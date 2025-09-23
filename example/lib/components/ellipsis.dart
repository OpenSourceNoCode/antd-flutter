import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

const ellipsisText =
    "Excepteur deserunt aliqua elit in velit et dolor dolor ullamco laboris eiusmod in. Id deserunt commodo eu ut consequat in aliquip. Id consequat minim enim Lorem voluptate esse ullamco. Deserunt quis dolore ipsum nulla do officia. Cillum amet magna nostrud.";

/// @t 事件
/// @l [AntdEllipsis]
class AntdEllipsisCustomDemo extends StatelessWidget {
  const AntdEllipsisCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdBox(
        style: AntdBoxStyle(padding: 16.right),
        child: AntdEllipsis(
          onCollapseTap: () {
            AntdToast.show("点击了收起");
          },
          onExpandTap: () {
            AntdToast.show("点击了展开");
          },
          onTextTap: () {
            AntdToast.show("点击了文本");
          },
          content: ellipsisText,
          collapseText: "点我收起",
          expandText: "点我展开",
        ),
      )
    ]);
  }
}
