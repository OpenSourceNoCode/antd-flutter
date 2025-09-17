import 'dart:convert';

import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 基础使用
/// @l [AntdForm]
class AntdFormDemo extends StatelessWidget {
  const AntdFormDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
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
                shrinkWrap: true,
                items: [
                  AntdFormItem(
                    required: true,
                    label: const Text("姓名"),
                    name: "name",
                    rules: const [AntdFormRule(len: 5)],
                    builder: <String>(ctx) {
                      return const AntdInput(
                        placeholder: Text("请输入姓名"),
                      );
                    },
                  ),
                  AntdFormItem(
                    required: true,
                    label: const Text("喜爱的水果"),
                    name: "apple",
                    builder: <String>(ctx) {
                      return const AntdSelector(options: [
                        AntdSelectorOption(label: Text("苹果"), value: "ap"),
                        AntdSelectorOption(label: Text("橘子"), value: "or"),
                        AntdSelectorOption(label: Text("香蕉"), value: "ba")
                      ]);
                    },
                  ),
                  AntdFormItem(
                    label: const Text("地址"),
                    help: const Text("详情地址"),
                    name: "address",
                    builder: <String>(ctx) {
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
              )
            ],
          );
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
                      builder: <String>(ctx) {
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
                        return const AntdSelector(options: [
                          AntdSelectorOption(label: Text("苹果"), value: "ap"),
                          AntdSelectorOption(label: Text("橘子"), value: "or"),
                          AntdSelectorOption(label: Text("香蕉"), value: "ba")
                        ]);
                      },
                    ),
                    AntdFormItem(
                      label: const Text("地址"),
                      help: const Text("详情地址"),
                      name: "address",
                      builder: <String>(ctx) {
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
              AntdList(shrinkWrap: true, items: [
                AntdFormItem(
                  required: true,
                  label: const Text("姓名"),
                  name: "name",
                  rules: const [AntdFormRule(len: 5)],
                  builder: <String>(ctx) {
                    return const AntdInput(
                      placeholder: Text("请输入姓名"),
                    );
                  },
                ),
                AntdFormItem(
                  label: const Text("地址"),
                  help: const Text("详情地址"),
                  name: "address",
                  builder: <String>(ctx) {
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
              shrinkWrap: true,
              items: fieldIds.map((id) {
                return AntdFormItem(
                  preserve: id % 2 == 0,
                  key: ValueKey(id.toString()),
                  name: id.toString(),
                  label: Text(id.toString()),
                  required: id % 2 == 0,
                  builder: <String>(ctx) {
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
                      builder: <String>(ctx) {
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
                      builder: <String>(ctx) {
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
