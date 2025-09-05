import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

/// @t 基础用法
/// @d 直接通过open打开
/// @l [AntdDialog]
class AntdAlertDialogDemo extends StatelessWidget {
  const AntdAlertDialogDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("基础弹窗 open打开"),
        onTap: () {
          AntdDialog(
              title: const Text("我是标题"),
              header: const Text("我是Header"),
              actions: const [
                AntdDialogAction(
                  title: Text("我是一个Action"),
                )
              ],
              builder: (controller, ctx) {
                return const Center(
                  child: Text("明月松间照，清泉石上流"),
                );
              }).open();
        },
      ),
      AntdButton(
        child: const Text("对话框 静态方法"),
        onTap: () {
          AntdDialog.alert(const Text("明月松间照，清泉石上流"),
              header: const Text("我是Header"), title: const Text("我是Title"));
        },
      ),
      AntdButton(
        child: const Text("确认框 静态方法"),
        onTap: () {
          AntdDialog.confirm(const Text("明月松间照，清泉石上流"),
              header: const Text("我是Header"), title: const Text("我是Title"));
        },
      ),
    ]);
  }
}

/// @t 自定义按钮
/// @d 自定义对话框按钮列表
/// @l [AntdDialog]
class AntdDialogCustomerDemo extends StatelessWidget {
  const AntdDialogCustomerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("自定义按钮"),
        onTap: () {
          AntdLayer.open(AntdDialog(
            builder: (controller, ctx) => const Center(
              child: Text("明月松间照，清泉石上流"),
            ),
            dismissOnAction: true,
            actions: [
              AntdDialogAction(
                  title: const Text("在线阅读"),
                  onTap: (_) async {
                    await Future.delayed(const Duration(seconds: 3));
                  }),
              const AntdDialogAction(
                title: Text("下载文件"),
              ),
              const AntdDialogAction(title: Text("取消"), bottom: true),
              const AntdDialogAction(
                  title: Text("确认"), danger: true, bottom: true)
            ],
          ));
        },
      ),
    ]);
  }
}

/// @t 内容区域
/// @d 可以自定义内容区域
/// @l [AntdDialog]
class AntdDialogCustomerContentDemo extends StatelessWidget {
  const AntdDialogCustomerContentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdButton(
        child: const Text(" 自定义内容区域"),
        onTap: () {
          AntdLayer.open(AntdDialog(
            header: AntdIcon(
              icon: AntdIcons.exclamationShield,
              style: AntdIconStyle(size: 48, color: token.colorWarning),
            ),
            title: const Text("注意"),
            builder: (controller, ctx) => const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("请用手机拍摄手持工牌照，注意保持照片清晰"), Text("明月松间照，清泉石上流")],
            ),
            actions: [
              AntdDialogAction(
                title: Text("我知道了"),
              )
            ],
          ));
        },
      ),
    ]);
  }
}

/// @t 事件
/// @l [AntdDialog]
class AntdDialogEventDemo extends StatelessWidget {
  const AntdDialogEventDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("对话框事件"),
        onTap: () {
          AntdLayer.open(AntdDialog(
              onClosed: () {
                AntdToast.show("关闭了对话框");
              },
              onOpened: () {
                AntdToast.show("打开了对话框");
              },
              onMaskTap: () {
                AntdToast.show("点击了对话框");
              },
              builder: (controller, ctx) => const Center(
                    child: Text("明月松间照，清泉石上流"),
                  )));
        },
      ),
    ]);
  }
}

/// @t 等待对话框完成
/// @l [AntdDialog]
class AntdDialogWaitDemo extends StatelessWidget {
  const AntdDialogWaitDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("对话框"),
        onTap: () async {
          await AntdDialog.alert(const Center(
            child: Text("明月松间照，清泉石上流"),
          ));
          AntdToast.show("对话框关闭了");
        },
      ),
    ]);
  }
}
