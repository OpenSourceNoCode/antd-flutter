"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[4878],{14878:function(n,e,a){a.r(e),a.d(e,{texts:function(){return t}});const t=[{value:"\u5782\u76F4\u5C55\u793A\u5BFC\u822A\u680F\u3002",paraId:0},{value:"\u9700\u8981\u7528\u6237\u5FEB\u901F\u5BFC\u822A\u81F3\u67D0\u4E00\u9879\u5185\u5BB9\u96C6\u5408\uFF0C\u5E76\u53EF\u4EE5\u5728\u591A\u4E2A\u5185\u5BB9\u4E4B\u95F4\u6765\u56DE\u5207\u6362\u3002",paraId:1,tocIndex:0},{value:`class AntdSliderBarFitDemo extends StatelessWidget {
  const AntdSliderBarFitDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "AntdScrollItemFit.fill\u6BCF\u4E2A\u5185\u5BB9\u6491\u6EE1\u4E00\u5C4F",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  contentFit: AntdScrollItemFit.fill, items: _items))),
      DemoTitle(
          title: "AntdScrollItemFit.child\u6839\u636E\u81EA\u8EAB\u7684\u5185\u5BB9\u81EA\u9002\u5E94",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  contentFit: AntdScrollItemFit.child, items: _items))),
      DemoTitle(
          title: "AntdScrollItemFit.split,\u5185\u5BB9\u65E0\u6CD5\u6491\u6EE1\u65F6\u81EA\u52A8\u5747\u5206\uFF0C\u5185\u5BB9\u8FC7\u591A\u65F6\u81EA\u9002\u5E94",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  contentFit: AntdScrollItemFit.split, items: _items)))
    ]);
  }
}

`,paraId:2,tocIndex:2},{value:`class AntdSliderBarTitlePlacementDemo extends StatelessWidget {
  const AntdSliderBarTitlePlacementDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "\u6700\u9876\u90E8\u5BF9\u9F50",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  titlePlacement: AntdEdge.start, items: _items))),
      DemoTitle(
          title: "\u4E2D\u95F4\u5BF9\u9F50",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  titlePlacement: AntdEdge.center, items: _items))),
      DemoTitle(
          title: "\u5E95\u90E8\u5BF9\u9F50",
          child: SizedBox(
              height: 500,
              child:
                  AntdSliderBar(titlePlacement: AntdEdge.end, items: _items)))
    ]);
  }
}

`,paraId:3,tocIndex:3},{value:`class AntdSliderBarHapticFeedbackDemo extends StatelessWidget {
  const AntdSliderBarHapticFeedbackDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "\u5173\u95ED\u53CD\u9988",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  hapticFeedback: AntdHapticFeedback.none, items: _items))),
      DemoTitle(
          title: "hapticFeedback\u81EA\u5B9A\u4E49\u53CD\u9988\u7EA7\u522B",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  hapticFeedback: AntdHapticFeedback.medium, items: _items)))
    ]);
  }
}

`,paraId:4,tocIndex:4},{value:`class AntdSliderBarEventDemo extends StatelessWidget {
  const AntdSliderBarEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "AntdSliderBar\u7684onChange,\u53EF\u4EE5\u8BFB\u53D6AntdSliderBarItem\u7684\u5B8C\u6574\u5C5E\u6027",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  onChange: (item, index) {
                    AntdToast.show("\u6211\u662F:\${item.value}");
                  },
                  items: _items))),
      DemoTitle(
          title: "\u6807\u9898\u680F\u76EE\u89E6\u5E95/\u89E6\u9876\u4E8B\u4EF6",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  onChange: (item, index) {
                    AntdToast.show("\u6211\u662F:\${item.value}");
                  },
                  onEdgeReached: (offset, up) async {
                    AntdToast.show("\u5230\u8FBE\${up ? '\u9876\u90E8' : '\u5E95\u90E8'}");
                  },
                  items: _items))),
      DemoTitle(
          title: "\u901A\u8FC7edgeThreshold\u63A7\u5236\u89E6\u5E95/\u89E6\u9876\u9608\u503C",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  onChange: (item, index) {
                    AntdToast.show("\u6211\u662F:\${item.value}");
                  },
                  edgeThreshold: 0.3,
                  onEdgeReached: (offset, up) async {
                    AntdToast.show("\u5230\u8FBE\${up ? '\u9876\u90E8' : '\u5E95\u90E8'}");
                  },
                  items: _items))),
      DemoTitle(
          title: "\u6807\u9898\u680F\u7D22\u5F15\u76D1\u542C\u4E8B\u4EF6",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  onChange: (item, index) {
                    AntdToast.show("\u6211\u662F:\${item.value}");
                  },
                  onEdgeReached: (offset, up) async {
                    AntdToast.show("\u5230\u8FBE\${up ? '\u9876\u90E8' : '\u5E95\u90E8'}");
                  },
                  onItemPosition: (ctx) {
                    AntdToast.show("\u5F53\u524D\u662F:\${ctx.index},\u8FDB\u5165:\${ctx.visibleHeight},");
                  },
                  items: _items)))
    ]);
  }
}

