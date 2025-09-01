import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 基础用法
/// @l [AntdSlider]
class AntdSliderDemo extends StatelessWidget {
  const AntdSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSlider(
        onChange: (value) {
          AntdToast.show(
            "当前选中值为start:${value.start},end:${value.end}",
          );
        },
      )
    ]);
  }
}

/// @t 显示刻度并指定步距
/// @l [AntdSlider]
class AntdSliderTicksStepDemo extends StatelessWidget {
  const AntdSliderTicksStepDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSlider(
        ticks: true,
        step: 10,
        onChange: (value) {
          AntdToast.show(
            "当前选中值为start:${value.start},end:${value.end}",
          );
        },
      )
    ]);
  }
}

/// @t 传入刻度标记
/// @l [AntdSlider]
class AntdSliderTicksStepMarkDemo extends StatelessWidget {
  const AntdSliderTicksStepMarkDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSlider(
        ticks: true,
        step: 10,
        onChange: (value) {
          AntdToast.show(
            "当前选中值为${value.start}",
          );
        },
        renderTicks: (value) {
          return Text("$value");
        },
      )
    ]);
  }
}

/// @t 最大/最小值(50~80)
/// @l [AntdSlider]
class AntdSliderMaxMinDemo extends StatelessWidget {
  const AntdSliderMaxMinDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSlider(
        ticks: true,
        step: 10,
        max: 80,
        min: 50,
        onChange: (value) {
          AntdToast.show(
            "当前选中值为${value.end}",
          );
        },
      )
    ]);
  }
}

/// @t 默认值
/// @l [AntdSlider]
class AntdSliderDefaultDemo extends StatelessWidget {
  const AntdSliderDefaultDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSlider(
        ticks: true,
        step: 10,
        value: AntdSliderValue(start: 20, end: 0),
      )
    ]);
  }
}

/// @t 双滑块
/// @l [AntdSlider]
class AntdSliderRangeDemo extends StatelessWidget {
  const AntdSliderRangeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSlider(
        ticks: true,
        step: 10,
        range: true,
        value: const AntdSliderValue(start: 20, end: 40),
        onChange: (value) {
          AntdToast.show(
            "当前选中值为start:${value.start},end:${value.end}",
          );
        },
      )
    ]);
  }
}

/// @t 禁用状态
/// @l [AntdSlider]
class AntdSliderDisabledDemo extends StatelessWidget {
  const AntdSliderDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSlider(
        ticks: true,
        step: 10,
        range: true,
        disabled: true,
        value: AntdSliderValue(start: 20, end: 20),
      )
    ]);
  }
}

/// @t 自定义样式（通过 style）
/// @l [AntdSlider]
class AntdSliderCustomDemo extends StatelessWidget {
  const AntdSliderCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdSlider(
        style: AntdSliderStyle(
            activeMarkStyle: AntdBoxStyle(color: token.colorError),
            activeTrackStyle: AntdBoxStyle(color: token.colorSuccess)),
        ticks: true,
        step: 10,
        range: true,
        value: const AntdSliderValue(start: 20, end: 20),
      )
    ]);
  }
}
