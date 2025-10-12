import 'dart:collection';
import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:dart_style/dart_style.dart';
import 'package:flutter/cupertino.dart';

import 'class.dart';
import 'define.dart';

// 将类名转换为kebab-case（如 AntdLoading → antd-loading）
String toKebabCase(String input) {
  return input
      .replaceAllMapped(
          RegExp(r'([A-Z])'), (m) => '-${m.group(1)!.toLowerCase()}')
      .replaceAll(RegExp(r'^-'), '')
      .toLowerCase();
}

CommentDefine parseComment(String name, String filePath, List<Token>? tokens) {
  if (tokens == null || tokens.isEmpty) {
    return CommentDefine(name: name, filePath: filePath);
  }

  String title = "";
  String? description;
  String? usage;
  String? version;
  String? group;
  int order = 9999;
  List<String>? links;

  // 当前正在解析的块类型
  String? currentBlockType;
  StringBuffer? currentBlockBuffer;

  // 处理描述文本中的链接转换（修正版）
  String convertLinks(String text) {
    return text.replaceAllMapped(
      RegExp(r'\[([^\]]+)\](?:#\[([^\]]+)\])?'),
      (match) {
        final className = match.group(1)!;
        if (match.groupCount >= 2 && match.group(2) != null) {
          final anchor = match.group(2)!;
          return '[$anchor](/${toKebabCase(className)}#$anchor)';
        }
        return '[$className](/${toKebabCase(className)})';
      },
    );
  }

  // 结束当前块的处理
  void endCurrentBlock() {
    if (currentBlockType == null || currentBlockBuffer == null) return;

    final content = currentBlockBuffer.toString().trim();
    switch (currentBlockType) {
      case 't':
        title = content;
        break;
      case 'd':
        description = convertLinks(content);
        break;
      case 'u':
        usage = content;
        break;
      case 'l':
        links = content
            .split(",")
            .map((v) => v.replaceAll(RegExp(r'[\[\]]'), '').trim())
            .where((v) => v.isNotEmpty)
            .toList();
        break;
      case 'v':
        version = content;
        break;
      case 'g':
        group = content;
        break;
      case 'o':
        order = int.tryParse(content) ?? 9999;
        break;
    }

    currentBlockType = null;
    currentBlockBuffer = null;
  }

  // 处理第一行非注解内容
  bool firstLineHandled = false;

  for (var token in tokens) {
    final line = token.lexeme.replaceAll('///', '').trim();
    if (line.isEmpty) continue;

    final match = RegExp(r'@(\w+)\s*(.*)').firstMatch(line);

    if (match != null) {
      // 遇到新注解，结束当前块
      endCurrentBlock();

      final key = match.group(1)!;
      final value = match.group(2)!;

      currentBlockType = key;
      currentBlockBuffer = StringBuffer(value);
      firstLineHandled = true;
    } else {
      if (!firstLineHandled) {
        // 处理第一行非注解内容
        if (title.isEmpty) {
          // 如果没有换行，整个作为@t
          if (tokens.length == 1) {
            description = line;
          } else {
            // 如果有换行，第一行作为@t，其余作为@d
            title = line;
            currentBlockType = 'd';
            currentBlockBuffer = StringBuffer();
          }
        }
        firstLineHandled = true;
      } else if (currentBlockType != null) {
        // 追加到当前块
        if (currentBlockBuffer!.isNotEmpty) {
          currentBlockBuffer!.writeln();
        }
        currentBlockBuffer!.write(line);
      } else {
        // 默认作为描述
        if (currentBlockBuffer == null) {
          currentBlockType = 'd';
          currentBlockBuffer = StringBuffer(line);
        } else {
          currentBlockBuffer!.writeln();
          currentBlockBuffer!.write(line);
        }
      }
    }
  }

  // 处理最后的块
  endCurrentBlock();

  return CommentDefine(
    name: name,
    filePath: filePath,
    title: title.isNotEmpty ? title : null,
    description: description,
    usage: usage,
    version: version,
    group: group,
    order: order,
    links: links,
  );
}

