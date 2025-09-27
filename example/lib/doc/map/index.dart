import 'dart:io';

import '../../comment/define.dart';
import '../index.dart';

class MapUseComponents implements UseComponents {
  @override
  void process(List<ComponentDefine> defines, Directory scriptDir) async {
    print('正在生成 map.dart，demos 数量: ${defines.length}');

    var generatedDir = '${scriptDir.path}/lib/generated';
    final mdDirectory = Directory(generatedDir);
    if (!await mdDirectory.exists()) {
      await mdDirectory.create(recursive: true);
    }

    var methods = <String>[];

    for (var value in defines) {
      StringBuffer stringBuffer = StringBuffer();
      stringBuffer.writeln(
          "Widget _${value.comment.name}FormMap(Map<String,dynamic> atr){");

      stringBuffer.writeln("return ${value.comment.name}(");
      for (var props in value.properties!) {
        stringBuffer.writeln(
            "${props.name}:_resolveValue(atr,'${value.comment.name}','${props.name}','${props.type}',${props.defaultValue}),");
      }
      stringBuffer.writeln(");");
      stringBuffer.writeln("}");
      methods.add(stringBuffer.toString());
    }

    final file = File("$generatedDir/map.dart");
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln("import 'package:antd_flutter_mobile/index.dart';");
    stringBuffer.writeln("import 'package:example/doc/map/custom.dart';");
    stringBuffer.writeln("import 'package:flutter/cupertino.dart';");
    stringBuffer.writeln(
        "import 'package:flutter/gestures.dart';import 'package:flutter/rendering.dart';");
    stringBuffer
        .writeln("Widget formMap(String name,Map<String,dynamic> properties){");
    for (var value in defines) {
      stringBuffer.writeln("if (name == '${value.comment.name}'){");
      stringBuffer.writeln("return _${value.comment.name}FormMap(properties);");
      stringBuffer.writeln("}");
    }
    stringBuffer.writeln("return AntdBox();");
    stringBuffer.writeln("}");
    stringBuffer.writeln(methods.join('\n'));
    stringBuffer.writeln(genderPopoverForm(defines));
    stringBuffer.writeln("List<AntdFormItem> getFormItem(String name){");
    for (var value in defines) {
      stringBuffer.writeln("if (name == '${value.comment.name}'){");
      stringBuffer.writeln("return _get${value.comment.name}ItemList();");
      stringBuffer.writeln("}");
    }
    stringBuffer.writeln("return [];");
    stringBuffer.writeln("}");

    stringBuffer.writeln(
        "dynamic _resolveValue(Map<String, dynamic> atr,String componentName,String name,String type,dynamic defaultValue){");

    stringBuffer.writeln("""
    var fullName = "\$componentName-\$name";
  if (customFull.containsKey(fullName)) {
    return customFull[fullName];
  }
    var val = atr[name];
    if (type == 'Widget') {
      return val != null ? Text(val) : null;
    } 
    if (val == null  || (val is String  && val.isEmpty)){
      return defaultValue;
    }
       if (type == 'double') {
      return double.tryParse(val);
    } else if (type == 'int') {
      return int.tryParse(val);
    } else if (type == 'Duration' && int.tryParse(val) != null) {
      return Duration(microseconds: int.tryParse(val)!);
    } else {
      return val;
    }
    """);
    stringBuffer.writeln("}");
    await file.writeAsString(stringBuffer.toString());
    print('生成完成: ${file.path}');
  }

  String genderPopoverForm(List<ComponentDefine> defines) {
    StringBuffer stringBuffer = StringBuffer();

    for (var value in defines) {
      stringBuffer.writeln(
          "List<AntdFormItem> _get${value.comment.name}ItemList(){return [");
      for (var props in value.properties!) {
        if (!['key', 'style'].contains(props.name) &&
            props.funcSig == null &&
            !props.name.startsWith("on") &&
            props.type?.endsWith("Callback") == false &&
            !props.name.endsWith("Tap") &&
            !props.type!.contains("Function") &&
            props.type?.startsWith("List") == false &&
            props.type?.contains("Controller") == false) {
          stringBuffer.writeln("AntdFormItem(");
          stringBuffer.writeln("name: \"${props.name}\",");
          stringBuffer.writeln("""
                label: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('${props.name}(${props.type})'),
            Text('${props.description}')
          ],),
              """);
          stringBuffer.writeln("builder: (ctx) {");
          if (props.type?.startsWith("bool") == true) {
            stringBuffer.writeln("""
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                """);
          } else if (props.enums != null) {
            var selectorOption = props.enums!
                .map((value) =>
                    "AntdSelectorOption(label: Text('${value}'), value: '${value}')")
                .join(",");

            stringBuffer.writeln("""
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(${props.type}.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                options: [${selectorOption}]);
            """);
          } else {
            stringBuffer.writeln("""
              return  AntdInput();
            """);
          }
          stringBuffer.writeln("},");
          stringBuffer.writeln("),");
        }
      }
      stringBuffer.writeln("];}");
    }

    return stringBuffer.toString();
  }
}
