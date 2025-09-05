"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[9994],{19994:function(a,e,n){n.r(e),n.d(e,{texts:function(){return t}});const t=[{value:"\u7C7B\u4F3C\u4E8EWeb\u4E2D\u7684div,\u5C0F\u7A0B\u5E8F\u4E2D\u7684view,Android\u4E2D\u7684View,iOS\u4E2D\u7684UIView",paraId:0},{value:`class AntdBoxDemo extends StatelessWidget {
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
                  height: 100,
                  width: 100,
                  color: token.colorPrimary,
                  radius: 40.radius.all,
                  border: token.borderSide
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
      AntdBox(
          style: AntdBoxStyle(
              height: 100,
              width: 150,
              color: token.colorPrimary,
              alignment: Alignment.center,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("\u6307\u5B9A\u5BBD\u9AD8")),
      AntdBox(
          style: AntdBoxStyle(
              size: 100,
              radius: 100.radius.all,
              alignment: Alignment.center,
              color: token.colorPrimary,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("\u901A\u8FC7Size\u5C5E\u6027\u5E76\u6307\u5B9A\u5706\u89D2")),
      AntdBox(
          style: AntdBoxStyle(
              size: 100,
              color: token.colorError,
              alignment: Alignment.centerLeft),
          child: AntdBox(
              style: AntdBoxStyle(
                  width: 0.8,
                  height: 50,
                  layoutModes: [
                    AntdBoxLayoutMode.factorWidth,
                    AntdBoxLayoutMode.fixedHeight
                  ],
                  color: token.colorPrimary,
                  textStyle: token.font.md.copyWith(color: token.colorWhite)),
              child: const Text("\u5BBD\u5EA6\u767E\u5206\u6BD4\u9AD8\u5EA6\u56FA\u5B9A"))),
      AntdBox(
          style: AntdBoxStyle(
              size: 100,
              color: token.colorError,
              alignment: Alignment.centerLeft),
          child: AntdBox(
              style: AntdBoxStyle(
                  height: 0.8,
                  width: 50,
                  color: token.colorPrimary,
                  layoutModes: [
                    AntdBoxLayoutMode.factorHeight,
                    AntdBoxLayoutMode.fixedWidth
                  ],
                  textStyle: token.font.md.copyWith(color: token.colorWhite)),
              child: const Text("\u9AD8\u5EA6\u767E\u5206\u6BD4\u5BBD\u5EA6\u56FA\u5B9A"))),
      AntdBox(
          style: AntdBoxStyle(
              size: 100,
              color: token.colorError,
              alignment: Alignment.centerLeft),
          child: AntdBox(
              style: AntdBoxStyle(
                  height: 0.8,
                  width: 0.8,
                  color: token.colorPrimary,
                  layoutModes: [
                    AntdBoxLayoutMode.factorHeight,
                    AntdBoxLayoutMode.factorWidth
                  ],
                  textStyle: token.font.md.copyWith(color: token.colorWhite)),
              child: const Text("\u5BBD\u9AD8\u767E\u5206\u6BD4"))),
      AntdBox(
          style: AntdBoxStyle(
              size: 150, color: token.colorError, alignment: Alignment.center),
          child: AntdBox(
              style: AntdBoxStyle(
                  color: token.colorPrimary,
                  textStyle: token.font.md.copyWith(color: token.colorWhite)),
              child: const Text("\u5185\u5BB9\u81EA\u9002\u5E94"))),
      AntdBox(
          style: AntdBoxStyle(
              height: 9,
              width: 16,
              layoutModes: [AntdBoxLayoutMode.aspectRatio],
              color: token.colorPrimary,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("16:9\u5BBD\u9AD8\u6BD4")),
      AntdBox(
          style: AntdBoxStyle(
              height: 3,
              width: 4,
              layoutModes: [AntdBoxLayoutMode.aspectRatio],
              color: token.colorPrimary,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("4:3\u5BBD\u9AD8\u6BD4"))
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
                  color: token.colorPrimary.withValues(alpha: 0.8)),
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

`,paraId:4,tocIndex:5},{value:`class AntdVisibilityDemo extends StatelessWidget {
  const AntdVisibilityDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
        outline: true,
        style: AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: AntdBoxStyle(size: 100, visibility: AntdVisibility.hidden),
              child: Text("\u5B8C\u5168\u9690\u85CF")),
          AntdBox(
              style:
                  AntdBoxStyle(size: 100, visibility: AntdVisibility.visible),
              child: Text("\u9690\u85CF\u4F46\u662F\u7A7A\u95F4\u4ECD\u5728"))
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
                  size: 120,
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
                  style: token.font.default_.copyWith(color: token.colorWhite)))
        ]);
  }
}

