import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

var _antdBox = AntdBox(
  styleBuilder: (ctx, box, style, token) {
    return AntdBoxStyle(
      size: 30,
      radius: token.radius.all,
      color: token.colorFill.tertiary,
    );
  },
);

class AntdBadgeDemo extends StatefulWidget {
  const AntdBadgeDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdBadgeDemoStateDemo();
  }
}

/// @t 基础用法
/// @l [AntdBadge]
class _AntdBadgeDemoStateDemo extends State<AntdBadgeDemo> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdBadge(badge: const Text("6"), child: _antdBox),
      AntdBadge(badge: const Text("5"), dot: true, child: _antdBox),
    ]);
  }
}

/// @t 带边框
/// @l [AntdBadge]
class AntdBadgeBorderDemo extends StatelessWidget {
  const AntdBadgeBorderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdBadge(
          badge: Text("更新了"),
          bordered: true,
          child: AntdBox(
            style: AntdBoxStyle(
              height: 30,
              width: 30,
              radius: BorderRadius.all(Radius.circular(4)),
              color: Color(0xff666666),
            ),
          )),
    ]);
  }
}

/// @t 独立使用
/// @d 不设置child
/// @l [AntdBadge]
class AntdBadgeSelfDemo extends StatelessWidget {
  const AntdBadgeSelfDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
        child: [AntdBadge(badge: Text("99+")), AntdBadge(badge: Text("新消息!"))]);
  }
}

/// @t 自定义颜色和偏移量
/// @d 通过position和color
/// @l [AntdBadge]
class AntdBadgePositionColorDemo extends StatelessWidget {
  const AntdBadgePositionColorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdBadge(
          dot: true,
          color: AntdColor.primary,
          position: AntdBadgePosition.bottomLeft,
          child: _antdBox),
      AntdBadge(
          dot: true,
          color: AntdColor.success,
          position: AntdBadgePosition.topLeft,
          child: _antdBox),
      AntdBadge(
          dot: true,
          color: AntdColor.danger,
          position: AntdBadgePosition.topRight,
          child: _antdBox),
      AntdBadge(
          dot: true,
          color: AntdColor.warning,
          position: AntdBadgePosition.bottomRight,
          child: _antdBox),
    ]);
  }
}
