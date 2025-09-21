"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[7086],{27086:function(t,e,n){n.r(e),n.d(e,{texts:function(){return a}});const a=[{value:"\u9AD8\u6027\u80FD\u8868\u5355\u63A7\u4EF6\uFF0C\u81EA\u5E26\u6570\u636E\u57DF\u7BA1\u7406\u3002\u5305\u542B\u6570\u636E\u5F55\u5165\u3001\u6821\u9A8C\u4EE5\u53CA\u5BF9\u5E94\u6837\u5F0F\u3002",paraId:0},{value:"\u9002\u7528\u4E8E\u521B\u5EFA\u4E00\u4E2A\u5B9E\u4F53\u6216\u6536\u96C6\u4FE1\u606F\u3002\u9700\u8981\u5BF9\u8F93\u5165\u7684\u6570\u636E\u7C7B\u578B\u8FDB\u884C\u6821\u9A8C\u65F6\u3002",paraId:1,tocIndex:0},{value:`class AntdFormDemo extends StatelessWidget {
  const AntdFormDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
          layout: AntdFormLayout.horizontal,
          initialValues: const {"name": '\u738Bxx', "address": 'xx\u5730\u5740 xx\u5C0F\u533A'},
          builder: (controller) {
            return Column(children: [
              ListenableBuilder(
                  listenable: controller,
                  builder: (BuildContext context, Widget? child) {
                    return AntdBox(
                        style: AntdBoxStyle(
                            color: token.colorBgContainer,
                            padding: 12.all,
                            width: double.infinity),
                        child: Text(jsonEncode(controller.getFieldsValue())));
                  }),
              AntdList(shrinkWrap: true, items: [
                AntdFormItem(
                    required: true,
                    label: const Text("\u59D3\u540D"),
                    name: "name",
                    rules: const [AntdFormRule(len: 5)],
                    builder: <String>(ctx) {
                      return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u59D3\u540D"));
                    }),
                AntdFormItem(
                    required: true,
                    label: const Text("\u559C\u7231\u7684\u6C34\u679C"),
                    name: "apple",
                    builder: <String>(ctx) {
                      return const AntdSelector(options: [
                        AntdSelectorOption(label: Text("\u82F9\u679C"), value: "ap"),
                        AntdSelectorOption(label: Text("\u6A58\u5B50"), value: "or"),
                        AntdSelectorOption(label: Text("\u9999\u8549"), value: "ba")
                      ]);
                    }),
                AntdFormItem(
                    label: const Text("\u5730\u5740"),
                    help: const Text("\u8BE6\u60C5\u5730\u5740"),
                    name: "address",
                    builder: <String>(ctx) {
                      return const AntdTextArea(
                          maxLength: 60, placeholder: Text("\u8BF7\u8F93\u5165\u5730\u5740"));
                    }),
                Padding(
                    padding: 10.top,
                    child: AntdButton(
                        color: AntdColor.primary,
                        block: true,
                        onTap: () async {
                          var result = await controller.submit();
                          if (result) {
                            AntdToast.show("\u901A\u8FC7\u6821\u9A8C");
                            return;
                          }
                          var errors = controller
                              .getFieldErrors()
                              .map((value) =>
                                  "\${value.name}:\${value.firstMessage}")
                              .toList();
                          AntdToast.show(errors.join(","));
                        },
                        child: const Text("\u63D0\u4EA4")))
              ])
            ]);
          })
    ]);
  }
}

