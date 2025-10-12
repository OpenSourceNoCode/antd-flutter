import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 扩展区
/// @d 左右两侧均可以放置扩展区域
/// @l [AntdJumboTabs]
class AntdJumboTabsExtraDemo extends StatelessWidget {
  const AntdJumboTabsExtraDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      DemoTitle(
          child: AntdJumboTabs(
              leftExtra: AntdBox(
                style: AntdBoxStyle(padding: 6.right),
                child: const Text("left"),
              ),
              rightExtra: const AntdIcon(
                icon: AntdIcons.ant,
              ),
              tabs: List.generate(30, (i) {
                return AntdJumboTab(
                    title: Text("Tab$i"),
                    value: i,
                    child: Text("$i"),
                    desc: Text("描述文案$i"));
              })))
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
/// @l [AntdJumboTabs]
class AntdJumboTabsOnChangeDemo extends StatelessWidget {
  const AntdJumboTabsOnChangeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      DemoTitle(
          title: "AntdTab的value 是数字",
          child: AntdJumboTabs(
              onChange: (value, index) {
                AntdToast.show("value:$value,index:$index",
                    position: AntdToastPosition.top);
              },
              tabs: List.generate(30, (i) {
                return AntdJumboTab(
                    title: Text("Tab$i"),
                    value: i,
                    child: Text("$i"),
                    desc: Text("描述文案$i"));
              }))),
      DemoTitle(
          title: "AntdTab的value是对象，数字等混合值",
          child: AntdJumboTabs(
              onChange: (value, index) {
                AntdToast.show("value:$value,index:$index",
                    position: AntdToastPosition.top);
              },
              tabs: List.generate(30, (i) {
                var data = i % 2 == 0 ? _Data(value: i) : i;
                return AntdJumboTab(
                    title: Text(i % 2 == 0 ? '对象数据' : '整型数据'),
                    value: data,
                    child: Text(data.toString()),
                    desc: Text("描述文案$i"));
              })))
    ]);
  }
}

class AntdJumboTabsActiveValueDemo extends StatefulWidget {
  const AntdJumboTabsActiveValueDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdJumboTabsActiveValueDemoStateDemo();
  }
}

/// @t 指定激活某个选项(支持任意类型的值)
/// @l [AntdJumboTabs]
class _AntdJumboTabsActiveValueDemoStateDemo
    extends State<AntdJumboTabsActiveValueDemo> {
  dynamic activeValue = 3;
  AntdTabController<AntdJumboTab> antdTabController = AntdTabController();

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
          child: AntdJumboTabs(
              activeValue: activeValue,
              onChange: (value, index) {
                setState(() {
                  activeValue = value;
                });
              },
              tabs: List.generate(
                10,
                (i) => AntdJumboTab(
                    title: Text("Tab$i"),
                    value: i,
                    child: Text("$i"),
                    desc: Text("描述文案$i")),
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
          child: AntdJumboTabs(
              controller: antdTabController,
              tabs: List.generate(
                10,
                (i) => AntdJumboTab(
                    title: Text("Tab$i"),
                    value: i,
                    child: Text("$i"),
                    desc: Text("描述文案$i")),
              ))),
    ]);
  }
}

/// @t 对齐方式
/// @d 当内容充满屏幕时选择卡如何对齐
/// @l [AntdJumboTabs]
class AntdJumboTabsAlignmentDemo extends StatelessWidget {
  const AntdJumboTabsAlignmentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      DemoTitle(
          title: "tabAlignment:AntdTabAlignment.left 选择卡在左侧",
          child: AntdJumboTabs(tabAlignment: AntdTabAlignment.left, tabs: [
            AntdJumboTab(title: Text("Tab1"), value: "1", child: Text("1")),
            AntdJumboTab(title: Text("Tab2"), value: "2", child: Text("2")),
            AntdJumboTab(title: Text("Tab3"), value: "3", child: Text("3")),
          ])),
      DemoTitle(
          title: "tabAlignment:AntdTabAlignment.center 选择居中 并强制自动均分宽度",
          child: AntdJumboTabs(tabAlignment: AntdTabAlignment.center, tabs: [
            AntdJumboTab(title: Text("Tab1"), value: "1", child: Text("1")),
            AntdJumboTab(title: Text("Tab2"), value: "2", child: Text("2")),
            AntdJumboTab(title: Text("Tab3"), value: "3", child: Text("3")),
          ]))
    ]);
  }
}

/// @t 震动反馈
/// @d 通过hapticFeedback属性 当选项卡切换时提供震动反馈
/// @l [AntdJumboTabs]
class AntdJumboTabsHapticFeedbackDemo extends StatelessWidget {
  const AntdJumboTabsHapticFeedbackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      DemoTitle(
          child: AntdJumboTabs(
              hapticFeedback: AntdHapticFeedback.heavy,
              tabs: List.generate(30, (i) {
                return AntdJumboTab(
                    title: Text("Tab$i"),
                    value: i,
                    child: Text("$i"),
                    desc: Text("描述文案$i"));
              })))
    ]);
  }
}

/// @t 自定义样式
/// @l [AntdJumboTabs]
class AntdJumboTabsStyleDemo extends StatelessWidget {
  const AntdJumboTabsStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdJumboTabs(
          activeValue: "2",
          style: AntdJumboStyle(
              activeTitleStyle: AntdBoxStyle(
                  color: token.colorSuccess,
                  textStyle: TextStyle(color: token.colorText)),
              titleStyle: AntdBoxStyle(
                  color: token.colorPrimary,
                  textStyle: TextStyle(color: token.colorWhite))),
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
