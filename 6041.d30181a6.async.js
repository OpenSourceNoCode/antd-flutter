"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[6041],{46041:function(n,a,e){e.r(a),e.d(a,{texts:function(){return d}});const d=[{value:"\u901A\u8FC7\u952E\u76D8\u8F93\u5165\u5185\u5BB9\uFF0C\u662F\u6700\u57FA\u7840\u7684\u8868\u5355\u57DF\u5305\u88C5\u3002",paraId:0},{value:"\u4E00\u822C\u7528\u5728\u8868\u5355\u9875\u8FDB\u884C\u4FE1\u606F\u7684\u6536\u96C6\uFF0C\u63D0\u4F9B\u6587\u672C\u6846\u3001\u9009\u62E9\u6846\u4E24\u79CD\u7C7B\u578B\u3002",paraId:1,tocIndex:0},{value:`class AntdInputDemo extends StatelessWidget {
  const AntdInputDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdInput(
          onChange: (value) {
            AntdToast.show("\u5F53\u524D\u7684\u8F93\u5165\u503C:$value");
          },
          placeholder: const Text("\u8BF7\u8F93\u5165\u5185\u5BB9"))
    ]);
  }
}

`,paraId:2,tocIndex:2},{value:`class AntdInputClearableDemo extends StatelessWidget {
  const AntdInputClearableDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdInput(
          onClear: () {
            AntdToast.show("\u6E05\u7406\u4E86\u6240\u6709\u8F93\u5165");
          },
          placeholder: const Text("\u8BF7\u8F93\u5165\u5185\u5BB9"),
          clearable: true)
    ]);
  }
}

`,paraId:3,tocIndex:3},{value:`class AntdInputTextAlignDemo extends StatelessWidget {
  const AntdInputTextAlignDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdInput(
          placeholder: Text("\u8BF7\u8F93\u5165\u5185\u5BB9"),
          clearable: true,
          textAlign: TextAlign.right)
    ]);
  }
}

`,paraId:4,tocIndex:4},{value:`class AntdInputReadOnlyDemo extends StatelessWidget {
  const AntdInputReadOnlyDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
        child: [AntdInput(readOnly: true, value: "\u53EA\u8BFB\u6A21\u5F0F\u7684\u8F93\u5165\u6846")]);
  }
}

`,paraId:5,tocIndex:5},{value:`class AntdInputDisabledDemo extends StatelessWidget {
  const AntdInputDisabledDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
        child: [AntdInput(disabled: true, placeholder: Text("\u88AB\u7981\u7528\u7684\u8F93\u5165\u6846"))]);
  }
}

`,paraId:6,tocIndex:6},{value:`class AntdInputObscureTextDemo extends StatelessWidget {
  const AntdInputObscureTextDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
        child: [AntdInput(obscureText: true, placeholder: Text("\u8BF7\u8F93\u5165\u5BC6\u7801"))]);
  }
}

`,paraId:7,tocIndex:7},{value:`class AntdInputPrefixSuffixTextDemo extends StatelessWidget {
  const AntdInputPrefixSuffixTextDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdInput(
          obscureText: true,
          prefix: Text("\u6211\u662F\u524D\u7F00"),
          suffix: Text("\u6211\u662F\u540E\u7F00"),
          placeholder: Text("\u8BF7\u8F93\u5165\u5BC6\u7801"))
    ]);
  }
}

`,paraId:8,tocIndex:8},{value:`class AntdInputFocusTextDemo extends StatelessWidget {
  const AntdInputFocusTextDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdInput(
          onFocus: (value) {
            AntdToast.show("\u7126\u70B9\u72B6\u6001:$value");
          },
          prefix: const Text("\u6211\u662F\u524D\u7F00"),
          suffix: const Text("\u6211\u662F\u540E\u7F00"),
          placeholder: const Text("\u8BF7\u8F93\u5165\u5BC6\u7801"))
    ]);
  }
}

