import 'package:antd_flutter/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

const text = Text(
    "Excepteur deserunt aliqua elit in velit et dolor dolor ullamco laboris eiusmod in. Id deserunt commodo eu ut consequat in aliquip. Id consequat minim enim Lorem voluptate esse ullamco. Deserunt quis dolore ipsum nulla do officia. Cillum amet magna nostrud.");

/// @t 事件
/// @l [AntdCollapse]
class AntdCollapseDemo extends StatelessWidget {
  const AntdCollapseDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdCollapse(
        value: const [1],
        onChange: (index, check) {
          AntdToast.show("触发了index:${index},当前选中:${check}");
        },
        items: const [
          AntdCollapseItem(title: Text("第一项"), content: text),
          AntdCollapseItem(title: Text("第二项"), content: text),
          AntdCollapseItem(title: Text("第三项"), content: text)
        ],
      ),
    ]);
  }
}

/// @t 样式
/// @l [AntdCollapse]
class AntdCollapseStyleDemo extends StatelessWidget {
  const AntdCollapseStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdCollapse(
        style: AntdCollapseStyle(
            bodyStyle: AntdBoxStyle(
                color: token.colorPrimary,
                textStyle: token.font.lg.copyWith(color: token.colorWhite))),
        onChange: (index, check) {
          AntdToast.show("触发了index:${index},当前选中:${check}");
        },
        items: const [
          AntdCollapseItem(title: Text("第13项"), content: text),
          AntdCollapseItem(title: Text("第二项"), content: text),
          AntdCollapseItem(title: Text("第三项"), content: text)
        ],
      ),
    ]);
  }
}

class AntdCollapseLoadingDemo extends StatefulWidget {
  const AntdCollapseLoadingDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdCollapseLoadingDemoStateDemo();
  }
}

/// @t 动态内容
/// @l [AntdCollapse]
class _AntdCollapseLoadingDemoStateDemo extends State<AntdCollapseLoadingDemo> {
  bool loading = false;
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdCollapse(
        value: [index],
        onChange: (index, check) {
          setState(() {
            this.index = check ? index : -1;
            if (check) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  loading = true;
                });
                Future.delayed(const Duration(seconds: 3)).then((_) {
                  setState(() {
                    loading = false;
                  });
                });
              });
            }
          });
        },
        items: [
          AntdCollapseItem(
              title: const Text("第一项"),
              content: AntdLoading(
                circular: true,
                color: AntdColor.primary,
                spinning: loading,
                text: const Text("加载中"),
                child: text,
              )),
          const AntdCollapseItem(
              title: Text("第二项"),
              activeIcon: AntdIcon(
                icon: AntdIcons.app,
              ),
              content: text),
          const AntdCollapseItem(
              title: Text("第三项"),
              activeIcon: AntdIcon(
                icon: AntdIcons.smile,
              ),
              content: text)
        ],
      )
    ]);
  }
}