`,paraId:8,tocIndex:9},{value:`class AntdEventDemo extends StatelessWidget {
  const AntdEventDemo({super.key});
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
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              onTap: () {
                AntdToast.show("\u89E6\u53D1\u4E86\u5355\u51FB");
              },
              child: const Text("\u5355\u673A")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              options: const AntdTapOptions(
                  hapticFeedback: AntdHapticFeedback.heavy),
              onDoubleTap: () {
                AntdToast.show("\u89E6\u53D1\u4E86\u53CC\u51FB");
              },
              child: const Text("\u53CC\u51FB")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              onLongPress: () {
                AntdToast.show("\u89E6\u53D1\u4E86\u957F\u6309");
              },
              child: const Text("\u957F\u6309")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              disabled: true,
              onTap: () {
                AntdToast.show("\u5982\u679C\u5728\u89E6\u53D1\u4E4B\u524D\u79FB\u52A8\u624B\u6307\u5219\u4F1A\u91CD\u65B0\u8BA1\u7B97");
              },
              onLongPress: () {
                AntdToast.show("\u89E6\u53D1\u4E86\u7981\u7528");
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
                AntdToast.show("\u89E6\u53D1\u4E86\u5355\u51FB");
              },
              options: const AntdTapOptions(allowOffset: true),
              child: const Text("\u79FB\u52A8\u540E\u62AC\u8D77\u4EFB\u7136\u89E6\u53D1")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              onTap: () {
                AntdToast.show("\u5148\u89E6\u53D1\u4E86\u5355\u673A");
              },
              onDoubleTap: () {
                AntdToast.show("\u89E6\u53D1\u4E86\u957F\u6309");
              },
              options: const AntdTapOptions(
                  allowOffset: true, alwaysTriggerTap: true),
              child: const Text("\u81EA\u5B9A\u4E49\u89E6\u6478\u914D\u7F6E")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              onTap: () {
                AntdToast.show("\u89E6\u53D1\u4E86\u5355\u673A");
              },
              options: const AntdTapOptions(
                  throttle: Duration(milliseconds: 1000),
                  debounce: Duration(milliseconds: 100)),
              child: const Text("\u8282\u6D41\u548C\u9632\u6296")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              onDoubleTap: () {
                AntdToast.show("\u89E6\u53D1\u4E86\u53CC\u51FB");
              },
              onLongPress: () {
                AntdToast.show("\u89E6\u53D1\u4E86\u957F\u6309");
              },
              options: const AntdTapOptions(
                  doubleTapTimeout: 50, longPressTimeout: 100),
              child: const Text("\u81EA\u5B9A\u4E49\u957F\u6309\u548C\u53CC\u51FB\u95F4\u9694"))
        ]);
  }
}

