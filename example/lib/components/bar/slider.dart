import 'package:antd_flutter_mobile/index.dart';
import 'package:example/components/tab/tabs.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

var _items = List.generate(100, (i) {
  return AntdSliderBarItem(
      value: i,
      content: AntdBox(
        style: AntdBoxStyle(
            color: getRandomColor(), height: i % 2 == 0 ? 100 : 400),
        child: Text("内容$i"),
      ),
      title: Text("选项$i"));
});

/// @t 内容的高度
/// @l [AntdSliderBar]
class AntdSliderBarFitDemo extends StatelessWidget {
  const AntdSliderBarFitDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "AntdScrollItemFit.fill每个内容撑满一屏",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(
                contentFit: AntdScrollItemFit.fill, items: _items),
          )),
      DemoTitle(
          title: "AntdScrollItemFit.child根据自身的内容自适应",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(
                contentFit: AntdScrollItemFit.child, items: _items),
          )),
      DemoTitle(
          title: "AntdScrollItemFit.split,内容无法撑满时自动均分，内容过多时自适应",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(
                contentFit: AntdScrollItemFit.split, items: _items),
          ))
    ]);
  }
}

/// @t 当内容滚动时标题栏如何对齐
/// @l [AntdSliderBar]
class AntdSliderBarTitlePlacementDemo extends StatelessWidget {
  const AntdSliderBarTitlePlacementDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "最顶部对齐",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(titlePlacement: AntdEdge.start, items: _items),
          )),
      DemoTitle(
          title: "中间对齐",
          child: SizedBox(
            height: 500,
            child:
                AntdSliderBar(titlePlacement: AntdEdge.center, items: _items),
          )),
      DemoTitle(
          title: "底部对齐",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(titlePlacement: AntdEdge.end, items: _items),
          ))
    ]);
  }
}

/// @t 震动反馈
/// @l [AntdSliderBar]
class AntdSliderBarHapticFeedbackDemo extends StatelessWidget {
  const AntdSliderBarHapticFeedbackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "关闭反馈",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(
                hapticFeedback: AntdHapticFeedback.none, items: _items),
          )),
      DemoTitle(
          title: "hapticFeedback自定义反馈级别",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(
                hapticFeedback: AntdHapticFeedback.medium, items: _items),
          )),
    ]);
  }
}

/// @t 事件
/// @l [AntdSliderBar]
class AntdSliderBarEventDemo extends StatelessWidget {
  const AntdSliderBarEventDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "AntdSliderBar的onChange,可以读取AntdSliderBarItem的完整属性",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(
                onChange: (item, index) {
                  AntdToast.show("我是:${item.value}");
                },
                items: _items),
          )),
      DemoTitle(
          title: "标题栏目触底/触顶事件",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(
                onChange: (item, index) {
                  AntdToast.show("我是:${item.value}");
                },
                onEdgeReached: (offset, up) async {
                  AntdToast.show("到达${up ? '顶部' : '底部'}");
                },
                items: _items),
          )),
      DemoTitle(
          title: "通过edgeThreshold控制触底/触顶阈值",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(
                onChange: (item, index) {
                  AntdToast.show("我是:${item.value}");
                },
                edgeThreshold: 0.3,
                onEdgeReached: (offset, up) async {
                  AntdToast.show("到达${up ? '顶部' : '底部'}");
                },
                items: _items),
          )),
      DemoTitle(
          title: "标题栏索引监听事件",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(
                onChange: (item, index) {
                  AntdToast.show("我是:${item.value}");
                },
                onEdgeReached: (offset, up) async {
                  AntdToast.show("到达${up ? '顶部' : '底部'}");
                },
                onItemPosition: (ctx) {
                  AntdToast.show("当前是:${ctx.index},进入:${ctx.visibleHeight},");
                },
                items: _items),
          )),
    ]);
  }
}

/// @t 标题栏宽度和填充方式
/// @l [AntdSliderBar]
class AntdSliderBarTitleDemo extends StatelessWidget {
  const AntdSliderBarTitleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "自定义标题栏宽度",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(
                style: const AntdSliderBarStyle(
                    titleStyle: AntdBoxStyle(width: 200)),
                items: _items),
          )),
      DemoTitle(
          title: "每行都填充宽度",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(fit: AntdScrollItemFit.fill, items: _items),
          )),
      DemoTitle(
          title: "自动均分",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(fit: AntdScrollItemFit.split, items: _items),
          )),
      DemoTitle(
          title: "内容自适应",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(fit: AntdScrollItemFit.child, items: _items),
          )),
    ]);
  }
}

