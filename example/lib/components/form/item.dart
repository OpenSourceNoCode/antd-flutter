import 'dart:convert';

import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

/// @t 必填和禁用,同[AntdForm]的disabled
/// @l [AntdFormItem]
class AntdFormItemDemo extends StatelessWidget {
  const AntdFormItemDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
        disabled: true,
        required: true,
        hasFeedback: true,
        initialValues: const {"name": '王xx'},
        builder: (controller) {
          return AntdList(
            shrinkWrap: true,
            items: [
              AntdFormItem(
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
                required: false,
                disabled: false,
                hasFeedback: true,
                label: const Text("姓名1"),
                name: "name1",
                rules: const [AntdFormRule(len: 5)],
                builder: <String>(ctx) {
                  return const AntdInput(
                    placeholder: Text("请输入姓名1"),
                  );
                },
              )
            ],
          );
        },
      ),
    ]);
  }
}

/// @t 布局
/// @l [AntdFormItem]
class AntdFormLayoutDemo extends StatelessWidget {
  const AntdFormLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
        layout: AntdFormLayout.vertical,
        initialValues: const {"name": '王xx'},
        builder: (controller) {
          return AntdList(
            shrinkWrap: true,
            items: [
              AntdFormItem(
                label: const Text("姓名"),
                name: "name",
                help: const Text("不能超过5个哈"),
                rules: const [AntdFormRule(len: 5)],
                builder: <String>(ctx) {
                  return const AntdInput(
                    placeholder: Text("请输入姓名"),
                  );
                },
              ),
            ],
          );
        },
      ),
      AntdForm(
        layout: AntdFormLayout.horizontal,
        initialValues: const {"name": '王xx'},
        builder: (controller) {
          return AntdList(
            shrinkWrap: true,
            items: [
              AntdFormItem(
                label: const Text("姓名"),
                name: "name",
                help: const Text("不能超过5个哈"),
                helpIcon: const AntdIcon(
                  icon: AntdIcons.message,
                ),
                rules: const [AntdFormRule(len: 5)],
                builder: <String>(ctx) {
                  return const AntdInput(
                    placeholder: Text("请输入姓名"),
                  );
                },
              ),
            ],
          );
        },
      ),
      AntdForm(
        layout: AntdFormLayout.horizontal,
        initialValues: const {"name": '王xx'},
        builder: (controller) {
          return AntdList(
            shrinkWrap: true,
            items: [
              AntdFormItem(
                label: const Text("自定义"),
                name: "name",
                help: const Text("我是提示"),
                extra: const Text("我是额外区域"),
                rules: const [AntdFormRule(len: 5)],
                builder: <String>(ctx) {
                  return const AntdInput(
                    placeholder: Text("请输入姓名"),
                  );
                },
                layoutBuilder: (ctx) {
                  return Column(
                    children: [
                      if (ctx.label != null) ctx.label!,
                      if (ctx.feedback != null) ctx.feedback!,
                      ctx.item,
                      if (ctx.extra != null) ctx.extra!,
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    ]);
  }
}

/// @t 初始值
/// @l [AntdFormItem]
class AntdFormInitialValueDemo extends StatelessWidget {
  const AntdFormInitialValueDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
        initialValues: const {"name": '王xx'},
        builder: (controller) {
          return AntdList(
            shrinkWrap: true,
            items: [
              AntdFormItem(
                label: const Text("姓名"),
                name: "name",
                initialValue: "我覆盖了王xx",
                builder: (ctx) {
                  return const AntdInput(
                    placeholder: Text("请输入姓名"),
                  );
                },
              ),
            ],
          );
        },
      ),
    ]);
  }
}

/// @t OnChang
/// @l [AntdFormItem]
class AntdFormOnChangeDemo extends StatelessWidget {
  const AntdFormOnChangeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
        initialValues: const {"name": '王xx'},
        builder: (controller) {
          return AntdList(
            shrinkWrap: true,
            items: [
              AntdFormItem(
                label: const Text("姓名"),
                name: "name",
                onChange: (controller, value) {
                  AntdToast.show("$value");
                },
                builder: (ctx) {
                  return const AntdInput(
                    placeholder: Text("请输入姓名"),
                  );
                },
              ),
            ],
          );
        },
      ),
    ]);
  }
}

