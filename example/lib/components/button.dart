import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 填充模式
/// @l [AntdButton]
class AntdButtonFillDemo extends StatelessWidget {
  const AntdButtonFillDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdButton(
        fill: AntdButtonFill.solid,
        child: Text('solid'),
      ),
      AntdButton(
        fill: AntdButtonFill.outline,
        child: Text('outline'),
      ),
      AntdButton(
        fill: AntdButtonFill.none,
        child: Text('none'),
      ),
    ]);
  }
}

/// @t 块级按钮
/// @l [AntdButton]
class AntdButtonBlockDemo extends StatelessWidget {
  const AntdButtonBlockDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdButton(
        block: true,
        size: AntdSize.large,
        child: Text('solid'),
      ),
    ]);
  }
}

/// @t 不同尺寸
/// @l [AntdButton]
class AntdButtonSizeDemo extends StatelessWidget {
  const AntdButtonSizeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
        child: AntdSize.values.map((size) {
      return AntdButton(
        size: size,
        child: Text(size.name),
      );
    }).toList());
  }
}

/// @t 语意按钮
/// @l [AntdButton]
class AntdButtonColorDemo extends StatelessWidget {
  const AntdButtonColorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
        child: AntdColor.values.map((color) {
      return AntdButton(
        color: color,
        child: Text(color.name),
      );
    }).toList());
  }
}

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
        style: const AntdButtonStyle(
            buttonStyle: AntdBoxStyle(color: Colors.green)),
        styleBuilder: (context, button, style, token) {
          ///动态样式可以直接使用当前的属性
          if (button.size == AntdSize.large) {
            return AntdButtonStyle(
                buttonStyle: AntdBoxStyle(
                    textStyle:
                        token.font.xxl.copyWith(color: token.colorWarning)));
          }
          return style;
        },
        child: const Text("自定义样式"),
      ),
      AntdStyleBuilderProvider<AntdButtonStyle, AntdButton>(
        builder: (context, button, style, token) {
          return AntdButtonStyle(
              buttonStyle: AntdBoxStyle(
                  border: token.border
                      .copyWith(width: 4, color: token.colorSuccess)
                      .all));
        },
        child: Column(
          children: [
            AntdStyleProvider<AntdButtonStyle>(
                style: const AntdButtonStyle(
                    buttonStyle: AntdBoxStyle(opacity: 0.5)),
                child: AntdButton(
                  size: AntdSize.large,
                  style: AntdButtonStyle(
                      buttonStyle: AntdBoxStyle(
                          border: const BorderSide(width: 2, color: Colors.red)
                              .all)),
                  styleBuilder: (context, button, style, token) {
                    ///动态样式可以直接使用当前的属性
                    if (button.size == AntdSize.large) {
                      return AntdButtonStyle(
                          buttonStyle: AntdBoxStyle(
                              color: token.colorPrimary,
                              textStyle: token.font.xxl
                                  .copyWith(color: token.colorWarning)));
                    }
                    return style;
                  },
                  child: const Text("Button"),
                )),
            const AntdButton(
              child: Text("Button"),
            )
          ],
        ),
      )
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
