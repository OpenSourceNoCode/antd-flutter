import 'dart:math';

import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 没有内容区域
/// @d 底部的边框也会随着内容区域一起消失
/// @l [AntdTabs]
class AntdTabsNoChildDemo extends StatelessWidget {
  const AntdTabsNoChildDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      AntdTabs(tabs: [
        AntdTab(
          title: Text("水果"),
          value: "1",
        ),
        AntdTab(
          title: Text("蔬菜"),
          value: "2",
        ),
        AntdTab(
          title: Text("动物"),
          value: "3",
        )
      ])
    ]);
  }
}

/// @t 对齐方式
/// @d 当内容不足的时候 tab如何对齐
/// @l [AntdTabs]
class AntdTabsTabAlignmentDemo extends StatelessWidget {
  const AntdTabsTabAlignmentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      AntdTabs(tabAlignment: AntdTabAlignment.left, tabs: [
        AntdTab(
          title: Text("水果"),
          value: "1",
        ),
        AntdTab(
          title: Text("蔬菜"),
          value: "2",
        ),
        AntdTab(
          title: Text("动物"),
          value: "3",
        )
      ]),
      AntdTabs(tabAlignment: AntdTabAlignment.center, tabs: [
        AntdTab(
          title: Text("水果"),
          value: "1",
        ),
        AntdTab(
          title: Text("蔬菜"),
          value: "2",
        ),
        AntdTab(
          title: Text("动物"),
          value: "3",
        )
      ]),
    ]);
  }
}

/// @t 绑定多个panel,多个panel不会互相影响
/// @d 通过更改physics实现不同的内容滚动效果
/// 通过alignment 可以控制第二个内容到达那里时再切页 默认是滚动一半时切页
/// @l [AntdTabs]
class AntdTabsTabPhysicsDemo extends StatelessWidget {
  const AntdTabsTabPhysicsDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AntdTabController tabController = AntdTabController();
    return DemoWrapper(outline: false, child: [
      AntdTabs(
          controller: tabController,
          tabs: List.generate(
              15,
              (i) => AntdTab(
                  title: Text("Tab$i"), value: "$i", disabled: i % 4 == 0))),
      AntdTabPanel(
          physics: const PageScrollPhysics(),
          alignment: AntdEdge.center,
          tabController: tabController,
          items: List.generate(15, (i) {
            return AntdBox(
              style: AntdBoxStyle(color: getRandomColor(), padding: 12.all),
              child: Text("我是Tab$i的Child"),
            );
          })),
      AntdTabPanel(
          physics: const BouncingScrollPhysics(),
          alignment: AntdEdge.end,
          tabController: tabController,
          items: List.generate(15, (i) {
            return AntdBox(
              style: AntdBoxStyle(color: getRandomColor(), padding: 12.all),
              child: Text("我是Tab$i的Child"),
            );
          }))
    ]);
  }
}

/// @t 事件
/// @l [AntdTabs]
class AntdTabsTabOnChangeDemo extends StatelessWidget {
  const AntdTabsTabOnChangeDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AntdTabController tabController = AntdTabController();
    return DemoWrapper(outline: false, child: [
      AntdTabs(
          onChange: (value, index) {
            AntdToast.show("当前index:$index");
          },
          controller: tabController,
          tabs: List.generate(
              15,
              (i) => AntdTab(
                  title: Text("Tab$i"), value: "$i", disabled: i % 4 == 0))),
      AntdTabPanel(
          physics: const BouncingScrollPhysics(),
          alignment: AntdEdge.start,
          tabController: tabController,
          items: List.generate(15, (i) {
            return AntdBox(
              style: AntdBoxStyle(
                  color: getRandomColor(),
                  padding: 12.all,
                  textStyle: const TextStyle(color: Colors.white)),
              child: Text("我是Tab$i的Child，index:$i"),
            );
          }))
    ]);
  }
}

