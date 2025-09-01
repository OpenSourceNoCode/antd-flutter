import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 自定义样式
/// @l [AntdJumboTabs]
class AntdJumboTabsStyleDemo extends StatelessWidget {
  const AntdJumboTabsStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdJumboTabs(
          activeValue: "2",
          style: AntdJumboStyle(
              titleStyle: AntdBoxStyle(
                  textStyle:
                      token.font.sm.copyWith(color: token.colorWarning))),
          tabs: const [
            AntdJumboTab(
                title: Text("水果"),
                value: "1",
                child: Text("菠萝"),
                desc: Text("描述文案")),
            AntdJumboTab(
                title: Text("蔬菜"),
                value: "2",
                child: Text("西红柿"),
                desc: Text("描述文案")),
            AntdJumboTab(
                title: Text("动物"),
                value: "3",
                child: Text("蚂蚁"),
                desc: Text("描述文案"))
          ])
    ]);
  }
}
