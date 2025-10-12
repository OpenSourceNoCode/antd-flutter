import 'package:antd_flutter_mobile/index.dart';
import 'package:example/components/form/form.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

/// @t 基础
/// @l [AntdTextArea]
class AntdTextAreaDemo extends StatelessWidget {
  const AntdTextAreaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdTextArea(
        onChange: (value) {
          AntdToast.show("当前的输入值:$value", position: AntdToastPosition.top);
        },
        placeholder: const Text("请输入内容"),
      )
    ]);
  }
}

/// @t 默认值
/// @l [AntdTextArea]
class AntdTextAreaDefaultValueDemo extends StatelessWidget {
  const AntdTextAreaDefaultValueDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdTextArea(
        defaultValue: "默认值",
        onChange: (value) {
          AntdToast.show("当前的输入值:$value", position: AntdToastPosition.top);
        },
        placeholder: const Text("请输入内容"),
      )
    ]);
  }
}

/// @t 只读/禁用
/// @l [AntdTextArea]
class AntdTextAreaReadOnlyDisabledDemo extends StatelessWidget {
  const AntdTextAreaReadOnlyDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "只读",
          child: AntdTextArea(
            defaultValue: "默认值",
            readOnly: true,
            placeholder: Text("请输入内容"),
          )),
      DemoTitle(
          outline: false,
          title: "禁用",
          child: AntdTextArea(
            defaultValue: "默认值",
            disabled: true,
            placeholder: Text("请输入内容"),
          ))
    ]);
  }
}

/// @t 指定行数
/// @l [AntdTextArea]
class AntdTextAreaMinLinesDemo extends StatelessWidget {
  const AntdTextAreaMinLinesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "最小行",
          child: AntdTextArea(
            minLines: 5,
            placeholder: Text("请输入内容"),
          )),
      DemoTitle(
          outline: false,
          title: "最大行",
          child: AntdTextArea(
            maxLines: 5,
            placeholder: Text("请输入内容"),
          ))
    ]);
  }
}

/// @t 字数统计
/// @l [AntdTextArea]
class AntdTextAreaShowCountDemo extends StatelessWidget {
  const AntdTextAreaShowCountDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "统计",
          child: AntdTextArea(
            showCount: true,
            minLines: 5,
            value: "北极星垂地，东山月满川。",
          )),
      DemoTitle(
          outline: false,
          title: "最大长度",
          child: AntdTextArea(
            showCount: true,
            maxLength: 10,
            minLines: 5,
            value: "北极星垂地，东山月满川。",
          ))
    ]);
  }
}

/// @t 键盘类型
/// @l [AntdTextArea]
class AntdTextAreaKeyboardTypeDemo extends StatelessWidget {
  const AntdTextAreaKeyboardTypeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "数字",
          child: AntdTextArea(
            showCount: true,
            placeholder: Text("请输入"),
            keyboardType: TextInputType.number,
          )),
      DemoTitle(
          outline: false,
          title: "手机号",
          child: AntdTextArea(
            showCount: true,
            placeholder: Text("请输入"),
            keyboardType: TextInputType.phone,
          )),
      DemoTitle(
          outline: false,
          title: "日期",
          child: AntdTextArea(
            showCount: true,
            placeholder: Text("请输入"),
            keyboardType: TextInputType.datetime,
          )),
    ]);
  }
}

/// @t 事件
/// @l [AntdTextArea]
class AntdTextAreaEventDemo extends StatelessWidget {
  const AntdTextAreaEventDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "onChange",
          child: AntdTextArea(
            showCount: true,
            placeholder: const Text("请输入"),
            onChange: (value) {
              AntdToast.show("当前的输入值:$value", position: AntdToastPosition.top);
            },
          )),
      DemoTitle(
          outline: false,
          title: "onClear 点击清理图标",
          child: AntdTextArea(
            showCount: true,
            placeholder: const Text("请输入"),
            onChange: (value) {
              AntdToast.show("当前的输入值:$value", position: AntdToastPosition.top);
            },
            onClear: () {
              AntdToast.show("触发clear", position: AntdToastPosition.top);
            },
          )),
      DemoTitle(
          outline: false,
          title: "onTap 触摸事件",
          child: AntdTextArea(
            showCount: true,
            placeholder: const Text("请输入"),
            onChange: (value) {
              AntdToast.show("当前的输入值:$value", position: AntdToastPosition.top);
            },
            onTap: () {
              AntdToast.show("触发onTap", position: AntdToastPosition.top);
            },
          )),
      DemoTitle(
          outline: false,
          title: "onFocus 焦点事件",
          child: AntdTextArea(
            showCount: true,
            placeholder: const Text("请输入"),
            onChange: (value) {
              AntdToast.show("当前的输入值:$value", position: AntdToastPosition.top);
            },
            onFocus: (value) {
              AntdToast.show("触发onFocus:$value",
                  position: AntdToastPosition.top);
            },
          )),
    ]);
  }
}

class AntdTextAreaFormDemo extends StatefulWidget {
  const AntdTextAreaFormDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdTextAreaFormDemoStateDemo();
  }
}

/// @t 与表单配合
/// @l [AntdTextArea]
class _AntdTextAreaFormDemoStateDemo extends State<AntdTextAreaFormDemo> {
  String? value;
  String? value1;

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "最基础 在AntdFormItem中使用会自动收集AntdTextArea的值",
          child: AntdForm(builder: (controller) {
            return FormValue(
                controller: controller,
                child: AntdFormItem(
                    name: "textarea",
                    builder: (ctx) {
                      return const AntdTextArea(
                        minLines: 2,
                        placeholder: Text("请输入"),
                      );
                    }));
          })),
      DemoTitle(
          outline: false,
          title: "表单控制默认值",
          child: AntdForm(
              initialValues: const {"textarea": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        builder: (ctx) {
                          return const AntdTextArea(
                            minLines: 2,
                            placeholder: Text("请输入"),
                          );
                        }));
              })),
      DemoTitle(
          outline: false,
          title:
              "表单控制只读禁用,属性的优先级遵守最近原则,虽然AntdFormItem指定的disabled,但是AntdTextArea覆盖了",
          child: AntdForm(
              initialValues: const {"textarea": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        readOnly: true,
                        disabled: true,
                        builder: (ctx) {
                          return const AntdTextArea(
                            disabled: false,
                            placeholder: Text("请输入"),
                          );
                        }));
              })),
      DemoTitle(
          outline: false,
          title: "不要表单自动收集 必须在合适的时候手动 否则不会同步",
          child: AntdForm(
              initialValues: const {"textarea": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        builder: (ctx) {
                          return const AntdTextArea(
                            autoCollect: false,
                            placeholder: Text("请输入"),
                          );
                        }));
              })),
      AntdButton(
        child: const Text('点我修改'),
        onTap: () {
          setState(() {
            value = "我是外部设置的值";
          });
        },
      ),
      DemoTitle(
          outline: false,
          title: "autoCollect:true的时候外部改变 Value 也会同步至表单",
          child: AntdForm(
              initialValues: const {"textarea": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        builder: (ctx) {
                          return AntdTextArea(
                            value: value,
                            placeholder: const Text("请输入"),
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
            value1 = "我是外部设置的值";
          });
        },
      ),
      DemoTitle(
          outline: false,
          title: "使用shouldTriggerChange 控制当外部的value改变时要不要触发onChange",
          child: AntdForm(
              initialValues: const {"textarea": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        builder: (ctx) {
                          return AntdTextArea(
                            value: value1,
                            placeholder: const Text("请输入"),
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