List<PropertiesDefine> parseProperties(
    ClassDeclaration node, String filePath, ClassDeclarationVisitor visitor) {
  final constructors = node.members.whereType<ConstructorDeclaration>();
  final propertiesDefines = _parseFields(node, filePath, visitor);

  if (constructors.isEmpty) {
    return propertiesDefines;
  }

  final fieldMap = <String, PropertiesDefine>{
    for (final field in propertiesDefines) field.name: field
  };

  final constructor = constructors.first;
  List<PropertiesDefine> constructorParams = constructor.parameters.parameters
      .map((parameter) {
        CommentDefine? paramDocs = _getParameterDocumentation(
            filePath, parameter, node, visitor.classMap);

        final paramName = _getParameterName(parameter);
        if (fieldMap.containsKey(paramName)) {
          fieldMap[paramName] = fieldMap[paramName]!.copyWith(
            description: fieldMap[paramName]?.description,
            version: fieldMap[paramName]?.version,
            links: fieldMap[paramName]?.links,
          );
          return const PropertiesDefine(name: '1');
        }

        final paramType = _getParameterType(parameter, visitor.classMap);
        final defaultValue = _getParameterDefaultValue(parameter);
        final isOptional = _isParameterOptional(parameter, defaultValue);

        var links = paramDocs?.links;
        if (links == null &&
            paramType != null &&
            paramType.endsWith("Style") == true) {
          links = [paramType.substring(0, paramType.indexOf("Style"))];
        }

        var genericTypeMap = visitor.genericTypeBinds[node.name.lexeme];
        return PropertiesDefine(
            name: paramName,
            type: _resolveGenericType(genericTypeMap, paramType),
            description: paramDocs?.description,
            version: paramDocs?.version,
            defaultValue: defaultValue,
            isOptional: isOptional,
            enums: _getEnumValues(paramType, visitor),
            funcSig: _resolveGenericType(
                genericTypeMap, _getFunSig(paramType, visitor)),
            links: links);
      })
      .where((value) => value.name != '1')
      .toList();
  // 合并字段和构造函数参数，优先保留构造函数参数
  final result = <PropertiesDefine>[];
  final paramNames = constructorParams.map((p) => p.name).toSet();

  // 添加所有构造函数参数
  result.addAll(constructorParams);

  // 添加未被构造函数参数覆盖的字段
  for (final field in propertiesDefines) {
    if (!paramNames.contains(field.name)) {
      result.add(field);
    }
  }

  return result;
}

String? _resolveGenericType(Map<String, String>? genericTypeMap, String? name) {
  if (name == null || genericTypeMap == null) return name;

  // 先处理简单情况
  if (!name.contains('Function(')) {
    return _replaceSimpleGenerics(name, genericTypeMap);
  }

  // 处理函数类型
  return _replaceFunctionGenerics(name, genericTypeMap);
}

String _replaceFunctionGenerics(String type, Map<String, String> genericMap) {
  final parts = type.split('Function(');
  if (parts.length != 2) return type;

  // 处理返回类型
  final returnType = _replaceSimpleGenerics(parts[0].trim(), genericMap);

  // 处理参数列表
  final paramsEnd = parts[1].lastIndexOf(')');
  if (paramsEnd == -1) return type;

  final params = parts[1].substring(0, paramsEnd);
  final processedParams = _processParamList(params, genericMap);

  return '$returnType Function($processedParams)';
}

String _processParamList(String params, Map<String, String> genericMap) {
  return params.split(',').map((param) {
    final parts = param.trim().split(' ');
    if (parts.length == 1) {
      // 无参数名的类型 (如 Function(T))
      return _replaceSimpleGenerics(parts[0], genericMap);
    } else {
      // 带参数名的类型 (如 Function(T tab))
      final type = _replaceSimpleGenerics(parts[0], genericMap);
      return '$type ${parts.sublist(1).join(' ')}';
    }
  }).join(', ');
}

