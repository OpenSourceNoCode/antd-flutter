"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[1383],{91383:function(t,e,n){n.r(e),n.d(e,{texts:function(){return a}});const a=[{value:"\u4E0E\u8868\u5355\u642D\u914D\u4F7F\u7528\uFF0C\u53EA\u662F\u5C5E\u6027\u592A\u591A\u5355\u72EC\u5217\u51FA\u6765\u4E86",paraId:0},{value:`class AntdFormItemDemo extends StatelessWidget {
  const AntdFormItemDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          disabled: true,
          required: true,
          hasFeedback: true,
          initialValues: const {"name": '\u738Bxx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("\u59D3\u540D"),
                  name: "name",
                  rules: const [AntdFormRule(len: 5)],
                  builder: <String>(ctx) {
                    return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u59D3\u540D"));
                  }),
              AntdFormItem(
                  required: false,
                  disabled: false,
                  hasFeedback: true,
                  label: const Text("\u59D3\u540D1"),
                  name: "name1",
                  rules: const [AntdFormRule(len: 5)],
                  builder: <String>(ctx) {
                    return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u59D3\u540D1"));
                  })
            ]);
          })
    ]);
  }
}

`,paraId:1,tocIndex:2},{value:`class AntdFormLayoutDemo extends StatelessWidget {
  const AntdFormLayoutDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          layout: AntdFormLayout.vertical,
          initialValues: const {"name": '\u738Bxx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("\u59D3\u540D"),
                  name: "name",
                  help: const Text("\u4E0D\u80FD\u8D85\u8FC75\u4E2A\u54C8"),
                  rules: const [AntdFormRule(len: 5)],
                  builder: <String>(ctx) {
                    return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u59D3\u540D"));
                  })
            ]);
          }),
      AntdForm(
          layout: AntdFormLayout.horizontal,
          initialValues: const {"name": '\u738Bxx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("\u59D3\u540D"),
                  name: "name",
                  help: const Text("\u4E0D\u80FD\u8D85\u8FC75\u4E2A\u54C8"),
                  helpIcon: const AntdIcon(icon: AntdIcons.message),
                  rules: const [AntdFormRule(len: 5)],
                  builder: <String>(ctx) {
                    return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u59D3\u540D"));
                  })
            ]);
          }),
      AntdForm(
          layout: AntdFormLayout.horizontal,
          initialValues: const {"name": '\u738Bxx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("\u81EA\u5B9A\u4E49"),
                  name: "name",
                  help: const Text("\u6211\u662F\u63D0\u793A"),
                  extra: const Text("\u6211\u662F\u989D\u5916\u533A\u57DF"),
                  rules: const [AntdFormRule(len: 5)],
                  builder: <String>(ctx) {
                    return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u59D3\u540D"));
                  },
                  layoutBuilder: (ctx) {
                    return Column(children: [
                      if (ctx.label != null) ctx.label!,
                      if (ctx.feedback != null) ctx.feedback!,
                      ctx.item,
                      if (ctx.extra != null) ctx.extra!
                    ]);
                  })
            ]);
          })
    ]);
  }
}

`,paraId:2,tocIndex:3},{value:`class AntdFormInitialValueDemo extends StatelessWidget {
  const AntdFormInitialValueDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          initialValues: const {"name": '\u738Bxx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("\u59D3\u540D"),
                  name: "name",
                  initialValue: "\u6211\u8986\u76D6\u4E86\u738Bxx",
                  builder: (ctx) {
                    return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u59D3\u540D"));
                  })
            ]);
          })
    ]);
  }
}

`,paraId:3,tocIndex:4},{value:`class AntdFormOnChangeDemo extends StatelessWidget {
  const AntdFormOnChangeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          initialValues: const {"name": '\u738Bxx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("\u59D3\u540D"),
                  name: "name",
                  onChange: (controller, value) {
                    AntdToast.show("$value");
                  },
                  builder: (ctx) {
                    return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u59D3\u540D"));
                  })
            ]);
          })
    ]);
  }
}