/// @t 自定义样式
/// @d 通过style 可以覆盖默认样式
/// @l [AntdSliderBar]
class AntdSliderBarStyleDemo extends StatelessWidget {
  const AntdSliderBarStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      SizedBox(
        height: 500,
        child: AntdSliderBar(items: [
          AntdSliderBarItem(
              value: "1",
              content: Row(
                children: [
                  const Text("选项1"),
                  Text(
                    "(8)",
                    style:
                        token.font.ms.copyWith(color: token.colorText.tertiary),
                  )
                ],
              ),
              title: const Text("我是标题1")),
          const AntdSliderBarItem(
              value: "2",
              disabled: true,
              content: Text("选项2"),
              title: Text("我是标题2")),
          const AntdSliderBarItem(
              value: "3", content: Text("选项3"), title: Text("我是标题3")),
          const AntdSliderBarItem(
              value: "4", content: Text("选项4"), title: Text("我是标题4"))
        ]),
      )
    ]);
  }
}

class AntdSliderBarMoreDemo extends StatefulWidget {
  const AntdSliderBarMoreDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdSliderBarMoreDemoStateDemo();
  }
}

/// @t 加载更多和懒加载
/// @l [AntdSliderBar]
class _AntdSliderBarMoreDemoStateDemo extends State<AntdSliderBarMoreDemo> {
  var titleMoreItems = [..._items];
  final _laodingIndex = [];
  final _loadingingIndex = [];

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      DemoTitle(
          title: "标题栏触底加载更多",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(
              items: titleMoreItems,
              onEdgeReached: (offset, up) async {
                if (!up) {
                  AntdToast.show("触发加载");
                  setState(() {
                    titleMoreItems.addAll(List.generate(5, (i) {
                      var index = titleMoreItems.length + i;
                      return AntdSliderBarItem(
                          value: index,
                          content: AntdBox(
                            style: AntdBoxStyle(
                                color: getRandomColor(), height: 200),
                            child: Text("内容$index,${DateTime.now()}"),
                          ),
                          title: Text("新增$index"));
                    }));
                  });
                  await Future.delayed(const Duration(seconds: 2));
                }
              },
            ),
          )),
      DemoTitle(
          title: "内容懒加载",
          child: SizedBox(
            height: 500,
            child: AntdSliderBar(
              onChange: (item, index) async {
                if (_laodingIndex.contains(index)) {
                  return;
                }

                setState(() {
                  _loadingingIndex.add(index);
                });
                await Future.delayed(const Duration(seconds: 3));
                setState(() {
                  _laodingIndex.add(index);
                  _loadingingIndex.remove(index);
                });
              },
              items: List.generate(20, (i) {
                return AntdSliderBarItem(
                    value: i,
                    content: AntdBox(
                      style: AntdBoxStyle(
                          color: i % 2 == 0
                              ? token.colorPrimary
                              : token.colorSuccess,
                          height: 200),
                      child: AntdBox(
                        style: AntdBoxStyle(padding: 8.all),
                        child: _loadingingIndex.contains(i)
                            ? const AntdSkeleton(
                                rows: 3,
                              )
                            : Text("内容$i"),
                      ),
                    ),
                    title: Text("新增$i"));
              }),
            ),
          )),
    ]);
  }
}

class AntdSliderBarControllerDemo extends StatefulWidget {
  const AntdSliderBarControllerDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdSliderBarControllerDemoStateDemo();
  }
}

/// @t 使用Controller手动控制跳转
/// @l [AntdSliderBar]
class _AntdSliderBarControllerDemoStateDemo
    extends State<AntdSliderBarControllerDemo> {
  AntdSliderBarController controller = AntdSliderBarController();

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Wrap(
        spacing: 12,
        children: [
          AntdButton(
            onTap: () {
              controller.toIndex(50);
            },
            child: const Text("跳转至50"),
          ),
          AntdButton(
            onTap: () {
              controller.toIndex(99);
            },
            child: const Text("跳转至99"),
          )
        ],
      ),
      SizedBox(
        height: 500,
        child: AntdSliderBar(controller: controller, items: _items),
      )
    ]);
  }
}
