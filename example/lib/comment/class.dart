import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:flutter/cupertino.dart';

import 'define.dart';
import 'parse.dart';

class ClassCollector {
  /// 收集所有Dart文件中的类和枚举定义
  /// 直接返回访问者对象，包含所有收集到的类声明和枚举声明
  static Future<ClassDeclarationVisitor> collectAllClasses(
    List<File> dartFiles,
  ) async {
    final visitor = ClassDeclarationVisitor();

    for (final file in dartFiles) {
      try {
        final content = await file.readAsString();
        final parseResult = parseString(
          content: content,
          path: file.path,
          throwIfDiagnostics: false,
        );

        parseResult.unit.accept(visitor);

        // 打印重复定义警告
        _printDuplicateWarnings(visitor, file.path);
      } catch (e, stack) {
        debugPrint('❌ 解析文件 ${file.path} 时出错: $e\n$stack');
      }
    }

    final genericTypeVisitor = GenericTypeVisitor(visitor: visitor);
    for (final file in dartFiles) {
      final content = await file.readAsString();
      final parseResult = parseString(
        content: content,
        path: file.path,
        throwIfDiagnostics: false,
      );
      parseResult.unit.accept(genericTypeVisitor);
    }

    return visitor;
  }

  /// 打印重复定义的警告信息
  static void _printDuplicateWarnings(
      ClassDeclarationVisitor visitor, String filePath) {
    // 检查重复类名
    final classNames = visitor.classes.map((c) => c.name.lexeme).toList();
    final duplicateClasses = _findDuplicates(classNames);
    for (var name in duplicateClasses) {
      debugPrint('⚠️ 重复的类名 [$name] 在文件: $filePath');
    }

    // 检查重复枚举名
    final enumNames = visitor.enums.map((e) => e.name.lexeme).toList();
    final duplicateEnums = _findDuplicates(enumNames);
    for (var name in duplicateEnums) {
      debugPrint('⚠️ 重复的枚举名 [$name] 在文件: $filePath');
    }
  }

  /// 查找列表中的重复项
  static Set<String> _findDuplicates(List<String> items) {
    final seen = <String>{};
    final duplicates = <String>{};
    for (final item in items) {
      if (seen.contains(item)) {
        duplicates.add(item);
      } else {
        seen.add(item);
      }
    }
    return duplicates;
  }
}

class ClassDeclarationVisitor extends RecursiveAstVisitor<void> {
  final List<ClassDeclaration> classes = [];
  final List<EnumDeclaration> enums = [];
  final List<GenericTypeAlias> genericTypes = [];
  final Map<String, Map<String, String>> genericTypeBinds = {};

  /// 获取所有类声明的映射表
  Map<String, ClassDeclaration> get classMap =>
      {for (final classDecl in classes) classDecl.name.lexeme: classDecl};

  /// 获取所有枚举声明的映射表
  Map<String, EnumDeclaration> get enumMap =>
      {for (final enumDecl in enums) enumDecl.name.lexeme: enumDecl};

  /// 获取所有枚举声明的映射表
  Map<String, GenericTypeAlias> get genericTypeMap => {
        for (final genericType in genericTypes)
          genericType.name.lexeme: genericType
      };

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    classes.add(node);
    super.visitClassDeclaration(node);
  }

  @override
  void visitEnumDeclaration(EnumDeclaration node) {
    enums.add(node);
    super.visitEnumDeclaration(node);
  }

  @override
  void visitGenericTypeAlias(GenericTypeAlias node) {
    genericTypes.add(node);
    super.visitGenericTypeAlias(node);
  }
}

class GenericTypeVisitor extends RecursiveAstVisitor<void> {
  final ClassDeclarationVisitor visitor;