`,paraId:9,tocIndex:10},{value:`class AntdStylCustomDemo extends StatelessWidget {
  const AntdStylCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var focusNode = FocusNode();
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdStyleBuilderProvider<AntdBoxStyle, AntdBox>(
              builder: (context, box, style, token) {
                return AntdBoxStyle(
                    color: token.colorPrimary,
                    size: 100,
                    textStyle:
                        token.font.md.copyWith(color: token.colorSuccess),
                    alignment: Alignment.center);
              },
              child: Row(children: [
                AntdStyleProvider<AntdBoxStyle>(
                    style: const AntdBoxStyle(size: 50),
                    child: AntdBox(
                        style: AntdBoxStyle(
                            radius: 10.radius.all,
                            textStyle: const TextStyle(color: Colors.white)),
                        styleBuilder: (context, box, style, token) {
                          return AntdBoxStyle(
                              border: token.borderSide
                                  .copyWith(color: token.colorSuccess, width: 3)
                                  .all);
                        },
                        child: const Text("box1"))),
                AntdBox(
                    style: AntdBoxStyle(margin: 10.left),
                    child: const Text("box2"))
              ])),
          AntdBox(
              disabled: true,
              style: AntdBoxStyle(
                  size: 50,
                  color: Colors.green,
                  disabledStyle: AntdBoxStyle(
                      size: 100,
                      color: token.colorError,
                      border: token.borderSide
                          .copyWith(color: token.colorPrimary, width: 3)
                          .all)),
              child: const Text("\u7981\u7528\u6837\u5F0F")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 50,
                  color: Colors.white,
                  feedbackStyle: AntdBoxStyle(
                      size: 100,
                      alignment: Alignment.center,
                      color: token.colorError,
                      border: token.borderSide
                          .copyWith(color: token.colorPrimary, width: 3)
                          .all)),
              child: const Text("\u6309\u4E0B\u53CD\u9988\u6837\u5F0F")),
          AntdBox(
              options: const AntdTapOptions(alwaysTriggerTap: true),
              onDoubleTap: () {
                if (focusNode.hasFocus) {
                  focusNode.unfocus();
                }
              },
              style: AntdBoxStyle(
                  size: 50,
                  color: Colors.white,
                  focusStyle: AntdBoxStyle(
                      size: 100,
                      alignment: Alignment.center,
                      textStyle:
                          token.font.default_.copyWith(color: token.colorWhite),
                      color: token.colorPrimary,
                      border: token.borderSide
                          .copyWith(color: token.colorWarning, width: 3)
                          .all)),
              child: AntdBox(child: const Text("\u83B7\u53D6\u7126\u70B9\u6837\u5F0F(\u53CC\u51FB\u53D6\u6D88\u7126\u70B9)")))
        ]);
  }
}

