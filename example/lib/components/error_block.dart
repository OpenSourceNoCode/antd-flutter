import 'package:antd_flutter/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

var style = AntdErrorBlockStyle(builder: (status) {
  return switch (status) {
    null => const AntdImage(
        image: AntdResource(assetName: "assets/images/error_default.png"),
      ),
    AntdErrorBlockStatus.none => const AntdImage(
        image: AntdResource(assetName: "assets/images/error_default.png"),
      ),
    AntdErrorBlockStatus.disconnected => const AntdImage(
        image: AntdResource(assetName: "assets/images/error_disconnected.png"),
      ),
    AntdErrorBlockStatus.empty => const AntdImage(
        image: AntdResource(assetName: "assets/images/error_empty.png"),
      ),
    AntdErrorBlockStatus.busy => const AntdImage(
        image: AntdResource(assetName: "assets/images/error_busy.png"),
      ),
  };
});

/// @t 四种状态
/// @l [AntdErrorBlock]
class AntdErrorBlockDemo extends StatelessWidget {
  const AntdErrorBlockDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdErrorBlock(
        style: style,
        status: AntdErrorBlockStatus.none,
      ),
      AntdErrorBlock(
        style: style,
        status: AntdErrorBlockStatus.disconnected,
      ),
      AntdErrorBlock(
        style: style,
        status: AntdErrorBlockStatus.empty,
      ),
      AntdErrorBlock(
        style: style,
        status: AntdErrorBlockStatus.busy,
      )
    ]);
  }
}

/// @t 自定义
/// @l [AntdErrorBlock]
class AntdErrorBlockCustomerDemo extends StatelessWidget {
  const AntdErrorBlockCustomerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdErrorBlock(
        style: style,
        status: AntdErrorBlockStatus.none,
        title: Text("页面遇到一些小问题"),
        desc: Text("Customize Description"),
        extra: AntdButton(
          color: AntdColor.primary,
          child: Text("点我修复"),
        ),
      )
    ]);
  }
}
