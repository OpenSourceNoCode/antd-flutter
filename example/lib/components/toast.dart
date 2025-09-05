import 'package:antd_flutter_mobile/components/button/index.dart';
import 'package:antd_flutter_mobile/components/icon/icon.dart';
import 'package:antd_flutter_mobile/components/icon/index.dart';
import 'package:antd_flutter_mobile/components/layer.dart';
import 'package:antd_flutter_mobile/components/toast/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/cupertino.dart';

/// @t 事件
/// @d 多种打开方式
/// @l [AntdToast]
class AntdToastDemo extends StatelessWidget {
  const AntdToastDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdToast.show("Toast");
          },
          child: const Text("静态方法")),
      AntdButton(
          onTap: () {
            AntdToast(
              builder: (close, state) => const Text("Toast"),
            ).open();
          },
          child: const Text("open方法")),
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdToast(
              builder: (close, state) => const Text("Toast"),
            ));
          },
          child: const Text("AntdLayer Open")),
    ]);
  }
}

/// @t 图标
/// @d 带一个前缀图标
/// @l [AntdToast]
class AntdToastIconDemo extends StatelessWidget {
  const AntdToastIconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdToast.show("上传失败");
          },
          child: const Text("成功")),
      AntdButton(
          onTap: () {
            AntdToast.show("上传失败");
          },
          child: const Text("失败")),
      AntdButton(
          onTap: () {
            AntdToast.show("上传中",
                icon: const AntdIcon(
                  icon: AntdIcons.upload,
                ));
          },
          child: const Text("自定义图标"))
    ]);
  }
}

/// @t 更多功能
/// @d 支持背景点击阻止，顶部底部和动态内容
/// @l [AntdToast]
class AntdToastMoreDemo extends StatelessWidget {
  const AntdToastMoreDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdToast.show(
              "触摸我消失",
              position: AntdToastPosition.center,
            );
          },
          child: const Text("触摸后消失")),
      AntdButton(
          onTap: () async {
            await AntdToast.show(
              "我关闭后会再打开一个",
              position: AntdToastPosition.center,
            );
            await AntdToast.show(
              "我是自动打开的",
              position: AntdToastPosition.center,
            );
          },
          child: const Text("等待返回")),
      AntdButton(
          onTap: () {
            AntdToast.show("顶部提示", position: AntdToastPosition.top);
          },
          child: const Text("顶部提示")),
      AntdButton(
          onTap: () {
            AntdToast.show("底部提示", position: AntdToastPosition.bottom);
          },
          child: const Text("底部提示")),
      AntdButton(
          onTap: () {
            AntdToast(
              builder: (_, ctx) {
                return const Text("请耐心等待, 不要退出");
              },
              showMask: true,
              dismissOnMaskTap: false,
            ).open();
          },
          child: const Text("阻止背景点击")),
      AntdButton(
          onTap: () {
            AntdToast.show(
              "我5s后才会消失",
              duration: const Duration(seconds: 5),
            );
          },
          child: const Text("自定义展示时长"))
    ]);
  }
}

/// @t 手动关闭
/// @d 手动需要将[Duration]设置为null或者0
/// @l [AntdToast]
class AntdToastManuleDemo extends StatelessWidget {
  const AntdToastManuleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdToast.show(
              key: const ValueKey("toask-close"),
              "这个不会自动消失",
              duration: null,
            );
          },
          child: const Text("显示")),
      AntdButton(
          onTap: () {
            AntdLayer.closeByKey(const ValueKey("toask-close"));
          },
          child: const Text("关闭")),
    ]);
  }
}
