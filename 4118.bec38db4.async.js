"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[4118],{54118:function(t,e,a){a.r(e),a.d(e,{texts:function(){return n}});const n=[{value:"\u901A\u8FC7\u952E\u76D8\u8F93\u5165\u5185\u5BB9\uFF0C\u662F\u6700\u57FA\u7840\u7684\u8868\u5355\u57DF\u5305\u88C5\u3002",paraId:0},{value:"\u9700\u8981\u6298\u884C\u7684\u957F\u6587\u672C\u8F93\u5165\u3002",paraId:1,tocIndex:0},{value:`class AntdTextAreaDemo extends StatelessWidget {
  const AntdTextAreaDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdTextArea(
          onChange: (value) {
            AntdToast.show("\u5F53\u524D\u7684\u8F93\u5165\u503C:$value", position: AntdToastPosition.top);
          },
          placeholder: const Text("\u8BF7\u8F93\u5165\u5185\u5BB9"))
    ]);
  }
}

`,paraId:2,tocIndex:2},{value:`class AntdTextAreaDefaultValueDemo extends StatelessWidget {
  const AntdTextAreaDefaultValueDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdTextArea(
          value: "\u9ED8\u8BA4\u503C",
          onChange: (value) {
            AntdToast.show("\u5F53\u524D\u7684\u8F93\u5165\u503C:$value", position: AntdToastPosition.top);
          },
          placeholder: const Text("\u8BF7\u8F93\u5165\u5185\u5BB9"))
    ]);
  }
}

`,paraId:3,tocIndex:3},{value:`class AntdTextAreaReadOnlyDisabledDemo extends StatelessWidget {
  const AntdTextAreaReadOnlyDisabledDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "\u53EA\u8BFB",
          child: AntdTextArea(
              value: "\u9ED8\u8BA4\u503C", readOnly: true, placeholder: Text("\u8BF7\u8F93\u5165\u5185\u5BB9"))),
      DemoTitle(
          outline: false,
          title: "\u7981\u7528",
          child: AntdTextArea(
              value: "\u9ED8\u8BA4\u503C", disabled: true, placeholder: Text("\u8BF7\u8F93\u5165\u5185\u5BB9")))
    ]);
  }
}

`,paraId:4,tocIndex:4},{value:`class AntdTextAreaMinLinesDemo extends StatelessWidget {
  const AntdTextAreaMinLinesDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "\u6700\u5C0F\u884C",
          child: AntdTextArea(minLines: 5, placeholder: Text("\u8BF7\u8F93\u5165\u5185\u5BB9"))),
      DemoTitle(
          outline: false,
          title: "\u6700\u5927\u884C",
          child: AntdTextArea(maxLines: 5, placeholder: Text("\u8BF7\u8F93\u5165\u5185\u5BB9")))
    ]);
  }
}

`,paraId:5,tocIndex:5},{value:`class AntdTextAreaShowCountDemo extends StatelessWidget {
  const AntdTextAreaShowCountDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "\u7EDF\u8BA1",
          child: AntdTextArea(
              showCount: true, minLines: 5, value: "\u5317\u6781\u661F\u5782\u5730\uFF0C\u4E1C\u5C71\u6708\u6EE1\u5DDD\u3002")),
      DemoTitle(
          outline: false,
          title: "\u6700\u5927\u957F\u5EA6",
          child: AntdTextArea(
              showCount: true,
              maxLength: 10,
              minLines: 5,
              value: "\u5317\u6781\u661F\u5782\u5730\uFF0C\u4E1C\u5C71\u6708\u6EE1\u5DDD\u3002"))
    ]);
  }
}

