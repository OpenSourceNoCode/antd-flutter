import 'dart:io';

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
  var components = await getComponents(targetDirs, parent);

  for (var use in uses) {
    use.process(components, scriptDir);
  }
}
