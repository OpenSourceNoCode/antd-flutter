import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 基础用法
/// @l [AntdEmpty]
class AntdEmptyDemo extends StatelessWidget {
  const AntdEmptyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdEmpty(
        ///写在主题里即可 不必一个个写
        image: AntdImage(image: AssetImage("assets/images/empty.png")),
      )
    ]);
  }
}

/// @t 描述文字
/// @l [AntdEmpty]
class AntdEmptyDescriptionDemo extends StatelessWidget {
  const AntdEmptyDescriptionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdEmpty(
        ///写在主题里即可 不必一个个写
        image: AntdImage(image: AssetImage("assets/images/empty.png")),
        description: Text("暂无数据"),
      )
    ]);
  }
}

/// @t 自定义样式
/// @l [AntdEmpty]
class AntdEmptyCustomerDemo extends StatelessWidget {
  const AntdEmptyCustomerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdEmpty(
        style:
            AntdEmptyStyle(bodyStyle: AntdBoxStyle(color: token.colorPrimary)),

        ///写在主题里即可 不必一个个写
        image: const AntdImage(image: AssetImage("assets/images/empty.png")),
        description: const Text("暂无数据"),
      )
    ]);
  }
}