`,paraId:4,tocIndex:5},{value:"\u5982\u679C\u4F60\u5728normalize\u6539\u53D8\u4E86value,\u90A3\u4E48builder\u7684\u65F6\u5019\u4E00\u5B9A\u4E0D\u8981\u8FD4\u56DEconst",paraId:5,tocIndex:6},{value:`class AntdFormNormalizeDemo extends StatelessWidget {
  const AntdFormNormalizeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          initialValues: const {"name": '\u738Bxx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("\u59D3\u540D"),
                  name: "name",
                  normalize: (value) {
                    return value + "222";
                  },
                  builder: (ctx) {
                    return AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u59D3\u540D"));
                  },
                  shouUpdate: (value, bef) {
                    return true;
                  })
            ]);
          })
    ]);
  }
}

`,paraId:6,tocIndex:6},{value:`class AntdFormDependenciesDemo extends StatelessWidget {
  const AntdFormDependenciesDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          initialValues: const {"name": '\u738Bxx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("\u59D3\u540D"),
                  name: "name",
                  builder: (ctx) {
                    return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u59D3\u540D"));
                  }),
              AntdFormItem(
                  label: const Text("\u5E74\u9F84"),
                  name: "age",
                  dependencies: const ['name'],
                  builder: (ctx) {
                    var name = controller.getFieldValue(name: "name");
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (name == null || name.isEmpty)
                            const Text("\u8BF7\u5148\u8F93\u5165\u5E74\u9F84"),
                          AntdInput(
                              disabled: name == null || name.isEmpty,
                              placeholder: const Text("\u8BF7\u8F93\u5165\u5E74\u9F84"))
                        ]);
                  }),
              AntdFormItem(
                  label: const Text("\u6027\u522B"),
                  name: "sex",
                  builder: (ctx) {
                    return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u6027\u522B"));
                  })
            ]);
          })
    ]);
  }
}

`,paraId:7,tocIndex:7},{value:`class AntdFormRulesDemo extends StatelessWidget {
  const AntdFormRulesDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          initialValues: const {"name": '\u738Bxx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("\u59D3\u540D"),
                  name: "name",
                  builder: (ctx) {
                    return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u59D3\u540D"));
                  },
                  rules: [
                    const AntdFormRule(len: 5),
                    AntdFormRule(validator: (item, value, fromValue) async {
                      if (value is String) {
                        return value.contains("a") ? "\u4E0D\u80FD\u5B58\u5728\u5B57\u6BCDa" : null;
                      }
                      return null;
                    })
                  ])
            ]);
          })
    ]);
  }
}

`,paraId:8,tocIndex:8},{value:`class AntdFormBuilderDemo extends StatelessWidget {
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
            return Column(children: [
              ListenableBuilder(
                  listenable: controller,
                  builder: (BuildContext context, Widget? child) {
                    return AntdBox(
                        style: AntdBoxStyle(
                            color: token.colorWhite,
                            padding: 12.all,
                            width: double.infinity),
                        child: Text(jsonEncode(controller.getFieldsValue())));
                  }),
              AntdList(shrinkWrap: true, items: [
                AntdFormItem(
                    label: const Text("\u59D3\u540D"),
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
                                        ? AntdBoxStyle(
                                            color: token.colorPrimary)
                                        : null),
                                onTap: () {
                                  if (values.contains(i)) {
                                    values.remove(i);
                                  } else {
                                    values.add(i);
                                  }
                                  ctx.onChange(values);
                                },
                                child: Text("Tag $i")));
                      }));
                    },
                    rules: [
                      const AntdFormRule(len: 3),
                      AntdFormRule(validator: (item, value, fromValue) async {
                        return (value as List).contains(2) ? "\u4E0D\u80FD\u9009\u62E9\u7B2C2\u4E2A" : null;
                      })
                    ])
              ])
            ]);
          })
    ]);
  }
}

