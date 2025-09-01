import 'dart:async';

import 'package:antd_flutter_mobile/index.dart';
import 'package:example/components/tab/tabs.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

/// @t 事件
/// @l [AntdPageIndicator]
class AntdPageIndicatorWhiteDemo extends StatefulWidget {
  const AntdPageIndicatorWhiteDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdPageIndicatorWhiteDemoStateDemo();
  }
}

class _AntdPageIndicatorWhiteDemoStateDemo
    extends State<AntdPageIndicatorWhiteDemo> {
  var index = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        if (index < 3) {
          index = index + 1;
        } else {
          index = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdPageIndicator(
        total: 4,
        style: AntdPageIndicatorStyle(
            bodyStyle: AntdBoxStyle(color: getRandomColor())),
        current: index,
      )
    ]);
  }
}

/// @t 垂直方向
/// @l [AntdPageIndicator]
class AntdPageIndicatorVerticalDemo extends StatelessWidget {
  const AntdPageIndicatorVerticalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdPageIndicator(
        vertical: true,
        total: 4,
        current: 0,
      )
    ]);
  }
}

/// @t 自定义样式
/// @l [AntdPageIndicator]
class AntdPageIndicatorStyleDemo extends StatelessWidget {
  const AntdPageIndicatorStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdPageIndicator(
        total: 4,
        style: AntdPageIndicatorStyle(
            bodyStyle:
                AntdBoxStyle(color: token.colorWarning, height: 4, width: 4),
            activeStyle:
                AntdBoxStyle(color: token.colorPrimary, height: 6, width: 16)),
        current: 0,
      )
    ]);
  }
}