/// @t normalize,通过normalize可以在值变更放入表单之前做处理
/// @d 如果你在normalize改变了value,那么builder的时候一定不要返回const
/// @l [AntdFormItem]
class AntdFormNormalizeDemo extends StatelessWidget {
  const AntdFormNormalizeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
        initialValues: const {"name": '王xx'},
        builder: (controller) {
          return AntdList(
            shrinkWrap: true,
            items: [
              AntdFormItem(
                label: const Text("姓名"),
                name: "name",
                normalize: (value) {
                  return value + "222";
                },
                builder: (ctx) {
                  return AntdInput(
                    placeholder: Text("请输入姓名"),
                  );
                },
                shouUpdate: (value, bef) {
                  return true;
                },
              ),
            ],
          );
        },
      ),
    ]);
  }
}

/// @t 依赖和更新
/// @l [AntdFormItem]
class AntdFormDependenciesDemo extends StatelessWidget {
  const AntdFormDependenciesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
        initialValues: const {"name": '王xx'},
        builder: (controller) {
          return AntdList(
            shrinkWrap: true,
            items: [
              AntdFormItem(
                label: const Text("姓名"),
                name: "name",
                builder: (ctx) {
                  return const AntdInput(
                    placeholder: Text("请输入姓名"),
                  );
                },
              ),
              AntdFormItem(
                label: const Text("年龄"),
                name: "age",
                dependencies: const ['name'],
                builder: (ctx) {
                  var name = controller.getFieldValue(name: "name");
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (name == null || name.isEmpty) const Text("请先输入年龄"),
                      AntdInput(
                        disabled: name == null || name.isEmpty,
                        placeholder: const Text("请输入年龄"),
                      )
                    ],
                  );
                },
              ),
              AntdFormItem(
                label: const Text("性别"),
                name: "sex",
                builder: (ctx) {
                  return const AntdInput(
                    placeholder: Text("请输入性别"),
                  );
                },
              ),
            ],
          );
        },
      ),
    ]);
  }
}

/// @t 校验
/// @l [AntdFormItem]
class AntdFormRulesDemo extends StatelessWidget {
  const AntdFormRulesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
        initialValues: const {"name": '王xx'},
        builder: (controller) {
          return AntdList(
            shrinkWrap: true,
            items: [
              AntdFormItem(
                label: const Text("姓名"),
                name: "name",
                builder: (ctx) {
                  return const AntdInput(
                    placeholder: Text("请输入姓名"),
                  );
                },
                rules: [
                  const AntdFormRule(len: 5),
                  AntdFormRule(validator: (item, value, fromValue) async {
                    if (value is String) {
                      return value.contains("a") ? "不能存在字母a" : null;
                    }
                    return null;
                  })
                ],
              ),
            ],
          );
        },
      ),
    ]);
  }
}

/// @t 自定义收集值
/// @l [AntdFormItem]
class AntdFormBuilderDemo extends StatelessWidget {
  const AntdFormBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
        initialValues: const {
          "tags": <int>[1, 3]
        },
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
                    label: const Text("姓名"),
                    name: "tags",
                    builder: (ctx) {
                      var values = ctx.value == null ? [] : ctx.value as List;
                      return Row(
                        children: List.generate(5, (i) {
                          return AntdBox(
                            style: AntdBoxStyle(margin: 4.horizontal),
                            child: AntdTag(
                              style: AntdTagStyle(
                                  bodyStyle: values.contains(i)
                                      ? AntdBoxStyle(color: token.colorPrimary)
                                      : null),
                              onTap: () {
                                if (values.contains(i)) {
                                  values.remove(i);
                                } else {
                                  values.add(i);
                                }

                                ctx.onChange(values);
                              },
                              child: Text("Tag $i"),
                            ),
                          );
                        }),
                      );
                    },
                    rules: [
                      const AntdFormRule(len: 3),
                      AntdFormRule(validator: (item, value, fromValue) async {
                        return (value as List).contains(2) ? "不能选择第2个" : null;
                      })
                    ],
                  ),
                ],
              )
            ],
          );
        },
      ),
    ]);
  }
}
