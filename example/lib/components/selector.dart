import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

import 'form/form.dart';

const options = [
  AntdSelectorItem(
    label: Text("选项1"),
    value: "1",
  ),
  AntdSelectorItem(
    label: Text("选项2"),
    value: "2",
  ),
  AntdSelectorItem(label: Text("选项3"), value: "3", description: Text("选项1的描述"))
];

/// @t 基础使用
/// @l [AntdSelector]
class AntdSelectorDemo extends StatelessWidget {
  const AntdSelectorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSelector(
        items: options,
      )
    ]);
  }
}

/// @t 多列布局
/// @l [AntdSelector]
class AntdSelectorColumnsDemo extends StatelessWidget {
  const AntdSelectorColumnsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      const AntdSelector(columns: 2, items: options),
      const AntdSelector(columns: 3, items: options),
      AntdSelector(
        items: options,
        builder: (items) {
          return AntdList(
            feedback: false,
            items: items ?? const [],
            shrinkWrap: true,
          );
        },
      )
    ]);
  }
}

class AntdSelectorValueDemo extends StatefulWidget {
  const AntdSelectorValueDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdSelectorValueDemoStateDemo();
  }
}

/// @t 受控模式 不要忘记使用onChange更新
/// @l [AntdSelector]
class _AntdSelectorValueDemoStateDemo extends State<AntdSelectorValueDemo> {
  List<dynamic> values = ["1"];
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSelector(
          value: values,
          onChange: (values) async {
            setState(() {
              this.values = values ?? [];
            });
          },
          items: options
              .map((option) =>
                  AntdSelectorItem(label: option.label, value: option.value))
              .toList()),
      Wrap(
        spacing: 12,
        children: [
          AntdButton(
            child: const Text("选中2"),
            onTap: () {
              setState(() {
                values.add("2");
              });
            },
          ),
          AntdButton(
            child: const Text("取消2"),
            onTap: () {
              setState(() {
                values.remove("2");
              });
            },
          )
        ],
      )
    ]);
  }
}

/// @t 只读和禁用
/// @l [AntdSelector]
class AntdSelectorDisabledDemo extends StatelessWidget {
  const AntdSelectorDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSelector(
        items: options,
        disabled: true,
      ),
      AntdSelector(
        readOnly: true,
        defaultValue: ["2"],
        items: options,
      ),
    ]);
  }
}

class AntdSelectorFormDemo extends StatefulWidget {
  const AntdSelectorFormDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdSelectorFormDemoStateDemo();
  }
}

/// @t 与表单配合
/// @l [AntdSelector]
class _AntdSelectorFormDemoStateDemo extends State<AntdSelectorFormDemo> {
  List<dynamic> defaultValue = ['2'];
  List<dynamic>? value = ['2'];
  List<dynamic>? value1 = ['2'];

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "最基础 在AntdFormItem中使用会自动收集AntdSelector的值,务必指定一个defaultValue",
          child: AntdForm(builder: (controller) {
            return FormValue(
                controller: controller,
                child: AntdFormItem(
                    name: "selector",
                    builder: (ctx) {
                      return const AntdSelector(
                        items: options,
                      );
                    }));
          })),
      DemoTitle(
          outline: false,
          title: "表单控制默认值",
          child: AntdForm(
              initialValues: {"selector": defaultValue},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "selector",
                        builder: (ctx) {
                          return const AntdSelector(
                            items: options,
                          );
                        }));
              })),
      DemoTitle(
          outline: false,
          title:
              "表单控制只读禁用,属性的优先级遵守最近原则,虽然AntdFormItem指定的disabled,但是AntdSelector覆盖了",
          child: AntdForm(
              initialValues: {"selector": defaultValue},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "selector",
                        readOnly: true,
                        disabled: true,
                        builder: (ctx) {
                          return const AntdSelector(
                            disabled: false,
                            items: options,
                          );
                        }));
              })),
      DemoTitle(
          outline: false,
          title: "不要表单自动收集 必须在合适的时候手动 否则不会同步",
          child: AntdForm(
              initialValues: {"selector": defaultValue},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "selector",
                        builder: (ctx) {
                          return const AntdSelector(
                            autoCollect: false,
                            items: options,
                          );
                        }));
              })),
      AntdButton(
        child: const Text('点我修改'),
        onTap: () {
          setState(() {
            value = ['2'];
          });
        },
      ),
      DemoTitle(
          outline: false,
          title: "autoCollect:true的时候外部改变 Value 也会同步至表单",
          child: AntdForm(
              initialValues: {"selector": defaultValue},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "selector",
                        builder: (ctx) {
                          return AntdSelector(
                            value: value,
                            items: options,
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
            value1 = ['2'];
          });
        },
      ),
      DemoTitle(
          outline: false,
          title: "使用shouldTriggerChange 控制当外部的value改变时要不要触发onChange",
          child: AntdForm(
              initialValues: {"selector": defaultValue},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "selector",
                        builder: (ctx) {
                          return AntdSelector(
                            value: value1,
                            items: options,
                            onChange: (value) {
                              AntdToast.show("当前的输入值:$value",
                                  position: AntdToastPosition.top);
                              setState(() {
                                value1 = value;
                              });
                            },
                            shouldTriggerChange: false,
                          );
                        }));
              })),
    ]);
  }
}
