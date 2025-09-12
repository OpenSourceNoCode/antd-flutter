import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

/// @t 通告栏语义
/// @l [AntdNoticeBar]
class AntdNoticeBarDemo extends StatelessWidget {
  const AntdNoticeBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdNoticeBar(
        content: "默认",
      ),
      AntdNoticeBar(
        color: AntdColor.warning,
        content: "警告",
      ),
      AntdNoticeBar(
        color: AntdColor.danger,
        content: "错误",
      ),
      AntdNoticeBar(
        color: AntdColor.primary,
        content: "信息",
      ),
      AntdNoticeBar(
        color: AntdColor.info,
        content: "信息",
      ),
      AntdNoticeBar(
        color: AntdColor.link,
        content: "链接",
      )
    ]);
  }
}

/// @t 可关闭
/// @l [AntdNoticeBar]
class AntdNoticeBarCloseableDemo extends StatelessWidget {
  const AntdNoticeBarCloseableDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdNoticeBar(
        closeable: true,
        onClose: () {
          AntdToast.show("点击了关闭", position: AntdToastPosition.top);
        },
        content: "默认",
      ),
    ]);
  }
}

/// @t 超长滚动
/// @l [AntdNoticeBar]
class AntdNoticeBarWrapFalseDemo extends StatelessWidget {
  const AntdNoticeBarWrapFalseDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdNoticeBar(
        wrap: false,
        color: AntdColor.warning,
        content: "veniam "
            "culpa "
            "occaecat"
            " ad dolore incididunt fugiat consequat Lorem est "
            "enim consectetur duis sint adipisicing adipisicing l"
            "aboris sunt adipisicing officia",
      ),
    ]);
  }
}

/// @t 多行展示
/// @l [AntdNoticeBar]
class AntdNoticeBarWrapDemo extends StatelessWidget {
  const AntdNoticeBarWrapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdNoticeBar(
          wrap: true,
          color: AntdColor.warning,
          content: "适用于当前页面内信息的通知，是一种较醒目的页面内通知方式"),
    ]);
  }
}

/// @t 自定义
/// @l [AntdNoticeBar]
class AntdNoticeBarCustomDemo extends StatelessWidget {
  const AntdNoticeBarCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdNoticeBar(
        closeable: true,
        icon: AntdIcon(
          icon: AntdIcons.receivePayment,
        ),
        closeIcon: AntdIcon(
          icon: AntdIcons.closeCircle,
        ),
        content: "自定义图标",
      ),
      AntdNoticeBar(
        closeable: true,
        icon: AntdIcon(
          icon: AntdIcons.receivePayment,
        ),
        closeIcon: AntdIcon(
          icon: AntdIcons.closeCircle,
        ),
        content: "自定义右侧功能区",
        extra: Row(
          children: [Text("查看详情"), Text("关闭")],
        ),
      ),
    ]);
  }
}
