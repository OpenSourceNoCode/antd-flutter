import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 基础用法
/// @l [AntdPopover]
class AntdPopoverDemo extends StatelessWidget {
  const AntdPopoverDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdPopover(
        mode: AntdPopoverMode.light,
        placement: AntdPlacement.topLeft,
        builder: (close, ctx) {
          return const AntdBox(
            child: Text("Hello World"),
          );
        },
        child: const AntdButton(
          child: Text("亮色"),
        ),
      ),
      AntdPopover(
        mode: AntdPopoverMode.dark,
        builder: (close, ctx) {
          return const AntdBox(
            child: Text("Hello World"),
          );
        },
        child: const AntdButton(
          child: Text("暗色"),
        ),
      ),
      AntdPopover(
        trigger: AntdPopoverTrigger.longPress,
        mode: AntdPopoverMode.dark,
        builder: (close, ctx) {
          return const AntdBox(
            child: Text("我是长按打开的内容"),
          );
        },
        child: const AntdButton(
          child: Text("长按打开"),
        ),
      )
    ]);
  }
}

/// @t 事件
/// @l [AntdPopover]
class AntdPopoverEventDemo extends StatelessWidget {
  const AntdPopoverEventDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdPopover(
        mode: AntdPopoverMode.light,
        placement: AntdPlacement.topLeft,
        onClosed: () {
          AntdToast.show("关闭了Popover");
        },
        onOpened: () {
          AntdToast.show("打开了Popover");
        },
        onMaskTap: () {
          AntdToast.show("点击了Popover背景");
        },
        builder: (close, ctx) {
          return const AntdBox(
            child: Text("Hello World"),
          );
        },
        child: const AntdButton(
          child: Text("事件"),
        ),
      ),
    ]);
  }
}

/// @t 手动打开等待弹窗完成
/// @l [AntdPopover]
class AntdPopoverWaitDemo extends StatelessWidget {
  const AntdPopoverWaitDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final AntdPopoverController controller = AntdPopoverController();
    return DemoWrapper(child: [
      AntdPopover(
        controller: controller,
        mode: AntdPopoverMode.light,
        placement: AntdPlacement.topLeft,
        builder: (close, ctx) {
          return const AntdBox(
            child: Text("Hello World"),
          );
        },
        child: const AntdButton(
          child: Text('我上边有气泡'),
        ),
      ),
      AntdButton(
        child: const Text("点我打开"),
        onTap: () {
          controller.open();
        },
      )
    ]);
  }
}

/// @t 不同的弹出位置
/// @l [AntdPopover]
class AntdPlacementDemo extends StatelessWidget {
  const AntdPlacementDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
        child: AntdPlacement.values.map((value) {
      return AntdPopover(
        placement: value,
        builder: (close, ctx) {
          return const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AntdBox(
                child: Text("Hello World1"),
              ),
              AntdBox(
                child: Text("Hello World2"),
              ),
              AntdBox(
                child: Text("Hello World3"),
              ),
              AntdBox(
                child: Text("Hello World4"),
              )
            ],
          );
        },
        child: AntdButton(
          child: Text(value.name),
        ),
      );
    }).toList());
  }
}

/// @t 多种激活方式
/// @l [AntdPopover]
class AntdPopoverTriggerDemo extends StatelessWidget {
  const AntdPopoverTriggerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdPopover(
        placement: AntdPlacement.top,
        trigger: AntdPopoverTrigger.tap,
        builder: (close, ctx) {
          return const AntdBox(
            child: Text("Hello World1"),
          );
        },
        child: const AntdButton(
          child: Text("点击"),
        ),
      ),
      AntdPopover(
        placement: AntdPlacement.top,
        trigger: AntdPopoverTrigger.longPress,
        builder: (close, ctx) {
          return const AntdBox(
            child: Text("Hello World1"),
          );
        },
        child: const AntdButton(
          child: Text("长按"),
        ),
      )
    ]);
  }
}

/// @t 气泡菜单
/// @l [AntdPopover]
class AntdPopoverActionDemo extends StatelessWidget {
  const AntdPopoverActionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      AntdPopoverAction(
          onTap: (_) {
            AntdToast.show("我触摸了扫一扫");
          },
          child: Text("扫一扫"),
          icon: const AntdIcon(
            icon: AntdIcons.scanning,
          )),
      AntdPopoverAction(
          child: const Text("付钱/收钱"),
          icon: const AntdIcon(
            icon: AntdIcons.handPayCircle,
          )),
      AntdPopoverAction(
          child: const Text("乘车码"),
          icon: const AntdIcon(
            icon: AntdIcons.transportQRcode,
          )),
      AntdPopoverAction(
          child: const Text("智能助理"),
          icon: const AntdIcon(
            icon: AntdIcons.ant,
          ))
    ];

    return DemoWrapper(child: [
      AntdPopover(
        placement: AntdPlacement.topLeft,
        actions: actions,
        child: const AntdButton(
          child: Text("亮色"),
        ),
      ),
      AntdPopover(
        mode: AntdPopoverMode.dark,
        actions: actions,
        child: const AntdButton(
          child: Text("暗色"),
        ),
      ),
      AntdPopover(
        actions: actions.map((value) {
          return AntdPopoverAction(
            child: value.child,
          );
        }).toList(),
        child: const AntdButton(
          child: Text("没有图标"),
        ),
      )
    ]);
  }
}
