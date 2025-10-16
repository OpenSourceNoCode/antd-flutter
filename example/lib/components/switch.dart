import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

import 'form/form.dart';

/// @t 基础使用
/// @d 使用defaultValue来指定业务数据，支持任意数据类型
/// @l [AntdSwitch]
class AntdSwitchDemo extends StatelessWidget {
  const AntdSwitchDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSwitch(
        value: 1,
        content: const Text("关闭"),
        activeContent: const Text("打开"),
        onChange: (value) async {
          AntdToast.show("当前值:$value");
        },
      ),
      AntdSwitch(
        value: 2,
        content: const Text("关闭"),
        activeContent: const Text("打开"),
        onChange: (value) async {
          AntdToast.show("当前值:$value");
        },
      ),
      AntdSwitch(
        value: 3,
        onChange: (value) async {
          AntdToast.show("当前值:$value");
        },
      ),
    ]);
  }
}

/// @t 自定义样式
/// @l [AntdSwitch]
class AntdSwitchCustomDemo extends StatelessWidget {
  const AntdSwitchCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdSwitch(
        style: AntdSwitchStyle(
            trackStyle: AntdBoxStyle(color: token.colorError),
            activeTrackStyle:
                AntdBoxStyle(color: token.colorSuccess, padding: 10.all),
            thumbStyle: AntdBoxStyle(height: 14, color: token.colorPrimary)),
      ),
    ]);
  }
}

class AntdSwitchValueDemo extends StatefulWidget {
  const AntdSwitchValueDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdSwitchValueDemoStateDemo();
  }
}

/// @t 受控模式 设置manual为true
/// @l [AntdSwitch]
class _AntdSwitchValueDemoStateDemo extends State<AntdSwitchValueDemo> {
  bool? status;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSwitch(
        value: status,
        manual: true,
        content: const Text("关闭"),
        activeContent: const Text("打开"),
        onChange: (value) async {
          AntdToast.show("当前值:$value");
        },
      ),
      Wrap(
        spacing: 12,
        children: [
          AntdButton(
            child: const Text("打开"),
            onTap: () {
              setState(() {
                status = true;
              });
            },
          ),
          AntdButton(
            child: const Text("关闭"),
            onTap: () {
              setState(() {
                status = false;
              });
            },
          )
        ],
      )
    ]);
  }
}

/// @t 只读和禁用
/// @l [AntdSwitch]
class AntdSwitchDisabledDemo extends StatelessWidget {
  const AntdSwitchDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSwitch(
        disabled: true,
        content: Text("禁用"),
      ),
      AntdSwitch(
        readOnly: true,
        value: true,
        activeContent: Text("只读"),
      ),
    ]);
  }
}

class AntdSwitchFormDemo extends StatefulWidget {
  const AntdSwitchFormDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdSwitchFormDemoStateDemo();
  }
}

/// @t 与表单配合
/// @l [AntdSwitch]
class _AntdSwitchFormDemoStateDemo extends State<AntdSwitchFormDemo> {
  bool value = false;
  bool value1 = false;

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "最基础 在AntdFormItem中使用会自动收集AntdSwitch的值,务必指定一个defaultValue",
          child: AntdForm(builder: (controller) {
            return FormValue(
                controller: controller,
                child: AntdFormItem(
                    name: "switch",
                    builder: (ctx) {
                      return const AntdSwitch(
                        value: false,
                      );
                    }));
          })),
      DemoTitle(
          outline: false,
          title: "表单控制默认值",
          child: AntdForm(
              initialValues: const {"switch": false},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "switch",
                        builder: (ctx) {
                          return const AntdSwitch();
                        }));
              })),
      DemoTitle(
          outline: false,
          title:
              "表单控制只读禁用,属性的优先级遵守最近原则,虽然AntdFormItem指定的disabled,但是AntdSwitch覆盖了",
          child: AntdForm(
              initialValues: const {"switch": false},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "switch",
                        readOnly: true,
                        disabled: true,
                        builder: (ctx) {
                          return const AntdSwitch(
                            disabled: false,
                          );
                        }));
              })),
      DemoTitle(
          outline: false,
          title: "不要表单自动收集 必须在合适的时候手动 否则不会同步",
          child: AntdForm(
              initialValues: const {"switch": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "switch",
                        builder: (ctx) {
                          return const AntdSwitch(
                            autoCollect: false,
                          );
                        }));
              })),
      AntdButton(
        child: const Text('点我修改'),
        onTap: () {
          setState(() {
            value = !value;
          });
        },
      ),
      DemoTitle(
          outline: false,
          title: "autoCollect:true的时候外部改变 Value 也会同步至表单",
          child: AntdForm(
              initialValues: const {"switch": '1'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "switch",
                        builder: (ctx) {
                          return AntdSwitch(
                            value: value,
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
            value1 = !value1;
          });
        },
      ),
      DemoTitle(
          outline: false,
          title: "使用shouldTriggerChange 控制当外部的value改变时要不要触发onChange",
          child: AntdForm(
              initialValues: const {"switch": '1'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "switch",
                        builder: (ctx) {
                          return AntdSwitch(
                            value: value1,
                            manual: true,
                            onChange: (value) {
                              AntdToast.show("当前的输入值:$value",
                                  position: AntdToastPosition.top);
                              setState(() {
                                this.value1 = value;
                              });
                            },
                            shouldTriggerChange: false,
                          );
                        }));
              })),
    ]);
  }
}
