import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 基础使用
/// @d 不开启动画
/// @l [AntdSkeleton]
class AntdSkeletonDemo extends StatelessWidget {
  const AntdSkeletonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      child: [
        AntdSkeleton(
          animated: false,
        )
      ],
    );
  }
}

/// @t 动画和标题行
/// @d 动画使用
/// @l [AntdSkeleton]
class AntdSkeletonAnimatedDemo extends StatelessWidget {
  const AntdSkeletonAnimatedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      child: [
        AntdSkeleton(
          animated: true,
          title: true,
        )
      ],
    );
  }
}

/// @t 多行
/// @l [AntdSkeleton]
class AntdSkeletonRowsDemo extends StatelessWidget {
  const AntdSkeletonRowsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      child: [
        AntdSkeleton(
          animated: true,
          title: true,
          rows: 6,
        )
      ],
    );
  }
}
