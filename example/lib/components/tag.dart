import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

/// @t 事件
/// @l [AntdTag]
class AntdTagRoundDemo extends StatelessWidget {
  const AntdTagRoundDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdTag(
        onTap: () {
          AntdToast.show("触摸了");
        },
        color: AntdColor.primary,
        child: const Text("触摸事件"),
      ),
      AntdTag(
        onTap: () {
          AntdToast.show("我是触摸事件");
        },
        onClose: () {
          AntdToast.show("我是关闭事件");
        },
        color: AntdColor.primary,
        round: true,
        close: const AntdIcon(
          icon: AntdIcons.close,
        ),
        child: const Text("关闭事件"),
      ),
    ]);
  }
}

/// @t 自定义样式
/// @l [AntdTag]
class AntdTagCustomDemo extends StatelessWidget {
  const AntdTagCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdTag(
        style: AntdTagStyle(
            bodyStyle: AntdBoxStyle(color: token.colorPrimary, padding: 4.all),
            closeIconStyle: AntdIconStyle(
                bodyStyle: AntdBoxStyle(color: token.colorWarning))),
        child: const Text("自定义样式"),
        close: AntdBox(
          child: Text("取消"),
        ),
      ),
    ]);
  }
}
