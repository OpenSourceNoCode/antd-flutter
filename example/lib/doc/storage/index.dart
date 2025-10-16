import 'dart:io';

import 'package:path/path.dart' as path;

import '../../comment/define.dart';
import '../index.dart';

class StorageUseComponents implements UseComponents {
  @override
  void process(List<ComponentDefine> defines, Directory scriptDir) async {
    print('正在生成 storage.dart，demos 数量: ${defines.length}');

    var generatedDir = '${scriptDir.path}/lib/generated';
    final mdDirectory = Directory(generatedDir);
    if (!await mdDirectory.exists()) {
      await mdDirectory.create(recursive: true);
    }

    var paths = <String>{};
    var names = <String>[];

    for (var value in defines) {
      for (var demo in value.demos) {
        final fullPath = demo.filePath.toString();
        var name = demo.name.toString();
        if (fullPath.isEmpty || name.isEmpty) {
          print('跳过无效 demo 数据: $value');
          continue;
        }

        if (name.endsWith('StateDemo')) {
          name = name.replaceAll('StateDemo', '');
          if (name.startsWith('_')) {
            name = name.substring(1);
          }
        }
        // 转换为相对路径
        final relativePath =
            _convertToPackagePath(fullPath, scriptDir.parent.path);
        paths.add(relativePath);
        names.add('"$name": const $name()');
      }
    }

    if (paths.isEmpty) {
      print('警告: 无有效的 demo 数据，生成空的 storage.dart');
    }

    final file = File("$generatedDir/storage.dart");
    StringBuffer stringBuffer = StringBuffer();

    for (var path in paths) {
      stringBuffer.writeln("import 'package:$path';");
    }
    stringBuffer.writeln("var demoMap = {");
    stringBuffer.writeln(names.join(',\n'));
    stringBuffer.writeln("};");

    await file.writeAsString(stringBuffer.toString());
    print('生成完成: ${file.path}');
  }

  String _convertToPackagePath(String fullPath, String projectRoot) {
    // 标准化路径
    final normalizedFull = path.normalize(fullPath);
    final normalizedRoot = path.normalize(projectRoot);

    // 移除项目根目录部分
    if (normalizedFull.startsWith(normalizedRoot)) {
      return normalizedFull
          .substring(normalizedRoot.length + 1)
          .replaceAll('\\', '/') // 确保Windows路径使用正斜杠
          .replaceFirst('lib/', ''); // 移除lib前缀
    }

    // 如果路径不在项目根目录下，尝试提取package格式
    final libIndex = normalizedFull.indexOf('/lib/');
    if (libIndex != -1) {
      return normalizedFull.substring(libIndex + 5).replaceAll('\\', '/');
    }

    // 如果都不匹配，返回原始路径的最后部分
    return path.basename(normalizedFull);
  }
}
