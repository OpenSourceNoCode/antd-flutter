"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[6759],{86759:function(a,e,n){n.r(e),n.d(e,{texts:function(){return t}});const t=[{value:"\u7C7B\u4F3C\u4E8EWeb\u4E2D\u7684div,\u5C0F\u7A0B\u5E8F\u4E2D\u7684view,Android\u4E2D\u7684View,iOS\u4E2D\u7684UIView",paraId:0},{value:`class AntdBoxDemo extends StatelessWidget {
  const AntdBoxDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: AntdBoxStyle(
                  alignment: Alignment.center,
                  size: 100,
                  color: token.colorPrimary,
                  radius: 40.radius.all,
                  border: token.border
                      .copyWith(color: token.colorSuccess, width: 10)
                      .all,
                  textStyle: token.font.md.copyWith(color: token.colorWhite)),
              child: const Text("\u6211\u662F\u6587\u5B57"))
        ]);
  }
}

`,paraId:1,tocIndex:2},{value:`class AntdLayoutDemo extends StatelessWidget {
  const AntdLayoutDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              height: 100,
              width: 200,
              color: token.colorSuccess,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("\u6307\u5B9A\u5BBD\u9AD8"), Text("height:100,width: 150")]))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              size: 100,
              radius: 100.radius.all,
              alignment: Alignment.center,
              color: token.colorSuccess,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("\u5706\u89D2"))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              width: 0.6,
              height: 100,
              layoutModes: [
                AntdBoxLayoutMode.factorWidth,
                AntdBoxLayoutMode.fixedHeight
              ],
              color: token.colorSuccess,
              alignment: Alignment.center,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("\u5BBD\u5EA6\u767E\u5206\u6BD4\u9AD8\u5EA6\u56FA\u5B9A"), Text("width: 0.6,height: 100")]))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              height: 0.6,
              width: 200,
              color: token.colorSuccess,
              layoutModes: [
                AntdBoxLayoutMode.factorHeight,
                AntdBoxLayoutMode.fixedWidth
              ],
              alignment: Alignment.center,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("\u9AD8\u5EA6\u767E\u5206\u6BD4\u5BBD\u5EA6\u56FA\u5B9A"), Text("height: 0.6,width: 200,")]))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              height: 0.8,
              width: 0.8,
              color: token.colorSuccess,
              layoutModes: [
                AntdBoxLayoutMode.factorHeight,
                AntdBoxLayoutMode.factorWidth
              ],
              alignment: Alignment.center,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("\u5BBD\u9AD8\u767E\u5206\u6BD4,height: 0.8,width: 0.8"))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              color: token.colorSuccess,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("\u5185\u5BB9\u81EA\u9002\u5E94"))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              height: 9,
              width: 16,
              layoutModes: [AntdBoxLayoutMode.aspectRatio],
              color: token.colorSuccess,
              alignment: Alignment.center,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("16:9\u5BBD\u9AD8\u6BD4"))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              height: 3,
              width: 4,
              layoutModes: [AntdBoxLayoutMode.aspectRatio],
              color: token.colorSuccess,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("4:3\u5BBD\u9AD8\u6BD4")))
    ]);
  }
}

`,paraId:2,tocIndex:3},{value:`class AntdBackdropFilterDemo extends StatelessWidget {
  const AntdBackdropFilterDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: AntdBoxStyle(
                  alignment: Alignment.center,
                  size: 100,
                  backdropFilter: 25,
                  color: token.colorSuccess.withValues(alpha: 0.8)),
              child: const Text("\u6211\u662F\u6587\u5B57"))
        ]);
  }
}

`,paraId:3,tocIndex:4},{value:`class AntdShadowsGradientDemo extends StatelessWidget {
  const AntdShadowsGradientDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  color: token.colorPrimary,
                  radius: 6.radius.all,
                  textStyle: TextStyle(color: token.colorWhite),
                  gradient: LinearGradient(
                      colors: [token.colorSuccess, token.colorBlack]),
                  shadows: [
                    BoxShadow(
                        color: token.colorError,
                        offset: const Offset(-20, -20),
                        spreadRadius: 20,
                        blurRadius: 20)
                  ]),
              child: const Text("\u6211\u662F\u6587\u5B57"))
        ]);
  }
}

