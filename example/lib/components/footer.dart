import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

/// @t 基础页脚
/// @l [AntdFooter]
class AntdFooterDemo extends StatelessWidget {
  const AntdFooterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdFooter(
        label: Text("没有更多了"),
      )
    ]);
  }
}

/// @t 自定义 label
/// @l [AntdFooter]
class AntdFooterLabelDemo extends StatelessWidget {
  const AntdFooterLabelDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdFooter(
        label: Row(
          children: [
            AntdIcon(
              icon: AntdIcons.handPayCircle,
            ),
            Text("蚂蚁财富")
          ],
        ),
      )
    ]);
  }
}

/// @t 带内容的页脚
/// @l [AntdFooter]
class AntdFooterContentDemo extends StatelessWidget {
  const AntdFooterContentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdFooter(
        content: Text("@ 2004-2020 Alipay.com All rights reserved"),
      )
    ]);
  }
}

const links = [Text("阿里云"), Text("支付宝")];

const chips = [
  AntdFooterChip(chip: Text("蚂蚁借呗")),
  AntdFooterChip(chip: Text("备用金")),
  AntdFooterChip(chip: Text("蚂蚁花呗"))
];

/// @t 带链接的页脚
/// @l [AntdFooter]
class AntdFooterLinksDemo extends StatelessWidget {
  const AntdFooterLinksDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdFooter(
        links: links,
      )
    ]);
  }
}

/// @t 带标签的页脚
/// @l [AntdFooter]
class AntdFooterChipsDemo extends StatelessWidget {
  const AntdFooterChipsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdFooter(
        chips: chips,
      )
    ]);
  }
}

const chipActives = [
  AntdFooterChip(chip: Text("蚂蚁借呗"), active: true),
  AntdFooterChip(chip: Text("备用金"), active: true),
  AntdFooterChip(chip: Text("蚂蚁花呗"), active: true)
];

/// @t 标签可点击
/// @l [AntdFooter]
class AntdFooterChipsActiveDemo extends StatelessWidget {
  const AntdFooterChipsActiveDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdFooter(
        chips: chipActives,
      )
    ]);
  }
}

/// @t 组合使用
/// @l [AntdFooter]
class AntdFooterChipsAllDemo extends StatelessWidget {
  const AntdFooterChipsAllDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdFooter(
        label: Text("没有更多了"),
        content: Text("@ 2004-2020 Alipay.com All rights reserved"),
        links: links,
        chips: chipActives,
      )
    ]);
  }
}
