import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 动画
/// @l [AntdSkeleton]
class AntdSkeletonAnimatedDemo extends StatelessWidget {
  const AntdSkeletonAnimatedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      child: [
        DemoTitle(
            outline: false,
            title: "无动画",
            child: AntdSkeleton(
              animated: false,
            )),
        DemoTitle(title: "有动画", outline: false, child: AntdSkeleton())
      ],
    );
  }
}

/// @t 标题行
/// @d 动画使用
/// @l [AntdSkeleton]
class AntdSkeletonTitleDemo extends StatelessWidget {
  const AntdSkeletonTitleDemo({super.key});

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

class AntdSkeletonSpinDemo extends StatefulWidget {
  const AntdSkeletonSpinDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdSkeletonSpinDemoStateDemo();
  }
}

/// @t 受控loading
/// @l [AntdSkeleton]
class _AntdSkeletonSpinDemoStateDemo extends State<AntdSkeletonSpinDemo> {
  var spin = false;
  Widget? child = const AntdBox(
    style: AntdBoxStyle(height: 100, width: double.infinity, color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
      child: [
        AntdButton(
          onTap: () {
            setState(() {
              spin = !spin;
            });
          },
          child: Text("${spin ? '停止' : '开始'}加载"),
        ),
        DemoTitle(
            outline: false,
            title: "使用spin控制加载中",
            child: AntdSkeleton(
              animated: true,
              title: true,
              spin: spin,
              child: child,
            )),
        AntdButton(
          onTap: () async {
            setState(() {
              child = null;
            });
            await Future.delayed(const Duration(seconds: 3));
            setState(() {
              child = const AntdBox(
                style: AntdBoxStyle(
                    height: 100, width: double.infinity, color: Colors.red),
              );
            });
          },
          child: const Text("点我3s后加载出child"),
        ),
        DemoTitle(
            outline: false,
            title: "当spin为空时，使用child控制加载中",
            child: AntdSkeleton(
              animated: true,
              title: true,
              child: child,
            )),
      ],
    );
  }
}
