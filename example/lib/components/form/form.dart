import 'dart:convert';

import 'package:antd_flutter_mobile/index.dart';
import 'package:example/components/cascader/view.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

class FormValue extends StatelessWidget {
  final AntdFormController controller;
  final Widget child;
  const FormValue({super.key, required this.controller, required this.child});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return Column(
      children: [
        ListenableBuilder(
          listenable: controller,
          builder: (BuildContext context, Widget? child) {
            return AntdBox(
              style: AntdBoxStyle(
                  color: token.colorBgContainer,
                  padding: 12.all,
                  width: double.infinity),
              child: Text(jsonEncode(controller.getFieldsValue())),
            );
          },
        ),
        child
      ],
    );
  }
}

/// @t 基础使用
/// @l [AntdForm]
class AntdFormDemo extends StatelessWidget {
  const AntdFormDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
        layout: AntdFormLayout.horizontal,
        initialValues: const {"name": '王xx', "address": 'xx地址 xx小区'},
        builder: (controller) {
          return FormValue(
              controller: controller,
              child: AntdList(
                shrinkWrap: true,
                feedback: false,
                items: [
                  AntdFormItem(
                    required: true,
                    label: const Text("姓名"),
                    name: "name",
                    rules: const [AntdFormRule(len: 5)],
                    builder: (ctx) {
                      return const AntdInput(
                        placeholder: Text("请输入姓名"),
                      );
                    },
                  ),
                  AntdFormItem(
                    required: true,
                    label: const Text("喜爱的水果"),
                    name: "apple",
                    builder: (ctx) {
                      return const AntdSelector(items: [
                        AntdSelectorItem(label: Text("苹果"), value: "ap"),
                        AntdSelectorItem(label: Text("橘子"), value: "or"),
                        AntdSelectorItem(label: Text("香蕉"), value: "ba")
                      ]);
                    },
                  ),
                  AntdFormItem(
                    label: const Text("地址"),
                    help: const Text("详情地址"),
                    name: "address",
                    builder: (ctx) {
                      return const AntdTextArea(
                        maxLength: 60,
                        placeholder: Text("请输入地址"),
                      );
                    },
                  ),
                  Padding(
                    padding: 10.top,
                    child: AntdButton(
                      color: AntdColor.primary,
                      block: true,
                      onTap: () async {
                        var result = await controller.submit();
                        if (result) {
                          AntdToast.show("通过校验");
                          return;
                        }

                        var errors = controller
                            .getFieldErrors()
                            .map((value) =>
                                "${value.name}:${value.firstMessage}")
                            .toList();
                        AntdToast.show(errors.join(","));
                      },
                      child: const Text("提交"),
                    ),
                  )
                ],
              ));
        },
      ),
    ]);
  }
}