  GenericTypeVisitor({required this.visitor});

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    _collectGenericBindings(node);
    super.visitClassDeclaration(node);
  }

  /// 递归收集泛型参数绑定关系（包含继承链和接口实现）
  void _collectGenericBindings(ClassDeclaration node) {
    final className = node.name.lexeme;
    final bindings = <String, String>{};

    // 处理当前类的直接泛型绑定
    _processCurrentClassBindings(node, bindings);

    // 递归处理继承链
    _processSuperclassHierarchy(node, bindings);

    // 递归处理接口实现
    _processInterfaceImplementations(node, bindings);

    if (bindings.isNotEmpty) {
      visitor.genericTypeBinds[className] = bindings;
    }
  }

  /// 处理当前类自身的泛型参数
  void _processCurrentClassBindings(
      ClassDeclaration node, Map<String, String> bindings) {
    if (node.typeParameters != null) {
      for (final typeParam in node.typeParameters!.typeParameters) {
        bindings[typeParam.name.lexeme] = typeParam.name.lexeme;
      }
    }
  }

  /// 递归处理继承链的泛型绑定
  void _processSuperclassHierarchy(
      ClassDeclaration node, Map<String, String> bindings) {
    if (node.extendsClause != null) {
      final superclass = node.extendsClause!.superclass;
      _resolveTypeBindings(superclass, bindings);

      // 递归处理父类的继承链
      final parentClass = _getClassDeclaration(superclass.name2.lexeme);
      if (parentClass != null) {
        _processSuperclassHierarchy(parentClass, bindings);
      }
    }
  }

  /// 递归处理接口实现的泛型绑定
  void _processInterfaceImplementations(
      ClassDeclaration node, Map<String, String> bindings) {
    node.implementsClause?.interfaces.forEach((interface) {
      _resolveTypeBindings(interface, bindings);

      // 递归处理接口的继承链
      final interfaceDecl = _getClassDeclaration(interface.name2.lexeme);
      if (interfaceDecl != null) {
        _processInterfaceImplementations(interfaceDecl, bindings);
      }
    });
  }

  /// 解析具体类型的泛型绑定关系
  void _resolveTypeBindings(TypeAnnotation type, Map<String, String> bindings) {
    if (type is NamedType && type.typeArguments != null) {
      final typeName = type.name2.lexeme;
      final typeDecl = _getClassDeclaration(typeName);

      if (typeDecl?.typeParameters != null) {
        final typeParams = typeDecl!.typeParameters!.typeParameters;
        final typeArgs = type.typeArguments!.arguments;

        for (int i = 0; i < typeParams.length && i < typeArgs.length; i++) {
          final paramName = typeParams[i].name.lexeme;
          final arg = typeArgs[i];

          if (arg is NamedType && !bindings.containsKey(paramName)) {
            bindings[paramName] = arg.toSource();
          }
        }
      }
    }
  }

  /// 辅助方法：根据类名获取类声明
  ClassDeclaration? _getClassDeclaration(String className) {
    return visitor.classMap[className];
  }
}

class ComponentVisitor extends RecursiveAstVisitor<void> {
  final String filePath;
  final ClassDeclarationVisitor visitor;
  final List<ComponentDefine> components = [];

  ComponentVisitor(this.filePath, this.visitor);

  /// 检查元数据列表中是否包含 @deprecated 注解
  bool _hasDeprecatedAnnotation(NodeList<Annotation> metadata) {
    for (final annotation in metadata) {
      if (annotation.name.name == 'deprecated') {
        return true;
      }
    }
    return false;
  }

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    if (_hasDeprecatedAnnotation(node.metadata)) {
      return;
    }
    var comment = parseComment(
        node.name.lexeme, filePath, node.documentationComment?.tokens);
    if (comment.title == null) {
      return;
    }
    final isDemoClass = node.name.lexeme.endsWith('Demo');
    if (isDemoClass) {
      comment = comment.copyWith(
          body: node.toSource(), name: getStateBaseName(comment.name));
    }
    final componentData = ComponentDefine(
        comment: comment, properties: parseProperties(node, filePath, visitor));

    components.add(componentData);
    super.visitClassDeclaration(node);
  }
}

class TokenVisitor extends RecursiveAstVisitor<void> {
  final String filePath;
  final ClassDeclarationVisitor visitor;
  final Map<String, List<PropertiesDefine>> commentMap = {};
  TokenVisitor(this.filePath, this.visitor);

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    if (node.documentationComment?.tokens.first.lexeme == "/// theme") {
      commentMap[node.name.lexeme] = parseProperties(node, filePath, visitor);
    }
    super.visitClassDeclaration(node);
  }
}