`,paraId:4,tocIndex:5},{value:`class _AntdVisibilityDemoStateDemo extends State<AntdVisibilityDemo> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          Column(children: [
            AntdSegmented(
                value: value,
                onChange: (value) {
                  setState(() {
                    this.value = value;
                  });
                },
                items: [
                  AntdSegmentedItem(
                      value: AntdVisibility.hidden.name,
                      child: const Text("hidden(\u4E0D\u5360\u7A7A\u95F4)")),
                  AntdSegmentedItem(
                      value: AntdVisibility.visible.name,
                      child: const Text("visible(\u7A7A\u95F4\u4E0D\u53D8)"))
                ]),
            AntdBox(
                style: AntdBoxStyle(
                    size: 100,
                    visibility: AntdVisibility.values
                        .where((data) => data.name == value)
                        .firstOrNull),
                child: const Text("\u5B8C\u5168\u9690\u85CF"))
          ])
        ]);
  }
}

`,paraId:5,tocIndex:6},{value:`class AntdAlignmentDemo extends StatelessWidget {
  const AntdAlignmentDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: <Alignment>[
          Alignment.center,
          Alignment.centerLeft,
          Alignment.centerRight,
          Alignment.topCenter,
          Alignment.topLeft,
          Alignment.topRight,
          Alignment.bottomCenter,
          Alignment.bottomLeft,
          Alignment.bottomRight
        ].map((v) {
          return AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  color: token.colorPrimary,
                  alignment: v,
                  textStyle: TextStyle(color: token.colorWhite)),
              child: Text(v.toString().replaceAll("Alignment.", "")));
        }).toList());
  }
}

`,paraId:6,tocIndex:7},{value:`class AntdSafeAreaDemo extends StatelessWidget {
  const AntdSafeAreaDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: AntdBoxStyle(color: token.colorError),
              child: AntdBox(
                  outerSafeArea: AntdPosition.bottom,
                  style: AntdBoxStyle(
                      size: 100,
                      padding: 30.bottom,
                      textStyle: TextStyle(color: token.colorWhite),
                      color: token.colorPrimary),
                  child: const Text("\u5E95\u90E8\u5916\u5B89\u5168\u533A"))),
          AntdBox(
              child: AntdBox(
                  innerSafeArea: AntdPosition.top,
                  style: AntdBoxStyle(
                      size: 100,
                      color: token.colorError,
                      padding: 30.top,
                      textStyle: TextStyle(color: token.colorWhite)),
                  child: AntdBox(
                      style: AntdBoxStyle(color: token.colorPrimary),
                      child: const Text("\u9876\u90E8\u5185\u5B89\u5168\u533A"))))
        ]);
  }
}

`,paraId:7,tocIndex:8},{value:`class AntdStyleRenderDemo extends StatelessWidget {
  const AntdStyleRenderDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdKitStyle(
                  height: 50,
                  width: 50,
                  color: token.colorError,
                  alignment: Alignment.center)
              .render(),
          AntdKitStyle(
                  height: 50,
                  width: 50,
                  color: token.colorPrimary,
                  alignment: Alignment.center)
              .render(Text("Render",
                  style: token.font.ms.copyWith(color: token.colorWhite)))
        ]);
  }
}