/// @t 使用trigger控制字段收集,默认在onChange时收集
/// @l [AntdForm]
class AntdFormTriggerDemo extends StatelessWidget {
  const AntdFormTriggerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
        layout: AntdFormLayout.horizontal,
        trigger: AntdFormTrigger.onFocus,
        validateTrigger: AntdFormTrigger.onFocus,
        initialValues: const {"name": '王xx', "address": 'xx地址 xx小区'},
        builder: (controller) {
          return Column(
            children: [
              ListenableBuilder(
                listenable: controller,
                builder: (BuildContext context, Widget? child) {
                  return AntdBox(
                    style: AntdBoxStyle(
                        color: token.colorBgContainer,
                        padding: 12.all,
                        width: double.infinity),
                    child: Text(jsonEncode(controller.getFieldsValue())),
                  );
                },
              ),
              AntdList(
                  feedback: false,
                  shrinkWrap: true,
                  style: AntdListStyle(
                      itemStyle: AntdBoxStyle(
                          focusStyle: AntdKitStyle(
                              border: token.border
                                  .copyWith(color: token.colorPrimary, width: 3)
                                  .all))),
                  items: [
                    AntdFormItem(
                      required: true,
                      label: const Text("姓名"),
                      name: "name",
                      rules: const [AntdFormRule(len: 5)],
                      builder: (ctx) {
                        return const AntdInput(
                          placeholder: Text("请输入姓名"),
                        );
                      },
                    ),
                    AntdFormItem(
                      required: true,
                      label: const Text("喜爱的水果"),
                      name: "apple",
                      builder: (ctx) {
                        return const AntdSelector(items: [
                          AntdSelectorItem(label: Text("苹果"), value: "ap"),
                          AntdSelectorItem(label: Text("橘子"), value: "or"),
                          AntdSelectorItem(label: Text("香蕉"), value: "ba")
                        ]);
                      },
                    ),
                    AntdFormItem(
                      label: const Text("地址"),
                      help: const Text("详情地址"),
                      name: "address",
                      builder: (ctx) {
                        return const AntdTextArea(
                          maxLength: 60,
                          placeholder: Text("请输入地址"),
                        );
                      },
                    ),
                    Padding(
                      padding: 10.top,
                      child: AntdButton(
                        color: AntdColor.primary,
                        block: true,
                        onTap: () async {
                          var result = await controller.submit();
                          if (result) {
                            AntdToast.show("通过校验");
                            return;
                          }

                          var errors = controller
                              .getFieldErrors()
                              .map((value) =>
                                  "${value.name}:${value.firstMessage}")
                              .toList();
                          AntdToast.show(errors.join(","));
                        },
                        child: const Text("提交"),
                      ),
                    )
                  ])
            ],
          );
        },
      ),
    ]);
  }
}

/// @t 事件
/// @l [AntdForm]
class AntdFormEventDemo extends StatelessWidget {
  const AntdFormEventDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
        onFinish: (values, rules) async {
          AntdToast.show("完成，表单值：$values");
        },
        onValuesChange: (controller, change) {
          change.forEach((name, value) {
            AntdToast.show("字段:$name 值：$value");
          });
        },
        layout: AntdFormLayout.horizontal,
        initialValues: const {"name": '王xx', "address": 'xx地址 xx小区'},
        builder: (controller) {
          return Column(
            children: [
              ListenableBuilder(
                listenable: controller,
                builder: (BuildContext context, Widget? child) {
                  return AntdBox(
                    style: AntdBoxStyle(
                        color: token.colorBgContainer,
                        padding: 12.all,
                        width: double.infinity),
                    child: Text(jsonEncode(controller.getFieldsValue())),
                  );
                },
              ),
              AntdList(shrinkWrap: true, feedback: false, items: [
                AntdFormItem(
                  required: true,
                  label: const Text("姓名"),
                  name: "name",
                  rules: const [AntdFormRule(len: 5)],
                  builder: (ctx) {
                    return const AntdInput(
                      placeholder: Text("请输入姓名"),
                    );
                  },
                ),
                AntdFormItem(
                  label: const Text("地址"),
                  help: const Text("详情地址"),
                  name: "address",
                  builder: (ctx) {
                    return const AntdTextArea(
                      maxLength: 60,
                      placeholder: Text("请输入地址"),
                    );
                  },
                ),
                Padding(
                  padding: 10.top,
                  child: AntdButton(
                    color: AntdColor.primary,
                    block: true,
                    onTap: () async {
                      await controller.submit();
                    },
                    child: const Text("提交"),
                  ),
                )
              ])
            ],
          );
        },
      ),
    ]);
  }
}

class AntdFormDynamicDemo extends StatefulWidget {
  const AntdFormDynamicDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdFormDynamicDemoStateDemo();
  }
}