`,paraId:5,tocIndex:5},{value:`class AntdSliderBarTitleDemo extends StatelessWidget {
  const AntdSliderBarTitleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "\u81EA\u5B9A\u4E49\u6807\u9898\u680F\u5BBD\u5EA6",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  style: const AntdSliderBarStyle(
                      titleStyle: AntdBoxStyle(width: 200)),
                  items: _items))),
      DemoTitle(
          title: "\u6BCF\u884C\u90FD\u586B\u5145\u5BBD\u5EA6",
          child: SizedBox(
              height: 500,
              child:
                  AntdSliderBar(fit: AntdScrollItemFit.fill, items: _items))),
      DemoTitle(
          title: "\u81EA\u52A8\u5747\u5206",
          child: SizedBox(
              height: 500,
              child:
                  AntdSliderBar(fit: AntdScrollItemFit.split, items: _items))),
      DemoTitle(
          title: "\u5185\u5BB9\u81EA\u9002\u5E94",
          child: SizedBox(
              height: 500,
              child:
                  AntdSliderBar(fit: AntdScrollItemFit.child, items: _items)))
    ]);
  }
}

`,paraId:6,tocIndex:6},{value:"\u901A\u8FC7style \u53EF\u4EE5\u8986\u76D6\u9ED8\u8BA4\u6837\u5F0F",paraId:7,tocIndex:7},{value:`class AntdSliderBarStyleDemo extends StatelessWidget {
  const AntdSliderBarStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      SizedBox(
          height: 500,
          child: AntdSliderBar(items: [
            AntdSliderBarItem(
                value: "1",
                content: Row(children: [
                  const Text("\u9009\u98791"),
                  Text("(8)",
                      style: token.font.ms
                          .copyWith(color: token.colorText.tertiary))
                ]),
                title: const Text("\u6211\u662F\u6807\u98981")),
            const AntdSliderBarItem(
                value: "2",
                disabled: true,
                content: Text("\u9009\u98792"),
                title: Text("\u6211\u662F\u6807\u98982")),
            const AntdSliderBarItem(
                value: "3", content: Text("\u9009\u98793"), title: Text("\u6211\u662F\u6807\u98983")),
            const AntdSliderBarItem(
                value: "4", content: Text("\u9009\u98794"), title: Text("\u6211\u662F\u6807\u98984"))
          ]))
    ]);
  }
}

`,paraId:8,tocIndex:7},{value:`class _AntdSliderBarMoreDemoStateDemo extends State<AntdSliderBarMoreDemo> {
  var titleMoreItems = [..._items];
  final _laodingIndex = [];
  final _loadingingIndex = [];
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      DemoTitle(
          title: "\u6807\u9898\u680F\u89E6\u5E95\u52A0\u8F7D\u66F4\u591A",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  items: titleMoreItems,
                  onEdgeReached: (offset, up) async {
                    if (!up) {
                      AntdToast.show("\u89E6\u53D1\u52A0\u8F7D");
                      setState(() {
                        titleMoreItems.addAll(List.generate(5, (i) {
                          var index = titleMoreItems.length + i;
                          return AntdSliderBarItem(
                              value: index,
                              content: AntdBox(
                                  style: AntdBoxStyle(
                                      color: getRandomColor(), height: 200),
                                  child: Text("\u5185\u5BB9$index,\${DateTime.now()}")),
                              title: Text("\u65B0\u589E$index"));
                        }));
                      });
                      await Future.delayed(const Duration(seconds: 2));
                    }
                  }))),
      DemoTitle(
          title: "\u5185\u5BB9\u61D2\u52A0\u8F7D",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  onChange: (item, index) async {
                    if (_laodingIndex.contains(index)) {
                      return;
                    }
                    setState(() {
                      _loadingingIndex.add(index);
                    });
                    await Future.delayed(const Duration(seconds: 3));
                    setState(() {
                      _laodingIndex.add(index);
                      _loadingingIndex.remove(index);
                    });
                  },
                  items: List.generate(20, (i) {
                    return AntdSliderBarItem(
                        value: i,
                        content: AntdBox(
                            style: AntdBoxStyle(
                                color: i % 2 == 0
                                    ? token.colorPrimary
                                    : token.colorSuccess,
                                height: 200),
                            child: AntdBox(
                                style: AntdBoxStyle(padding: 8.all),
                                child: _loadingingIndex.contains(i)
                                    ? const AntdSkeleton(rows: 3)
                                    : Text("\u5185\u5BB9$i"))),
                        title: Text("\u65B0\u589E$i"));
                  }))))
    ]);
  }
}