String _replaceSimpleGenerics(String type, Map<String, String> genericMap) {
  // 简单类型的替换逻辑（同之前方案）
  if (genericMap.containsKey(type)) {
    if (genericMap[type] == type) {
      return type;
    }
    return _replaceSimpleGenerics(genericMap[type]!, genericMap);
  }

  // 处理嵌套泛型（List<T>等）
  final buffer = StringBuffer();
  int start = 0;
  int level = 0;

  for (int i = 0; i < type.length; i++) {
    final char = type[i];
    if (char == '<') {
      _writeSegment(type.substring(start, i), buffer, genericMap);
      buffer.write('<');
      start = i + 1;
      level++;
    } else if (char == '>') {
      _writeSegment(type.substring(start, i), buffer, genericMap);
      buffer.write('>');
      start = i + 1;
      level--;
    } else if (char == ',' && level > 0) {
      _writeSegment(type.substring(start, i), buffer, genericMap);
      buffer.write(', ');
      start = i + 1;
    }
  }

  _writeSegment(type.substring(start), buffer, genericMap);
  return buffer.toString();
}

void _writeSegment(
    String segment, StringBuffer buffer, Map<String, String> genericMap) {
  segment = segment.trim();
  if (segment.isNotEmpty) {
    buffer.write(genericMap[segment] ?? segment);
  }
}

String? _getFunSig(String? paramType, ClassDeclarationVisitor visitor) {
  if (paramType == null) {
    return null;
  }
  GenericTypeAlias? hem = visitor.genericTypeMap[paramType.contains("<")
      ? paramType.substring(0, paramType.indexOf("<"))
      : paramType];
  if (hem == null) {
    return null;
  }

  return hem.functionType?.toSource();
}

/// 获取枚举类型的所有可能值
///
/// [typeName] 要查询的枚举类型名称
/// [visitor] 包含所有枚举声明的访问者对象
///
/// 返回枚举值的名称列表，如果不是枚举类型则返回null
List<String>? _getEnumValues(
  String? typeName,
  ClassDeclarationVisitor visitor,
) {
  // 1. 检查输入有效性
  if (typeName == null || typeName.isEmpty) {
    return null;
  }

  try {
    // 2. 从访问者中获取枚举声明
    final enumDecl = visitor.enumMap[typeName];
    if (enumDecl == null) {
      // 检查是否是泛型枚举 (如 MyEnum<T>)
      final genericMatch = RegExp(r'^(\w+)<').firstMatch(typeName);
      if (genericMatch != null) {
        return _getEnumValues(genericMatch.group(1), visitor);
      }
      return null;
    }

    // 3. 尝试通过不同方式获取枚举值
    final enumValues = _extractEnumValues(enumDecl);

    // 4. 检查结果有效性
    if (enumValues.isEmpty) {
      debugPrint('⚠️ 枚举 [$typeName] 没有定义任何值');
      return null;
    }

    return enumValues;
  } catch (e, stack) {
    debugPrint('❌ 获取枚举 [$typeName] 值时出错: $e\n$stack');
    return null;
  }
}

/// 从枚举声明中提取值（兼容不同版本的Dart分析器API）
List<String> _extractEnumValues(EnumDeclaration enumDecl) {
  return enumDecl.constants.map((e) => e.name.lexeme).toList();
}

// 获取参数名称
String _getParameterName(FormalParameter parameter) {
  if (parameter is SimpleFormalParameter) {
    return parameter.name?.lexeme ?? '';
  } else if (parameter is DefaultFormalParameter) {
    return _getParameterName(parameter.parameter);
  } else if (parameter is FieldFormalParameter) {
    return parameter.name.lexeme;
  } else if (parameter is SuperFormalParameter) {
    // 处理 super.xxx 参数
    return parameter.name.lexeme;
  }
  return '';
}