`,paraId:8,tocIndex:9},{value:`class AntdEventDemo extends StatelessWidget {
  const AntdEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var style = AntdBoxStyle(
        size: 100,
        alignment: Alignment.center,
        textStyle: TextStyle(color: token.colorWhite),
        color: token.colorPrimary);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: style,
              onTap: () {
                AntdToast.show("\u89E6\u53D1\u4E86\u5355\u51FB");
              },
              child: const Text("\u5355\u673A")),
          AntdBox(
              style: style,
              onDoubleTap: () {
                AntdToast.show("\u89E6\u53D1\u4E86\u53CC\u51FB");
              },
              child: const Text("\u53CC\u51FB")),
          AntdBox(
              style: style,
              onLongPress: () {
                AntdToast.show("\u89E6\u53D1\u4E86\u957F\u6309");
              },
              child: const Text("\u957F\u6309")),
          AntdBox(
              style: style,
              onTap: () {
                AntdToast.show("\u5355\u51FB");
              },
              onDoubleTap: () {
                AntdToast.show("\u53CC\u51FB");
              },
              onLongPress: () {
                AntdToast.show("\u957F\u6309");
              },
              child: const Text("\u540C\u65F6\u5B58\u5728")),
          AntdBox(
              style: style,
              disabled: true,
              onTap: () {
                AntdToast.show("\u5355\u51FB");
              },
              onDoubleTap: () {
                AntdToast.show("\u53CC\u51FB");
              },
              onLongPress: () {
                AntdToast.show("\u957F\u6309");
              },
              options: const AntdTapOptions(alwaysTriggerTap: true),
              child: const Text("\u7981\u7528")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              onTap: () {
                AntdToast.show("\u867D\u7136\u79FB\u52A8\u4E86 \u4F46\u8FD8\u662F\u89E6\u53D1\u4E86\u5355\u51FB");
              },
              options: const AntdTapOptions(allowOffset: true),
              child: const Text("\u79FB\u52A8\u540E\u89E6\u53D1")),
          AntdBox(
              style: style,
              onTap: () {
                AntdToast.show("\u89E6\u53D1\u540E500\u6BEB\u79D2\u624D\u6267\u884C\u5355\u51FB");
              },
              onDoubleTap: () {
                AntdToast.show("\u89E6\u53D1\u540E500\u6BEB\u79D2\u624D\u6267\u884C\u53CC\u51FB");
              },
              onLongPress: () {
                AntdToast.show("\u89E6\u53D1\u540E500\u6BEB\u79D2\u624D\u6267\u884C\u957F\u6309");
              },
              options:
                  const AntdTapOptions(debounce: Duration(milliseconds: 500)),
              child: const Text("\u9632\u6296 500\u6BEB\u79D2")),
          AntdBox(
              style: style,
              onTap: () {
                AntdToast.show("1s\u5185\u6267\u884C\u4E00\u6B21\u5355\u51FB");
              },
              onDoubleTap: () {
                AntdToast.show("1s\u5185\u6267\u884C\u4E00\u6B21\u53CC\u51FB");
              },
              onLongPress: () {
                AntdToast.show("1s\u5185\u6267\u884C\u4E00\u6B21\u957F\u6309");
              },
              options:
                  const AntdTapOptions(debounce: Duration(milliseconds: 1000)),
              child: const Text("\u8282\u6D41 1s")),
          AntdBox(
              style: style,
              onTap: () {
                AntdToast.show("\u89E6\u53D1\u5355\u51FB");
              },
              onDoubleTap: () {
                AntdToast.show("\u89E6\u53D1\u53CC\u51FB");
              },
              onLongPress: () {
                AntdToast.show("\u89E6\u53D1\u957F\u6309");
              },
              options: const AntdTapOptions(alwaysTriggerTap: true),
              child: const Text("\u4E00\u76F4\u89E6\u53D1\u5355\u51FB"))
        ]);
  }
}

