import 'dart:convert';
import 'dart:io';

import 'package:example/comment/parse.dart';
import 'package:path/path.dart' as path;

import '../../comment/define.dart';
import '../index.dart';
import 'style.dart';

class MdUseComponents implements UseComponents {
  @override
  Future<void> process(
      List<ComponentDefine> components, Directory scriptDir) async {
    String sideDocRoot = '${scriptDir.parent.path}/docs/docs/components';
    String outputDir = '${scriptDir.path}/assets/docs';

    // 确保目录存在
    final docsDir = Directory(outputDir);
    if (!await docsDir.exists()) {
      await docsDir.create(recursive: true); // recursive: true 会创建所有不存在的父目录
      print('已创建目录: $outputDir');
    }

    for (final component in components) {
      if (component.comment.title != null) {
        // Generate JSON file
        final outputPath =
            path.join(outputDir, '${component.comment.name}.json');
        await File(outputPath).writeAsString(
          jsonEncode(component.toJson()),
        );

        // Generate Markdown file
        final mdOutputPath = '$sideDocRoot/${component.comment.name}.md';
        final mdDirectory = Directory(path.dirname(mdOutputPath));

        if (!await mdDirectory.exists()) {
          await mdDirectory.create(recursive: true);
        }

        final buffer = StringBuffer();
        buffer.writeln(generateHeaderMd(component));

        if (component.demos.isNotEmpty) {
          buffer.writeln("## 代码展示");
          buffer.writeln();

          buffer.writeln("<div class='preview-container'>");
          buffer.writeln("<div>");
          buffer.writeln();
          for (final demo in component.demos) {
            buffer.writeln(generateDemoMd(demo));
          }
          buffer.writeln("</div>");
          buffer.writeln("<div class='phone-preview'>");
          buffer.writeln(
              "<iframe src='https://opensourcenocode.github.io/antd-flutter?target=${component.comment.name}'></iframe>");
          buffer.writeln("</div>");

          buffer.writeln("</div>");
        }

        buffer.writeln();
        buffer.writeln(style);
        buffer.writeln(generateApiDoc(component));
        buffer.writeln(generateRelateApiDoc(component));

        await File(mdOutputPath).writeAsString(buffer.toString());
        print('已生成: $outputPath');
      }
    }
  }

  String generateDemoMd(CommentDefine demo) {
    final buffer = StringBuffer();
    buffer.writeln('### ${demo.title ?? ''}');
    buffer.writeln();
    if (demo.description != null) {
      buffer.writeln(demo.description);
    }
    buffer.writeln();
    buffer.writeln("```dart");
    buffer.writeln(demo.body ?? '');
    buffer.writeln("```");

    return buffer.toString();
  }

  String generateHeaderMd(ComponentDefine component) {
    final comment = component.comment;
    final buffer = StringBuffer();

    buffer.writeln("---");
    buffer.writeln("group:");
    buffer.writeln("  title: ${comment.group ?? ''}");
    buffer.writeln("  order: ${100 - comment.order}");
    buffer.writeln("title: ${component.comment.name.replaceAll("Antd", "")}");
    buffer.writeln("subtitle: ${comment.title ?? ''}");
    buffer.writeln("---");

    buffer.writeln(comment.description ?? '');
    buffer.writeln("## 何时使用");
    buffer.writeln(comment.usage ?? '');
    return buffer.toString();
  }

  String generateApiDoc(ComponentDefine component) {
    final buffer = StringBuffer();

    var relateNames =
        component.relates.map((define) => define.comment.name).toSet();
    if (component.properties?.isNotEmpty ?? false) {
      buffer.writeln('## 属性');
      buffer.writeln(
          _generatePropertiesTable(component.properties!, relateNames));
    }

    return buffer.toString();
  }

  String generateRelateApiDoc(ComponentDefine component) {
    if (component.relates.isEmpty) {
      return "";
    }
    final buffer = StringBuffer();

    var relateNames =
        component.relates.map((define) => define.comment.name).toSet();
    for (var value in component.relates) {
      if (value.properties?.isNotEmpty ?? false) {
        buffer.writeln(
            '## ${value.comment.title}(${value.comment.name}) <a id=\'${value.comment.name}\'></a>');
        if (value.comment.description != null) {
          buffer.writeln(value.comment.description);
        }
        buffer
            .writeln(_generatePropertiesTable(value.properties!, relateNames));
      }
    }

    return buffer.toString();
  }

  String _generatePropertiesTable(
      List<PropertiesDefine> properties, Set<String> relateNames) {
    final buffer = StringBuffer();

    buffer.writeln('| 属性名 | 说明 | 类型 | 默认值 | 版本 |');
    buffer.writeln('| --- | --- | --- | --- | --- |');

    for (final prop in properties) {
      buffer.writeln('| ${_padRight(prop.name, 10)} '
          '| ${_padRight(prop.description != null ? "${prop.description}${getEnums(prop)}" : '-', 23)} '
          '| ${_padRight(_formatType(
                prop,
              ), 8)} '
          '| ${_padRight(prop.defaultValue?.replaceAll("${prop.type}.", "") ?? '-', 6)} '
          '| ${_padRight(prop.version ?? '-', 4)} |');
    }

    var str = buffer.toString();
    // for (var value in relateNames) {
    //   // 使用正则确保精确匹配
    //   str = str.replaceAllMapped(RegExp(r'\b' + RegExp.escape(value) + r'\b'),
    //       (match) => '[$value](#$value)');
    // }

    return str;
  }

  String getEnums(PropertiesDefine properties) {
    if (properties.enums?.isNotEmpty == true) {
      var enums = '';
      if (properties.enums != null && properties.enums!.isNotEmpty) {
        enums =
            properties.enums!.map((enumName) => "`$enumName`").join(' \\\| ');
        return ":$enums";
      }
    }
    return "";
  }

  String _formatType(PropertiesDefine properties) {
    // if (properties.name == 'styleBuilder') {
    //   return "-";
    // }
    // if (properties.funcSig?.isNotEmpty == true) {
    //   return properties.funcSig!;
    // }

    if (properties.links != null && properties.links?.isNotEmpty == true) {
      var linkName = properties.links?.first;
      if (linkName?.isNotEmpty == true) {
        return '[${properties.type}](../components/${toKebabCase(linkName!)}/#${properties.type})';
      }
    }

    var type = properties.type ?? 'dynamic';
    var str = type.replaceAll('<', '&lt;').replaceAll('>', '&gt;');
    return str;
  }

  String _padRight(String input, int length) {
    if (input.length >= length) return input;
    return input;
  }
}
