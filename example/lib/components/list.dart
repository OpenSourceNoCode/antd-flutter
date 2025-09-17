import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 自定义builder
/// @d 如果没有itemBuilder，那么如果items中是Widget的会自动使用[AntdListItem]包裹，否则不会做任何处理
/// @l [AntdList]
class AntdListDemo extends StatelessWidget {
  const AntdListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      SizedBox(
        height: 200,
        child: AntdList(
            itemBuilder: (context) {
              return AntdBox(
                style: AntdBoxStyle(
                    color: Colors.blue,
                    border:
                        const BorderSide(color: Colors.white, width: 1).bottom),
                child: context.data,
              );
            },
            items: List.generate(5, (i) {
              return Text(
                "$i",
                style: const TextStyle(color: Colors.white),
              );
            })),
      )
    ]);
  }
}

/// @t 带标题
/// @l [AntdList]
class AntdListHeaderDemo extends StatelessWidget {
  const AntdListHeaderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      SizedBox(
        height: 200,
        child: AntdList(
            header: const Text("我是Header"),
            items: List.generate(100, (i) {
              return Text("$i");
            })),
      )
    ]);
  }
}

/// @t 卡片样式
/// @l [AntdList]
class AntdListHeaderCardDemo extends StatelessWidget {
  const AntdListHeaderCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      SizedBox(
        height: 200,
        child: AntdList(
            header: const Text("我是Header"),
            card: true,
            items: List.generate(100, (i) {
              return Text("$i");
            })),
      )
    ]);
  }
}

/// @t 事件
/// @l [AntdList]
class AntdListOnItemPositionDemo extends StatelessWidget {
  const AntdListOnItemPositionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      SizedBox(
        height: 200,
        child: AntdList(
            onItemPosition: (ctx) {
              AntdToast.show(
                  "当前是:${ctx.index},已进入的高度${ctx.visibleHeight},尚未进入的高度:${ctx.hiddenHeight}");
            },
            items: List.generate(100, (i) {
              return Text("$i");
            })),
      )
    ]);
  }
}

/// @t 指定索引跳转
/// @l [AntdList]
class AntdListIndexDemo extends StatefulWidget {
  const AntdListIndexDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdListIndexDemoStateDemo();
  }
}

class _AntdListIndexDemoStateDemo extends State<AntdListIndexDemo> {
  AntdListController<Widget> controller = AntdListController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      Row(
        children: [
          AntdButton(
            child: const Text("点我跳转(总计1000000个元素)"),
            onTap: () {
              controller.toIndex(index);
            },
          ),
          Expanded(
              child: AntdInput(
            style: const AntdInputStyle(
                bodyStyle: AntdBoxStyle(color: Colors.white)),
            onChange: (value) {
              index = int.tryParse(value ?? "") ?? 0;
            },
          ))
        ],
      ),
      SizedBox(
        height: 200,
        child: AntdList(
            controller: controller,
            virtual: true,
            items: List.generate(1000000, (i) {
              return Text("$i");
            })),
      )
    ]);
  }
}