`,paraId:9,tocIndex:10},{value:"\u84DD\u8272\u4F1A\u63A5\u6536\u5230\u6240\u6709\u4E8B\u4EF6,\u7EFF\u8272\u548C\u7EA2\u8272\u5219\u4E0D\u4F1A",paraId:10,tocIndex:11},{value:`class AntdListenerDemo extends StatelessWidget {
  const AntdListenerDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var style = AntdBoxStyle(
        size: 300,
        alignment: Alignment.center,
        textStyle: TextStyle(color: token.colorWhite),
        color: token.colorPrimary);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: style,
              onTap: () {
                AntdToast.show("\u89E6\u53D1\u84DD\u8272\u5355\u51FB");
              },
              onDoubleTap: () {
                AntdToast.show("\u89E6\u53D1\u84DD\u8272\u53CC\u51FB");
              },
              onLongPress: () {
                AntdToast.show("\u89E6\u53D1\u84DD\u8272\u957F\u6309");
              },
              options: const AntdTapOptions(alwaysReceiveTap: true),
              child: AntdBox(
                  onTap: () {
                    AntdToast.show("\u89E6\u53D1\u7EA2\u8272\u5355\u51FB");
                  },
                  onDoubleTap: () {
                    AntdToast.show("\u89E6\u53D1\u7EA2\u8272\u53CC\u51FB");
                  },
                  onLongPress: () {
                    AntdToast.show("\u89E6\u53D1\u7EA2\u8272\u957F\u6309");
                  },
                  style: style.copyFrom(
                      const AntdBoxStyle(size: 200, color: Colors.red)),
                  child: AntdBox(
                      onTap: () {
                        AntdToast.show("\u89E6\u53D1\u7EFF\u8272\u5355\u51FB");
                      },
                      onDoubleTap: () {
                        AntdToast.show("\u89E6\u53D1\u7EFF\u8272\u53CC\u51FB");
                      },
                      onLongPress: () {
                        AntdToast.show("\u89E6\u53D1\u7EFF\u8272\u957F\u6309");
                      },
                      style: style.copyFrom(
                          const AntdBoxStyle(size: 100, color: Colors.green)),
                      child: const Text("\u5141\u8BB8\u7A7F\u900F"))))
        ]);
  }
}

`,paraId:11,tocIndex:11},{value:"\u901A\u8FC7feedbackStyle\u5B8C\u5168\u81EA\u5B9A\u4E49\u6837\u5F0F",paraId:12,tocIndex:12},{value:`class AntdFeedbackStyleDemo extends StatelessWidget {
  const AntdFeedbackStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var style = AntdBoxStyle(
        height: 200,
        width: double.infinity,
        alignment: Alignment.center,
        textStyle: TextStyle(color: token.colorWhite),
        border: token.border.copyWith(color: token.colorError).all,
        color: token.colorPrimary,
        feedbackStyle: AntdBoxStyle(
            textStyle: TextStyle(color: token.colorPrimary),
            border:
                token.border.copyWith(width: 2, color: token.colorPrimary).all,
            color: token.colorSuccess));
    return DemoWrapper(child: [
      AntdBox(style: style, child: const Text("\u6309\u4E0B\u65F6\u53CD\u9988")),
      AntdBox(
          style: style,
          options: const AntdTapOptions(feedbackDuration: Duration(seconds: 2)),
          child: const Text("\u81EA\u5B9A\u4E49\u53CD\u9988\u65F6\u957F"))
    ]);
  }
}

`,paraId:13,tocIndex:12},{value:`class AntdStylCustomDemo extends StatelessWidget {
  const AntdStylCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: AntdBoxStyle(
                  height: 200,
                  alignment: Alignment.center,
                  textStyle: token.font.lg.copyWith(color: token.colorWhite),
                  width: double.infinity,
                  color: token.colorPrimary,
                  border: token.border
                      .copyWith(color: token.colorSuccess, width: 2)
                      .all),
              child: const Text("\u901A\u8FC7style\u8BBE\u7F6E\u6837\u5F0F")),
          AntdBox(
              styleBuilder: (context, box, style, token) {
                return AntdBoxStyle(
                    height: 200,
                    alignment: Alignment.center,
                    textStyle: token.font.lg.copyWith(color: token.colorWhite),
                    width: double.infinity,
                    color: token.colorSuccess,
                    border: token.border
                        .copyWith(color: token.colorError, width: 2)
                        .all);
              },
              child: const Text("\u901A\u8FC7styleBuilder\u8BBE\u7F6E\u6837\u5F0F")),
          AntdStyleProvider(
              style: AntdBoxStyle(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  textStyle: token.font.lg.copyWith(color: token.colorWhite),
                  color: token.colorPrimary),
              child: Column(children: [
                const AntdBox(child: Text("\u901A\u8FC7AntdStyleProvider\u7EDF\u4E00\u8BBE\u7F6E")),
                AntdBox(
                    style: AntdBoxStyle(margin: 10.top),
                    child: const Text("\u901A\u8FC7AntdStyleProvider\u7EDF\u4E00\u8BBE\u7F6E"))
              ])),
          AntdStyleBuilderProvider<AntdBoxStyle, AntdBox>(
              builder: (context, box, style, token) {
                return AntdBoxStyle(
                    height: 150,
                    width: double.infinity,
                    alignment: Alignment.center,
                    textStyle: token.font.lg.copyWith(color: token.colorWhite),
                    color: token.colorSuccess);
              },
              child: Column(children: [
                const AntdBox(child: Text("\u901A\u8FC7AntdStyleBuilderProvider\u7EDF\u4E00\u8BBE\u7F6E")),
                AntdBox(
                    style: AntdBoxStyle(margin: 10.top),
                    child: const Text("\u901A\u8FC7AntdStyleBuilderProvider\u7EDF\u4E00\u8BBE\u7F6E"))
              ])),
          AntdBox(
              disabled: true,
              style: AntdBoxStyle(
                  height: 200,
                  width: double.infinity,
                  color: Colors.green,
                  disabledStyle: AntdBoxStyle(
                      size: 100,
                      color: token.colorError,
                      alignment: Alignment.center,
                      textStyle:
                          token.font.lg.copyWith(color: token.colorWhite),
                      border: token.border
                          .copyWith(color: token.colorPrimary, width: 3)
                          .all)),
              child: const Text("\u7981\u7528\u6837\u5F0F"))
        ]);
  }
}