/// @t 动态表单
/// @d 可以通过preserve控制字段删除后值是否保留
/// @l [AntdForm]
class _AntdFormDynamicDemoStateDemo extends State<AntdFormDynamicDemo> {
  var number = 0;
  var fieldIds = <num>[];

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(onFieldsChange: (newNames, add, names) {
        AntdToast.show("字段${newNames.join("-")},${add ? '添加' : '删除'}");
      }, builder: (controller) {
        return Column(
          children: [
            ListenableBuilder(
              listenable: controller,
              builder: (BuildContext context, Widget? child) {
                return AntdBox(
                  style: AntdBoxStyle(
                      margin: 10.bottom,
                      color: token.colorBgContainer,
                      padding: 12.all,
                      width: double.infinity),
                  child: Text(jsonEncode(controller.getFieldsValue())),
                );
              },
            ),
            AntdList(
              card: true,
              feedback: false,
              shrinkWrap: true,
              items: fieldIds.map((id) {
                return AntdFormItem(
                  preserve: id % 2 == 0,
                  key: ValueKey(id.toString()),
                  name: id.toString(),
                  label: Text(id.toString()),
                  required: id % 2 == 0,
                  builder: (ctx) {
                    return AntdInput(
                      placeholder: Text("请输入$id的内容"),
                      suffix: AntdButton(
                        size: AntdSize.mini,
                        onTap: () {
                          fieldIds.remove(id);
                          setState(() {});
                        },
                        child: const Text("移除"),
                      ),
                    );
                  },
                );
              }).toList(),
              footer: Column(
                children: [
                  AntdButton(
                    block: true,
                    onTap: () {
                      number += 1;
                      fieldIds.add(number);

                      setState(() {});
                    },
                    child: const Text("增加一项"),
                  ),
                  AntdBox(
                    style: AntdBoxStyle(margin: 12.top),
                    child: AntdButton(
                      block: true,
                      onTap: () async {
                        var result = await controller.submit();
                        AntdToast.show("提交${result ? '成功' : '失败'}");
                      },
                      child: const Text("提交"),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      })
    ]);
  }
}

/// @t 标题和卡片
/// @l [AntdForm]
class AntdFormCardDemo extends StatelessWidget {
  const AntdFormCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
        onFinish: (values, rules) async {
          AntdToast.show("完成，表单值：$values");
        },
        onValuesChange: (controller, change) {
          change.forEach((name, value) {
            AntdToast.show("字段:$name 值：$value");
          });
        },
        layout: AntdFormLayout.horizontal,
        initialValues: const {"name": '王xx', "address": 'xx地址 xx小区'},
        builder: (controller) {
          return Column(
            children: [
              ListenableBuilder(
                listenable: controller,
                builder: (BuildContext context, Widget? child) {
                  return AntdBox(
                    style: AntdBoxStyle(
                        color: token.colorBgContainer,
                        padding: 12.all,
                        width: double.infinity),
                    child: Text(jsonEncode(controller.getFieldsValue())),
                  );
                },
              ),
              AntdList(
                  feedback: false,
                  header: const Text("我是标题"),
                  footer: Padding(
                    padding: 10.top,
                    child: AntdButton(
                      color: AntdColor.primary,
                      block: true,
                      onTap: () async {
                        await controller.submit();
                      },
                      child: const Text("提交"),
                    ),
                  ),
                  card: true,
                  shrinkWrap: true,
                  items: [
                    AntdFormItem(
                      required: true,
                      label: const Text("手机号"),
                      name: "phone",
                      rules: const [AntdFormRule(len: 5)],
                      builder: (ctx) {
                        return const AntdInput(
                          placeholder: Text("请输入"),
                        );
                      },
                    ),
                    AntdFormItem(
                      required: true,
                      label: const Text("短信验证码"),
                      name: "code",
                      rules: const [AntdFormRule(len: 5)],
                      builder: (ctx) {
                        return AntdInput(
                          placeholder: const Text("请输入"),
                          suffix: Text(
                            "获取验证码",
                            style: TextStyle(color: token.colorLink),
                          ),
                        );
                      },
                    ),
                  ])
            ],
          );
        },
      ),
    ]);
  }
}