`,paraId:2,tocIndex:2},{value:`class AntdFormTriggerDemo extends StatelessWidget {
  const AntdFormTriggerDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
          layout: AntdFormLayout.horizontal,
          trigger: AntdFormTrigger.onFocus,
          validateTrigger: AntdFormTrigger.onFocus,
          initialValues: const {"name": '\u738Bxx', "address": 'xx\u5730\u5740 xx\u5C0F\u533A'},
          builder: (controller) {
            return Column(children: [
              ListenableBuilder(
                  listenable: controller,
                  builder: (BuildContext context, Widget? child) {
                    return AntdBox(
                        style: AntdBoxStyle(
                            color: token.colorBgContainer,
                            padding: 12.all,
                            width: double.infinity),
                        child: Text(jsonEncode(controller.getFieldsValue())));
                  }),
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
                        label: const Text("\u59D3\u540D"),
                        name: "name",
                        rules: const [AntdFormRule(len: 5)],
                        builder: <String>(ctx) {
                          return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u59D3\u540D"));
                        }),
                    AntdFormItem(
                        required: true,
                        label: const Text("\u559C\u7231\u7684\u6C34\u679C"),
                        name: "apple",
                        builder: (ctx) {
                          return const AntdSelector(options: [
                            AntdSelectorOption(label: Text("\u82F9\u679C"), value: "ap"),
                            AntdSelectorOption(label: Text("\u6A58\u5B50"), value: "or"),
                            AntdSelectorOption(label: Text("\u9999\u8549"), value: "ba")
                          ]);
                        }),
                    AntdFormItem(
                        label: const Text("\u5730\u5740"),
                        help: const Text("\u8BE6\u60C5\u5730\u5740"),
                        name: "address",
                        builder: <String>(ctx) {
                          return const AntdTextArea(
                              maxLength: 60, placeholder: Text("\u8BF7\u8F93\u5165\u5730\u5740"));
                        }),
                    Padding(
                        padding: 10.top,
                        child: AntdButton(
                            color: AntdColor.primary,
                            block: true,
                            onTap: () async {
                              var result = await controller.submit();
                              if (result) {
                                AntdToast.show("\u901A\u8FC7\u6821\u9A8C");
                                return;
                              }
                              var errors = controller
                                  .getFieldErrors()
                                  .map((value) =>
                                      "\${value.name}:\${value.firstMessage}")
                                  .toList();
                              AntdToast.show(errors.join(","));
                            },
                            child: const Text("\u63D0\u4EA4")))
                  ])
            ]);
          })
    ]);
  }
}

`,paraId:3,tocIndex:3},{value:`class AntdFormEventDemo extends StatelessWidget {
  const AntdFormEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
          onFinish: (values, rules) async {
            AntdToast.show("\u5B8C\u6210\uFF0C\u8868\u5355\u503C\uFF1A$values");
          },
          onValuesChange: (controller, change) {
            change.forEach((name, value) {
              AntdToast.show("\u5B57\u6BB5:$name \u503C\uFF1A$value");
            });
          },
          layout: AntdFormLayout.horizontal,
          initialValues: const {"name": '\u738Bxx', "address": 'xx\u5730\u5740 xx\u5C0F\u533A'},
          builder: (controller) {
            return Column(children: [
              ListenableBuilder(
                  listenable: controller,
                  builder: (BuildContext context, Widget? child) {
                    return AntdBox(
                        style: AntdBoxStyle(
                            color: token.colorBgContainer,
                            padding: 12.all,
                            width: double.infinity),
                        child: Text(jsonEncode(controller.getFieldsValue())));
                  }),
              AntdList(shrinkWrap: true, items: [
                AntdFormItem(
                    required: true,
                    label: const Text("\u59D3\u540D"),
                    name: "name",
                    rules: const [AntdFormRule(len: 5)],
                    builder: <String>(ctx) {
                      return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165\u59D3\u540D"));
                    }),
                AntdFormItem(
                    label: const Text("\u5730\u5740"),
                    help: const Text("\u8BE6\u60C5\u5730\u5740"),
                    name: "address",
                    builder: <String>(ctx) {
                      return const AntdTextArea(
                          maxLength: 60, placeholder: Text("\u8BF7\u8F93\u5165\u5730\u5740"));
                    }),
                Padding(
                    padding: 10.top,
                    child: AntdButton(
                        color: AntdColor.primary,
                        block: true,
                        onTap: () async {
                          await controller.submit();
                        },
                        child: const Text("\u63D0\u4EA4")))
              ])
            ]);
          })
    ]);
  }
}