`,paraId:9,tocIndex:9},{value:`class _AntdInputFormDemoStateDemo extends State<AntdInputFormDemo> {
  String? value;
  String? value1;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "\u6700\u57FA\u7840 \u5728AntdFormItem\u4E2D\u4F7F\u7528\u4F1A\u81EA\u52A8\u6536\u96C6AntdInput\u7684\u503C",
          child: AntdForm(builder: (controller) {
            return FormValue(
                controller: controller,
                child: AntdFormItem(
                    name: "input",
                    builder: (ctx) {
                      return const AntdInput(
                          minLines: 2, placeholder: Text("\u8BF7\u8F93\u5165"));
                    }));
          })),
      DemoTitle(
          outline: false,
          title: "\u8868\u5355\u63A7\u5236\u9ED8\u8BA4\u503C",
          child: AntdForm(
              initialValues: const {"input": '\u6765\u81EAform\u7684\u9ED8\u8BA4\u503C'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "input",
                        builder: (ctx) {
                          return const AntdInput(
                              minLines: 2, placeholder: Text("\u8BF7\u8F93\u5165"));
                        }));
              })),
      DemoTitle(
          outline: false,
          title:
              "\u8868\u5355\u63A7\u5236\u53EA\u8BFB\u7981\u7528,\u5C5E\u6027\u7684\u4F18\u5148\u7EA7\u9075\u5B88\u6700\u8FD1\u539F\u5219,\u867D\u7136AntdFormItem\u6307\u5B9A\u7684disabled,\u4F46\u662FAntdInput\u8986\u76D6\u4E86",
          child: AntdForm(
              initialValues: const {"input": '\u6765\u81EAform\u7684\u9ED8\u8BA4\u503C'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "input",
                        readOnly: true,
                        disabled: true,
                        builder: (ctx) {
                          return const AntdInput(
                              disabled: false, placeholder: Text("\u8BF7\u8F93\u5165"));
                        }));
              })),
      DemoTitle(
          outline: false,
          title: "\u4E0D\u8981\u8868\u5355\u81EA\u52A8\u6536\u96C6 \u5FC5\u987B\u5728\u5408\u9002\u7684\u65F6\u5019\u624B\u52A8 \u5426\u5219\u4E0D\u4F1A\u540C\u6B65",
          child: AntdForm(
              initialValues: const {"input": '\u6765\u81EAform\u7684\u9ED8\u8BA4\u503C'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "input",
                        builder: (ctx) {
                          return const AntdInput(
                              autoCollect: false, placeholder: Text("\u8BF7\u8F93\u5165"));
                        }));
              })),
      AntdButton(
          child: const Text('\u70B9\u6211\u4FEE\u6539'),
          onTap: () {
            setState(() {
              value = "\u6211\u662F\u5916\u90E8\u8BBE\u7F6E\u7684\u503C";
            });
          }),
      DemoTitle(
          outline: false,
          title: "autoCollect:true\u7684\u65F6\u5019\u5916\u90E8\u6539\u53D8 Value \u4E5F\u4F1A\u540C\u6B65\u81F3\u8868\u5355",
          child: AntdForm(
              initialValues: const {"input": '\u6765\u81EAform\u7684\u9ED8\u8BA4\u503C'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "input",
                        builder: (ctx) {
                          return AntdInput(
                              value: value,
                              placeholder: const Text("\u8BF7\u8F93\u5165"),
                              onChange: (value) {
                                AntdToast.show("\u5F53\u524D\u7684\u8F93\u5165\u503C:$value",
                                    position: AntdToastPosition.top);
                                setState(() {
                                  this.value = value;
                                });
                              });
                        }));
              })),
      AntdButton(
          child: const Text('\u70B9\u6211\u4FEE\u6539'),
          onTap: () {
            setState(() {
              value1 = "\u6211\u662F\u5916\u90E8\u8BBE\u7F6E\u7684\u503C";
            });
          }),
      DemoTitle(
          outline: false,
          title: "\u4F7F\u7528shouldTriggerChange \u63A7\u5236\u5F53\u5916\u90E8\u7684value\u6539\u53D8\u65F6\u8981\u4E0D\u8981\u89E6\u53D1onChange",
          child: AntdForm(
              initialValues: const {"input": '\u6765\u81EAform\u7684\u9ED8\u8BA4\u503C'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "input",
                        builder: (ctx) {
                          return AntdInput(
                              value: value1,
                              placeholder: const Text("\u8BF7\u8F93\u5165"),
                              onChange: (value) {
                                AntdToast.show("\u5F53\u524D\u7684\u8F93\u5165\u503C:$value",
                                    position: AntdToastPosition.top);
                                setState(() {
                                  this.value = value;
                                });
                              },
                              shouldTriggerChange: false);
                        }));
              }))
    ]);
  }
}

