import 'package:antd_flutter/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// @t 基础用法
/// @d 直接通过open打开
/// @l [AntdActionSheet]
class AntdActionSheetDemo extends StatelessWidget {
  const AntdActionSheetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("最简单的用法"),
        onTap: () {
          AntdLayer.open(const AntdActionSheet(
            actions: [
              AntdAction(title: Text("辅助")),
              AntdAction(title: Text("修改")),
              AntdAction(title: Text("保存"))
            ],
          ));
        },
      ),
    ]);
  }
}

/// @t 取消和额外描述
/// @l [AntdActionSheet]
class AntdActionSheetCancelExtraDemo extends StatelessWidget {
  const AntdActionSheetCancelExtraDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("取消和额外描述"),
        onTap: () {
          AntdLayer.open(const AntdActionSheet(
            extra: Text("请选择你要进行的操作"),
            cancelText: Text("取消"),
            actions: [
              AntdAction(title: Text("辅助")),
              AntdAction(title: Text("修改")),
              AntdAction(title: Text("保存"))
            ],
          ));
        },
      ),
    ]);
  }
}

/// @t 禁用和危险的选项
/// @l [AntdActionSheet]
class AntdActionSheetDisableDanderDemo extends StatelessWidget {
  const AntdActionSheetDisableDanderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("禁用和危险的选项"),
        onTap: () {
          AntdLayer.open(const AntdActionSheet(
            extra: Text("请选择你要进行的操作"),
            cancelText: Text("取消"),
            actions: [
              AntdAction(title: Text("辅助")),
              AntdAction(title: Text("修改"), disabled: true),
              AntdAction(
                  title: Text("删除"),
                  description: Text("删除后数据不可恢复"),
                  danger: true,
                  bold: true)
            ],
          ));
        },
      ),
    ]);
  }
}

/// @t 事件
/// @l [AntdActionSheet]
class AntdActionSheetEventDemo extends StatelessWidget {
  const AntdActionSheetEventDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("事件"),
        onTap: () {
          AntdLayer.open(AntdActionSheet(
            onClosed: () {
              AntdToast.show("关闭了弹出层");
            },
            onOpened: () {
              AntdToast.show("打开了弹出层");
            },
            onMaskTap: () {
              AntdToast.show("点击了弹出层");
            },
            extra: Text("请选择你要进行的操作"),
            cancelText: Text("取消"),
            actions: [
              AntdAction(
                  title: Text("辅助"),
                  onTap: (_) {
                    AntdToast.show("点击了辅助按钮");
                  }),
              AntdAction(title: Text("修改"), disabled: true),
              AntdAction(
                  title: Text("删除"),
                  description: Text("删除后数据不可恢复"),
                  danger: true,
                  bold: true)
            ],
          ));
        },
      ),
    ]);
  }
}

/// @t 等待弹窗结束
/// @l [AntdActionSheet]
class AntdActionSheetWaitDemo extends StatelessWidget {
  const AntdActionSheetWaitDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("取消和额外描述"),
        onTap: () async {
          await AntdLayer.open(const AntdActionSheet(
            extra: Text("请选择你要进行的操作"),
            cancelText: Text("取消"),
            actions: [
              AntdAction(title: Text("辅助")),
              AntdAction(title: Text("修改")),
              AntdAction(title: Text("保存"))
            ],
          ));
          AntdToast.show(
            "弹出层关闭了我才出现的",
            duration: Duration(seconds: 0),
          );
        },
      ),
    ]);
  }
}