`,paraId:4,tocIndex:4},{value:"\u53EF\u4EE5\u901A\u8FC7preserve\u63A7\u5236\u5B57\u6BB5\u5220\u9664\u540E\u503C\u662F\u5426\u4FDD\u7559",paraId:5,tocIndex:5},{value:`class _AntdFormDynamicDemoStateDemo extends State<AntdFormDynamicDemo> {
  var number = 0;
  var fieldIds = <num>[];
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(onFieldsChange: (newNames, add, names) {
        AntdToast.show("\u5B57\u6BB5\${newNames.join("-")},\${add ? '\u6DFB\u52A0' : '\u5220\u9664'}");
      }, builder: (controller) {
        return Column(children: [
          ListenableBuilder(
              listenable: controller,
              builder: (BuildContext context, Widget? child) {
                return AntdBox(
                    style: AntdBoxStyle(
                        margin: 10.bottom,
                        color: token.colorBgContainer,
                        padding: 12.all,
                        width: double.infinity),
                    child: Text(jsonEncode(controller.getFieldsValue())));
              }),
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
                          placeholder: Text("\u8BF7\u8F93\u5165$id\u7684\u5185\u5BB9"),
                          suffix: AntdButton(
                              size: AntdSize.mini,
                              onTap: () {
                                fieldIds.remove(id);
                                setState(() {});
                              },
                              child: const Text("\u79FB\u9664")));
                    });
              }).toList(),
              footer: Column(children: [
                AntdButton(
                    block: true,
                    onTap: () {
                      number += 1;
                      fieldIds.add(number);
                      setState(() {});
                    },
                    child: const Text("\u589E\u52A0\u4E00\u9879")),
                AntdBox(
                    style: AntdBoxStyle(margin: 12.top),
                    child: AntdButton(
                        block: true,
                        onTap: () async {
                          var result = await controller.submit();
                          AntdToast.show("\u63D0\u4EA4\${result ? '\u6210\u529F' : '\u5931\u8D25'}");
                        },
                        child: const Text("\u63D0\u4EA4")))
              ]))
        ]);
      })
    ]);
  }
}

`,paraId:6,tocIndex:5},{value:`class AntdFormCardDemo extends StatelessWidget {
  const AntdFormCardDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
          onFinish: (values, rules) async {
            AntdToast.show("\u5B8C\u6210\uFF0C\u8868\u5355\u503C\uFF1A$values");
          },
          onValuesChange: (controller, change) {
            change.forEach((name, value) {
              AntdToast.show("\u5B57\u6BB5:$name \u503C\uFF1A$value");
            });
          },
          layout: AntdFormLayout.horizontal,
          initialValues: const {"name": '\u738Bxx', "address": 'xx\u5730\u5740 xx\u5C0F\u533A'},
          builder: (controller) {
            return Column(children: [
              ListenableBuilder(
                  listenable: controller,
                  builder: (BuildContext context, Widget? child) {
                    return AntdBox(
                        style: AntdBoxStyle(
                            color: token.colorBgContainer,
                            padding: 12.all,
                            width: double.infinity),
                        child: Text(jsonEncode(controller.getFieldsValue())));
                  }),
              AntdList(
                  header: const Text("\u6211\u662F\u6807\u9898"),
                  footer: Padding(
                      padding: 10.top,
                      child: AntdButton(
                          color: AntdColor.primary,
                          block: true,
                          onTap: () async {
                            await controller.submit();
                          },
                          child: const Text("\u63D0\u4EA4"))),
                  card: true,
                  shrinkWrap: true,
                  items: [
                    AntdFormItem(
                        required: true,
                        label: const Text("\u624B\u673A\u53F7"),
                        name: "phone",
                        rules: const [AntdFormRule(len: 5)],
                        builder: <String>(ctx) {
                          return const AntdInput(placeholder: Text("\u8BF7\u8F93\u5165"));
                        }),
                    AntdFormItem(
                        required: true,
                        label: const Text("\u77ED\u4FE1\u9A8C\u8BC1\u7801"),
                        name: "code",
                        rules: const [AntdFormRule(len: 5)],
                        builder: <String>(ctx) {
                          return AntdInput(
                              placeholder: const Text("\u8BF7\u8F93\u5165"),
                              suffix: Text("\u83B7\u53D6\u9A8C\u8BC1\u7801",
                                  style: TextStyle(color: token.colorLink)));
                        })
                  ])
            ]);
          })
    ]);
  }
}