`,paraId:6,tocIndex:6},{value:`class AntdTextAreaKeyboardTypeDemo extends StatelessWidget {
  const AntdTextAreaKeyboardTypeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "\u6570\u5B57",
          child: AntdTextArea(
              showCount: true,
              placeholder: Text("\u8BF7\u8F93\u5165"),
              keyboardType: TextInputType.number)),
      DemoTitle(
          outline: false,
          title: "\u624B\u673A\u53F7",
          child: AntdTextArea(
              showCount: true,
              placeholder: Text("\u8BF7\u8F93\u5165"),
              keyboardType: TextInputType.phone)),
      DemoTitle(
          outline: false,
          title: "\u65E5\u671F",
          child: AntdTextArea(
              showCount: true,
              placeholder: Text("\u8BF7\u8F93\u5165"),
              keyboardType: TextInputType.datetime))
    ]);
  }
}

`,paraId:7,tocIndex:7},{value:`class AntdTextAreaEventDemo extends StatelessWidget {
  const AntdTextAreaEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "onChange",
          child: AntdTextArea(
              showCount: true,
              placeholder: const Text("\u8BF7\u8F93\u5165"),
              onChange: (value) {
                AntdToast.show("\u5F53\u524D\u7684\u8F93\u5165\u503C:$value",
                    position: AntdToastPosition.top);
              })),
      DemoTitle(
          outline: false,
          title: "onClear \u70B9\u51FB\u6E05\u7406\u56FE\u6807",
          child: AntdTextArea(
              showCount: true,
              placeholder: const Text("\u8BF7\u8F93\u5165"),
              onChange: (value) {
                AntdToast.show("\u5F53\u524D\u7684\u8F93\u5165\u503C:$value",
                    position: AntdToastPosition.top);
              },
              onClear: () {
                AntdToast.show("\u89E6\u53D1clear", position: AntdToastPosition.top);
              })),
      DemoTitle(
          outline: false,
          title: "onTap \u89E6\u6478\u4E8B\u4EF6",
          child: AntdTextArea(
              showCount: true,
              placeholder: const Text("\u8BF7\u8F93\u5165"),
              onChange: (value) {
                AntdToast.show("\u5F53\u524D\u7684\u8F93\u5165\u503C:$value",
                    position: AntdToastPosition.top);
              },
              onTap: () {
                AntdToast.show("\u89E6\u53D1onTap", position: AntdToastPosition.top);
              })),
      DemoTitle(
          outline: false,
          title: "onFocus \u7126\u70B9\u4E8B\u4EF6",
          child: AntdTextArea(
              showCount: true,
              placeholder: const Text("\u8BF7\u8F93\u5165"),
              onChange: (value) {
                AntdToast.show("\u5F53\u524D\u7684\u8F93\u5165\u503C:$value",
                    position: AntdToastPosition.top);
              },
              onFocus: (value) {
                AntdToast.show("\u89E6\u53D1onFocus:$value",
                    position: AntdToastPosition.top);
              }))
    ]);
  }
}

