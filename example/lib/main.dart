import 'dart:convert';

import 'package:antd_flutter/index.dart';
import 'package:collection/collection.dart';
import 'package:example/generated/map.dart';
import 'package:example/generated/storage.dart';
import 'package:example/widget/demo.dart';
import 'package:example/widget/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'comment/define.dart';

class DemoInfo {
  final String title;
  final Widget page;

  DemoInfo({required this.title, required this.page});
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AntdProvider(
    builder: (context, theme) {
      return const App();
    },
  ));
}

/// 读取指定目录下的所有JSON文件
Future<Map<String, ComponentDefine>> loadAssetJsons() async {
  final manifest = await rootBundle.loadString('AssetManifest.json');
  final jsonFiles = (json.decode(manifest) as Map<String, dynamic>).keys.where(
      (path) => path.startsWith('assets/docs/') && path.endsWith('.json'));

  final Map<String, ComponentDefine> allJsonData = {};
  for (final path in jsonFiles) {
    final content = await rootBundle.loadString(path);
    allJsonData[path] = ComponentDefine.fromJson(json.decode(content));
  }
  return allJsonData;
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  var docs = <Map<String, dynamic>>[];
  var menus = <Menu>[];
  var panels = <String, Widget>{};

  @override
  void initState() {
    loadAssetJsons().then((res) {
      var values = res.values.toList();
      values.sort((a, b) {
        return a.comment.order.compareTo(b.comment.order);
      });

      // 2. 再按 group 字段分组
      final grouped = groupBy(values, (doc) => doc.comment.group ?? "");
      grouped.forEach((group, values) {
        // 1. 先按 order 字段排序
        values.sort((a, b) {
          return a.comment.order.compareTo(b.comment.order);
        });
        menus.add(Menu(group: true, title: group));
        for (var value in values) {
          menus.add(Menu(
            group: false,
            title: value.comment.title ?? "",
            path: value.comment.name,
          ));

          panels[value.comment.name] = SingleChildScrollView(
            child: buildDemoBlocks(value.demos, value.comment),
          );
        }
      });
      setState(() {});
    });
    super.initState();
  }

  Blocks buildDemoBlocks(List<CommentDefine>? maps, CommentDefine comment) {
    return Blocks(
      items: [
        AutoPropertiesDemo(name: comment.name),
        ...(maps?.map((value) {
              return DemoBlock(
                title: Text(value.title ?? ""),
                desc: value.description,
                demo: value.body,
                child: demoMap[value.name] ?? const AntdBox(),
              );
            }).toList() ??
            [])
      ],
      axis: Axis.horizontal,
      title: "${comment.title} ${comment.name}",
      description: comment.description,
      usage: comment.usage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (c, _) {
        return Scaffold(
          body: Layout(
            title: "Antd Flutter",
            menus: menus,
            child: panels,
          ),
        );
      },
    );
  }
}

class AutoPropertiesDemo extends StatefulWidget {
  const AutoPropertiesDemo({super.key, required this.name});

  final String name;

  @override
  State<StatefulWidget> createState() {
    return _AutoPropertiesDemoState();
  }
}

class _AutoPropertiesDemoState extends State<AutoPropertiesDemo> {
  Map<String, dynamic> properties = {};

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return AntdBox(
      style: AntdBoxStyle(
        padding: 12.all,
        color: token.colorWhite,
        textStyle: token.font.lg,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "动态展示",
              ),
              AntdBox(
                onTap: () async {
                  var result = await AntdLayer.open(AntdPopup(
                    position: AntdPosition.right,
                    builder: (close, ctx) {
                      return AntdBox(
                        style: AntdBoxStyle(
                            color: token.colorWhite,
                            height: double.infinity,
                            width: 0.85,
                            layoutModes: [AntdBoxLayoutMode.factorWidth]),
                        child: AntdForm(
                          initialValues: properties,
                          builder: (controller) {
                            return AntdList(items: [
                              AntdBox(
                                outerSafeArea: AntdPosition.top,
                                child: AntdButton(
                                  color: AntdColor.primary,
                                  block: true,
                                  onTap: () {
                                    close(controller.getFieldsValue());
                                  },
                                  child: Text("确定"),
                                ),
                              ),
                              ...getFormItem(widget.name),
                            ]);
                          },
                        ),
                      );
                    },
                  ));

                  setState(() {
                    properties = result ?? {};
                  });
                },
                child: Text(
                  "属性配置",
                  style: TextStyle(color: token.colorLink),
                ),
              )
            ],
          ),
          AntdBox(
            style: AntdBoxStyle(
                margin: 8.top,
                alignment: Alignment.center,
                padding: 12.all,
                color: token.colorWarning,
                width: double.infinity),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300),
              child: formMap(widget.name, properties),
            ),
          )
        ],
      ),
    );
  }
}
