import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

import 'form/form.dart';

/// @t 基础用法
/// @l [AntdSlider]
class AntdSliderDemo extends StatelessWidget {
  const AntdSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdSlider(
        onChange: (value) {
          AntdToast.show(
            "当前选中值为start:${value?.start},end:${value?.end}",
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
            "当前选中值为start:${value?.start},end:${value?.end}",
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
            "当前选中值为${value?.start}",
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
            "当前选中值为${value?.end}",
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
            "当前选中值为start:${value?.start},end:${value?.end}",
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

class AntdSliderControllerDemo extends StatefulWidget {
  const AntdSliderControllerDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdSliderControllerDemoStateDemo();
  }
}

/// @t 受控模式,设置manual位true
/// @l [AntdSlider]
class _AntdSliderControllerDemoStateDemo
    extends State<AntdSliderControllerDemo> {
  AntdSliderValue? value = const AntdSliderValue(start: 20, end: 30);
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSlider(
        ticks: true,
        step: 10,
        range: true,
        value: value,
        manual: true,
        onChange: (value) {
          setState(() {
            this.value = value;
          });
        },
      ),
      AntdButton(
        onTap: () {
          setState(() {
            value = const AntdSliderValue(start: 20, end: 30);
          });
        },
        child: const Text("动态修改"),
      )
    ]);
  }
}

class AntdSliderFormDemo extends StatefulWidget {
  const AntdSliderFormDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdSliderFormDemoStateDemo();
  }
}

/// @t 与表单配合
/// @l [AntdSlider]
class _AntdSliderFormDemoStateDemo extends State<AntdSliderFormDemo> {
  AntdSliderValue? value;
  AntdSliderValue? value1;

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "最基础 在AntdFormItem中使用会自动收集AntdSlider的值,务必指定一个defaultValue",
          child: AntdForm(builder: (controller) {
            return FormValue(
                controller: controller,
                child: AntdFormItem(
                    name: "slider",
                    builder: (ctx) {
                      return const AntdSlider(
                        ticks: true,
                        step: 10,
                        range: true,
                      );
                    }));
          })),
      DemoTitle(
          outline: false,
          title: "表单控制默认值",
          child: AntdForm(
              initialValues: const {
                "slider": AntdSliderValue(start: 20, end: 40)
              },
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "slider",
                        builder: (ctx) {
                          return const AntdSlider(
                            ticks: true,
                            step: 10,
                            range: true,
                          );
                        }));
              })),
      DemoTitle(
          outline: false,
          title:
              "表单控制只读禁用,属性的优先级遵守最近原则,虽然AntdFormItem指定的disabled,但是AntdSlider覆盖了",
          child: AntdForm(
              initialValues: const {
                "slider": AntdSliderValue(start: 20, end: 40)
              },
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "slider",
                        readOnly: true,
                        disabled: true,
                        builder: (ctx) {
                          return const AntdSlider(
                            disabled: false,
                            ticks: true,
                            step: 10,
                            range: true,
                          );
                        }));
              })),
      DemoTitle(
          outline: false,
          title: "不要表单自动收集 必须在合适的时候手动 否则不会同步",
          child: AntdForm(
              initialValues: const {
                "slider": AntdSliderValue(start: 20, end: 40)
              },
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "slider",
                        builder: (ctx) {
                          return const AntdSlider(
                            autoCollect: false,
                            ticks: true,
                            step: 10,
                            range: true,
                          );
                        }));
              })),
      AntdButton(
        child: const Text('点我修改'),
        onTap: () {
          setState(() {
            value = const AntdSliderValue(start: 20, end: 30);
          });
        },
      ),
      DemoTitle(
          outline: false,
          title: "autoCollect:true的时候外部改变 Value 也会同步至表单",
          child: AntdForm(
              initialValues: const {
                "slider": AntdSliderValue(start: 20, end: 40)
              },
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "slider",
                        builder: (ctx) {
                          return AntdSlider(
                            value: value,
                            ticks: true,
                            step: 10,
                            range: true,
                            manual: true,
                            onChange: (value) {
                              AntdToast.show("当前的输入值:$value",
                                  position: AntdToastPosition.top);
                              setState(() {
                                this.value = value;
                              });
                            },
                          );
                        }));
              })),
      AntdButton(
        child: const Text('点我修改'),
        onTap: () {
          setState(() {
            value1 = const AntdSliderValue(start: 20, end: 30);
          });
        },
      ),
      DemoTitle(
          outline: false,
          title: "使用shouldTriggerChange 控制当外部的value改变时要不要触发onChange",
          child: AntdForm(
              initialValues: const {
                "slider": AntdSliderValue(start: 20, end: 40)
              },
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "slider",
                        builder: (ctx) {
                          return AntdSlider(
                            value: value1,
                            ticks: true,
                            step: 10,
                            range: true,
                            manual: true,
                            onChange: (value) {
                              AntdToast.show("当前的输入值:$value",
                                  position: AntdToastPosition.top);
                              setState(() {
                                this.value = value;
                              });
                            },
                            shouldTriggerChange: false,
                          );
                        }));
              })),
    ]);
  }
}