// 获取参数类型
String? _getParameterType(
    FormalParameter parameter, Map<String, ClassDeclaration> allClasses) {
  if (parameter is SimpleFormalParameter) {
    return _extractRealType(parameter.type, allClasses);
  } else if (parameter is DefaultFormalParameter) {
    return _getParameterType(parameter.parameter, allClasses);
  } else if (parameter is FieldFormalParameter) {
    // 处理 this.xxx 参数
    if (parameter.type != null) {
      return _extractRealType(parameter.type, allClasses);
    }
    final field = _findCorrespondingField(parameter);
    return _extractRealType(field?.fields.type, allClasses);
  } else if (parameter is SuperFormalParameter) {
    // 特殊处理 super.key
    if (parameter.name.lexeme == 'key') {
      return 'Key';
    }

    // 处理其他 super.xxx 参数
    if (parameter.type != null) {
      return _extractRealType(parameter.type, allClasses);
    }
    final field = _findSuperField(parameter, allClasses);
    return _extractRealType(field?.fields.type, allClasses);
  }
  return null;
}

// 提取真实类型，处理泛型情况
String? _extractRealType(
    TypeAnnotation? type, Map<String, ClassDeclaration> allClasses) {
  if (type == null) return null;

  if (type is NamedType) {
    final typeName = type.name2.lexeme;

    // 处理泛型类型
    if (type.typeArguments != null) {
      final typeArgs = type.typeArguments!.arguments.map((arg) {
        if (arg is NamedType) {
          return _extractRealType(arg, allClasses) ?? 'dynamic';
        }
        return 'dynamic';
      }).join(', ');

      return '$typeName<$typeArgs>';
    }

    return typeName;
  }

  return type.toSource();
}

FieldDeclaration? _findSuperField(
  SuperFormalParameter param,
  Map<String, ClassDeclaration> allClasses, {
  int maxDepth = 5,
}) {
  // 获取当前类的声明
  final classDecl = param.thisOrAncestorOfType<ClassDeclaration>();
  if (classDecl == null) return null;

  // 开始递归查找
  return _findFieldInHierarchy(
      classDecl, param.name.lexeme, allClasses, maxDepth);
}

FieldDeclaration? _findFieldInHierarchy(
  ClassDeclaration classDecl,
  String fieldName,
  Map<String, ClassDeclaration> allClasses,
  int remainingDepth,
) {
  // 1. 先在当前类查找
  final field = _findFieldInClass(classDecl, fieldName);
  if (field != null) return field;

  // 2. 检查递归深度
  if (remainingDepth <= 0) return null;

  // 3. 获取父类名称
  final superClassName = classDecl.extendsClause?.superclass.name2.lexeme;
  if (superClassName == null) return null;

  // 4. 获取父类定义
  final superClass = allClasses[superClassName];
  if (superClass == null) return null;

  // 5. 递归查找父类
  return _findFieldInHierarchy(
    superClass,
    fieldName,
    allClasses,
    remainingDepth - 1,
  );
}

FieldDeclaration? _findFieldInClass(
  ClassDeclaration classDecl,
  String fieldName,
) {
  for (final member in classDecl.members) {
    if (member is FieldDeclaration) {
      for (final variable in member.fields.variables) {
        if (variable.name.lexeme == fieldName) {
          return member;
        }
      }
    }
  }
  return null;
}

/// 查找字段形式参数对应的字段声明
FieldDeclaration? _findCorrespondingField(FieldFormalParameter param) {
  final parent = param.thisOrAncestorOfType<ConstructorDeclaration>();
  if (parent == null) return null;

  final classDecl = parent.thisOrAncestorOfType<ClassDeclaration>();
  if (classDecl == null) return null;

  return classDecl.members.whereType<FieldDeclaration>().firstWhere(
        (field) => field.fields.variables
            .any((v) => v.name.lexeme == param.name.lexeme),
      );
}

