import 'dart:convert';

import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

import '../form/form.dart';

/// @t 基础使用
/// @l [AntdCheckbox]
class AntdCheckboxDemo extends StatelessWidget {
  const AntdCheckboxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AntdCheckbox(
            value: true,
            onChange: (value) {
              AntdToast.show("变更为:$value");
            },
            extra: const Text("有描述的复选框"),
          ),
          const AntdCheckbox(
            disabled: true,
            extra: Text("禁用"),
          )
        ],
      )
    ]);
  }
}

class AntdCheckboxIndeterminateDemo extends StatefulWidget {
  const AntdCheckboxIndeterminateDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdCheckboxIndeterminateDemoStateDemo();
  }
}

/// @t 全选和半选
/// @l [AntdCheckbox]
class _AntdCheckboxIndeterminateDemoStateDemo
    extends State<AntdCheckboxIndeterminateDemo> {
  var values = <int>[];
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AntdCheckbox(
            value: true,
            indeterminate: values.length != 3,
            extra: const Text("半选"),
          ),
          ...(List.generate(3, (i) {
            return AntdCheckbox(
              onChange: (check) {
                setState(() {
                  if (check == true) {
                    values.add(i);
                  } else {
                    values.remove(i);
                  }
                });
              },
              extra: Text("我是$i"),
            );
          }))
        ],
      )
    ]);
  }
}

/// @t 自定义样式
/// @l [AntdCheckbox]
class AntdCheckboxCustomDemo extends StatelessWidget {
  const AntdCheckboxCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdCheckbox(
        value: true,
        style: AntdCheckboxStyle(
            icon: const AntdIcon(
              icon: AntdIcons.smile,
            ),
            activeIcon: AntdIcon(
              style: AntdIconStyle(size: 22, color: token.colorPrimary),
              icon: AntdIcons.smileFill,
            ),
            disableIcon: AntdIcon(
              style: AntdIconStyle(color: token.colorPrimary),
              icon: AntdIcons.delete,
            ),
            activeIconStyle: AntdIconStyle(
                bodyStyle: AntdBoxStyle(color: token.colorWhite))),
        extra: const Text("我是自定义内容"),
      ),
    ]);
  }
}

class AntdCheckboxValueDemo extends StatefulWidget {
  const AntdCheckboxValueDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdCheckboxValueDemoStateDemo();
  }
}

/// @t 受控模式
/// @l [AntdCheckbox]
class _AntdCheckboxValueDemoStateDemo extends State<AntdCheckboxValueDemo> {
  bool? check = false;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdCheckbox(
        value: check,
        manual: true,
        extra: const Text("受控模式"),
      ),
      Row(
        children: [
          AntdButton(
            child: const Text("选中"),
            onTap: () {
              setState(() {
                check = true;
              });
            },
          ),
          AntdButton(
            child: const Text("取消"),
            onTap: () {
              setState(() {
                check = null;
              });
            },
          )
        ],
      )
    ]);
  }
}

/// @t 只读和禁用
/// @l [AntdCheckbox]
class AntdCheckboxDisabledDemo extends StatelessWidget {
  const AntdCheckboxDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdCheckbox(
        disabled: true,
        extra: Text("禁用"),
      ),
      AntdCheckbox(
        readOnly: true,
        value: true,
        extra: Text("只读"),
      ),
    ]);
  }
}

/// @t 选择组
/// @l [AntdCheckbox]
class AntdCheckboxGroupDemo extends StatelessWidget {
  const AntdCheckboxGroupDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdCheckboxGroup(
        items: const [
          AntdCheckbox(
            extra: Text("1"),
            value: 1,
          ),
          AntdCheckbox(
            extra: Text("2"),
            value: 2,
          ),
          AntdCheckbox(
            extra: Text("3"),
            value: 3,
          ),
        ],
        onChange: (values) {
          AntdToast.show(jsonEncode(values));
        },
      )
    ]);
  }
}

class AntdCheckboxFormDemo extends StatefulWidget {
  const AntdCheckboxFormDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdCheckboxFormDemoStateDemo();
  }
}

/// @t 与表单配合
/// @l [AntdCheckbox]
class _AntdCheckboxFormDemoStateDemo extends State<AntdCheckboxFormDemo> {
  bool value = false;
  bool value1 = false;

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "最基础 在AntdFormItem中使用会自动收集AntdCheckbox的值,务必指定一个value",
          child: AntdForm(builder: (controller) {
            return FormValue(
                controller: controller,
                child: AntdFormItem(
                    name: "checkbox",
                    builder: (ctx) {
                      return const AntdCheckbox(
                        value: "1",
                      );
                    }));
          })),
      DemoTitle(
          outline: false,
          title: "表单控制默认值",
          child: AntdForm(
              initialValues: const {"checkbox": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "checkbox",
                        builder: (ctx) {
                          return const AntdCheckbox();
                        }));
              })),
      DemoTitle(
          outline: false,
          title:
              "表单控制只读禁用,属性的优先级遵守最近原则,虽然AntdFormItem指定的disabled,但是AntdCheckbox覆盖了",
          child: AntdForm(
              initialValues: const {"checkbox": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "checkbox",
                        readOnly: true,
                        disabled: true,
                        builder: (ctx) {
                          return const AntdCheckbox(
                            disabled: false,
                          );
                        }));
              })),
      DemoTitle(
          outline: false,
          title: "不要表单自动收集 必须在合适的时候手动 否则不会同步",
          child: AntdForm(
              initialValues: const {"checkbox": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "checkbox",
                        builder: (ctx) {
                          return const AntdCheckbox(
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
              initialValues: const {"checkbox": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "checkbox",
                        builder: (ctx) {
                          return AntdCheckbox(
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
              initialValues: const {"checkbox": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "checkbox",
                        builder: (ctx) {
                          return AntdCheckbox(
                            value: value1,
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
