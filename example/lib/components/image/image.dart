import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

const url =
    "https://images.unsplash.com/photo-1567945716310-4745a6b7844b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=60";

/// @t 基础使用
/// @l [AntdImage]
class AntdImageDemo extends StatelessWidget {
  const AntdImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdImage(
        image: NetworkImage(url),
      )
    ]);
  }
}

/// @t 多种填充模式
/// @l [AntdImage]
class AntdImageFitDemo extends StatelessWidget {
  const AntdImageFitDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
        child: BoxFit.values.map((value) {
      return AntdImage(
        style: const AntdImageStyle(bodyStyle: AntdBoxStyle(size: 100)),
        fit: value,
        image: const NetworkImage(url),
      );
    }).toList());
  }
}

/// @t 自定义圆角
/// @l [AntdImage]
class AntdImageRadiusDemo extends StatelessWidget {
  const AntdImageRadiusDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdImage(
        style: AntdImageStyle(
            bodyStyle:
                AntdBoxStyle(size: 100, radius: const Radius.circular(8).all)),
        image: const NetworkImage(url),
      ),
      AntdImage(
        style: AntdImageStyle(
            bodyStyle:
                AntdBoxStyle(size: 100, radius: const Radius.circular(18).all)),
        image: const NetworkImage(url),
      ),
      AntdImage(
        style: AntdImageStyle(
            bodyStyle: AntdBoxStyle(
                size: 100, radius: const Radius.circular(9999).all)),
        image: const NetworkImage(url),
      )
    ]);
  }
}

/// @t 加载失败
/// @l [AntdImage]
class AntdImageFailedDemo extends StatelessWidget {
  const AntdImageFailedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdImage(
        height: 100,
        width: 100,
        style: AntdImageStyle(
            bodyStyle: AntdBoxStyle(radius: const Radius.circular(8).all)),
        image: const AssetImage(""),
      ),
    ]);
  }
}