// 获取参数文档
CommentDefine? _getParameterDocumentation(
  String filePath,
  FormalParameter parameter,
  ClassDeclaration node,
  Map<String, ClassDeclaration> allClasses,
) {
  if (parameter.name.toString() == 'key') {
    return null;
  }

  // 获取注释节点
  List<Token> tokens = [];
  final comment = _getParameterComment(parameter, node);

  if (comment == null &&
      parameter is DefaultFormalParameter &&
      parameter.parameter is SuperFormalParameter) {
    // 处理SuperFormalParameter的特殊情况
    final superParam = parameter.parameter as SuperFormalParameter;

    // 1. 优先使用参数自身的直接注释
    if (superParam.documentationComment != null) {
      tokens = superParam.documentationComment!.tokens;
    }
    // 2. 检查参数前的注释链
    else {
      Token? commentToken =
          parameter.beginToken.previous?.next?.precedingComments;
      while (commentToken != null) {
        tokens.add(commentToken);
        commentToken = commentToken.next;
      }

      // 3. 如果还是没有找到，查找父类注释
      if (tokens.isEmpty) {
        tokens =
            _findSuperParameterComment(superParam, node, allClasses)?.tokens ??
                [];
      }
    }
  }
  // 普通情况直接使用已有注释
  else {
    tokens = comment?.tokens ?? [];
  }

  return parseComment(parameter.name?.lexeme ?? "", filePath, tokens);
}

// 获取参数注释节点
Comment? _getParameterComment(
  FormalParameter parameter,
  ClassDeclaration currentClass,
) {
  if (parameter is SimpleFormalParameter) {
    return parameter.documentationComment;
  } else if (parameter is DefaultFormalParameter) {
    return _getParameterComment(parameter.parameter, currentClass);
  } else if (parameter is FieldFormalParameter) {
    return parameter.documentationComment;
  }
  return null;
}

/// 在继承链中查找super参数对应的字段注释
Comment? _findSuperParameterComment(
  SuperFormalParameter param,
  ClassDeclaration currentClass,
  Map<String, ClassDeclaration> allClasses, {
  int maxDepth = 7,
}) {
  ClassDeclaration? classDecl = currentClass;

  while (classDecl != null && maxDepth-- > 0) {
    final superClassName = classDecl.extendsClause?.superclass.name2.lexeme;
    if (superClassName == null) break;

    final superClass = allClasses[superClassName];
    if (superClass == null) break;

    // 查找父类中的对应字段
    final field = _findFieldInClass(superClass, param.name.lexeme);
    if (field != null && field.documentationComment != null) {
      return field.documentationComment;
    }

    classDecl = superClass;
  }

  return null;
}

// 获取参数默认值
String? _getParameterDefaultValue(FormalParameter parameter) {
  if (parameter is DefaultFormalParameter) {
    return parameter.defaultValue?.toSource();
  }
  return null;
}

List<PropertiesDefine> _parseFields(
  ClassDeclaration node,
  String filePath,
  ClassDeclarationVisitor visitor,
) {
  return node.members
      .whereType<FieldDeclaration>()
      .expand((f) => f.fields.variables.map((v) {
            final fieldDocs = parseComment(
                node.name.lexeme, filePath, f.documentationComment?.tokens);
            final defaultValue = _parseDefaultValue(v);
            final isOptional = _isFieldOptional(f.fields.type, defaultValue);
            final paramType =
                f.fields.type?.toSource().replaceFirst(RegExp(r'\?$'), '');
            var links = fieldDocs.links;
            if (links == null &&
                paramType != null &&
                paramType.endsWith("Style") == true) {
              links = [paramType.substring(0, paramType.indexOf("Style"))];
            }
            var genericTypeMap = visitor.genericTypeBinds[node.name.lexeme];
            return PropertiesDefine(
                name: v.name.lexeme,
                type: paramType,
                description: fieldDocs.description,
                version: fieldDocs.version,
                defaultValue: defaultValue,
                isOptional: isOptional,
                enums: _getEnumValues(paramType, visitor),
                funcSig: _resolveGenericType(
                    genericTypeMap, _getFunSig(paramType, visitor)),
                links: links);
          }))
      .toList();
}

// 判断参数是否可选
bool _isParameterOptional(FormalParameter parameter, String? defaultValue) {
  if (defaultValue != null) return true;
  if (parameter.isRequiredNamed) return false;
  if (parameter.isNamed) return true;
  if (parameter is DefaultFormalParameter) return true;
  return false;
}

