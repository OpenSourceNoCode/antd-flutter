import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 自定义样式
/// @d 自定义样式
/// @l [AntdCapsuleTabs]
class AntdCapsuleTabsStyleDemo extends StatelessWidget {
  const AntdCapsuleTabsStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdCapsuleTabs(
          style: AntdTabsStyle(
              titleStyle: AntdBoxStyle(
                  textStyle:
                      token.font.sm.copyWith(color: token.colorWarning))),
          tabs: const [
            AntdTab(title: Text("Espresso"), value: "1", child: Text("1")),
            AntdTab(title: Text("Coffee Latte"), value: "2", child: Text("2")),
            AntdTab(title: Text("Cappuccino"), value: "3", child: Text("3")),
            AntdTab(title: Text("Americano"), value: "4", child: Text("4")),
            AntdTab(title: Text("Flat White"), value: "5", child: Text("5")),
            AntdTab(
                title: Text("Caramel Macchiato"), value: "6", child: Text("6"))
          ])
    ]);
  }
}
