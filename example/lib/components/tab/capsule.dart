import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 扩展区
/// @d 左右两侧均可以放置扩展区域
/// @l [AntdCapsuleTabs]
class AntdCapsuleTabsExtraDemo extends StatelessWidget {
  const AntdCapsuleTabsExtraDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      DemoTitle(
          child: AntdCapsuleTabs(
              leftExtra: AntdBox(
                style: AntdBoxStyle(padding: 6.right),
                child: const Text("left"),
              ),
              rightExtra: const AntdIcon(
                icon: AntdIcons.ant,
              ),
              tabs: const [
            AntdTab(title: Text("Espresso"), value: "1", child: Text("1")),
            AntdTab(title: Text("Coffee Latte"), value: "2", child: Text("2")),
            AntdTab(title: Text("Cappuccino"), value: "3", child: Text("3")),
            AntdTab(title: Text("Americano"), value: "4", child: Text("4")),
            AntdTab(title: Text("Flat White"), value: "5", child: Text("5")),
            AntdTab(
                title: Text("Caramel Macchiato"), value: "6", child: Text("6"))
          ]))
    ]);
  }
}

class _Data {
  final int value;

  const _Data({required this.value});

  @override
  String toString() {
    return "value:$value";
  }
}

/// @t 事件
/// @d AntdTab的value支持任意值，这样你可以很方便的携带业务数据
/// @l [AntdCapsuleTabs]
class AntdCapsuleTabsOnChangeDemo extends StatelessWidget {
  const AntdCapsuleTabsOnChangeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      DemoTitle(
          title: "AntdTab的value 是字符串",
          child: AntdCapsuleTabs(
              onChange: (value, index) {
                AntdToast.show("value:$value,index:$index",
                    position: AntdToastPosition.top);
              },
              tabs: const [
                AntdTab(title: Text("Espresso"), value: "1", child: Text("1")),
                AntdTab(
                    title: Text("Coffee Latte"), value: "2", child: Text("2")),
                AntdTab(
                    title: Text("Cappuccino"), value: "3", child: Text("3")),
                AntdTab(title: Text("Americano"), value: "4", child: Text("4")),
                AntdTab(
                    title: Text("Flat White"), value: "5", child: Text("5")),
                AntdTab(
                    title: Text("Caramel Macchiato"),
                    value: "6",
                    child: Text("6"))
              ])),
      DemoTitle(
          title: "AntdTab的value是对象，字符串等混合值",
          child: AntdCapsuleTabs(
              onChange: (value, index) {
                AntdToast.show("value:$value,index:$index",
                    position: AntdToastPosition.top);
              },
              tabs: const [
                AntdTab(
                    title: Text("对象类型"),
                    value: _Data(value: 1),
                    child: Text("我的值是对象")),
                AntdTab(
                    title: Text("字符串"), value: "2", child: Text("我的值是字符串2")),
                AntdTab(
                    title: Text("对象类型"),
                    value: _Data(value: 2),
                    child: Text("我的值是对象")),
                AntdTab(
                    title: Text("字符串"), value: "4", child: Text("我的值是字符串4")),
                AntdTab(
                    title: Text("字符串"), value: "5", child: Text("我的值是字符串5")),
                AntdTab(title: Text("字符串"), value: "6", child: Text("我的值是字符串6"))
              ]))
    ]);
  }
}

class AntdCapsuleTabsActiveValueDemo extends StatefulWidget {
  const AntdCapsuleTabsActiveValueDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdCapsuleTabsActiveValueDemoStateDemo();
  }
}

