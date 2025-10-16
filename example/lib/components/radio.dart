import 'dart:convert';

import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

import 'form/form.dart';

/// @t 基础使用
/// @l [AntdRadio]
class AntdRadioDemo extends StatelessWidget {
  const AntdRadioDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AntdRadio(
            value: 1,
            onChange: (value) async {
              AntdToast.show("变更为:$value");
            },
            extra: const Text("有描述的单选框"),
          ),
          const AntdRadio(
            value: 1,
            indeterminate: true,
            extra: Text("半选"),
          ),
          const AntdRadio(
            value: 1,
            disabled: true,
            extra: Text("禁用"),
          )
        ],
      )
    ]);
  }
}

/// @t 自定义样式
/// @l [AntdRadio]
class AntdRadioCustomDemo extends StatelessWidget {
  const AntdRadioCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdRadio(
        value: 1,
        style: AntdRadioStyle(
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

class AntdRadioValueDemo extends StatefulWidget {
  const AntdRadioValueDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdRadioValueDemoStateDemo();
  }
}

/// @t 受控模式 设置manual为true 通过onChange更新
/// @l [AntdRadio]
class _AntdRadioValueDemoStateDemo extends State<AntdRadioValueDemo> {
  bool? check = false;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdRadio(
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
/// @l [AntdRadio]
class AntdRadioDisabledDemo extends StatelessWidget {
  const AntdRadioDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdRadio(
        disabled: true,
        extra: Text("禁用"),
      ),
      AntdRadio(
        readOnly: true,
        value: true,
        extra: Text("只读"),
      ),
    ]);
  }
}

/// @t 选择组
/// @l [AntdRadio]
class AntdRadioGroupDemo extends StatelessWidget {
  const AntdRadioGroupDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdRadioGroup(
        items: const [
          AntdRadio(
            extra: Text("1"),
            value: 1,
          ),
          AntdRadio(
            extra: Text("2"),
            value: 2,
          ),
          AntdRadio(
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

class AntdRadioFormDemo extends StatefulWidget {
  const AntdRadioFormDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdRadioFormDemoStateDemo();
  }
}

/// @t 与表单配合
/// @l [AntdRadio]
class _AntdRadioFormDemoStateDemo extends State<AntdRadioFormDemo> {
  bool value = false;
  bool value1 = false;

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "最基础 在AntdFormItem中使用会自动收集AntdRadio的值,务必指定一个value",
          child: AntdForm(builder: (controller) {
            return FormValue(
                controller: controller,
                child: AntdFormItem(
                    name: "radio",
                    builder: (ctx) {
                      return const AntdRadio(
                        value: true,
                      );
                    }));
          })),
      DemoTitle(
          outline: false,
          title: "表单控制默认值",
          child: AntdForm(
              initialValues: const {"radio": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "radio",
                        builder: (ctx) {
                          return const AntdRadio();
                        }));
              })),
      DemoTitle(
          outline: false,
          title:
              "表单控制只读禁用,属性的优先级遵守最近原则,虽然AntdFormItem指定的disabled,但是AntdRadio覆盖了",
          child: AntdForm(
              initialValues: const {"radio": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "radio",
                        readOnly: true,
                        disabled: true,
                        builder: (ctx) {
                          return const AntdRadio(
                            disabled: false,
                          );
                        }));
              })),
      DemoTitle(
          outline: false,
          title: "不要表单自动收集 必须在合适的时候手动 否则不会同步",
          child: AntdForm(
              initialValues: const {"radio": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "radio",
                        builder: (ctx) {
                          return const AntdRadio(
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
              initialValues: const {"radio": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "radio",
                        builder: (ctx) {
                          return AntdRadio(
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
              initialValues: const {"radio": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "radio",
                        builder: (ctx) {
                          return AntdRadio(
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