`,paraId:8,tocIndex:8},{value:`class _AntdTextAreaFormDemoStateDemo extends State<AntdTextAreaFormDemo> {
  AntdInputController inputController = AntdInputController();
  AntdInputController inputController1 = AntdInputController();
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "\u6700\u57FA\u7840 \u5728AntdFormItem\u4E2D\u4F7F\u7528\u4F1A\u81EA\u52A8\u6536\u96C6AntdTextArea\u7684\u503C",
          child: AntdForm(builder: (controller) {
            return FormValue(
                controller: controller,
                child: AntdFormItem(
                    name: "textarea",
                    builder: (ctx) {
                      return const AntdTextArea(
                          minLines: 2, placeholder: Text("\u8BF7\u8F93\u5165"));
                    }));
          })),
      DemoTitle(
          outline: false,
          title: "\u8868\u5355\u63A7\u5236\u9ED8\u8BA4\u503C",
          child: AntdForm(
              initialValues: const {"textarea": '\u6765\u81EAform\u7684\u9ED8\u8BA4\u503C'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        builder: (ctx) {
                          return const AntdTextArea(
                              minLines: 2, placeholder: Text("\u8BF7\u8F93\u5165"));
                        }));
              })),
      DemoTitle(
          outline: false,
          title:
              "\u8868\u5355\u63A7\u5236\u53EA\u8BFB\u7981\u7528,\u5C5E\u6027\u7684\u4F18\u5148\u7EA7\u9075\u5B88\u6700\u8FD1\u539F\u5219,\u867D\u7136AntdFormItem\u6307\u5B9A\u7684disabled,\u4F46\u662FAntdTextArea\u8986\u76D6\u4E86",
          child: AntdForm(
              initialValues: const {"textarea": '\u6765\u81EAform\u7684\u9ED8\u8BA4\u503C'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        readOnly: true,
                        disabled: true,
                        builder: (ctx) {
                          return const AntdTextArea(
                              disabled: false, placeholder: Text("\u8BF7\u8F93\u5165"));
                        }));
              })),
      DemoTitle(
          outline: false,
          title: "\u4E0D\u8981\u8868\u5355\u81EA\u52A8\u6536\u96C6 \u5FC5\u987B\u5728\u5408\u9002\u7684\u65F6\u5019\u624B\u52A8 \u5426\u5219\u4E0D\u4F1A\u540C\u6B65",
          child: AntdForm(
              initialValues: const {"textarea": '\u6765\u81EAform\u7684\u9ED8\u8BA4\u503C'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        builder: (ctx) {
                          return const AntdTextArea(
                              autoCollect: false, placeholder: Text("\u8BF7\u8F93\u5165"));
                        }));
              })),
      AntdButton(
          child: const Text('\u70B9\u6211\u4FEE\u6539'),
          onTap: () {
            setState(() {
              inputController.text = "\u6211\u662F\u5916\u90E8\u8BBE\u7F6E\u7684\u503C";
            });
          }),
      DemoTitle(
          outline: false,
          title: "autoCollect:true\u7684\u65F6\u5019\u5916\u90E8\u6539\u53D8 Value \u4E5F\u4F1A\u540C\u6B65\u81F3\u8868\u5355",
          child: AntdForm(
              initialValues: const {"textarea": '\u6765\u81EAform\u7684\u9ED8\u8BA4\u503C'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        builder: (ctx) {
                          return AntdTextArea(
                              controller: inputController,
                              placeholder: const Text("\u8BF7\u8F93\u5165"),
                              onChange: (value) {
                                AntdToast.show("\u5F53\u524D\u7684\u8F93\u5165\u503C:$value",
                                    position: AntdToastPosition.top);
                              });
                        }));
              })),
      AntdButton(
          child: const Text('\u70B9\u6211\u4FEE\u6539'),
          onTap: () {
            setState(() {
              inputController1.text = "\u6211\u662F\u5916\u90E8\u8BBE\u7F6E\u7684\u503C";
            });
          }),
      DemoTitle(
          outline: false,
          title: "\u4F7F\u7528shouldTriggerChange \u63A7\u5236\u5F53\u5916\u90E8\u7684value\u6539\u53D8\u65F6\u8981\u4E0D\u8981\u89E6\u53D1onChange",
          child: AntdForm(
              initialValues: const {"textarea": '\u6765\u81EAform\u7684\u9ED8\u8BA4\u503C'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        builder: (ctx) {
                          return AntdTextArea(
                              controller: inputController1,
                              placeholder: const Text("\u8BF7\u8F93\u5165"),
                              onChange: (value) {
                                AntdToast.show("\u5F53\u524D\u7684\u8F93\u5165\u503C:$value",
                                    position: AntdToastPosition.top);
                              },
                              shouldTriggerChange: false);
                        }));
              }))
    ]);
  }
}