`,paraId:9,tocIndex:9},{value:`
  `,paraId:10},{value:"\u5C5E\u6027\u540D",paraId:11,tocIndex:10},{value:"\u8BF4\u660E",paraId:11,tocIndex:10},{value:"\u7C7B\u578B",paraId:11,tocIndex:10},{value:"\u9ED8\u8BA4\u503C",paraId:11,tocIndex:10},{value:"\u7248\u672C",paraId:11,tocIndex:10},{value:"key",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"Key",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"style",paraId:11,tocIndex:10},{value:"\u6837\u5F0F",paraId:11,tocIndex:10},{value:"AntdFormItemStyle",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"styleBuilder",paraId:11,tocIndex:10},{value:"\u52A8\u6001\u6837\u5F0F",paraId:11,tocIndex:10},{value:"AntdStyleBuilder<AntdFormItemStyle, AntdFormItem>",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"readOnly",paraId:11,tocIndex:10},{value:"\u53EA\u8BFB",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"disabled",paraId:11,tocIndex:10},{value:"\u7981\u7528",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"hasFeedback",paraId:11,tocIndex:10},{value:"\u662F\u5426\u5C55\u793A\u9519\u8BEF\u53CD\u9988",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"layout",paraId:11,tocIndex:10},{value:"\u5E03\u5C40\u6A21\u5F0F:",paraId:11,tocIndex:10},{value:"vertical",paraId:11,tocIndex:10},{value:" | ",paraId:11,tocIndex:10},{value:"horizontal",paraId:11,tocIndex:10},{value:"AntdFormLayout",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"preserve",paraId:11,tocIndex:10},{value:"\u5F53\u5B57\u6BB5\u88AB\u5220\u9664\u65F6\u4FDD\u7559\u5B57\u6BB5\u503C",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"required",paraId:11,tocIndex:10},{value:"\u662F\u5426\u5FC5\u9009\uFF0C\u9700\u8981\u6CE8\u610F\u7684\u662F\u8FD9\u4E2A\u5C5E\u6027\u4EC5\u4EC5\u7528\u6765\u63A7\u5236\u5916\u89C2\uFF0C\u5E76\u4E0D\u5305\u542B\u6821\u9A8C\u903B\u8F91",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"trigger",paraId:11,tocIndex:10},{value:"\u8BBE\u7F6E\u6536\u96C6\u5B57\u6BB5\u503C\u53D8\u66F4\u7684\u65F6\u673A:",paraId:11,tocIndex:10},{value:"onChange",paraId:11,tocIndex:10},{value:" | ",paraId:11,tocIndex:10},{value:"onFocus",paraId:11,tocIndex:10},{value:" | ",paraId:11,tocIndex:10},{value:"any",paraId:11,tocIndex:10},{value:"AntdFormTrigger",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"validateFirst",paraId:11,tocIndex:10},{value:"\u5F53\u67D0\u4E00\u89C4\u5219\u6821\u9A8C\u4E0D\u901A\u8FC7\u65F6\uFF0C\u662F\u5426\u505C\u6B62\u5269\u4E0B\u7684\u89C4\u5219\u7684\u6821\u9A8C\u3002\u8BBE\u7F6E parallel \u65F6\u4F1A\u5E76\u884C\u6821\u9A8C",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"validateTrigger",paraId:11,tocIndex:10},{value:"\u8BBE\u7F6E\u5B57\u6BB5\u6821\u9A8C\u7684\u65F6\u673A:",paraId:11,tocIndex:10},{value:"onChange",paraId:11,tocIndex:10},{value:" | ",paraId:11,tocIndex:10},{value:"onFocus",paraId:11,tocIndex:10},{value:" | ",paraId:11,tocIndex:10},{value:"any",paraId:11,tocIndex:10},{value:"AntdFormTrigger",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"help",paraId:11,tocIndex:10},{value:"\u63D0\u793A\u6587\u672C",paraId:11,tocIndex:10},{value:"Widget",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"helpIcon",paraId:11,tocIndex:10},{value:"\u63D0\u793A\u56FE\u6807",paraId:11,tocIndex:10},{value:"Widget",paraId:11,tocIndex:10},{value:"const AntdIcon(icon: AntdIcons.questionCircle)",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"hidden",paraId:11,tocIndex:10},{value:"\u662F\u5426\u9690\u85CF\u6574\u4E2A\u5B57\u6BB5",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"initialValue",paraId:11,tocIndex:10},{value:"\u8BBE\u7F6E\u5B50\u5143\u7D20\u9ED8\u8BA4\u503C\uFF0C\u5982\u679C\u4E0E Form \u7684 initialValues \u51B2\u7A81\u5219\u4EE5 Form \u4E3A\u51C6",paraId:11,tocIndex:10},{value:"dynamic",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"onChange",paraId:11,tocIndex:10},{value:"\u6570\u636E\u6539\u53D8\u65F6\u8C03\u7528",paraId:11,tocIndex:10},{value:"AntdFormItemChange",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"label",paraId:11,tocIndex:10},{value:"\u6807\u7B7E\u540D",paraId:11,tocIndex:10},{value:"Widget",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"name",paraId:11,tocIndex:10},{value:'\u5B57\u6BB5\u540D,\u5D4C\u5957\u7684\u8DEF\u5F84\u5982 "user.address.city"',paraId:11,tocIndex:10},{value:"String",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"dependencies",paraId:11,tocIndex:10},{value:"\u4F9D\u8D56\u7684\u5B57\u6BB5\u4FE1\u606F",paraId:11,tocIndex:10},{value:"List<String>",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"normalize",paraId:11,tocIndex:10},{value:"\u7EC4\u4EF6\u83B7\u53D6\u503C\u540E\u8FDB\u884C\u8F6C\u6362\uFF0C\u518D\u653E\u5165 Form \u4E2D\u3002\u4E0D\u652F\u6301\u5F02\u6B65",paraId:11,tocIndex:10},{value:"AntdFormItemNormalize",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"rules",paraId:11,tocIndex:10},{value:"\u6821\u9A8C\u89C4\u5219\uFF0C\u8BBE\u7F6E\u5B57\u6BB5\u7684\u6821\u9A8C\u903B\u8F91",paraId:11,tocIndex:10},{value:"List<AntdFormRule>",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"extra",paraId:11,tocIndex:10},{value:"\u53F3\u4FA7\u6269\u5C55\u533A",paraId:11,tocIndex:10},{value:"Widget",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"builder",paraId:11,tocIndex:10},{value:"\u5185\u5BB9",paraId:11,tocIndex:10},{value:"AntdFormItemBuilder",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"layoutBuilder",paraId:11,tocIndex:10},{value:"\u81EA\u5B9A\u4E49\u5E03\u5C40",paraId:11,tocIndex:10},{value:"AntdFormItemLayoutBuilder",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"shouUpdate",paraId:11,tocIndex:10},{value:"\u66F4\u65B0\u5224\u65AD\u51FD\u6570",paraId:11,tocIndex:10},{value:"AntdFormItemShouUpdate",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"\u5C5E\u6027\u540D",paraId:12,tocIndex:11},{value:"\u8BF4\u660E",paraId:12,tocIndex:11},{value:"\u7C7B\u578B",paraId:12,tocIndex:11},{value:"\u9ED8\u8BA4\u503C",paraId:12,tocIndex:11},{value:"\u7248\u672C",paraId:12,tocIndex:11},{value:"message",paraId:12,tocIndex:11},{value:"\u9519\u8BEF\u4FE1\u606F\uFF0C\u4E0D\u8BBE\u7F6E\u65F6\u4F1A\u901A\u8FC7\u6A21\u677F\u81EA\u52A8\u751F\u6210",paraId:12,tocIndex:11},{value:"String",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"validator",paraId:12,tocIndex:11},{value:"\u81EA\u5B9A\u4E49\u6821\u9A8C",paraId:12,tocIndex:11},{value:"AntdFormRuleValidator",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"trigger",paraId:12,tocIndex:11},{value:"\u8BBE\u7F6E\u89E6\u53D1\u9A8C\u8BC1\u65F6\u673A:",paraId:12,tocIndex:11},{value:"onChange",paraId:12,tocIndex:11},{value:" | ",paraId:12,tocIndex:11},{value:"onFocus",paraId:12,tocIndex:11},{value:" | ",paraId:12,tocIndex:11},{value:"any",paraId:12,tocIndex:11},{value:"AntdFormTrigger",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"warningOnly",paraId:12,tocIndex:11},{value:"\u4EC5\u8B66\u544A\uFF0C\u4E0D\u963B\u585E\u8868\u5355\u63D0\u4EA4",paraId:12,tocIndex:11},{value:"bool",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"enums",paraId:12,tocIndex:11},{value:"\u662F\u5426\u5339\u914D\u679A\u4E3E\u4E2D\u7684\u503C\uFF08\u9700\u8981\u5C06 type \u8BBE\u7F6E\u4E3A enum\uFF09",paraId:12,tocIndex:11},{value:"List<String>",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"len",paraId:12,tocIndex:11},{value:"string \u7C7B\u578B\u65F6\u4E3A\u5B57\u7B26\u4E32\u957F\u5EA6\uFF1Bnumber \u7C7B\u578B\u65F6\u4E3A\u786E\u5B9A\u6570\u5B57\uFF1B array \u7C7B\u578B\u65F6\u4E3A\u6570\u7EC4\u957F\u5EA6",paraId:12,tocIndex:11},{value:"int",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"max",paraId:12,tocIndex:11},{value:"\u5FC5\u987B\u8BBE\u7F6E type\uFF1Astring \u7C7B\u578B\u4E3A\u5B57\u7B26\u4E32\u6700\u5927\u957F\u5EA6\uFF1Bnumber \u7C7B\u578B\u65F6\u4E3A\u6700\u5927\u503C\uFF1Barray \u7C7B\u578B\u65F6\u4E3A\u6570\u7EC4\u6700\u5927\u957F\u5EA6",paraId:12,tocIndex:11},{value:"int",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"min",paraId:12,tocIndex:11},{value:"\u5FC5\u987B\u8BBE\u7F6E type\uFF1Astring \u7C7B\u578B\u4E3A\u5B57\u7B26\u4E32\u6700\u5C0F\u957F\u5EA6\uFF1Bnumber \u7C7B\u578B\u65F6\u4E3A\u6700\u5C0F\u503C\uFF1Barray \u7C7B\u578B\u65F6\u4E3A\u6570\u7EC4\u6700\u5C0F\u957F\u5EA6",paraId:12,tocIndex:11},{value:"int",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"pattern",paraId:12,tocIndex:11},{value:"\u6B63\u5219\u8868\u8FBE\u5F0F\u5339\u914D",paraId:12,tocIndex:11},{value:"RegExp",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"required",paraId:12,tocIndex:11},{value:"\u662F\u5426\u4E3A\u5FC5\u9009\u5B57\u6BB5",paraId:12,tocIndex:11},{value:"bool",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"whitespace",paraId:12,tocIndex:11},{value:"\u5982\u679C\u5B57\u6BB5\u4EC5\u5305\u542B\u7A7A\u683C\u5219\u6821\u9A8C\u4E0D\u901A\u8FC7",paraId:12,tocIndex:11},{value:"bool",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"type",paraId:12,tocIndex:11},{value:"\u7C7B\u578B:",paraId:12,tocIndex:11},{value:"string",paraId:12,tocIndex:11},{value:" | ",paraId:12,tocIndex:11},{value:"number",paraId:12,tocIndex:11},{value:"AntdFormRuleType",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11}]}}]);
