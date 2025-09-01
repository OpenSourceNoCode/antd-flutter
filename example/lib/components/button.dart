import 'package:antd_flutter/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 自定义图标
/// @d 前缀可是任意的[Widget]
/// @l [AntdButton]
class AntdButtonIconDemo extends StatelessWidget {
  const AntdButtonIconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdButton(
        icon: AntdIcon(
          icon: AntdIcons.search,
        ),
        color: AntdColor.warning,
        fill: AntdButtonFill.solid,
        child: Text("搜索"),
      ),
    ]);
  }
}

/// @t 自定样式
/// @d 通过style属性覆盖默认样式
/// @l [AntdButton]
class AntdButtonStyleDemo extends StatelessWidget {
  const AntdButtonStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        style: AntdButtonStyle(
            buttonStyle: AntdBoxStyle(
                border: const BorderSide(color: Colors.red).all,
                color: Colors.green,
                textStyle: const TextStyle(fontSize: 22, color: Colors.black))),
        child: const Text("自定义样式"),
      ),
    ]);
  }
}

/// @t 加载中
/// @d 基于AntdLoading实现
/// @l [AntdButton]
class AntdButtonLoadingDemo extends StatelessWidget {
  const AntdButtonLoadingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      const AntdButton(
        loading: true,
        color: AntdColor.primary,
        fill: AntdButtonFill.solid,
        child: Text("默认按钮"),
      ),
      AntdButton(
        onLoadingTap: () async {
          await Future.delayed(Duration(seconds: 3));
        },
        fill: AntdButtonFill.solid,
        child: const Text("自动loading"),
      ),
    ]);
  }
}

/// @t 节流和防抖
/// @d 当存在onTap时可以开启,并且没有禁用
/// @l [AntdButton]
class AntdButtonThrottleDebounceDemo extends StatelessWidget {
  const AntdButtonThrottleDebounceDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        throttle: const Duration(milliseconds: 200),
        fill: AntdButtonFill.solid,
        child: const Text("节流按钮"),
        onTap: () {
          AntdToast.show('节流触发点击:${DateTime.now().millisecondsSinceEpoch}');
        },
      ),
      AntdButton(
        debounce: const Duration(milliseconds: 200),
        fill: AntdButtonFill.solid,
        child: const Text("防抖按钮"),
        onTap: () {
          AntdToast.show('防抖触发点击:${DateTime.now().millisecondsSinceEpoch}');
        },
      ),
    ]);
  }
}