/// @t 搭配badge使用以及左右扩展区域
/// @l [AntdTabs]
class AntdTabsBadgeDemo extends StatelessWidget {
  const AntdTabsBadgeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      AntdTabs(
          leftExtra: AntdIcon(
            icon: AntdIcons.left,
          ),
          rightExtra: AntdIcon(
            icon: AntdIcons.rightright,
          ),
          tabs: [
            AntdTab(
                title: AntdBadge(
                  badge: Text("11"),
                  child: Text("Espresso"),
                ),
                value: "1",
                child: Text("1")),
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

/// @t 自定义样式
/// @l [AntdTabs]
class AntdTabsStyleDemo extends StatelessWidget {
  const AntdTabsStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdTabs(
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

/// @t 自定义指示灯样式和动画时长
/// @l [AntdTabs]
class AntdTabsIndicatorStyleDemo extends StatelessWidget {
  const AntdTabsIndicatorStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      AntdTabs(
          style: AntdTabsStyle(
              indicatorStyle:
                  AntdBoxStyle(color: Colors.red, width: 15, height: 4)),
          tabs: [
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

class AntdTabsPanelDemo extends StatefulWidget {
  const AntdTabsPanelDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdTabsPanelDemoStateDemo();
  }
}

/// @t 自定义滑动方向和面板位置
/// @d 如果面板不想默认出现在下方,那么[AntdTab]中不能有child
/// @l [AntdTabs]
class _AntdTabsPanelDemoStateDemo extends State<AntdTabsPanelDemo> {
  AntdTabController controller = AntdTabController();

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      Column(
        children: [
          AntdTabs(controller: controller, tabs: const [
            AntdTab(
              title: Text("Espresso"),
              value: "1",
            ),
            AntdTab(title: Text("Coffee Latte"), value: "2"),
            AntdTab(title: Text("Cappuccino"), value: "3"),
            AntdTab(title: Text("Americano"), value: "4"),
            AntdTab(title: Text("Flat White"), value: "5"),
            AntdTab(title: Text("Caramel Macchiato"), value: "6")
          ]),
          AntdBox(
            style: AntdBoxStyle(
                color: token.colorPrimary,
                textStyle: token.font.ms.copyWith(color: token.colorWhite)),
            child: const Text("我是其他内容,我上边是独立的tab,下边是独立的panel"),
          ),
          AntdBox(
            style: const AntdBoxStyle(height: 400),
            child: AntdTabPanel(
                tabController: controller,
                vertical: true,
                physics: const ClampingScrollPhysics(),
                alignment: AntdEdge.start,
                items: List.generate(
                    6,
                    (i) => AntdBox(
                          style: AntdBoxStyle(
                              color: getRandomColor(),
                              alignment: Alignment.center),
                          child: Text("我是Tab$i的child,index:$i"),
                        ))),
          )
        ],
      ),
    ]);
  }
}

Color getRandomColor() {
  final random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

String generateRandomString(int length) {
  const chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ),
  );
}

class AntdTabsLoadingDemo extends StatefulWidget {
  const AntdTabsLoadingDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdTabsLoadingDemoStateDemo();
  }
}

///懒加载
///@l [AntdTabs]
class _AntdTabsLoadingDemoStateDemo extends State<AntdTabsLoadingDemo> {
  final _loading = <int>[];
  final _loadinged = <int>[];
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      Column(
        children: [
          AntdTabs(
              onChange: (_, index) {
                if (index % 2 == 0 && !_loadinged.contains(index)) {
                  setState(() {
                    _loading.add(index);
                  });

                  Future.delayed(const Duration(seconds: 3), () {
                    _loadinged.add(index);
                    setState(() {
                      _loading.remove(index);
                    });
                  });
                }
              },
              tabs: List.generate(10, (i) {
                var child = AntdBox(
                  style: AntdBoxStyle(padding: 48.vertical),
                  child: Text(generateRandomString(i * 50)),
                );
                return AntdTab(
                    title: Text("Tab$i"),
                    value: "$i",
                    child: AntdLoading(
                      circular: true,
                      color: AntdColor.primary,
                      spinning: _loading.contains(i),
                      text: const Text("正在加载中"),
                      child: _loading.contains(i)
                          ? const AntdBox()
                          : Center(
                              child: child,
                            ),
                    ));
              })),
        ],
      ),
    ]);
  }
}
