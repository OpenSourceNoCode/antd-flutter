import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

/// @t 基础用法
/// @d 直接通过open打开
/// @l [AntdModal]
class AntdAlertModalDemo extends StatelessWidget {
  const AntdAlertModalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("基础弹窗"),
        onTap: () {
          AntdModal(
              title: const Text("我是标题"),
              header: const Text("我是Header"),
              builder: (controller, ctx) => const Center(
                    child: Text("我是基础弹窗"),
                  )).open();
        },
      ),
      AntdButton(
        child: const Text("提示对话框"),
        onTap: () {
          AntdModal.alert(const Center(
            child: Text("明月松间照，清泉石上流"),
          ));
        },
      ),
      AntdButton(
        child: const Text("确认对话框"),
        onTap: () {
          AntdModal.confirm(const Center(
            child: Text("明月松间照，清泉石上流"),
          ));
        },
      ),
    ]);
  }
}

/// @t 自定义按钮
/// @d 自定义对话框按钮列表
/// @l [AntdModal]
class AntdModalCustomerDemo extends StatelessWidget {
  const AntdModalCustomerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("自定义按钮"),
        onTap: () {
          AntdLayer.open(AntdModal(
            dismissOnAction: false,
            builder: (controller, ctx) {
              return const Center(
                child: Text("明月松间照，清泉石上流"),
              );
            },
            closeIcon: const AntdIcon(
              icon: AntdIcons.close,
            ),
            actions: [
              AntdModalAction(
                  primary: true,
                  title: const Text("在线阅读"),
                  onTap: (_) async {
                    await Future.delayed(const Duration(seconds: 3));
                  }),
              const AntdModalAction(
                title: Text("下载文件"),
              ),
              AntdModalAction(
                  title: const Text("取消"),
                  onTap: (close) async {
                    await close();
                  }),
              const AntdModalAction(title: Text("确认"))
            ],
          ));
        },
      ),
    ]);
  }
}

/// @t 内容区域
/// @d 可以自定义内容区域
/// @l [AntdModal]
class AntdModalCustomerContentDemo extends StatelessWidget {
  const AntdModalCustomerContentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdButton(
        child: const Text(" 自定义内容区域"),
        onTap: () {
          AntdLayer.open(AntdModal(
            header: AntdIcon(
              icon: AntdIcons.exclamationShield,
              style: AntdIconStyle(size: 48, color: token.colorWarning),
            ),
            title: const Text("注意"),
            builder: (controller, ctx) => const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("请用手机拍摄手持工牌照，注意保持照片清晰"), Text("明月松间照，清泉石上流")],
            ),
          ));
        },
      ),
    ]);
  }
}

/// @t 事件
/// @l [AntdModal]
class AntdModalEventDemo extends StatelessWidget {
  const AntdModalEventDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("弹窗事件"),
        onTap: () {
          AntdLayer.open(AntdModal(
              onClosed: () {
                AntdToast.show("关闭了弹窗");
              },
              onOpened: () {
                AntdToast.show("打开了弹窗");
              },
              onMaskTap: () {
                AntdToast.show("点击了弹窗");
              },
              builder: (controller, ctx) => const Center(
                    child: Text("明月松间照，清泉石上流"),
                  )));
        },
      ),
    ]);
  }
}

/// @t 等待弹窗完成
/// @l [AntdModal]
class AntdModalWaitDemo extends StatelessWidget {
  const AntdModalWaitDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("弹窗"),
        onTap: () async {
          await AntdModal.alert(const Center(
            child: Text("明月松间照，清泉石上流"),
          ));
          AntdToast.show("弹窗关闭了");
        },
      ),
    ]);
  }
}
