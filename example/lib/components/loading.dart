import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 默认
/// @l [AntdLoading]
class AntdLoadingDemo extends StatelessWidget {
  const AntdLoadingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdLoading(),
      AntdLoading(
        circular: true,
      ),
    ]);
  }
}

/// @t 不同大小
/// @l [AntdLoading]
class AntdLoadingSizeDemo extends StatelessWidget {
  const AntdLoadingSizeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdLoading(
        color: AntdColor.primary,
        size: 4,
      ),
      AntdLoading(
        color: AntdColor.primary,
        size: 6,
      ),
      AntdLoading(
        color: AntdColor.primary,
        size: 12,
      ),
      AntdLoading(
        color: AntdColor.primary,
        size: 24,
      ),
      AntdLoading(
        circular: true,
        color: AntdColor.primary,
        size: 12,
      ),
      AntdLoading(
        circular: true,
        color: AntdColor.primary,
        size: 16,
      ),
      AntdLoading(
        circular: true,
        color: AntdColor.primary,
        size: 24,
      ),
      AntdLoading(
        circular: true,
        color: AntdColor.primary,
        size: 32,
      ),
    ]);
  }
}

/// @t 有子元素
/// @d loading自动居中，并且会自动添加遮罩层
/// @l [AntdLoading]
class AntdLoadingChildDemo extends StatelessWidget {
  const AntdLoadingChildDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdLoading(
        circular: true,
        child: AntdBox(
          style: AntdBoxStyle(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              color: token.colorPrimary),
          child: const Text("子元素"),
        ),
      ),
    ]);
  }
}