`,paraId:9,tocIndex:8},{value:`class _AntdSliderBarControllerDemoStateDemo
    extends State<AntdSliderBarControllerDemo> {
  AntdSliderBarController controller = AntdSliderBarController();
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Wrap(spacing: 12, children: [
        AntdButton(
            onTap: () {
              controller.toIndex(50);
            },
            child: const Text("\u8DF3\u8F6C\u81F350")),
        AntdButton(
            onTap: () {
              controller.toIndex(99);
            },
            child: const Text("\u8DF3\u8F6C\u81F399"))
      ]),
      SizedBox(
          height: 500,
          child: AntdSliderBar(controller: controller, items: _items))
    ]);
  }
}

`,paraId:10,tocIndex:9},{value:`
  `,paraId:11},{value:"\u5C5E\u6027\u540D",paraId:12,tocIndex:10},{value:"\u8BF4\u660E",paraId:12,tocIndex:10},{value:"\u7C7B\u578B",paraId:12,tocIndex:10},{value:"\u9ED8\u8BA4\u503C",paraId:12,tocIndex:10},{value:"\u7248\u672C",paraId:12,tocIndex:10},{value:"key",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"Key",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"style",paraId:12,tocIndex:10},{value:"\u6837\u5F0F",paraId:12,tocIndex:10},{value:"AntdSliderBarStyle",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"styleBuilder",paraId:12,tocIndex:10},{value:"\u52A8\u6001\u6837\u5F0F",paraId:12,tocIndex:10},{value:"AntdStyleBuilder<AntdSliderBarStyle, AntdSliderBar>",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"physics",paraId:12,tocIndex:10},{value:"\u6EDA\u52A8\u7269\u7406\u6548\u679C",paraId:12,tocIndex:10},{value:"ScrollPhysics",paraId:12,tocIndex:10},{value:"const BouncingScrollPhysics()",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"shrinkWrap",paraId:12,tocIndex:10},{value:"\u81EA\u52A8\u6269\u5C55\u9AD8\u5EA6",paraId:12,tocIndex:10},{value:"bool",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"controller",paraId:12,tocIndex:10},{value:"\u63A7\u5236\u5668",paraId:12,tocIndex:10},{value:"AntdSliderBarController",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"onItemPosition",paraId:12,tocIndex:10},{value:"item\u53D8\u66F4\u4E8B\u4EF6",paraId:12,tocIndex:10},{value:"AntdItemPositionListener<AntdSliderBarItem>",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"throttle",paraId:12,tocIndex:10},{value:"\u6EDA\u52A8\u4E8B\u4EF6\u8282\u6D41\u65F6\u957F",paraId:12,tocIndex:10},{value:"Duration",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"edgeThreshold",paraId:12,tocIndex:10},{value:"\u89E6\u8FB9\u9608\u503C (0-1\u8868\u793A\u767E\u5206\u6BD4)",paraId:12,tocIndex:10},{value:"double",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"onEdgeReached",paraId:12,tocIndex:10},{value:"\u5F53\u89E6\u78B0\u5230\u8FB9\u754C\u65F6\u7684\u56DE\u8C03",paraId:12,tocIndex:10},{value:"AntdOnScrollEdge",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"virtual",paraId:12,tocIndex:10},{value:"\u542F\u52A8\u865A\u62DF\u6EDA\u52A8",paraId:12,tocIndex:10},{value:"bool",paraId:12,tocIndex:10},{value:"false",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"alignment",paraId:12,tocIndex:10},{value:"\u6839\u636E\u65B9\u5411\u81EA\u52A8\u4F18\u5316\u89C6\u56FE\u8FB9\u754C:",paraId:12,tocIndex:10},{value:"start",paraId:12,tocIndex:10},{value:" | ",paraId:12,tocIndex:10},{value:"center",paraId:12,tocIndex:10},{value:" | ",paraId:12,tocIndex:10},{value:"end",paraId:12,tocIndex:10},{value:"AntdEdge",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"fit",paraId:12,tocIndex:10},{value:"\u81EA\u52A8\u9002\u914D\u7B56\u7565:",paraId:12,tocIndex:10},{value:"fill",paraId:12,tocIndex:10},{value:" | ",paraId:12,tocIndex:10},{value:"split",paraId:12,tocIndex:10},{value:" | ",paraId:12,tocIndex:10},{value:"child",paraId:12,tocIndex:10},{value:"AntdScrollItemFit",paraId:12,tocIndex:10},{value:"child",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"scrollBehavior",paraId:12,tocIndex:10},{value:"\u6EDA\u52A8\u884C\u4E3A",paraId:12,tocIndex:10},{value:"ScrollBehavior",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"cacheExtent",paraId:12,tocIndex:10},{value:"\u9884\u6E32\u67D3\u533A\u57DF\u5927\u5C0F",paraId:12,tocIndex:10},{value:"double",paraId:12,tocIndex:10},{value:"1.5",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"cacheExtentStyle",paraId:12,tocIndex:10},{value:"\u9884\u6E32\u67D3\u533A\u57DF\u8BA1\u7B97\u65B9\u5F0F",paraId:12,tocIndex:10},{value:"CacheExtentStyle",paraId:13,tocIndex:10},{value:"viewport",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"items",paraId:12,tocIndex:10},{value:"\u6EDA\u52A8\u7684\u6570\u636E",paraId:12,tocIndex:10},{value:"List<AntdSliderBarItem>",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"contentFit",paraId:12,tocIndex:10},{value:"\u5185\u5BB9\u5982\u4F55\u586B\u5145:",paraId:12,tocIndex:10},{value:"fill",paraId:12,tocIndex:10},{value:" | ",paraId:12,tocIndex:10},{value:"split",paraId:12,tocIndex:10},{value:" | ",paraId:12,tocIndex:10},{value:"child",paraId:12,tocIndex:10},{value:"AntdScrollItemFit",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"onChange",paraId:12,tocIndex:10},{value:"\u53D8\u66F4\u4E8B\u4EF6",paraId:12,tocIndex:10},{value:"AntdSliderBarOnChange",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"titlePlacement",paraId:12,tocIndex:10},{value:"\u6807\u9898\u548C\u89C6\u56FE\u7684\u5BF9\u9F50\u65B9\u5F0F:",paraId:12,tocIndex:10},{value:"start",paraId:12,tocIndex:10},{value:" | ",paraId:12,tocIndex:10},{value:"center",paraId:12,tocIndex:10},{value:" | ",paraId:12,tocIndex:10},{value:"end",paraId:12,tocIndex:10},{value:"AntdEdge",paraId:12,tocIndex:10},{value:"center",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"hapticFeedback",paraId:12,tocIndex:10},{value:"\u5F00\u542F\u53CD\u9988:",paraId:12,tocIndex:10},{value:"light",paraId:12,tocIndex:10},{value:" | ",paraId:12,tocIndex:10},{value:"medium",paraId:12,tocIndex:10},{value:" | ",paraId:12,tocIndex:10},{value:"heavy",paraId:12,tocIndex:10},{value:" | ",paraId:12,tocIndex:10},{value:"none",paraId:12,tocIndex:10},{value:"AntdHapticFeedback",paraId:12,tocIndex:10},{value:"light",paraId:12,tocIndex:10},{value:"-",paraId:12,tocIndex:10},{value:"\u5C5E\u6027\u540D",paraId:14,tocIndex:11},{value:"\u8BF4\u660E",paraId:14,tocIndex:11},{value:"\u7C7B\u578B",paraId:14,tocIndex:11},{value:"\u9ED8\u8BA4\u503C",paraId:14,tocIndex:11},{value:"\u7248\u672C",paraId:14,tocIndex:11},{value:"inherit",paraId:14,tocIndex:11},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:14,tocIndex:11},{value:"bool",paraId:14,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"bodyStyle",paraId:14,tocIndex:11},{value:"\u6ED1\u52A8\u6761\u6574\u4F53\u5BB9\u5668\u6837\u5F0F",paraId:14,tocIndex:11},{value:"AntdBoxStyle",paraId:15,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"contentStyle",paraId:14,tocIndex:11},{value:"\u672A\u9009\u4E2D\u72B6\u6001\u7684\u6807\u9898\u6837\u5F0F",paraId:14,tocIndex:11},{value:"AntdBoxStyle",paraId:16,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"titleStyle",paraId:14,tocIndex:11},{value:"\u672A\u9009\u4E2D\u72B6\u6001\u7684\u6807\u9898\u6837\u5F0F",paraId:14,tocIndex:11},{value:"AntdBoxStyle",paraId:17,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"activeTitleStyle",paraId:14,tocIndex:11},{value:"\u9009\u4E2D\u72B6\u6001\u7684\u6807\u9898\u6837\u5F0F",paraId:14,tocIndex:11},{value:"AntdBoxStyle",paraId:18,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"indicatorStyle",paraId:14,tocIndex:11},{value:"\u672A\u9009\u4E2D\u72B6\u6001\u7684\u6307\u793A\u5668\u6837\u5F0F",paraId:14,tocIndex:11},{value:"AntdBoxStyle",paraId:19,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"activeIndicatorStyle",paraId:14,tocIndex:11},{value:"\u9009\u4E2D\u72B6\u6001\u7684\u6307\u793A\u5668\u6837\u5F0F",paraId:14,tocIndex:11},{value:"AntdBoxStyle",paraId:20,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"activeCornerRadius",paraId:14,tocIndex:11},{value:"\u9009\u4E2D\u9879\u7684\u5706\u89D2\u534A\u5F84\uFF08\u5355\u4F4D\uFF1A\u50CF\u7D20\uFF09",paraId:14,tocIndex:11},{value:"Radius",paraId:14,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"-",paraId:14,tocIndex:11},{value:"\u5C5E\u6027\u540D",paraId:21,tocIndex:12},{value:"\u8BF4\u660E",paraId:21,tocIndex:12},{value:"\u7C7B\u578B",paraId:21,tocIndex:12},{value:"\u9ED8\u8BA4\u503C",paraId:21,tocIndex:12},{value:"\u7248\u672C",paraId:21,tocIndex:12},{value:"value",paraId:21,tocIndex:12},{value:"\u9009\u9879\u7684\u552F\u4E00\u6807\u8BC6\u503C",paraId:21,tocIndex:12},{value:"dynamic",paraId:21,tocIndex:12},{value:"-",paraId:21,tocIndex:12},{value:"-",paraId:21,tocIndex:12},{value:"content",paraId:21,tocIndex:12},{value:"\u81EA\u5B9A\u4E49\u5185\u5BB9\u7EC4\u4EF6\uFF08\u4F18\u5148\u7EA7\u9AD8\u4E8Etitle\uFF09",paraId:21,tocIndex:12},{value:"Widget",paraId:21,tocIndex:12},{value:"-",paraId:21,tocIndex:12},{value:"-",paraId:21,tocIndex:12},{value:"title",paraId:21,tocIndex:12},{value:"\u9ED8\u8BA4\u6807\u9898\u5185\u5BB9\uFF08\u5F53content\u4E3A\u7A7A\u65F6\u4F7F\u7528\uFF09",paraId:21,tocIndex:12},{value:"Widget",paraId:21,tocIndex:12},{value:"-",paraId:21,tocIndex:12},{value:"-",paraId:21,tocIndex:12},{value:"disabled",paraId:21,tocIndex:12},{value:"\u662F\u5426\u7981\u7528\u8BE5\u9009\u9879",paraId:21,tocIndex:12},{value:"bool",paraId:21,tocIndex:12},{value:"false",paraId:21,tocIndex:12},{value:"-",paraId:21,tocIndex:12},{value:"onActive",paraId:21,tocIndex:12},{value:"item\u88AB\u6FC0\u6D3B\u540E",paraId:21,tocIndex:12},{value:"VoidCallback",paraId:21,tocIndex:12},{value:"-",paraId:21,tocIndex:12},{value:"-",paraId:21,tocIndex:12}]}}]);
