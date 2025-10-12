import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

import 'form/form.dart';

/// @t 基础使用
/// @l [AntdInput]
class AntdInputDemo extends StatelessWidget {
  const AntdInputDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdInput(
        onChange: (value) {
          AntdToast.show("当前的输入值:$value");
        },
        placeholder: const Text("请输入内容"),
      )
    ]);
  }
}

/// @t 带清除按钮
/// @l [AntdInput]
class AntdInputClearableDemo extends StatelessWidget {
  const AntdInputClearableDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdInput(
        onClear: () {
          AntdToast.show("清理了所有输入");
        },
        placeholder: const Text("请输入内容"),
        clearable: true,
      ),
    ]);
  }
}

/// @t 输入内容右对齐
/// @l [AntdInput]
class AntdInputTextAlignDemo extends StatelessWidget {
  const AntdInputTextAlignDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdInput(
        placeholder: Text("请输入内容"),
        clearable: true,
        textAlign: TextAlign.right,
      ),
    ]);
  }
}

/// @t 只读状态
/// @l [AntdInput]
class AntdInputReadOnlyDemo extends StatelessWidget {
  const AntdInputReadOnlyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdInput(
        readOnly: true,
        value: "只读模式的输入框",
      ),
    ]);
  }
}

/// @t 禁用状态
/// @l [AntdInput]
class AntdInputDisabledDemo extends StatelessWidget {
  const AntdInputDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdInput(
        disabled: true,
        placeholder: Text("被禁用的输入框"),
      ),
    ]);
  }
}

/// @t 查看密码
/// @l [AntdInput]
class AntdInputObscureTextDemo extends StatelessWidget {
  const AntdInputObscureTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdInput(
        obscureText: true,
        placeholder: Text("请输入密码"),
      ),
    ]);
  }
}

/// @t 前缀和后缀
/// @l [AntdInput]
class AntdInputPrefixSuffixTextDemo extends StatelessWidget {
  const AntdInputPrefixSuffixTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdInput(
        obscureText: true,
        prefix: Text("我是前缀"),
        suffix: Text("我是后缀"),
        placeholder: Text("请输入密码"),
      ),
    ]);
  }
}

/// @t 焦点
/// @l [AntdInput]
class AntdInputFocusTextDemo extends StatelessWidget {
  const AntdInputFocusTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdInput(
        onFocus: (value) {
          AntdToast.show("焦点状态:$value");
        },
        prefix: const Text("我是前缀"),
        suffix: const Text("我是后缀"),
        placeholder: const Text("请输入密码"),
      ),
    ]);
  }
}

class AntdInputFormDemo extends StatefulWidget {
  const AntdInputFormDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdInputFormDemoStateDemo();
  }
}

/// @t 与表单配合
/// @l [AntdInput]
class _AntdInputFormDemoStateDemo extends State<AntdInputFormDemo> {
  String? value;
  String? value1;

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "最基础 在AntdFormItem中使用会自动收集AntdInput的值",
          child: AntdForm(builder: (controller) {
            return FormValue(
                controller: controller,
                child: AntdFormItem(
                    name: "input",
                    builder: (ctx) {
                      return const AntdInput(
                        minLines: 2,
                        placeholder: Text("请输入"),
                      );
                    }));
          })),
      DemoTitle(
          outline: false,
          title: "表单控制默认值",
          child: AntdForm(
              initialValues: const {"input": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "input",
                        builder: (ctx) {
                          return const AntdInput(
                            minLines: 2,
                            placeholder: Text("请输入"),
                          );
                        }));
              })),
      DemoTitle(
          outline: false,
          title:
              "表单控制只读禁用,属性的优先级遵守最近原则,虽然AntdFormItem指定的disabled,但是AntdInput覆盖了",
          child: AntdForm(
              initialValues: const {"input": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "input",
                        readOnly: true,
                        disabled: true,
                        builder: (ctx) {
                          return const AntdInput(
                            disabled: false,
                            placeholder: Text("请输入"),
                          );
                        }));
              })),
      DemoTitle(
          outline: false,
          title: "不要表单自动收集 必须在合适的时候手动 否则不会同步",
          child: AntdForm(
              initialValues: const {"input": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "input",
                        builder: (ctx) {
                          return const AntdInput(
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
              initialValues: const {"input": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "input",
                        builder: (ctx) {
                          return AntdInput(
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
              initialValues: const {"input": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "input",
                        builder: (ctx) {
                          return AntdInput(
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