bool _isFieldOptional(TypeAnnotation? type, String? defaultValue) {
  if (defaultValue != null) return true;
  if (type is NamedType) {
    return type.question != null;
  }
  return false;
}

String? _parseDefaultValue(VariableDeclaration variable) {
  if (variable.initializer != null) {
    return variable.initializer?.toSource();
  }

  final classNode = variable.thisOrAncestorOfType<ClassDeclaration>();
  if (classNode != null) {
    for (final member in classNode.members) {
      if (member is ConstructorDeclaration) {
        for (final param in member.parameters.parameters) {
          if (param is DefaultFormalParameter) {
            if (param.parameter is FieldFormalParameter) {
              final fieldParam = param.parameter as FieldFormalParameter;
              if (fieldParam.name.toString() == variable.name.lexeme) {
                return param.defaultValue?.toSource();
              }
            } else if (param.parameter is SimpleFormalParameter) {
              final simpleParam = param.parameter as SimpleFormalParameter;
              if (simpleParam.name?.lexeme == variable.name.lexeme) {
                return param.defaultValue?.toSource();
              }
            }
          }
        }
      }
    }
  }

  return null;
}

Future<List<File>> getFiles(List<String> targetDirs, Directory parent) async {
  final allDartFiles = <File>[];
  for (final dir in targetDirs) {
    final files = await _findDartFiles('${parent.path}/$dir');
    allDartFiles.addAll(files);
    debugPrint('在目录 $dir 中找到 ${files.length} 个Dart文件');
  }
  return allDartFiles;
}

Future<List<ComponentDefine>> getComponents(
    List<File> files, ClassDeclarationVisitor visitor) async {
  final allComponents = <ComponentDefine>[];
  for (final file in files) {
    allComponents.addAll(_parseFile(file, visitor));
  }

  final components = _margeDemos(allComponents);
  components.sort((a, b) {
    final orderA = a.comment.order;
    final orderB = b.comment.order;
    return orderB.compareTo(orderA);
  });
  return components;
}

List<ComponentDefine> _margeDemos(List<ComponentDefine> components) {
  final result = <ComponentDefine>[];
  final relateNames = <String>[];
  // 使用LinkedHashMap保持插入顺序
  final componentMap = LinkedHashMap<String, ComponentDefine>.fromIterable(
    components,
    key: (c) => c.comment.name,
  );

  // 1. 处理非Demo组件之间的关联关系
  for (final component
      in components.where((c) => !c.comment.name.endsWith('Demo'))) {
    // 处理link可能是String或List<String>的情况
    final links = component.comment.links ?? [];

    for (final link in links) {
      final linkedComponent = componentMap[link];
      if (linkedComponent != null) {
        relateNames.add(component.comment.name);
        // 创建新的关联组件列表，避免修改原始对象
        final newRelates = <ComponentDefine>[
          ...linkedComponent.relates,
          component
        ];
        componentMap[link] = linkedComponent.copyWith(
          relates: newRelates,
        );
      }
    }
  }

  // 2. 添加所有非Demo组件到结果列表
  componentMap.values
      .where((c) => !c.comment.name.endsWith('Demo'))
      .forEach(result.add);

  // 3. 处理Demo组件
  for (final demo in components.where((c) => c.comment.name.endsWith('Demo'))) {
    final baseName = getBaseName(demo.comment.name);
    final mainComponent = _findMainComponent(demo, componentMap, baseName);

    if (mainComponent != null) {
      _addDemoToMainComponent(demo, mainComponent, result);
    } else if (demo.comment.title != null) {
      _addAsStandaloneDemo(demo, baseName, result);
    }
  }

  return result
      .where((data) =>
          !relateNames.contains(data.comment.name) &&
          !data.comment.name.startsWith("_") &&
          !data.comment.name.endsWith("Demo"))
      .toList();
}