`,paraId:14,tocIndex:13},{value:`
  `,paraId:15},{value:"\u5C5E\u6027\u540D",paraId:16,tocIndex:14},{value:"\u8BF4\u660E",paraId:16,tocIndex:14},{value:"\u7C7B\u578B",paraId:16,tocIndex:14},{value:"\u9ED8\u8BA4\u503C",paraId:16,tocIndex:14},{value:"\u7248\u672C",paraId:16,tocIndex:14},{value:"key",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"Key",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"style",paraId:16,tocIndex:14},{value:"\u6837\u5F0F",paraId:16,tocIndex:14},{value:"AntdBoxStyle",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"styleBuilder",paraId:16,tocIndex:14},{value:"\u52A8\u6001\u6837\u5F0F",paraId:16,tocIndex:14},{value:"AntdStyleBuilder<AntdBoxStyle, AntdBox>",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"outerSafeArea",paraId:16,tocIndex:14},{value:"\u5916\u90E8\u5B89\u5168\u533A\u57DF\u8FB9\u8DDD\uFF08\u901A\u5E38\u7528\u4E8E\u907F\u5F00\u7CFB\u7EDFUI\u5982\u5218\u6D77\u5C4F\uFF09:",paraId:16,tocIndex:14},{value:"top",paraId:16,tocIndex:14},{value:" | ",paraId:16,tocIndex:14},{value:"bottom",paraId:16,tocIndex:14},{value:" | ",paraId:16,tocIndex:14},{value:"left",paraId:16,tocIndex:14},{value:" | ",paraId:16,tocIndex:14},{value:"right",paraId:16,tocIndex:14},{value:" | ",paraId:16,tocIndex:14},{value:"horizontal",paraId:16,tocIndex:14},{value:" | ",paraId:16,tocIndex:14},{value:"vertical",paraId:16,tocIndex:14},{value:" | ",paraId:16,tocIndex:14},{value:"all",paraId:16,tocIndex:14},{value:"AntdPosition",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"innerSafeArea",paraId:16,tocIndex:14},{value:"\u5185\u90E8\u5B89\u5168\u533A\u57DF\u8FB9\u8DDD\uFF08\u5185\u5BB9\u4E0E\u8FB9\u754C\u7684\u4FDD\u7559\u95F4\u8DDD\uFF09:",paraId:16,tocIndex:14},{value:"top",paraId:16,tocIndex:14},{value:" | ",paraId:16,tocIndex:14},{value:"bottom",paraId:16,tocIndex:14},{value:" | ",paraId:16,tocIndex:14},{value:"left",paraId:16,tocIndex:14},{value:" | ",paraId:16,tocIndex:14},{value:"right",paraId:16,tocIndex:14},{value:" | ",paraId:16,tocIndex:14},{value:"horizontal",paraId:16,tocIndex:14},{value:" | ",paraId:16,tocIndex:14},{value:"vertical",paraId:16,tocIndex:14},{value:" | ",paraId:16,tocIndex:14},{value:"all",paraId:16,tocIndex:14},{value:"AntdPosition",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"onLayout",paraId:16,tocIndex:14},{value:"\u53C2\u6570\u5305\u542B\u89C6\u56FE\u7684\u5C3A\u5BF8\u548C\u5168\u5C40\u4F4D\u7F6E\u4FE1\u606F",paraId:16,tocIndex:14},{value:"AntdOnLayout",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"onFocus",paraId:16,tocIndex:14},{value:"\u7126\u70B9\u53D8\u5316\u56DE\u8C03\uFF08\u5F53\u7EC4\u4EF6\u83B7\u5F97/\u5931\u53BB\u7126\u70B9\u65F6\u89E6\u53D1\uFF09",paraId:16,tocIndex:14},{value:"AntdOnFocus",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"onTap",paraId:16,tocIndex:14},{value:"\u8F7B\u51FB\u4E8B\u4EF6\u56DE\u8C03",paraId:16,tocIndex:14},{value:"VoidCallback",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"onDoubleTap",paraId:16,tocIndex:14},{value:"\u53CC\u51FB\u4E8B\u4EF6\u56DE\u8C03",paraId:16,tocIndex:14},{value:"VoidCallback",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"onLongPress",paraId:16,tocIndex:14},{value:"\u957F\u6309\u4E8B\u4EF6\u56DE\u8C03",paraId:16,tocIndex:14},{value:"VoidCallback",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"disabled",paraId:16,tocIndex:14},{value:"\u7981\u7528",paraId:16,tocIndex:14},{value:"bool",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"options",paraId:16,tocIndex:14},{value:"\u5305\u62EC\uFF1A\u53CC\u51FB\u95F4\u9694\u3001\u957F\u6309\u65F6\u957F\u3001\u89E6\u89C9\u53CD\u9988\u7B49",paraId:16,tocIndex:14},{value:"AntdTapOptions",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"child",paraId:16,tocIndex:14},{value:"\u5B50\u7EC4\u4EF6\uFF08\u901A\u5E38\u4E3A\u9700\u8981\u5E94\u7528\u8FD9\u4E9B\u4EA4\u4E92\u548C\u5E03\u5C40\u7EA6\u675F\u7684\u5185\u5BB9\uFF09",paraId:16,tocIndex:14},{value:"Widget",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"focusNode",paraId:16,tocIndex:14},{value:"\u7126\u70B9",paraId:16,tocIndex:14},{value:"FocusNode",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"-",paraId:16,tocIndex:14},{value:"\u5C5E\u6027\u540D",paraId:17,tocIndex:15},{value:"\u8BF4\u660E",paraId:17,tocIndex:15},{value:"\u7C7B\u578B",paraId:17,tocIndex:15},{value:"\u9ED8\u8BA4\u503C",paraId:17,tocIndex:15},{value:"\u7248\u672C",paraId:17,tocIndex:15},{value:"inherit",paraId:17,tocIndex:15},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:17,tocIndex:15},{value:"bool",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"padding",paraId:17,tocIndex:15},{value:"\u5185\u8FB9\u8DDD",paraId:17,tocIndex:15},{value:"EdgeInsets",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"margin",paraId:17,tocIndex:15},{value:"\u5916\u8FB9\u8DDD",paraId:17,tocIndex:15},{value:"EdgeInsets",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"opacity",paraId:17,tocIndex:15},{value:"\u900F\u660E\u5EA6",paraId:17,tocIndex:15},{value:"double",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"color",paraId:17,tocIndex:15},{value:"\u80CC\u666F\u8272",paraId:17,tocIndex:15},{value:"Color",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"border",paraId:17,tocIndex:15},{value:"\u8FB9\u6846",paraId:17,tocIndex:15},{value:"Border",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"radius",paraId:17,tocIndex:15},{value:"\u5706\u89D2",paraId:17,tocIndex:15},{value:"BorderRadius",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"textStyle",paraId:17,tocIndex:15},{value:"\u5171\u4EAB\u7684Text\u6837\u5F0F",paraId:17,tocIndex:15},{value:"TextStyle",paraId:18,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"height",paraId:17,tocIndex:15},{value:"\u9AD8\u5EA6",paraId:17,tocIndex:15},{value:"double",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"width",paraId:17,tocIndex:15},{value:"\u5BBD\u5EA6",paraId:17,tocIndex:15},{value:"double",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"constraints",paraId:17,tocIndex:15},{value:"\u76D2\u5B50\u7EA6\u675F",paraId:17,tocIndex:15},{value:"BoxConstraints",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"size",paraId:17,tocIndex:15},{value:"\u7EDF\u4E00\u5C3A\u5BF8\uFF08\u540C\u65F6\u5F71\u54CD width/height\uFF0C\u4F18\u5148\u7EA7\u6700\u4F4E\uFF09",paraId:17,tocIndex:15},{value:"double",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"layoutModes",paraId:17,tocIndex:15},{value:"\u5E03\u5C40\u884C\u4E3A\u6A21\u5F0F",paraId:17,tocIndex:15},{value:"List<AntdBoxLayoutMode>",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"backdropFilter",paraId:17,tocIndex:15},{value:"\u6BDB\u73BB\u7483\u6548\u679C",paraId:17,tocIndex:15},{value:"double",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"shadows",paraId:17,tocIndex:15},{value:"\u9634\u5F71",paraId:17,tocIndex:15},{value:"List<BoxShadow>",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"gradient",paraId:17,tocIndex:15},{value:"\u6E10\u53D8",paraId:17,tocIndex:15},{value:"Gradient",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"alignment",paraId:17,tocIndex:15},{value:"\u5B50\u5BB9\u5668\u7684\u5BF9\u9F50\u65B9\u5F0F",paraId:17,tocIndex:15},{value:"Alignment",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"visibility",paraId:17,tocIndex:15},{value:"\u53EF\u89C1\u72B6\u6001:",paraId:17,tocIndex:15},{value:"hidden",paraId:17,tocIndex:15},{value:" | ",paraId:17,tocIndex:15},{value:"visible",paraId:17,tocIndex:15},{value:"AntdVisibility",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"hapticFeedback",paraId:17,tocIndex:15},{value:"\u9707\u52A8\u53CD\u9988:",paraId:17,tocIndex:15},{value:"light",paraId:17,tocIndex:15},{value:" | ",paraId:17,tocIndex:15},{value:"medium",paraId:17,tocIndex:15},{value:" | ",paraId:17,tocIndex:15},{value:"heavy",paraId:17,tocIndex:15},{value:" | ",paraId:17,tocIndex:15},{value:"none",paraId:17,tocIndex:15},{value:"AntdHapticFeedback",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"colorFilter",paraId:17,tocIndex:15},{value:"\u989C\u8272\u8FC7\u6EE4",paraId:17,tocIndex:15},{value:"ColorFilter",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"-",paraId:17,tocIndex:15},{value:"\u5C5E\u6027\u540D",paraId:19,tocIndex:16},{value:"\u8BF4\u660E",paraId:19,tocIndex:16},{value:"\u7C7B\u578B",paraId:19,tocIndex:16},{value:"\u9ED8\u8BA4\u503C",paraId:19,tocIndex:16},{value:"\u7248\u672C",paraId:19,tocIndex:16},{value:"inherit",paraId:19,tocIndex:16},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:19,tocIndex:16},{value:"bool",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"padding",paraId:19,tocIndex:16},{value:"\u5185\u8FB9\u8DDD",paraId:19,tocIndex:16},{value:"EdgeInsets",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"margin",paraId:19,tocIndex:16},{value:"\u5916\u8FB9\u8DDD",paraId:19,tocIndex:16},{value:"EdgeInsets",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"opacity",paraId:19,tocIndex:16},{value:"\u900F\u660E\u5EA6",paraId:19,tocIndex:16},{value:"double",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"color",paraId:19,tocIndex:16},{value:"\u80CC\u666F\u8272",paraId:19,tocIndex:16},{value:"Color",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"border",paraId:19,tocIndex:16},{value:"\u8FB9\u6846",paraId:19,tocIndex:16},{value:"Border",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"radius",paraId:19,tocIndex:16},{value:"\u5706\u89D2",paraId:19,tocIndex:16},{value:"BorderRadius",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"textStyle",paraId:19,tocIndex:16},{value:"\u5171\u4EAB\u7684Text\u6837\u5F0F",paraId:19,tocIndex:16},{value:"TextStyle",paraId:20,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"height",paraId:19,tocIndex:16},{value:"\u9AD8\u5EA6",paraId:19,tocIndex:16},{value:"double",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"width",paraId:19,tocIndex:16},{value:"\u5BBD\u5EA6",paraId:19,tocIndex:16},{value:"double",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"constraints",paraId:19,tocIndex:16},{value:"\u76D2\u5B50\u7EA6\u675F",paraId:19,tocIndex:16},{value:"BoxConstraints",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"size",paraId:19,tocIndex:16},{value:"\u7EDF\u4E00\u5C3A\u5BF8\uFF08\u540C\u65F6\u5F71\u54CD width/height\uFF0C\u4F18\u5148\u7EA7\u6700\u4F4E\uFF09",paraId:19,tocIndex:16},{value:"double",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"layoutModes",paraId:19,tocIndex:16},{value:"\u5E03\u5C40\u884C\u4E3A\u6A21\u5F0F",paraId:19,tocIndex:16},{value:"List<AntdBoxLayoutMode>",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"backdropFilter",paraId:19,tocIndex:16},{value:"\u6BDB\u73BB\u7483\u6548\u679C",paraId:19,tocIndex:16},{value:"double",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"shadows",paraId:19,tocIndex:16},{value:"\u9634\u5F71",paraId:19,tocIndex:16},{value:"List<BoxShadow>",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"gradient",paraId:19,tocIndex:16},{value:"\u6E10\u53D8",paraId:19,tocIndex:16},{value:"Gradient",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"alignment",paraId:19,tocIndex:16},{value:"\u5B50\u5BB9\u5668\u7684\u5BF9\u9F50\u65B9\u5F0F",paraId:19,tocIndex:16},{value:"Alignment",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"visibility",paraId:19,tocIndex:16},{value:"\u53EF\u89C1\u72B6\u6001:",paraId:19,tocIndex:16},{value:"hidden",paraId:19,tocIndex:16},{value:" | ",paraId:19,tocIndex:16},{value:"visible",paraId:19,tocIndex:16},{value:"AntdVisibility",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"hapticFeedback",paraId:19,tocIndex:16},{value:"\u9707\u52A8\u53CD\u9988:",paraId:19,tocIndex:16},{value:"light",paraId:19,tocIndex:16},{value:" | ",paraId:19,tocIndex:16},{value:"medium",paraId:19,tocIndex:16},{value:" | ",paraId:19,tocIndex:16},{value:"heavy",paraId:19,tocIndex:16},{value:" | ",paraId:19,tocIndex:16},{value:"none",paraId:19,tocIndex:16},{value:"AntdHapticFeedback",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"colorFilter",paraId:19,tocIndex:16},{value:"\u989C\u8272\u8FC7\u6EE4",paraId:19,tocIndex:16},{value:"ColorFilter",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"focusStyle",paraId:19,tocIndex:16},{value:"AntdKitStyle",paraId:21,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"disabledStyle",paraId:19,tocIndex:16},{value:"AntdKitStyle",paraId:22,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"feedbackStyle",paraId:19,tocIndex:16},{value:"AntdKitStyle",paraId:23,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"options",paraId:19,tocIndex:16},{value:"\u89E6\u6478\u914D\u7F6E \u4F18\u5148\u7EA7\u4F4E\u4E8E[AntdBox]\u4E0A\u7684options",paraId:19,tocIndex:16},{value:"AntdTapOptions",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16},{value:"-",paraId:19,tocIndex:16}]}}]);