`,paraId:7,tocIndex:6},{value:`
  `,paraId:8},{value:"\u5C5E\u6027\u540D",paraId:9,tocIndex:7},{value:"\u8BF4\u660E",paraId:9,tocIndex:7},{value:"\u7C7B\u578B",paraId:9,tocIndex:7},{value:"\u9ED8\u8BA4\u503C",paraId:9,tocIndex:7},{value:"\u7248\u672C",paraId:9,tocIndex:7},{value:"key",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"Key",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"style",paraId:9,tocIndex:7},{value:"\u6837\u5F0F",paraId:9,tocIndex:7},{value:"AntdFormStyle",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"styleBuilder",paraId:9,tocIndex:7},{value:"\u52A8\u6001\u6837\u5F0F",paraId:9,tocIndex:7},{value:"AntdStyleBuilder<AntdFormStyle, AntdForm>",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"readOnly",paraId:9,tocIndex:7},{value:"\u53EA\u8BFB",paraId:9,tocIndex:7},{value:"bool",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"disabled",paraId:9,tocIndex:7},{value:"\u7981\u7528",paraId:9,tocIndex:7},{value:"bool",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"hasFeedback",paraId:9,tocIndex:7},{value:"\u662F\u5426\u5C55\u793A\u9519\u8BEF\u53CD\u9988",paraId:9,tocIndex:7},{value:"bool",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"layout",paraId:9,tocIndex:7},{value:"\u5E03\u5C40\u6A21\u5F0F:",paraId:9,tocIndex:7},{value:"vertical",paraId:9,tocIndex:7},{value:" | ",paraId:9,tocIndex:7},{value:"horizontal",paraId:9,tocIndex:7},{value:"AntdFormLayout",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"preserve",paraId:9,tocIndex:7},{value:"\u5F53\u5B57\u6BB5\u88AB\u5220\u9664\u65F6\u4FDD\u7559\u5B57\u6BB5\u503C",paraId:9,tocIndex:7},{value:"bool",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"required",paraId:9,tocIndex:7},{value:"\u662F\u5426\u5FC5\u9009\uFF0C\u9700\u8981\u6CE8\u610F\u7684\u662F\u8FD9\u4E2A\u5C5E\u6027\u4EC5\u4EC5\u7528\u6765\u63A7\u5236\u5916\u89C2\uFF0C\u5E76\u4E0D\u5305\u542B\u6821\u9A8C\u903B\u8F91",paraId:9,tocIndex:7},{value:"bool",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"trigger",paraId:9,tocIndex:7},{value:"\u8BBE\u7F6E\u6536\u96C6\u5B57\u6BB5\u503C\u53D8\u66F4\u7684\u65F6\u673A:",paraId:9,tocIndex:7},{value:"onChange",paraId:9,tocIndex:7},{value:" | ",paraId:9,tocIndex:7},{value:"onFocus",paraId:9,tocIndex:7},{value:" | ",paraId:9,tocIndex:7},{value:"any",paraId:9,tocIndex:7},{value:"AntdFormTrigger",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"validateFirst",paraId:9,tocIndex:7},{value:"\u5F53\u67D0\u4E00\u89C4\u5219\u6821\u9A8C\u4E0D\u901A\u8FC7\u65F6\uFF0C\u662F\u5426\u505C\u6B62\u5269\u4E0B\u7684\u89C4\u5219\u7684\u6821\u9A8C\u3002\u8BBE\u7F6E parallel \u65F6\u4F1A\u5E76\u884C\u6821\u9A8C",paraId:9,tocIndex:7},{value:"bool",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"validateTrigger",paraId:9,tocIndex:7},{value:"\u8BBE\u7F6E\u5B57\u6BB5\u6821\u9A8C\u7684\u65F6\u673A:",paraId:9,tocIndex:7},{value:"onChange",paraId:9,tocIndex:7},{value:" | ",paraId:9,tocIndex:7},{value:"onFocus",paraId:9,tocIndex:7},{value:" | ",paraId:9,tocIndex:7},{value:"any",paraId:9,tocIndex:7},{value:"AntdFormTrigger",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"controller",paraId:9,tocIndex:7},{value:"\u63A7\u5236\u5668",paraId:9,tocIndex:7},{value:"AntdFormController",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"header",paraId:9,tocIndex:7},{value:"\u5934\u90E8\u533A\u57DF \u901A\u5E38\u653E\u7F6E\u6807\u9898",paraId:9,tocIndex:7},{value:"Widget",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"footer",paraId:9,tocIndex:7},{value:"\u5C3E\u90E8\u533A\u57DF \u901A\u5E38\u653E\u7F6E\u63D0\u4EA4\u6309\u94AE",paraId:9,tocIndex:7},{value:"Widget",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"initialValues",paraId:9,tocIndex:7},{value:"\u8868\u5355\u9ED8\u8BA4\u503C\uFF0C\u53EA\u6709\u521D\u59CB\u5316\u4EE5\u53CA\u91CD\u7F6E\u65F6\u751F\u6548",paraId:9,tocIndex:7},{value:"Map<String, dynamic>",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"builder",paraId:9,tocIndex:7},{value:"\u5B50\u9879",paraId:9,tocIndex:7},{value:"AntdFormBuilder",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"onFieldsChange",paraId:9,tocIndex:7},{value:"\u5B57\u6BB5\u66F4\u65B0\u65F6\u89E6\u53D1",paraId:9,tocIndex:7},{value:"AntdFormFieldsChange",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"onFinish",paraId:9,tocIndex:7},{value:"\u63D0\u4EA4\u8868\u5355\u4E14\u6570\u636E\u9A8C\u8BC1\u6210\u529F\u540E\u89E6\u53D1",paraId:9,tocIndex:7},{value:"AntdFormFinish",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"onValuesChange",paraId:9,tocIndex:7},{value:"\u5B57\u6BB5\u503C\u66F4\u65B0\u65F6\u89E6\u53D1",paraId:9,tocIndex:7},{value:"AntdFormValuesChange",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"-",paraId:9,tocIndex:7},{value:"\u5C5E\u6027\u540D",paraId:10,tocIndex:8},{value:"\u8BF4\u660E",paraId:10,tocIndex:8},{value:"\u7C7B\u578B",paraId:10,tocIndex:8},{value:"\u9ED8\u8BA4\u503C",paraId:10,tocIndex:8},{value:"\u7248\u672C",paraId:10,tocIndex:8},{value:"inherit",paraId:10,tocIndex:8},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:10,tocIndex:8},{value:"bool",paraId:10,tocIndex:8},{value:"-",paraId:10,tocIndex:8},{value:"-",paraId:10,tocIndex:8},{value:"wrapStyle",paraId:10,tocIndex:8},{value:"\u7528\u4E8E\u5305\u88F9\u6574\u4E2A\u8868\u5355\u7EC4\u4EF6\uFF0C\u901A\u5E38\u8BBE\u7F6E\u5916\u8FB9\u8DDD\u3001\u80CC\u666F\u8272\u7B49",paraId:10,tocIndex:8},{value:"AntdBoxStyle",paraId:11,tocIndex:8},{value:"-",paraId:10,tocIndex:8},{value:"-",paraId:10,tocIndex:8},{value:"headerStyle",paraId:10,tocIndex:8},{value:"\u7528\u4E8E\u8868\u5355\u6807\u9898\u3001\u64CD\u4F5C\u6309\u94AE\u7B49\u5934\u90E8\u5185\u5BB9\u7684\u5BB9\u5668\u6837\u5F0F",paraId:10,tocIndex:8},{value:"AntdBoxStyle",paraId:12,tocIndex:8},{value:"-",paraId:10,tocIndex:8},{value:"-",paraId:10,tocIndex:8},{value:"bodyStyle",paraId:10,tocIndex:8},{value:"\u7528\u4E8E\u8868\u5355\u5B57\u6BB5\u9879\u7684\u4E3B\u4F53\u5185\u5BB9\u5BB9\u5668\u6837\u5F0F",paraId:10,tocIndex:8},{value:"AntdBoxStyle",paraId:13,tocIndex:8},{value:"-",paraId:10,tocIndex:8},{value:"-",paraId:10,tocIndex:8},{value:"footerStyle",paraId:10,tocIndex:8},{value:"\u7528\u4E8E\u63D0\u4EA4\u6309\u94AE\u3001\u5E95\u90E8\u8BF4\u660E\u7B49\u5E95\u90E8\u5185\u5BB9\u7684\u5BB9\u5668\u6837\u5F0F",paraId:10,tocIndex:8},{value:"AntdBoxStyle",paraId:14,tocIndex:8},{value:"-",paraId:10,tocIndex:8},{value:"-",paraId:10,tocIndex:8},{value:"\u5C5E\u6027\u540D",paraId:15,tocIndex:9},{value:"\u8BF4\u660E",paraId:15,tocIndex:9},{value:"\u7C7B\u578B",paraId:15,tocIndex:9},{value:"\u9ED8\u8BA4\u503C",paraId:15,tocIndex:9},{value:"\u7248\u672C",paraId:15,tocIndex:9},{value:"label",paraId:15,tocIndex:9},{value:"\u6807\u7B7E\u90E8\u5206\u6240\u5360\u6805\u683C\u5217\u6570\uFF08\u9ED8\u8BA42\uFF09",paraId:15,tocIndex:9},{value:"int",paraId:15,tocIndex:9},{value:"2",paraId:15,tocIndex:9},{value:"-",paraId:15,tocIndex:9},{value:"item",paraId:15,tocIndex:9},{value:"\u63A7\u4EF6\u90E8\u5206\u6240\u5360\u6805\u683C\u5217\u6570\uFF08\u9ED8\u8BA44\uFF09",paraId:15,tocIndex:9},{value:"int",paraId:15,tocIndex:9},{value:"4",paraId:15,tocIndex:9},{value:"-",paraId:15,tocIndex:9},{value:"\u5C5E\u6027\u540D",paraId:16,tocIndex:10},{value:"\u8BF4\u660E",paraId:16,tocIndex:10},{value:"\u7C7B\u578B",paraId:16,tocIndex:10},{value:"\u9ED8\u8BA4\u503C",paraId:16,tocIndex:10},{value:"\u7248\u672C",paraId:16,tocIndex:10},{value:"size",paraId:16,tocIndex:10},{value:"-",paraId:16,tocIndex:10},{value:"Size",paraId:16,tocIndex:10},{value:"const Size(5, 5)",paraId:16,tocIndex:10},{value:"-",paraId:16,tocIndex:10},{value:"color",paraId:16,tocIndex:10},{value:"-",paraId:16,tocIndex:10},{value:"Color",paraId:16,tocIndex:10},{value:"-",paraId:16,tocIndex:10},{value:"-",paraId:16,tocIndex:10},{value:"\u5C5E\u6027\u540D",paraId:17,tocIndex:11},{value:"\u8BF4\u660E",paraId:17,tocIndex:11},{value:"\u7C7B\u578B",paraId:17,tocIndex:11},{value:"\u9ED8\u8BA4\u503C",paraId:17,tocIndex:11},{value:"\u7248\u672C",paraId:17,tocIndex:11},{value:"inherit",paraId:17,tocIndex:11},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:17,tocIndex:11},{value:"bool",paraId:17,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"bodyStyle",paraId:17,tocIndex:11},{value:"\u8868\u5355\u9879\u6574\u4F53\u5BB9\u5668\u6837\u5F0F",paraId:17,tocIndex:11},{value:"AntdBoxStyle",paraId:18,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"itemStyle",paraId:17,tocIndex:11},{value:"\u8868\u5355\u63A7\u4EF6\u5BB9\u5668\u6837\u5F0F",paraId:17,tocIndex:11},{value:"AntdBoxStyle",paraId:19,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"itemFlexStyle",paraId:17,tocIndex:11},{value:"item\u7684\u5BF9\u9F50\u6837\u5F0F",paraId:17,tocIndex:11},{value:"AntdFlexStyle",paraId:20,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"labelStyle",paraId:17,tocIndex:11},{value:"\u6807\u7B7E\u6587\u672C\u5BB9\u5668\u6837\u5F0F",paraId:17,tocIndex:11},{value:"AntdBoxStyle",paraId:21,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"labelRowStyle",paraId:17,tocIndex:11},{value:"\u6807\u7B7E\u6587\u672C\u5BB9\u5668\u6837\u5F0F",paraId:17,tocIndex:11},{value:"AntdFlexStyle",paraId:22,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"feedbackStyle",paraId:17,tocIndex:11},{value:"\u6821\u9A8C\u53CD\u9988\u4FE1\u606F\u5BB9\u5668\u6837\u5F0F",paraId:17,tocIndex:11},{value:"AntdBoxStyle",paraId:23,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"helpIconStyle",paraId:17,tocIndex:11},{value:"\u5E2E\u52A9\u63D0\u793A\u56FE\u6807\u6837\u5F0F",paraId:17,tocIndex:11},{value:"AntdIconStyle",paraId:24,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"extraIconStyle",paraId:17,tocIndex:11},{value:"\u989D\u5916\u64CD\u4F5C\u56FE\u6807\u6837\u5F0F",paraId:17,tocIndex:11},{value:"AntdIconStyle",paraId:25,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"extraRowStyle",paraId:17,tocIndex:11},{value:"\u6269\u5C55\u533A\u57DF\u7684\u5BF9\u9F50\u6837\u5F0F",paraId:17,tocIndex:11},{value:"AntdFlexStyle",paraId:26,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"span",paraId:17,tocIndex:11},{value:"\u6805\u683C\u5E03\u5C40\u8DE8\u5EA6\u914D\u7F6E",paraId:17,tocIndex:11},{value:"AntdFormItemSpan",paraId:17,tocIndex:11},{value:"const AntdFormItemSpan()",paraId:17,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"requireStyle",paraId:17,tocIndex:11},{value:"\u5FC5\u586B\u6807\u8BB0\u6837\u5F0F",paraId:17,tocIndex:11},{value:"AntdFormItemRequireStyle",paraId:27,tocIndex:11},{value:"-",paraId:17,tocIndex:11},{value:"-",paraId:17,tocIndex:11}]}}]);
