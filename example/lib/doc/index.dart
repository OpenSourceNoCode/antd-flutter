import 'dart:io';

import 'package:example/comment/class.dart';

import '../comment/define.dart';
import '../comment/parse.dart';
import 'map/index.dart';
import 'md/index.dart';
import 'storage/index.dart';

abstract class UseComponents {
  void process(List<ComponentDefine> defines, Directory scriptDir);
}

void main() async {
  var root = File(Platform.script.toFilePath());
  var parent = root.parent.parent.parent.parent;
  const targetDirs = ['lib', 'example/lib', 'test'];
  final scriptDir = root.parent.parent.parent;

  var uses = <UseComponents>[
    MapUseComponents(),
    StorageUseComponents(),
    MdUseComponents()
  ];

  var files = await getFiles(targetDirs, parent);
  var visitor = await ClassCollector.collectAllClasses(files);
  var components = await getComponents(files, visitor);

  for (var use in uses) {
    use.process(components, scriptDir);
  }

  Map<String, List<PropertiesDefine>> map = {};
  for (var file in files.reversed) {
    map.addAll(getStyleComment(file, visitor));
  }

  final buffer = StringBuffer();
  map.forEach((name, defines) {
    buffer.writeln("## $name");
    buffer.writeln(generatePropertiesTable(defines));
  });
  String sideDocRoot = '${scriptDir.parent.path}/docs/docs/guide';
  final mdOutputPath = '$sideDocRoot/_theme_table.md';
  await File(mdOutputPath).writeAsString(buffer.toString());
}
