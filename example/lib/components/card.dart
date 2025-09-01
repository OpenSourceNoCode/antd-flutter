import 'package:antd_flutter/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 基础用法
/// @l [AntdCard]
class AntdCardDemo extends StatelessWidget {
  const AntdCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdCard(
        child: Text('卡片内容'),
      )
    ]);
  }
}

/// @t 自定义卡片内容
/// @l [AntdCard]
class AntdCardCustomDemo extends StatelessWidget {
  const AntdCardCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdCard(
        extra: const AntdIcon(
          icon: AntdIcons.rightright,
          style: AntdIconStyle(size: 13),
        ),
        icon: AntdIcon(
          icon: AntdIcons.ant,
          style: AntdIconStyle(color: token.colorPrimary),
        ),
        title: const Text("卡片标题"),
        footer: const AntdBox(
          style: AntdBoxStyle(
            alignment: Alignment.centerRight,
          ),
          child: AntdButton(
            color: AntdColor.primary,
            child: Text("底部按钮"),
          ),
        ),
        child: const Text('卡片内容'),
      )
    ]);
  }
}

/// @t 自定义卡片样式
/// @l [AntdCard]
class AntdCardCustomStyleDemo extends StatelessWidget {
  const AntdCardCustomStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdCard(
        style: AntdCardStyle(
            titleStyle: AntdBoxStyle(
                textStyle:
                    token.font.default_.copyWith(color: token.colorPrimary)),
            bodyStyle: AntdBoxStyle(
                textStyle:
                    token.font.default_.copyWith(color: token.colorError))),
        title: const Text("卡片标题"),
        child: const Text('卡片内容'),
      )
    ]);
  }
}