String getStateBaseName(String demoName) {
  var baseName = demoName;
  if (baseName.endsWith('StateDemo')) {
    baseName = baseName.replaceAll('StateDemo', '');
    if (baseName.startsWith('_')) {
      baseName = baseName.substring(1);
    }
  }
  return baseName;
}

String getBaseName(String demoName) {
  var baseName = demoName;
  if (baseName.endsWith('Demo')) {
    baseName = baseName.replaceAll('Demo', '');
  }
  return baseName;
}

ComponentDefine? _findMainComponent(
  ComponentDefine demo,
  Map<String, ComponentDefine> componentMap,
  String baseName,
) {
  // 1. 优先通过comment.link查找
  if (demo.comment.links != null) {
    // 处理link可能是String或List<String>的情况
    final links = demo.comment.links ?? [];

    // 返回第一个找到的有效组件
    for (final link in links) {
      if (componentMap.containsKey(link)) {
        return componentMap[link];
      }
    }
  }
  // 2. 其次尝试通过baseName查找
  return componentMap[baseName];
}

void _addDemoToMainComponent(
  ComponentDefine demo,
  ComponentDefine mainComponent,
  List<ComponentDefine> result,
) {
  final formattedBody = innFormatDartCode(demo.comment.body ?? '');
  final demoComment = demo.comment.copyWith(body: formattedBody);

  // 检查是否已存在相同demo
  final existingIndex =
      result.indexWhere((c) => c.comment.name == mainComponent.comment.name);
  if (existingIndex != -1) {
    final existingComponent = result[existingIndex];

    // 避免重复添加相同demo
    if (!existingComponent.demos.any((d) => d.title == demoComment.title)) {
      result[existingIndex] = existingComponent.copyWith(
        demos: [...existingComponent.demos, demoComment],
      );
    }
  } else {
    result.add(mainComponent.copyWith(
      demos: [demoComment],
    ));
  }
}

void _addAsStandaloneDemo(
  ComponentDefine demo,
  String baseName,
  List<ComponentDefine> result,
) {
  // 创建新的独立组件副本，不修改原始demo
  final standalone = demo.copyWith(
    demos: const [],
    comment: demo.comment.copyWith(
      body: innFormatDartCode(demo.comment.body ?? ''),
    ),
  );

  // 检查是否已存在同名组件
  if (!result.any((c) => c.comment.name == baseName)) {
    result.add(standalone);
  }
}

Future<List<File>> _findDartFiles(String dirPath) async {
  final dir = Directory(dirPath);
  final files = <File>[];

  try {
    await for (final entity in dir.list(recursive: true)) {
      if (entity is File && entity.path.endsWith('.dart')) {
        files.add(entity);
      }
    }
  } catch (e) {
    debugPrint('警告: 无法访问目录 $dirPath: $e');
  }

  return files;
}

List<ComponentDefine> _parseFile(
  File file,
  ClassDeclarationVisitor visitor_,
) {
  try {
    final content = file.readAsStringSync();
    final parseResult = parseString(
      content: content,
      path: file.path,
      throwIfDiagnostics: false,
    );

    final visitor = ComponentVisitor(file.path, visitor_);
    parseResult.unit.accept(visitor);

    return visitor.components;
  } catch (e) {
    debugPrint('解析文件 ${file.path} 时出错: $e');
    return [];
  }
}

String innFormatDartCode(String sourceCode) {
  try {
    final formatter = DartFormatter();
    return formatter.format(sourceCode);
  } catch (e) {
    throw Exception('格式化失败: $e');
  }
}

Map<String, List<PropertiesDefine>> getStyleComment(
  File file,
  ClassDeclarationVisitor visitor_,
) {
  try {
    final content = file.readAsStringSync();
    final parseResult = parseString(
      content: content,
      path: file.path,
      throwIfDiagnostics: false,
    );

    final visitor = TokenVisitor(file.path, visitor_);
    parseResult.unit.accept(visitor);

    return visitor.commentMap;
  } catch (e) {
    debugPrint('解析文件 ${file.path} 时出错: $e');
    return {};
  }
}