/// @t 指定激活某个选项(支持任意类型的值)
/// @l [AntdCapsuleTabs]
class _AntdCapsuleTabsActiveValueDemoStateDemo
    extends State<AntdCapsuleTabsActiveValueDemo> {
  dynamic activeValue = 3;
  AntdTabController antdTabController = AntdTabController();

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      DemoTitle(
          title: "当使用activeValue控制可选项时，必须使用onChange同步",
          extra: Wrap(spacing: 12, children: [
            AntdButton(
              onTap: () {
                setState(() {
                  activeValue = 4;
                });
              },
              child: const Text("激活第4个"),
            ),
            AntdButton(
              onTap: () {
                setState(() {
                  activeValue = 6;
                });
              },
              child: const Text("激活第6个"),
            )
          ]),
          child: AntdCapsuleTabs(
              activeValue: activeValue,
              onChange: (value, index) {
                setState(() {
                  activeValue = value;
                });
              },
              tabs: List.generate(
                10,
                (i) =>
                    AntdTab(title: Text("Tab$i"), value: i, child: Text("$i")),
              ))),
      DemoTitle(
          title: "使用controller控制选中项",
          extra: Wrap(spacing: 12, children: [
            AntdButton(
              onTap: () {
                antdTabController.switchTo(4);
              },
              child: const Text("激活第4个"),
            ),
            AntdButton(
              onTap: () {
                antdTabController.switchTo(6);
              },
              child: const Text("激活第6个"),
            )
          ]),
          child: AntdCapsuleTabs(
              controller: antdTabController,
              tabs: List.generate(
                10,
                (i) =>
                    AntdTab(title: Text("Tab$i"), value: i, child: Text("$i")),
              ))),
    ]);
  }
}

/// @t 对齐方式
/// @d 当内容充满屏幕时选择卡如何对齐
/// @l [AntdCapsuleTabs]
class AntdCapsuleTabsAlignmentDemo extends StatelessWidget {
  const AntdCapsuleTabsAlignmentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      DemoTitle(
          title: "tabAlignment:AntdTabAlignment.left 选择卡在左侧",
          child: AntdCapsuleTabs(tabAlignment: AntdTabAlignment.left, tabs: [
            AntdTab(title: Text("Tab1"), value: "1", child: Text("1")),
            AntdTab(title: Text("Tab2"), value: "2", child: Text("2")),
            AntdTab(title: Text("Tab3"), value: "3", child: Text("3")),
          ])),
      DemoTitle(
          title: "tabAlignment:AntdTabAlignment.center 选择居中 并强制自动均分宽度",
          child: AntdCapsuleTabs(tabAlignment: AntdTabAlignment.center, tabs: [
            AntdTab(title: Text("Tab1"), value: "1", child: Text("1")),
            AntdTab(title: Text("Tab2"), value: "2", child: Text("2")),
            AntdTab(title: Text("Tab3"), value: "3", child: Text("3")),
          ]))
    ]);
  }
}

/// @t 震动反馈
/// @d 通过hapticFeedback属性 当选项卡切换时提供震动反馈
/// @l [AntdCapsuleTabs]
class AntdCapsuleTabsHapticFeedbackDemo extends StatelessWidget {
  const AntdCapsuleTabsHapticFeedbackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      DemoTitle(
        child: AntdCapsuleTabs(hapticFeedback: AntdHapticFeedback.heavy, tabs: [
          AntdTab(title: Text("Espresso"), value: "1", child: Text("1")),
          AntdTab(title: Text("Coffee Latte"), value: "2", child: Text("2")),
          AntdTab(title: Text("Cappuccino"), value: "3", child: Text("3")),
          AntdTab(title: Text("Americano"), value: "4", child: Text("4")),
          AntdTab(title: Text("Flat White"), value: "5", child: Text("5")),
          AntdTab(
              title: Text("Caramel Macchiato"), value: "6", child: Text("6"))
        ]),
      )
    ]);
  }
}

/// @t 自定义样式
/// @d 使用AntdTabsStyle自定义样式
/// @l [AntdCapsuleTabs]
class AntdCapsuleTabsStyleDemo extends StatelessWidget {
  const AntdCapsuleTabsStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      DemoTitle(
          child: AntdCapsuleTabs(
              style: AntdTabsStyle(
                  activeTitleStyle: AntdBoxStyle(
                      color: token.colorSuccess,
                      textStyle: TextStyle(color: token.colorText)),
                  titleStyle: AntdBoxStyle(
                      color: token.colorPrimary,
                      textStyle: TextStyle(color: token.colorWhite))),
              tabs: const [
            AntdTab(title: Text("Espresso"), value: "1", child: Text("1")),
            AntdTab(title: Text("Coffee Latte"), value: "2", child: Text("2")),
            AntdTab(title: Text("Cappuccino"), value: "3", child: Text("3")),
            AntdTab(title: Text("Americano"), value: "4", child: Text("4")),
            AntdTab(title: Text("Flat White"), value: "5", child: Text("5")),
            AntdTab(
                title: Text("Caramel Macchiato"), value: "6", child: Text("6"))
          ]))
    ]);
  }
}