`,paraId:10,tocIndex:11},{value:`
  `,paraId:11},{value:"\u5C5E\u6027\u540D",paraId:12,tocIndex:12},{value:"\u8BF4\u660E",paraId:12,tocIndex:12},{value:"\u7C7B\u578B",paraId:12,tocIndex:12},{value:"\u9ED8\u8BA4\u503C",paraId:12,tocIndex:12},{value:"\u7248\u672C",paraId:12,tocIndex:12},{value:"key",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"Key",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"style",paraId:12,tocIndex:12},{value:"\u6837\u5F0F",paraId:12,tocIndex:12},{value:"AntdBoxStyle",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"styleBuilder",paraId:12,tocIndex:12},{value:"\u52A8\u6001\u6837\u5F0F",paraId:12,tocIndex:12},{value:"AntdStyleBuilder<AntdBoxStyle, AntdBox>",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"outerSafeArea",paraId:12,tocIndex:12},{value:"\u5916\u90E8\u5B89\u5168\u533A\u57DF\u8FB9\u8DDD\uFF08\u901A\u5E38\u7528\u4E8E\u907F\u5F00\u7CFB\u7EDFUI\u5982\u5218\u6D77\u5C4F\uFF09:",paraId:12,tocIndex:12},{value:"top",paraId:12,tocIndex:12},{value:" | ",paraId:12,tocIndex:12},{value:"bottom",paraId:12,tocIndex:12},{value:" | ",paraId:12,tocIndex:12},{value:"left",paraId:12,tocIndex:12},{value:" | ",paraId:12,tocIndex:12},{value:"right",paraId:12,tocIndex:12},{value:" | ",paraId:12,tocIndex:12},{value:"horizontal",paraId:12,tocIndex:12},{value:" | ",paraId:12,tocIndex:12},{value:"vertical",paraId:12,tocIndex:12},{value:" | ",paraId:12,tocIndex:12},{value:"all",paraId:12,tocIndex:12},{value:"AntdPosition",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"innerSafeArea",paraId:12,tocIndex:12},{value:"\u5185\u90E8\u5B89\u5168\u533A\u57DF\u8FB9\u8DDD\uFF08\u5185\u5BB9\u4E0E\u8FB9\u754C\u7684\u4FDD\u7559\u95F4\u8DDD\uFF09:",paraId:12,tocIndex:12},{value:"top",paraId:12,tocIndex:12},{value:" | ",paraId:12,tocIndex:12},{value:"bottom",paraId:12,tocIndex:12},{value:" | ",paraId:12,tocIndex:12},{value:"left",paraId:12,tocIndex:12},{value:" | ",paraId:12,tocIndex:12},{value:"right",paraId:12,tocIndex:12},{value:" | ",paraId:12,tocIndex:12},{value:"horizontal",paraId:12,tocIndex:12},{value:" | ",paraId:12,tocIndex:12},{value:"vertical",paraId:12,tocIndex:12},{value:" | ",paraId:12,tocIndex:12},{value:"all",paraId:12,tocIndex:12},{value:"AntdPosition",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"onLayout",paraId:12,tocIndex:12},{value:"\u53C2\u6570\u5305\u542B\u89C6\u56FE\u7684\u5C3A\u5BF8\u548C\u5168\u5C40\u4F4D\u7F6E\u4FE1\u606F",paraId:12,tocIndex:12},{value:"AntdOnLayout",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"onFocus",paraId:12,tocIndex:12},{value:"\u7126\u70B9\u53D8\u5316\u56DE\u8C03\uFF08\u5F53\u7EC4\u4EF6\u83B7\u5F97/\u5931\u53BB\u7126\u70B9\u65F6\u89E6\u53D1\uFF09",paraId:12,tocIndex:12},{value:"AntdOnFocus",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"onTap",paraId:12,tocIndex:12},{value:"\u8F7B\u51FB\u4E8B\u4EF6\u56DE\u8C03",paraId:12,tocIndex:12},{value:"VoidCallback",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"onDoubleTap",paraId:12,tocIndex:12},{value:"\u53CC\u51FB\u4E8B\u4EF6\u56DE\u8C03",paraId:12,tocIndex:12},{value:"VoidCallback",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"onLongPress",paraId:12,tocIndex:12},{value:"\u957F\u6309\u4E8B\u4EF6\u56DE\u8C03",paraId:12,tocIndex:12},{value:"VoidCallback",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"disabled",paraId:12,tocIndex:12},{value:"\u7981\u7528",paraId:12,tocIndex:12},{value:"bool",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"options",paraId:12,tocIndex:12},{value:"\u5305\u62EC\uFF1A\u53CC\u51FB\u95F4\u9694\u3001\u957F\u6309\u65F6\u957F\u3001\u89E6\u89C9\u53CD\u9988\u7B49",paraId:12,tocIndex:12},{value:"AntdTapOptions",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"child",paraId:12,tocIndex:12},{value:"\u5B50\u7EC4\u4EF6\uFF08\u901A\u5E38\u4E3A\u9700\u8981\u5E94\u7528\u8FD9\u4E9B\u4EA4\u4E92\u548C\u5E03\u5C40\u7EA6\u675F\u7684\u5185\u5BB9\uFF09",paraId:12,tocIndex:12},{value:"Widget",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"focusNode",paraId:12,tocIndex:12},{value:"\u7126\u70B9",paraId:12,tocIndex:12},{value:"FocusNode",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"-",paraId:12,tocIndex:12},{value:"\u5C5E\u6027\u540D",paraId:13,tocIndex:13},{value:"\u8BF4\u660E",paraId:13,tocIndex:13},{value:"\u7C7B\u578B",paraId:13,tocIndex:13},{value:"\u9ED8\u8BA4\u503C",paraId:13,tocIndex:13},{value:"\u7248\u672C",paraId:13,tocIndex:13},{value:"inherit",paraId:13,tocIndex:13},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:13,tocIndex:13},{value:"bool",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"padding",paraId:13,tocIndex:13},{value:"\u5185\u8FB9\u8DDD",paraId:13,tocIndex:13},{value:"EdgeInsets",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"margin",paraId:13,tocIndex:13},{value:"\u5916\u8FB9\u8DDD",paraId:13,tocIndex:13},{value:"EdgeInsets",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"opacity",paraId:13,tocIndex:13},{value:"\u900F\u660E\u5EA6",paraId:13,tocIndex:13},{value:"double",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"color",paraId:13,tocIndex:13},{value:"\u80CC\u666F\u8272",paraId:13,tocIndex:13},{value:"Color",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"border",paraId:13,tocIndex:13},{value:"\u8FB9\u6846",paraId:13,tocIndex:13},{value:"Border",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"radius",paraId:13,tocIndex:13},{value:"\u5706\u89D2",paraId:13,tocIndex:13},{value:"BorderRadius",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"textStyle",paraId:13,tocIndex:13},{value:"\u5171\u4EAB\u7684Text\u6837\u5F0F",paraId:13,tocIndex:13},{value:"TextStyle",paraId:14,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"height",paraId:13,tocIndex:13},{value:"\u9AD8\u5EA6",paraId:13,tocIndex:13},{value:"double",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"minHeight",paraId:13,tocIndex:13},{value:"\u6700\u5C0F\u9AD8\u5EA6",paraId:13,tocIndex:13},{value:"double",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"width",paraId:13,tocIndex:13},{value:"\u5BBD\u5EA6",paraId:13,tocIndex:13},{value:"double",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"minWidth",paraId:13,tocIndex:13},{value:"\u6700\u5C0F\u5BBD\u5EA6",paraId:13,tocIndex:13},{value:"double",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"size",paraId:13,tocIndex:13},{value:"\u7EDF\u4E00\u5C3A\u5BF8\uFF08\u540C\u65F6\u5F71\u54CD width/height\uFF0C\u4F18\u5148\u7EA7\u6700\u4F4E\uFF09",paraId:13,tocIndex:13},{value:"double",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"layoutModes",paraId:13,tocIndex:13},{value:"\u5E03\u5C40\u884C\u4E3A\u6A21\u5F0F",paraId:13,tocIndex:13},{value:"List<AntdBoxLayoutMode>",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"backdropFilter",paraId:13,tocIndex:13},{value:"\u6BDB\u73BB\u7483\u6548\u679C",paraId:13,tocIndex:13},{value:"double",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"shadows",paraId:13,tocIndex:13},{value:"\u9634\u5F71",paraId:13,tocIndex:13},{value:"List<BoxShadow>",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"gradient",paraId:13,tocIndex:13},{value:"\u6E10\u53D8",paraId:13,tocIndex:13},{value:"Gradient",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"alignment",paraId:13,tocIndex:13},{value:"\u5B50\u5BB9\u5668\u7684\u5BF9\u9F50\u65B9\u5F0F",paraId:13,tocIndex:13},{value:"Alignment",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"visibility",paraId:13,tocIndex:13},{value:"\u53EF\u89C1\u72B6\u6001:",paraId:13,tocIndex:13},{value:"hidden",paraId:13,tocIndex:13},{value:" | ",paraId:13,tocIndex:13},{value:"visible",paraId:13,tocIndex:13},{value:"AntdVisibility",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"hapticFeedback",paraId:13,tocIndex:13},{value:"\u9707\u52A8\u53CD\u9988:",paraId:13,tocIndex:13},{value:"light",paraId:13,tocIndex:13},{value:" | ",paraId:13,tocIndex:13},{value:"medium",paraId:13,tocIndex:13},{value:" | ",paraId:13,tocIndex:13},{value:"heavy",paraId:13,tocIndex:13},{value:"AntdHapticFeedback",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"colorFilter",paraId:13,tocIndex:13},{value:"\u989C\u8272\u8FC7\u6EE4",paraId:13,tocIndex:13},{value:"ColorFilter",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"-",paraId:13,tocIndex:13},{value:"\u5C5E\u6027\u540D",paraId:15,tocIndex:14},{value:"\u8BF4\u660E",paraId:15,tocIndex:14},{value:"\u7C7B\u578B",paraId:15,tocIndex:14},{value:"\u9ED8\u8BA4\u503C",paraId:15,tocIndex:14},{value:"\u7248\u672C",paraId:15,tocIndex:14},{value:"inherit",paraId:15,tocIndex:14},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:15,tocIndex:14},{value:"bool",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"padding",paraId:15,tocIndex:14},{value:"\u5185\u8FB9\u8DDD",paraId:15,tocIndex:14},{value:"EdgeInsets",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"margin",paraId:15,tocIndex:14},{value:"\u5916\u8FB9\u8DDD",paraId:15,tocIndex:14},{value:"EdgeInsets",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"opacity",paraId:15,tocIndex:14},{value:"\u900F\u660E\u5EA6",paraId:15,tocIndex:14},{value:"double",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"color",paraId:15,tocIndex:14},{value:"\u80CC\u666F\u8272",paraId:15,tocIndex:14},{value:"Color",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"border",paraId:15,tocIndex:14},{value:"\u8FB9\u6846",paraId:15,tocIndex:14},{value:"Border",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"radius",paraId:15,tocIndex:14},{value:"\u5706\u89D2",paraId:15,tocIndex:14},{value:"BorderRadius",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"textStyle",paraId:15,tocIndex:14},{value:"\u5171\u4EAB\u7684Text\u6837\u5F0F",paraId:15,tocIndex:14},{value:"TextStyle",paraId:16,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"height",paraId:15,tocIndex:14},{value:"\u9AD8\u5EA6",paraId:15,tocIndex:14},{value:"double",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"minHeight",paraId:15,tocIndex:14},{value:"\u6700\u5C0F\u9AD8\u5EA6",paraId:15,tocIndex:14},{value:"double",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"width",paraId:15,tocIndex:14},{value:"\u5BBD\u5EA6",paraId:15,tocIndex:14},{value:"double",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"minWidth",paraId:15,tocIndex:14},{value:"\u6700\u5C0F\u5BBD\u5EA6",paraId:15,tocIndex:14},{value:"double",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"size",paraId:15,tocIndex:14},{value:"\u7EDF\u4E00\u5C3A\u5BF8\uFF08\u540C\u65F6\u5F71\u54CD width/height\uFF0C\u4F18\u5148\u7EA7\u6700\u4F4E\uFF09",paraId:15,tocIndex:14},{value:"double",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"layoutModes",paraId:15,tocIndex:14},{value:"\u5E03\u5C40\u884C\u4E3A\u6A21\u5F0F",paraId:15,tocIndex:14},{value:"List<AntdBoxLayoutMode>",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"backdropFilter",paraId:15,tocIndex:14},{value:"\u6BDB\u73BB\u7483\u6548\u679C",paraId:15,tocIndex:14},{value:"double",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"shadows",paraId:15,tocIndex:14},{value:"\u9634\u5F71",paraId:15,tocIndex:14},{value:"List<BoxShadow>",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"gradient",paraId:15,tocIndex:14},{value:"\u6E10\u53D8",paraId:15,tocIndex:14},{value:"Gradient",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"alignment",paraId:15,tocIndex:14},{value:"\u5B50\u5BB9\u5668\u7684\u5BF9\u9F50\u65B9\u5F0F",paraId:15,tocIndex:14},{value:"Alignment",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"visibility",paraId:15,tocIndex:14},{value:"\u53EF\u89C1\u72B6\u6001:",paraId:15,tocIndex:14},{value:"hidden",paraId:15,tocIndex:14},{value:" | ",paraId:15,tocIndex:14},{value:"visible",paraId:15,tocIndex:14},{value:"AntdVisibility",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"hapticFeedback",paraId:15,tocIndex:14},{value:"\u9707\u52A8\u53CD\u9988:",paraId:15,tocIndex:14},{value:"light",paraId:15,tocIndex:14},{value:" | ",paraId:15,tocIndex:14},{value:"medium",paraId:15,tocIndex:14},{value:" | ",paraId:15,tocIndex:14},{value:"heavy",paraId:15,tocIndex:14},{value:"AntdHapticFeedback",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"colorFilter",paraId:15,tocIndex:14},{value:"\u989C\u8272\u8FC7\u6EE4",paraId:15,tocIndex:14},{value:"ColorFilter",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"focusStyle",paraId:15,tocIndex:14},{value:"AntdKitStyle",paraId:17,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"disabledStyle",paraId:15,tocIndex:14},{value:"AntdKitStyle",paraId:18,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"feedbackStyle",paraId:15,tocIndex:14},{value:"AntdKitStyle",paraId:19,tocIndex:14},{value:"-",paraId:15,tocIndex:14},{value:"-",paraId:15,tocIndex:14}]}}]);