/// @t 支持自动收集的组件
/// @l [AntdForm]
class AntdFormAutoCollectDemo extends StatelessWidget {
  const AntdFormAutoCollectDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdForm(
          initialValues: const {
            'radioGroup': 1,
            'input': '1111',
            'slider': AntdSliderValue(start: 10, end: 80)
          },
          builder: (controller) {
            return Column(
              children: [
                ListenableBuilder(
                  listenable: controller,
                  builder: (BuildContext context, Widget? child) {
                    final fieldsValue = controller.getFieldsValue();
                    const encoder = JsonEncoder.withIndent('  '); // 两个空格缩进
                    final formattedJson = encoder.convert(fieldsValue);

                    return AntdBox(
                      style: AntdBoxStyle(
                          color: token.colorBgContainer,
                          padding: 12.all,
                          width: double.infinity),
                      child: Text(formattedJson),
                    );
                  },
                ),
                AntdList(shrinkWrap: true, feedback: false, items: [
                  AntdFormItem(
                      name: "switch",
                      label: const Text("开关"),
                      builder: (ctx) {
                        return const AntdSwitch(
                          value: "any",
                        );
                      }),
                  AntdFormItem(
                      name: "selector",
                      label: const Text("选择组"),
                      builder: (ctx) {
                        return const AntdSelector(items: [
                          AntdSelectorItem(
                            label: Text("label1"),
                            value: 1,
                          ),
                          AntdSelectorItem(
                            label: Text("label2"),
                            value: 2,
                          )
                        ]);
                      }),
                  AntdFormItem(
                      name: "radio",
                      label: const Text("单选"),
                      builder: (ctx) {
                        return const AntdRadio(
                          value: 1,
                          extra: Text("1"),
                        );
                      }),
                  AntdFormItem(
                      name: "radioGroup",
                      label: const Text("单选选择组"),
                      builder: (ctx) {
                        return const AntdRadioGroup(
                          items: [
                            AntdRadio(
                              value: 1,
                              extra: Text("1"),
                            ),
                            AntdRadio(
                              value: 2,
                              extra: Text("2"),
                            )
                          ],
                        );
                      }),
                  AntdFormItem(
                      name: "checkbox",
                      label: const Text("多选"),
                      builder: (ctx) {
                        return const AntdCheckbox(
                          value: 1,
                          extra: Text("1"),
                        );
                      }),
                  AntdFormItem(
                      name: "checkboxGroup",
                      label: const Text("多选选择组"),
                      builder: (ctx) {
                        return const AntdCheckboxGroup(
                          value: ['1'],
                          items: [
                            AntdCheckbox(
                              value: "1",
                              extra: Text("1"),
                            ),
                            AntdCheckbox(
                              value: "2",
                              extra: Text("2"),
                            )
                          ],
                        );
                      }),
                  AntdFormItem(
                      name: "input",
                      label: const Text("输入框"),
                      builder: (ctx) {
                        return const AntdInput();
                      }),
                  AntdFormItem(
                      name: "textarea",
                      label: const Text("文本域"),
                      builder: (ctx) {
                        return const AntdTextArea();
                      }),
                  AntdFormItem(
                      name: "slider",
                      label: const Text("滑动输入"),
                      builder: (ctx) {
                        return AntdSlider(
                          ticks: true,
                          range: true,
                          step: 10,
                          renderTicks: (i) => Text("$i"),
                        );
                      }),
                  AntdFormItem(
                      name: "checkList",
                      label: const Text("可选择列表"),
                      builder: (ctx) {
                        return AntdCheckList(
                          items: List.generate(
                              5,
                              (i) => AntdCheckItem(
                                    value: i,
                                    child: Text("$i"),
                                  )),
                        );
                      }),
                  AntdFormItem(
                      name: "segmented",
                      label: const Text("分段选择器"),
                      builder: (ctx) {
                        return AntdSegmented(
                          items: List.generate(
                              5,
                              (i) => AntdSegmentedItem(
                                    value: i,
                                    child: Text("$i"),
                                  )),
                        );
                      }),
                  AntdFormItem(
                      name: "cascaderView",
                      label: const Text("级连选择视图"),
                      builder: (ctx) {
                        return const AntdCascaderView(
                          options: cascaderOptions,
                        );
                      }),
                ])
              ],
            );
          })
    ]);
  }
}