`,paraId:9,tocIndex:9},{value:`
  `,paraId:10},{value:"\u5C5E\u6027\u540D",paraId:11,tocIndex:10},{value:"\u8BF4\u660E",paraId:11,tocIndex:10},{value:"\u7C7B\u578B",paraId:11,tocIndex:10},{value:"\u9ED8\u8BA4\u503C",paraId:11,tocIndex:10},{value:"\u7248\u672C",paraId:11,tocIndex:10},{value:"key",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"Key",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"style",paraId:11,tocIndex:10},{value:"\u6837\u5F0F",paraId:11,tocIndex:10},{value:"AntdInputStyle",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"styleBuilder",paraId:11,tocIndex:10},{value:"\u52A8\u6001\u6837\u5F0F",paraId:11,tocIndex:10},{value:"AntdStyleBuilder<AntdInputStyle, AntdTextArea>",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"focusNode",paraId:11,tocIndex:10},{value:"\u63A7\u5236\u8F93\u5165\u6846\u7684\u7126\u70B9\u72B6\u6001",paraId:11,tocIndex:10},{value:"FocusNode",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"clearable",paraId:11,tocIndex:10},{value:"\u662F\u5426\u663E\u793A\u6E05\u9664\u6309\u94AE\uFF08\u70B9\u51FB\u4F1A\u6E05\u7A7A\u8F93\u5165\u5185\u5BB9\uFF09",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"true",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"value",paraId:11,tocIndex:10},{value:"\u503C",paraId:11,tocIndex:10},{value:"String",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"disabled",paraId:11,tocIndex:10},{value:"\u7981\u7528",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"onChange",paraId:11,tocIndex:10},{value:"\u53D8\u66F4\u4E8B\u4EF6",paraId:11,tocIndex:10},{value:"ValueChanged<String>",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"onEditingComplete",paraId:11,tocIndex:10},{value:"\u7F16\u8F91\u5B8C\u6210\u65F6\u7684\u56DE\u8C03\uFF08\u901A\u5E38\u70B9\u51FB\u952E\u76D8\u5B8C\u6210/\u4E0B\u4E00\u6B65\u65F6\u89E6\u53D1\uFF09",paraId:11,tocIndex:10},{value:"VoidCallback",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"onSubmitted",paraId:11,tocIndex:10},{value:"\u6587\u672C\u63D0\u4EA4\u65F6\u7684\u56DE\u8C03\uFF08\u901A\u5E38\u70B9\u51FB\u952E\u76D8\u53D1\u9001/\u641C\u7D22\u65F6\u89E6\u53D1\uFF09",paraId:11,tocIndex:10},{value:"ValueChanged<String>",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"onClear",paraId:11,tocIndex:10},{value:"\u70B9\u51FB\u6E05\u9664\u6309\u94AE\u65F6\u7684\u56DE\u8C03\u51FD\u6570",paraId:11,tocIndex:10},{value:"VoidCallback",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"placeholder",paraId:11,tocIndex:10},{value:"\u8F93\u5165\u6846\u4E3A\u7A7A\u65F6\u663E\u793A\u7684\u63D0\u793A\u6587\u672C",paraId:11,tocIndex:10},{value:"Widget",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"readOnly",paraId:11,tocIndex:10},{value:"\u53EA\u8BFB",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"controller",paraId:11,tocIndex:10},{value:"\u8F93\u5165\u6846\u7684\u63A7\u5236\u5668\uFF0C\u7528\u4E8E\u7A0B\u5E8F\u5316\u63A7\u5236\u6587\u672C\u5185\u5BB9",paraId:11,tocIndex:10},{value:"AntdInputController",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"autoCollect",paraId:11,tocIndex:10},{value:"\u81EA\u52A8\u540C\u6B65\u503C\u5230\u8868\u5355",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"autocorrect",paraId:11,tocIndex:10},{value:"\u662F\u5426\u81EA\u52A8\u6821\u6B63\u62FC\u5199\u9519\u8BEF\uFF08\u5982iOS\u952E\u76D8\u7684\u81EA\u52A8\u4FEE\u6B63\uFF09\uFF0C\u9ED8\u8BA4\u4E3Atrue",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"false",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"maxLines",paraId:11,tocIndex:10},{value:"\u8F93\u5165\u6846\u7684\u6700\u5927\u884C\u6570\uFF08\u591A\u884C\u6587\u672C\u65F6\u751F\u6548\uFF09",paraId:11,tocIndex:10},{value:"int",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"minLines",paraId:11,tocIndex:10},{value:"\u8F93\u5165\u6846\u7684\u6700\u5C0F\u884C\u6570\uFF08\u591A\u884C\u6587\u672C\u65F6\u751F\u6548\uFF09",paraId:11,tocIndex:10},{value:"int",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"maxLength",paraId:11,tocIndex:10},{value:"\u5141\u8BB8\u8F93\u5165\u7684\u6700\u5927\u5B57\u7B26\u6570",paraId:11,tocIndex:10},{value:"int",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"keyboardType",paraId:11,tocIndex:10},{value:"\u952E\u76D8\u7C7B\u578B\uFF08\u5982\u6570\u5B57\u952E\u76D8\u3001\u90AE\u7BB1\u952E\u76D8\u7B49\uFF09",paraId:11,tocIndex:10},{value:"TextInputType",paraId:11,tocIndex:10},{value:"text",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"inputAction",paraId:11,tocIndex:10},{value:"\u952E\u76D8\u52A8\u4F5C\u6309\u94AE\u7C7B\u578B\uFF08\u5982\u641C\u7D22\u3001\u53D1\u9001\u7B49\uFF09",paraId:11,tocIndex:10},{value:"TextInputAction",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"onSelectionChanged",paraId:11,tocIndex:10},{value:"\u6587\u672C\u9009\u4E2D\u8303\u56F4\u53D8\u5316\u65F6\u7684\u56DE\u8C03",paraId:11,tocIndex:10},{value:"SelectionChangedCallback",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"formatters",paraId:11,tocIndex:10},{value:"\u8F93\u5165\u5185\u5BB9\u683C\u5F0F\u8FC7\u6EE4\u5668\uFF08\u5982\u9650\u5236\u6570\u5B57\u3001\u6B63\u5219\u5339\u914D\u7B49\uFF09",paraId:11,tocIndex:10},{value:"List<TextInputFormatter>",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"prefix",paraId:11,tocIndex:10},{value:"\u8F93\u5165\u6846\u524D\u7F00\u90E8\u4EF6\uFF08\u5982\u56FE\u6807\u3001\u6807\u7B7E\u7B49\uFF09",paraId:11,tocIndex:10},{value:"Widget",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"suffix",paraId:11,tocIndex:10},{value:"\u8F93\u5165\u6846\u540E\u7F00\u90E8\u4EF6\uFF08\u5982\u56FE\u6807\u3001\u6309\u94AE\u7B49\uFF09",paraId:11,tocIndex:10},{value:"Widget",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"onTap",paraId:11,tocIndex:10},{value:"\u8F93\u5165\u6846\u70B9\u51FB\u4E8B\u4EF6\u56DE\u8C03",paraId:11,tocIndex:10},{value:"VoidCallback",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"contextMenuBuilder",paraId:11,tocIndex:10},{value:"\u81EA\u5B9A\u4E49\u4E0A\u4E0B\u6587\u83DC\u5355\u6784\u5EFA\u5668\uFF08\u957F\u6309\u6587\u672C\u65F6\u5F39\u51FA\u7684\u83DC\u5355\uFF09",paraId:11,tocIndex:10},{value:"EditableTextContextMenuBuilder",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"undoController",paraId:11,tocIndex:10},{value:"\u64A4\u9500/\u91CD\u505A\u5386\u53F2\u63A7\u5236\u5668",paraId:11,tocIndex:10},{value:"UndoHistoryController",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"spellCheckConfiguration",paraId:11,tocIndex:10},{value:"\u62FC\u5199\u68C0\u67E5\u914D\u7F6E\uFF08\u5982\u542F\u7528/\u7981\u7528\u3001\u9519\u8BEF\u6587\u672C\u6837\u5F0F\u7B49\uFF09",paraId:11,tocIndex:10},{value:"SpellCheckConfiguration",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"magnifierConfiguration",paraId:11,tocIndex:10},{value:"\u6587\u672C\u653E\u5927\u955C\u914D\u7F6E\uFF08\u957F\u6309\u9009\u4E2D\u6587\u672C\u65F6\u7684\u653E\u5927\u6548\u679C\uFF09",paraId:11,tocIndex:10},{value:"TextMagnifierConfiguration",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"onAppPrivateCommand",paraId:11,tocIndex:10},{value:"\u5904\u7406\u6765\u81EA\u952E\u76D8\u7684\u79C1\u6709\u547D\u4EE4\uFF08\u5982\u7B2C\u4E09\u65B9\u952E\u76D8\u6269\u5C55\u529F\u80FD\uFF09",paraId:11,tocIndex:10},{value:"AppPrivateCommandCallback",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"dragStartBehavior",paraId:11,tocIndex:10},{value:"\u62D6\u52A8\u884C\u4E3A\u7684\u8D77\u59CB\u65B9\u5F0F\uFF08\u5982\u7ACB\u5373\u54CD\u5E94\u6216\u5EF6\u8FDF\u54CD\u5E94\uFF09",paraId:11,tocIndex:10},{value:"DragStartBehavior",paraId:11,tocIndex:10},{value:"start",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"scrollController",paraId:11,tocIndex:10},{value:"\u6EDA\u52A8\u63A7\u5236\u5668\uFF08\u7528\u4E8E\u63A7\u5236\u591A\u884C\u6587\u672C\u7684\u6EDA\u52A8\u4F4D\u7F6E\uFF09",paraId:11,tocIndex:10},{value:"ScrollController",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"scrollPhysics",paraId:11,tocIndex:10},{value:"\u6EDA\u52A8\u7269\u7406\u6548\u679C\uFF08\u5982\u6EDA\u52A8\u8FB9\u754C\u884C\u4E3A\uFF09",paraId:11,tocIndex:10},{value:"ScrollPhysics",paraId:11,tocIndex:10},{value:"const NeverScrollableScrollPhysics()",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"clipBehavior",paraId:11,tocIndex:10},{value:"\u5185\u5BB9\u88C1\u526A\u65B9\u5F0F\uFF08\u5982\u6297\u952F\u9F7F\u88C1\u526A\uFF09",paraId:11,tocIndex:10},{value:"Clip",paraId:11,tocIndex:10},{value:"hardEdge",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"onFocus",paraId:11,tocIndex:10},{value:"\u7126\u70B9\u4E8B\u4EF6",paraId:11,tocIndex:10},{value:"AntdOnFocus",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"shouldTriggerChange",paraId:11,tocIndex:10},{value:"\u5F53value\u624B\u52A8\u63A7\u5236\u7684\u65F6\u5019 \u662F\u5426\u5E94\u8BE5\u89E6\u53D1onChange",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"true",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"hapticFeedback",paraId:11,tocIndex:10},{value:"\u5F00\u542F\u53CD\u9988:",paraId:11,tocIndex:10},{value:"light",paraId:11,tocIndex:10},{value:" | ",paraId:11,tocIndex:10},{value:"medium",paraId:11,tocIndex:10},{value:" | ",paraId:11,tocIndex:10},{value:"heavy",paraId:11,tocIndex:10},{value:" | ",paraId:11,tocIndex:10},{value:"none",paraId:11,tocIndex:10},{value:"AntdHapticFeedback",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"showCount",paraId:11,tocIndex:10},{value:"\u662F\u5426\u5C55\u793A\u5B57\u6570\u7EDF\u8BA1",paraId:11,tocIndex:10},{value:"bool",paraId:11,tocIndex:10},{value:"true",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"countBuilder",paraId:11,tocIndex:10},{value:"\u81EA\u5B9A\u4E49\u7EDF\u8BA1\u6570\u5B57",paraId:11,tocIndex:10},{value:"AntdTextAreaCountBuilder",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"-",paraId:11,tocIndex:10},{value:"\u5C5E\u6027\u540D",paraId:12,tocIndex:11},{value:"\u8BF4\u660E",paraId:12,tocIndex:11},{value:"\u7C7B\u578B",paraId:12,tocIndex:11},{value:"\u9ED8\u8BA4\u503C",paraId:12,tocIndex:11},{value:"\u7248\u672C",paraId:12,tocIndex:11},{value:"inherit",paraId:12,tocIndex:11},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:12,tocIndex:11},{value:"bool",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"placeholderStyle",paraId:12,tocIndex:11},{value:"\u5360\u4F4D\u7B26\u6587\u672C\u6837\u5F0F",paraId:12,tocIndex:11},{value:"AntdBoxStyle",paraId:13,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"textStyle",paraId:12,tocIndex:11},{value:"\u5E38\u89C4\u6587\u672C\u6837\u5F0F",paraId:12,tocIndex:11},{value:"TextStyle",paraId:14,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"obscureTextStyle",paraId:12,tocIndex:11},{value:"\u5BC6\u7801\u6A21\u5F0F\u6587\u672C\u6837\u5F0F",paraId:12,tocIndex:11},{value:"TextStyle",paraId:15,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"bodyStyle",paraId:12,tocIndex:11},{value:"\u8F93\u5165\u6846\u5BB9\u5668\u6837\u5F0F",paraId:12,tocIndex:11},{value:"AntdBoxStyle",paraId:16,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"cursorStyle",paraId:12,tocIndex:11},{value:"\u5149\u6807\u6837\u5F0F\u914D\u7F6E",paraId:12,tocIndex:11},{value:"AntInputCursorStyle",paraId:17,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"obscuringCharacter",paraId:12,tocIndex:11},{value:'\u5BC6\u7801\u6A21\u5F0F\u66FF\u4EE3\u5B57\u7B26\uFF0C\u9ED8\u8BA4"\u2022"',paraId:12,tocIndex:11},{value:"String",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"clearIconStyle",paraId:12,tocIndex:11},{value:"\u56FE\u6807\u6837\u5F0F\u914D\u7F6E",paraId:12,tocIndex:11},{value:"AntdIconStyle",paraId:18,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"selectionStyle",paraId:12,tocIndex:11},{value:"\u6587\u672C\u9009\u62E9\u6837\u5F0F\u914D\u7F6E",paraId:12,tocIndex:11},{value:"AntdSelectionStyle",paraId:19,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"keyboardStyle",paraId:12,tocIndex:11},{value:"\u952E\u76D8\u6837\u5F0F\u914D\u7F6E",paraId:12,tocIndex:11},{value:"AntdKeyboardStyle",paraId:20,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"clearIcon",paraId:12,tocIndex:11},{value:"\u6E05\u9664\u6309\u94AE\u56FE\u6807",paraId:12,tocIndex:11},{value:"Widget",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"obscureIconStyle",paraId:12,tocIndex:11},{value:"\u5BC6\u7801\u9690\u85CF\u72B6\u6001\u56FE\u6807\u6837\u5F0F\u914D\u7F6E",paraId:12,tocIndex:11},{value:"AntdIconStyle",paraId:21,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"obscureIcon",paraId:12,tocIndex:11},{value:"\u5BC6\u7801\u9690\u85CF\u72B6\u6001\u56FE\u6807",paraId:12,tocIndex:11},{value:"Widget",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"activeObscureIconStyle",paraId:12,tocIndex:11},{value:"\u5BC6\u7801\u663E\u793A\u72B6\u6001\u56FE\u6807\u6837\u5F0F\u914D\u7F6E",paraId:12,tocIndex:11},{value:"AntdIconStyle",paraId:22,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"activeObscureIcon",paraId:12,tocIndex:11},{value:"\u5BC6\u7801\u663E\u793A\u72B6\u6001\u56FE\u6807",paraId:12,tocIndex:11},{value:"Widget",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"rowStyle",paraId:12,tocIndex:11},{value:"\u5E03\u5C40\u884C\u6837\u5F0F\u914D\u7F6E",paraId:12,tocIndex:11},{value:"AntdFlexStyle",paraId:23,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"autocorrectionColor",paraId:12,tocIndex:11},{value:"\u81EA\u52A8\u4FEE\u6B63\u6587\u672C\u533A\u57DF\u989C\u8272",paraId:12,tocIndex:11},{value:"Color",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11}]}}]);
