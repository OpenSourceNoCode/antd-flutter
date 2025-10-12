import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

/// @t 基础分割线
/// @d 默认水平最宽
/// @l [AntdDivider]
class AntdDividerDemo extends StatelessWidget {
  const AntdDividerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [AntdDivider()]);
  }
}

/// @t 基础分割线
/// @d 居中对齐
/// @l [AntdDivider]
class AntdDividerContentDemo extends StatelessWidget {
  const AntdDividerContentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdDivider(
        child: Text("默认中间"),
      ),
      AntdDivider(
        position: AntdDividerPosition.left,
        child: Text("在左侧"),
      ),
      AntdDivider(
        position: AntdDividerPosition.right,
        child: Text("在右侧"),
      )
    ]);
  }
}

/// @t 自定义样式
/// @d 通过[AntdDividerStyle]覆盖默认样式
/// @l [AntdDivider]
class AntdDividerStyleDemo extends StatelessWidget {
  const AntdDividerStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdDivider(
        style: AntdDividerStyle(
          color: token.colorPrimary,
          width: 4,
        ),
        child: const Text("默认中间"),
      ),
    ]);
  }
}

/// @t 垂直分割线
/// @d 设置vertical为ture
/// @l [AntdDivider]
class AntdDividerVerticalDemo extends StatelessWidget {
  const AntdDividerVerticalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      Row(
        children: [
          Text(
            "我在左边",
            style: token.font.sm,
          ),
          const AntdDivider(vertical: true),
          const Text("我在右边"),
          const AntdDivider(vertical: true),
          const Text("最右边"),
        ],
      )
    ]);
  }
}