`,paraId:10,tocIndex:10},{value:`
  `,paraId:11},{value:"\u5C5E\u6027\u540D",paraId:12,tocIndex:11},{value:"\u8BF4\u660E",paraId:12,tocIndex:11},{value:"\u7C7B\u578B",paraId:12,tocIndex:11},{value:"\u9ED8\u8BA4\u503C",paraId:12,tocIndex:11},{value:"\u7248\u672C",paraId:12,tocIndex:11},{value:"key",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"Key",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"style",paraId:12,tocIndex:11},{value:"\u6837\u5F0F",paraId:12,tocIndex:11},{value:"AntdInputStyle",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"styleBuilder",paraId:12,tocIndex:11},{value:"\u52A8\u6001\u6837\u5F0F",paraId:12,tocIndex:11},{value:"AntdStyleBuilder<AntdInputStyle, AntdInput>",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"focusNode",paraId:12,tocIndex:11},{value:"\u63A7\u5236\u8F93\u5165\u6846\u7684\u7126\u70B9\u72B6\u6001",paraId:12,tocIndex:11},{value:"FocusNode",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"clearable",paraId:12,tocIndex:11},{value:"\u662F\u5426\u663E\u793A\u6E05\u9664\u6309\u94AE\uFF08\u70B9\u51FB\u4F1A\u6E05\u7A7A\u8F93\u5165\u5185\u5BB9\uFF09",paraId:12,tocIndex:11},{value:"bool",paraId:12,tocIndex:11},{value:"true",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"value",paraId:12,tocIndex:11},{value:"\u503C",paraId:12,tocIndex:11},{value:"String",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"disabled",paraId:12,tocIndex:11},{value:"\u7981\u7528",paraId:12,tocIndex:11},{value:"bool",paraId:12,tocIndex:11},{value:"false",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"onChange",paraId:12,tocIndex:11},{value:"\u53D8\u66F4\u4E8B\u4EF6",paraId:12,tocIndex:11},{value:"ValueChanged<String>",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"onEditingComplete",paraId:12,tocIndex:11},{value:"\u7F16\u8F91\u5B8C\u6210\u65F6\u7684\u56DE\u8C03\uFF08\u901A\u5E38\u70B9\u51FB\u952E\u76D8\u5B8C\u6210/\u4E0B\u4E00\u6B65\u65F6\u89E6\u53D1\uFF09",paraId:12,tocIndex:11},{value:"VoidCallback",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"onSubmitted",paraId:12,tocIndex:11},{value:"\u6587\u672C\u63D0\u4EA4\u65F6\u7684\u56DE\u8C03\uFF08\u901A\u5E38\u70B9\u51FB\u952E\u76D8\u53D1\u9001/\u641C\u7D22\u65F6\u89E6\u53D1\uFF09",paraId:12,tocIndex:11},{value:"ValueChanged<String>",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"onClear",paraId:12,tocIndex:11},{value:"\u70B9\u51FB\u6E05\u9664\u6309\u94AE\u65F6\u7684\u56DE\u8C03\u51FD\u6570",paraId:12,tocIndex:11},{value:"VoidCallback",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"placeholder",paraId:12,tocIndex:11},{value:"\u8F93\u5165\u6846\u4E3A\u7A7A\u65F6\u663E\u793A\u7684\u63D0\u793A\u6587\u672C",paraId:12,tocIndex:11},{value:"Widget",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"readOnly",paraId:12,tocIndex:11},{value:"\u53EA\u8BFB",paraId:12,tocIndex:11},{value:"bool",paraId:12,tocIndex:11},{value:"false",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"controller",paraId:12,tocIndex:11},{value:"\u8F93\u5165\u6846\u7684\u63A7\u5236\u5668\uFF0C\u7528\u4E8E\u7A0B\u5E8F\u5316\u63A7\u5236\u6587\u672C\u5185\u5BB9",paraId:12,tocIndex:11},{value:"AntdInputController",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"textAlign",paraId:12,tocIndex:11},{value:"\u6587\u672C\u5BF9\u9F50\u65B9\u5F0F\uFF08\u5DE6/\u4E2D/\u53F3\uFF09",paraId:12,tocIndex:11},{value:"TextAlign",paraId:12,tocIndex:11},{value:"start",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"obscureIcon",paraId:12,tocIndex:11},{value:"\u662F\u5426\u663E\u793A\u5BC6\u7801\u53EF\u89C1\u6027\u5207\u6362\u56FE\u6807\uFF08\u4EC5\u5F53obscureText=true\u65F6\u6709\u6548\uFF09",paraId:12,tocIndex:11},{value:"bool",paraId:12,tocIndex:11},{value:"true",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"obscureText",paraId:12,tocIndex:11},{value:"\u662F\u5426\u4EE5\u5BC6\u7801\u5F62\u5F0F\u9690\u85CF\u8F93\u5165\u5185\u5BB9\uFF08\u663E\u793A\u4E3A\u5706\u70B9\uFF09\uFF0C\u9ED8\u8BA4\u4E3Afalse",paraId:12,tocIndex:11},{value:"bool",paraId:12,tocIndex:11},{value:"false",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"autocorrect",paraId:12,tocIndex:11},{value:"\u662F\u5426\u81EA\u52A8\u6821\u6B63\u62FC\u5199\u9519\u8BEF\uFF08\u5982iOS\u952E\u76D8\u7684\u81EA\u52A8\u4FEE\u6B63\uFF09\uFF0C\u9ED8\u8BA4\u4E3Atrue",paraId:12,tocIndex:11},{value:"bool",paraId:12,tocIndex:11},{value:"false",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"maxLines",paraId:12,tocIndex:11},{value:"\u8F93\u5165\u6846\u7684\u6700\u5927\u884C\u6570\uFF08\u591A\u884C\u6587\u672C\u65F6\u751F\u6548\uFF09",paraId:12,tocIndex:11},{value:"int",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"minLines",paraId:12,tocIndex:11},{value:"\u8F93\u5165\u6846\u7684\u6700\u5C0F\u884C\u6570\uFF08\u591A\u884C\u6587\u672C\u65F6\u751F\u6548\uFF09",paraId:12,tocIndex:11},{value:"int",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"maxLength",paraId:12,tocIndex:11},{value:"\u5141\u8BB8\u8F93\u5165\u7684\u6700\u5927\u5B57\u7B26\u6570",paraId:12,tocIndex:11},{value:"int",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"keyboardType",paraId:12,tocIndex:11},{value:"\u952E\u76D8\u7C7B\u578B\uFF08\u5982\u6570\u5B57\u952E\u76D8\u3001\u90AE\u7BB1\u952E\u76D8\u7B49\uFF09",paraId:12,tocIndex:11},{value:"TextInputType",paraId:12,tocIndex:11},{value:"text",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"inputAction",paraId:12,tocIndex:11},{value:"\u952E\u76D8\u52A8\u4F5C\u6309\u94AE\u7C7B\u578B\uFF08\u5982\u641C\u7D22\u3001\u53D1\u9001\u7B49\uFF09",paraId:12,tocIndex:11},{value:"TextInputAction",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"onSelectionChanged",paraId:12,tocIndex:11},{value:"\u6587\u672C\u9009\u4E2D\u8303\u56F4\u53D8\u5316\u65F6\u7684\u56DE\u8C03",paraId:12,tocIndex:11},{value:"SelectionChangedCallback",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"formatters",paraId:12,tocIndex:11},{value:"\u8F93\u5165\u5185\u5BB9\u683C\u5F0F\u8FC7\u6EE4\u5668\uFF08\u5982\u9650\u5236\u6570\u5B57\u3001\u6B63\u5219\u5339\u914D\u7B49\uFF09",paraId:12,tocIndex:11},{value:"List<TextInputFormatter>",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"prefix",paraId:12,tocIndex:11},{value:"\u8F93\u5165\u6846\u524D\u7F00\u90E8\u4EF6\uFF08\u5982\u56FE\u6807\u3001\u6807\u7B7E\u7B49\uFF09",paraId:12,tocIndex:11},{value:"Widget",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"suffix",paraId:12,tocIndex:11},{value:"\u8F93\u5165\u6846\u540E\u7F00\u90E8\u4EF6\uFF08\u5982\u56FE\u6807\u3001\u6309\u94AE\u7B49\uFF09",paraId:12,tocIndex:11},{value:"Widget",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"onTap",paraId:12,tocIndex:11},{value:"\u8F93\u5165\u6846\u70B9\u51FB\u4E8B\u4EF6\u56DE\u8C03",paraId:12,tocIndex:11},{value:"VoidCallback",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"contextMenuBuilder",paraId:12,tocIndex:11},{value:"\u81EA\u5B9A\u4E49\u4E0A\u4E0B\u6587\u83DC\u5355\u6784\u5EFA\u5668\uFF08\u957F\u6309\u6587\u672C\u65F6\u5F39\u51FA\u7684\u83DC\u5355\uFF09",paraId:12,tocIndex:11},{value:"EditableTextContextMenuBuilder",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"undoController",paraId:12,tocIndex:11},{value:"\u64A4\u9500/\u91CD\u505A\u5386\u53F2\u63A7\u5236\u5668",paraId:12,tocIndex:11},{value:"UndoHistoryController",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"spellCheckConfiguration",paraId:12,tocIndex:11},{value:"\u62FC\u5199\u68C0\u67E5\u914D\u7F6E\uFF08\u5982\u542F\u7528/\u7981\u7528\u3001\u9519\u8BEF\u6587\u672C\u6837\u5F0F\u7B49\uFF09",paraId:12,tocIndex:11},{value:"SpellCheckConfiguration",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"magnifierConfiguration",paraId:12,tocIndex:11},{value:"\u6587\u672C\u653E\u5927\u955C\u914D\u7F6E\uFF08\u957F\u6309\u9009\u4E2D\u6587\u672C\u65F6\u7684\u653E\u5927\u6548\u679C\uFF09",paraId:12,tocIndex:11},{value:"TextMagnifierConfiguration",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"onAppPrivateCommand",paraId:12,tocIndex:11},{value:"\u5904\u7406\u6765\u81EA\u952E\u76D8\u7684\u79C1\u6709\u547D\u4EE4\uFF08\u5982\u7B2C\u4E09\u65B9\u952E\u76D8\u6269\u5C55\u529F\u80FD\uFF09",paraId:12,tocIndex:11},{value:"AppPrivateCommandCallback",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"dragStartBehavior",paraId:12,tocIndex:11},{value:"\u62D6\u52A8\u884C\u4E3A\u7684\u8D77\u59CB\u65B9\u5F0F\uFF08\u5982\u7ACB\u5373\u54CD\u5E94\u6216\u5EF6\u8FDF\u54CD\u5E94\uFF09",paraId:12,tocIndex:11},{value:"DragStartBehavior",paraId:12,tocIndex:11},{value:"start",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"scrollController",paraId:12,tocIndex:11},{value:"\u6EDA\u52A8\u63A7\u5236\u5668\uFF08\u7528\u4E8E\u63A7\u5236\u591A\u884C\u6587\u672C\u7684\u6EDA\u52A8\u4F4D\u7F6E\uFF09",paraId:12,tocIndex:11},{value:"ScrollController",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"scrollPhysics",paraId:12,tocIndex:11},{value:"\u6EDA\u52A8\u7269\u7406\u6548\u679C\uFF08\u5982\u6EDA\u52A8\u8FB9\u754C\u884C\u4E3A\uFF09",paraId:12,tocIndex:11},{value:"ScrollPhysics",paraId:12,tocIndex:11},{value:"const NeverScrollableScrollPhysics()",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"clipBehavior",paraId:12,tocIndex:11},{value:"\u5185\u5BB9\u88C1\u526A\u65B9\u5F0F\uFF08\u5982\u6297\u952F\u9F7F\u88C1\u526A\uFF09",paraId:12,tocIndex:11},{value:"Clip",paraId:12,tocIndex:11},{value:"hardEdge",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"onFocus",paraId:12,tocIndex:11},{value:"\u7126\u70B9\u4E8B\u4EF6",paraId:12,tocIndex:11},{value:"AntdOnFocus",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"shouldTriggerChange",paraId:12,tocIndex:11},{value:"\u5F53value\u624B\u52A8\u63A7\u5236\u7684\u65F6\u5019 \u662F\u5426\u5E94\u8BE5\u89E6\u53D1onChange",paraId:12,tocIndex:11},{value:"bool",paraId:12,tocIndex:11},{value:"false",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"hapticFeedback",paraId:12,tocIndex:11},{value:"\u5F00\u542F\u53CD\u9988:",paraId:12,tocIndex:11},{value:"light",paraId:12,tocIndex:11},{value:" | ",paraId:12,tocIndex:11},{value:"medium",paraId:12,tocIndex:11},{value:" | ",paraId:12,tocIndex:11},{value:"heavy",paraId:12,tocIndex:11},{value:" | ",paraId:12,tocIndex:11},{value:"none",paraId:12,tocIndex:11},{value:"AntdHapticFeedback",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"autoCollect",paraId:12,tocIndex:11},{value:"\u81EA\u52A8\u540C\u6B65\u503C\u5230\u8868\u5355",paraId:12,tocIndex:11},{value:"bool",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"-",paraId:12,tocIndex:11},{value:"\u5C5E\u6027\u540D",paraId:13,tocIndex:12},{value:"\u8BF4\u660E",paraId:13,tocIndex:12},{value:"\u7C7B\u578B",paraId:13,tocIndex:12},{value:"\u9ED8\u8BA4\u503C",paraId:13,tocIndex:12},{value:"\u7248\u672C",paraId:13,tocIndex:12},{value:"inherit",paraId:13,tocIndex:12},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:13,tocIndex:12},{value:"bool",paraId:13,tocIndex:12},{value:"-",paraId:13,tocIndex:12},{value:"-",paraId:13,tocIndex:12},{value:"color",paraId:13,tocIndex:12},{value:"\u5149\u6807\u989C\u8272",paraId:13,tocIndex:12},{value:"Color",paraId:13,tocIndex:12},{value:"-",paraId:13,tocIndex:12},{value:"-",paraId:13,tocIndex:12},{value:"width",paraId:13,tocIndex:12},{value:"\u5149\u6807\u5BBD\u5EA6",paraId:13,tocIndex:12},{value:"double",paraId:13,tocIndex:12},{value:"2.0",paraId:13,tocIndex:12},{value:"-",paraId:13,tocIndex:12},{value:"height",paraId:13,tocIndex:12},{value:"\u5149\u6807\u9AD8\u5EA6",paraId:13,tocIndex:12},{value:"double",paraId:13,tocIndex:12},{value:"-",paraId:13,tocIndex:12},{value:"-",paraId:13,tocIndex:12},{value:"radius",paraId:13,tocIndex:12},{value:"\u5149\u6807\u5706\u89D2\u534A\u5F84",paraId:13,tocIndex:12},{value:"double",paraId:13,tocIndex:12},{value:"-",paraId:13,tocIndex:12},{value:"-",paraId:13,tocIndex:12},{value:"opacityAnimates",paraId:13,tocIndex:12},{value:"\u5149\u6807\u900F\u660E\u5EA6\u662F\u5426\u542F\u7528\u52A8\u753B\u6548\u679C",paraId:13,tocIndex:12},{value:"bool",paraId:13,tocIndex:12},{value:"false",paraId:13,tocIndex:12},{value:"-",paraId:13,tocIndex:12},{value:"offset",paraId:13,tocIndex:12},{value:"\u5149\u6807\u4F4D\u7F6E\u504F\u79FB\u91CF",paraId:13,tocIndex:12},{value:"Offset",paraId:13,tocIndex:12},{value:"-",paraId:13,tocIndex:12},{value:"-",paraId:13,tocIndex:12},{value:"above",paraId:13,tocIndex:12},{value:"\u662F\u5426\u5728\u6587\u672C\u4E0A\u5C42\u7ED8\u5236\u5149\u6807",paraId:13,tocIndex:12},{value:"bool",paraId:13,tocIndex:12},{value:"false",paraId:13,tocIndex:12},{value:"-",paraId:13,tocIndex:12},{value:"\u5C5E\u6027\u540D",paraId:14,tocIndex:13},{value:"\u8BF4\u660E",paraId:14,tocIndex:13},{value:"\u7C7B\u578B",paraId:14,tocIndex:13},{value:"\u9ED8\u8BA4\u503C",paraId:14,tocIndex:13},{value:"\u7248\u672C",paraId:14,tocIndex:13},{value:"inherit",paraId:14,tocIndex:13},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:14,tocIndex:13},{value:"bool",paraId:14,tocIndex:13},{value:"-",paraId:14,tocIndex:13},{value:"-",paraId:14,tocIndex:13},{value:"heightStyle",paraId:14,tocIndex:13},{value:"\u9009\u62E9\u533A\u57DF\u9AD8\u5EA6\u8BA1\u7B97\u65B9\u5F0F",paraId:14,tocIndex:13},{value:"BoxHeightStyle",paraId:15,tocIndex:13},{value:"-",paraId:14,tocIndex:13},{value:"-",paraId:14,tocIndex:13},{value:"widthStyle",paraId:14,tocIndex:13},{value:"\u9009\u62E9\u533A\u57DF\u5BBD\u5EA6\u8BA1\u7B97\u65B9\u5F0F",paraId:14,tocIndex:13},{value:"BoxWidthStyle",paraId:16,tocIndex:13},{value:"-",paraId:14,tocIndex:13},{value:"-",paraId:14,tocIndex:13},{value:"color",paraId:14,tocIndex:13},{value:"\u6587\u672C\u9009\u4E2D\u533A\u57DF\u989C\u8272",paraId:14,tocIndex:13},{value:"Color",paraId:14,tocIndex:13},{value:"-",paraId:14,tocIndex:13},{value:"-",paraId:14,tocIndex:13},{value:"enable",paraId:14,tocIndex:13},{value:"\u662F\u5426\u542F\u7528\u6587\u672C\u9009\u62E9\u529F\u80FD",paraId:14,tocIndex:13},{value:"bool",paraId:14,tocIndex:13},{value:"-",paraId:14,tocIndex:13},{value:"-",paraId:14,tocIndex:13},{value:"\u5C5E\u6027\u540D",paraId:17,tocIndex:14},{value:"\u8BF4\u660E",paraId:17,tocIndex:14},{value:"\u7C7B\u578B",paraId:17,tocIndex:14},{value:"\u9ED8\u8BA4\u503C",paraId:17,tocIndex:14},{value:"\u7248\u672C",paraId:17,tocIndex:14},{value:"inherit",paraId:17,tocIndex:14},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:17,tocIndex:14},{value:"bool",paraId:17,tocIndex:14},{value:"-",paraId:17,tocIndex:14},{value:"-",paraId:17,tocIndex:14},{value:"appearance",paraId:17,tocIndex:14},{value:"\u952E\u76D8\u5916\u89C2\u4E3B\u9898\uFF08\u4EAE\u8272/\u6697\u8272\uFF09",paraId:17,tocIndex:14},{value:"Brightness",paraId:17,tocIndex:14},{value:"-",paraId:17,tocIndex:14},{value:"-",paraId:17,tocIndex:14},{value:"\u5C5E\u6027\u540D",paraId:18,tocIndex:15},{value:"\u8BF4\u660E",paraId:18,tocIndex:15},{value:"\u7C7B\u578B",paraId:18,tocIndex:15},{value:"\u9ED8\u8BA4\u503C",paraId:18,tocIndex:15},{value:"\u7248\u672C",paraId:18,tocIndex:15},{value:"inherit",paraId:18,tocIndex:15},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:18,tocIndex:15},{value:"bool",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"placeholderStyle",paraId:18,tocIndex:15},{value:"\u5360\u4F4D\u7B26\u6587\u672C\u6837\u5F0F",paraId:18,tocIndex:15},{value:"AntdBoxStyle",paraId:19,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"textStyle",paraId:18,tocIndex:15},{value:"\u5E38\u89C4\u6587\u672C\u6837\u5F0F",paraId:18,tocIndex:15},{value:"TextStyle",paraId:20,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"obscureTextStyle",paraId:18,tocIndex:15},{value:"\u5BC6\u7801\u6A21\u5F0F\u6587\u672C\u6837\u5F0F",paraId:18,tocIndex:15},{value:"TextStyle",paraId:21,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"bodyStyle",paraId:18,tocIndex:15},{value:"\u8F93\u5165\u6846\u5BB9\u5668\u6837\u5F0F",paraId:18,tocIndex:15},{value:"AntdBoxStyle",paraId:22,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"cursorStyle",paraId:18,tocIndex:15},{value:"\u5149\u6807\u6837\u5F0F\u914D\u7F6E",paraId:18,tocIndex:15},{value:"AntInputCursorStyle",paraId:23,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"obscuringCharacter",paraId:18,tocIndex:15},{value:'\u5BC6\u7801\u6A21\u5F0F\u66FF\u4EE3\u5B57\u7B26\uFF0C\u9ED8\u8BA4"\u2022"',paraId:18,tocIndex:15},{value:"String",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"clearIconStyle",paraId:18,tocIndex:15},{value:"\u56FE\u6807\u6837\u5F0F\u914D\u7F6E",paraId:18,tocIndex:15},{value:"AntdIconStyle",paraId:24,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"selectionStyle",paraId:18,tocIndex:15},{value:"\u6587\u672C\u9009\u62E9\u6837\u5F0F\u914D\u7F6E",paraId:18,tocIndex:15},{value:"AntdSelectionStyle",paraId:25,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"keyboardStyle",paraId:18,tocIndex:15},{value:"\u952E\u76D8\u6837\u5F0F\u914D\u7F6E",paraId:18,tocIndex:15},{value:"AntdKeyboardStyle",paraId:26,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"clearIcon",paraId:18,tocIndex:15},{value:"\u6E05\u9664\u6309\u94AE\u56FE\u6807",paraId:18,tocIndex:15},{value:"Widget",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"obscureIconStyle",paraId:18,tocIndex:15},{value:"\u5BC6\u7801\u9690\u85CF\u72B6\u6001\u56FE\u6807\u6837\u5F0F\u914D\u7F6E",paraId:18,tocIndex:15},{value:"AntdIconStyle",paraId:27,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"obscureIcon",paraId:18,tocIndex:15},{value:"\u5BC6\u7801\u9690\u85CF\u72B6\u6001\u56FE\u6807",paraId:18,tocIndex:15},{value:"Widget",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"activeObscureIconStyle",paraId:18,tocIndex:15},{value:"\u5BC6\u7801\u663E\u793A\u72B6\u6001\u56FE\u6807\u6837\u5F0F\u914D\u7F6E",paraId:18,tocIndex:15},{value:"AntdIconStyle",paraId:28,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"activeObscureIcon",paraId:18,tocIndex:15},{value:"\u5BC6\u7801\u663E\u793A\u72B6\u6001\u56FE\u6807",paraId:18,tocIndex:15},{value:"Widget",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"rowStyle",paraId:18,tocIndex:15},{value:"\u5E03\u5C40\u884C\u6837\u5F0F\u914D\u7F6E",paraId:18,tocIndex:15},{value:"AntdFlexStyle",paraId:29,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"autocorrectionColor",paraId:18,tocIndex:15},{value:"\u81EA\u52A8\u4FEE\u6B63\u6587\u672C\u533A\u57DF\u989C\u8272",paraId:18,tocIndex:15},{value:"Color",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15},{value:"-",paraId:18,tocIndex:15}]}}]);
