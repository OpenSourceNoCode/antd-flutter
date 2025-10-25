"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[4691,9614],{29490:function(l,d,n){n.r(d);var a=n(23586),u=n(97893),x=n(99735),h=n(15942),p=n(45144),s=n(68865),o=n(55873),m=n(55819),v=n(83202),I=n(19566),j=n(68082),f=n(13590),g=n(12338),r=n(3031),_=n(91043),i=n(75271),t=n(45345),e=n(52676);function c(){return(0,e.jsx)(r.dY,{children:(0,e.jsx)(i.Suspense,{fallback:(0,e.jsx)(_.Z,{}),children:(0,e.jsx)(e.Fragment,{children:(0,e.jsxs)("div",{className:"markdown",children:[(0,e.jsx)("p",{children:t.texts[0].value}),(0,e.jsxs)("h2",{id:"\u4F55\u65F6\u4F7F\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4F55\u65F6\u4F7F\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4F55\u65F6\u4F7F\u7528"]}),(0,e.jsx)("p",{children:t.texts[1].value}),(0,e.jsxs)("h2",{id:"\u4EE3\u7801\u5C55\u793A",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4EE3\u7801\u5C55\u793A",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4EE3\u7801\u5C55\u793A"]}),(0,e.jsxs)("div",{className:"preview-container",children:[(0,e.jsx)("div",{className:"phone-preview",children:(0,e.jsx)("iframe",{src:"https://opensourcenocode.github.io/antd-flutter?target=AntdPullToRefresh"})}),(0,e.jsxs)("div",{style:{flex:"1"},children:[(0,e.jsxs)("h3",{id:"\u57FA\u7840\u7528\u6CD5",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u57FA\u7840\u7528\u6CD5",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u57FA\u7840\u7528\u6CD5"]}),(0,e.jsx)(s.Z,{lang:"dart",children:t.texts[2].value}),(0,e.jsxs)("h3",{id:"\u6DF7\u5408\u5185\u5BB9",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u6DF7\u5408\u5185\u5BB9",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u6DF7\u5408\u5185\u5BB9"]}),(0,e.jsx)(s.Z,{lang:"dart",children:t.texts[3].value})]})]}),t.texts[4].value,(0,e.jsx)("style",{dangerouslySetInnerHTML:{__html:`
.preview-container {
  display: flex;
  gap: 24px;
  margin: 32px 0;
  align-items: start;
}

.phone-preview {
  min-width: 375px;
  max-width: 375px;
  border: 10px solid #f3f3f3;
  border-radius: 40px;
  background: #fff;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  overflow: hidden;
  height: 652px;
  width: 393px;
  position: sticky;
  top: 80px;
}

.phone-preview iframe {
  width: 100%;
  height: 100%;
  border: none;
}

.code-block {
  max-height: 100%;
  margin: 16px 0;
  overflow-y: scroll;
}

.dumi-default-source-code {
  margin: 0 !important;
}

.markdown .dumi-default-source-code >pre.prism-code {
  padding: 12px !important;
  font-size: 12px !important;
}

@media (max-width: 960px) {
  .preview-container {
    flex-direction: column;
  }
  
  .phone-preview {
    width: 100%;
    max-width: 375px;
    margin: 0 auto 24px;
    position: static;
  }
}

/* Dart \u4EE3\u7801\u9AD8\u4EAE\u4E3B\u9898 - \u57FA\u4E8E VS Code \u6697\u8272\u4E3B\u9898\u4F18\u5316 */
.prism-code {
  display: block;
  overflow-x: auto;
  padding: 1em;
  border-radius: 6px;
  font-family: 'Fira Code', 'Consolas', 'Monaco', monospace;
  font-size: 14px;
  line-height: 1.5;
  color: #d4d4d4;
  background: #1e1e1e;
}

/* \u57FA\u7840\u5143\u7D20 */
.prism-code .hljs-keyword { color: #569cd6; font-weight: bold; }          /* \u5173\u952E\u5B57 */
.prism-code .hljs-built_in { color: #4ec9b0; }                           /* \u5185\u7F6E\u7C7B\u578B */
.prism-code .hljs-type { color: #4ec9b0; }                               /* \u7C7B\u578B\u58F0\u660E */
.prism-code .hljs-literal { color: #569cd6; }                            /* \u5B57\u9762\u91CF */
.prism-code .hljs-number { color: #b5cea8; }                             /* \u6570\u5B57 */
.prism-code .hljs-string { color: #ce9178; }                             /* \u5B57\u7B26\u4E32 */
.prism-code .hljs-comment { color: #6a9955; font-style: italic; }        /* \u6CE8\u91CA */
.prism-code .hljs-meta { color: #9b9b9b; }                               /* \u5143\u4FE1\u606F */

/* Dart \u7279\u6709\u5143\u7D20 */
.prism-code .hljs-constant { color: #4fc1ff; }                           /* const/final */
.prism-code .hljs-function { color: #dcdcaa; }                           /* \u51FD\u6570\u540D */
.prism-code .hljs-title.class_ { color: #4ec9b0; text-decoration: underline; } /* \u7C7B\u540D */
.prism-code .hljs-params { color: #9cdcfe; }                             /* \u53C2\u6570 */
.prism-code .hljs-variable { color: #9cdcfe; }                           /* \u53D8\u91CF */
.prism-code .hljs-annotation { color: #d4d4d4; background: #3a3a3a; }    /* \u6CE8\u89E3 */
.prism-code .hljs-punctuation { color: #d4d4d4; }                        /* \u6807\u70B9\u7B26\u53F7 */

/* \u7279\u6B8A\u589E\u5F3A */
.prism-code .hljs-constructor { color: #c586c0; }                        /* \u6784\u9020\u51FD\u6570 */
.prism-code .hljs-named-parameter { color: #9cdcfe; font-style: italic; }/* \u547D\u540D\u53C2\u6570 */
.prism-code .hljs-generic { color: #4ec9b0; opacity: 0.8; }              /* \u6CDB\u578B\u7B26\u53F7 */
.prism-code .hljs-typedef { color: #4ec9b0; text-decoration: underline; }/* typedef */

/* \u884C\u53F7\u6837\u5F0F (\u53EF\u9009) */
.prism-code .hljs-ln-numbers {
  color: #858585;
  text-align: right;
  padding-right: 12px;
}
`}}),(0,e.jsxs)("h2",{id:"\u5C5E\u6027",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5C5E\u6027",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5C5E\u6027"]}),(0,e.jsxs)(o.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[5].value}),(0,e.jsx)("th",{children:t.texts[6].value}),(0,e.jsx)("th",{children:t.texts[7].value}),(0,e.jsx)("th",{children:t.texts[8].value}),(0,e.jsx)("th",{children:t.texts[9].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[10].value}),(0,e.jsx)("td",{children:t.texts[11].value}),(0,e.jsx)("td",{children:t.texts[12].value}),(0,e.jsx)("td",{children:t.texts[13].value}),(0,e.jsx)("td",{children:t.texts[14].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[15].value}),(0,e.jsx)("td",{children:t.texts[16].value}),(0,e.jsx)("td",{children:t.texts[17].value}),(0,e.jsx)("td",{children:t.texts[18].value}),(0,e.jsx)("td",{children:t.texts[19].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[20].value}),(0,e.jsx)("td",{children:t.texts[21].value}),(0,e.jsx)("td",{children:t.texts[22].value}),(0,e.jsx)("td",{children:t.texts[23].value}),(0,e.jsx)("td",{children:t.texts[24].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[25].value}),(0,e.jsx)("td",{children:t.texts[26].value}),(0,e.jsx)("td",{children:t.texts[27].value}),(0,e.jsx)("td",{children:t.texts[28].value}),(0,e.jsx)("td",{children:t.texts[29].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[30].value}),(0,e.jsx)("td",{children:t.texts[31].value}),(0,e.jsx)("td",{children:t.texts[32].value}),(0,e.jsx)("td",{children:t.texts[33].value}),(0,e.jsx)("td",{children:t.texts[34].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[35].value}),(0,e.jsx)("td",{children:t.texts[36].value}),(0,e.jsx)("td",{children:t.texts[37].value}),(0,e.jsx)("td",{children:t.texts[38].value}),(0,e.jsx)("td",{children:t.texts[39].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[40].value}),(0,e.jsx)("td",{children:t.texts[41].value}),(0,e.jsx)("td",{children:t.texts[42].value}),(0,e.jsx)("td",{children:t.texts[43].value}),(0,e.jsx)("td",{children:t.texts[44].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[45].value}),(0,e.jsx)("td",{children:t.texts[46].value}),(0,e.jsx)("td",{children:t.texts[47].value}),(0,e.jsx)("td",{children:t.texts[48].value}),(0,e.jsx)("td",{children:t.texts[49].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[50].value}),(0,e.jsx)("td",{children:t.texts[51].value}),(0,e.jsx)("td",{children:t.texts[52].value}),(0,e.jsx)("td",{children:t.texts[53].value}),(0,e.jsx)("td",{children:t.texts[54].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[55].value}),(0,e.jsx)("td",{children:t.texts[56].value}),(0,e.jsx)("td",{children:t.texts[57].value}),(0,e.jsx)("td",{children:t.texts[58].value}),(0,e.jsx)("td",{children:t.texts[59].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[60].value}),(0,e.jsx)("td",{children:t.texts[61].value}),(0,e.jsx)("td",{children:t.texts[62].value}),(0,e.jsx)("td",{children:t.texts[63].value}),(0,e.jsx)("td",{children:t.texts[64].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[65].value}),(0,e.jsx)("td",{children:t.texts[66].value}),(0,e.jsx)("td",{children:t.texts[67].value}),(0,e.jsx)("td",{children:t.texts[68].value}),(0,e.jsx)("td",{children:t.texts[69].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[70].value}),(0,e.jsx)("td",{children:t.texts[71].value}),(0,e.jsx)("td",{children:t.texts[72].value}),(0,e.jsx)("td",{children:t.texts[73].value}),(0,e.jsx)("td",{children:t.texts[74].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[75].value}),(0,e.jsx)("td",{children:t.texts[76].value}),(0,e.jsx)("td",{children:t.texts[77].value}),(0,e.jsx)("td",{children:t.texts[78].value}),(0,e.jsx)("td",{children:t.texts[79].value})]})]})]})]})})})})}d.default=c},48670:function(l,d,n){n.d(d,{Z:function(){return a.Z}});var a=n(4204)},45345:function(l,d,n){n.r(d),n.d(d,{texts:function(){return a}});const a=[{value:"\u5728\u5217\u8868\u4E2D\u901A\u8FC7\u624B\u6307\u4E0B\u62C9\u5237\u65B0\u52A0\u8F7D\u65B0\u5185\u5BB9\u7684\u4EA4\u4E92\u64CD\u4F5C\u3002",paraId:0},{value:"\u9002\u7528\u4E8E\u5BF9\u5F53\u524D\u9875\u9762\u8FDB\u884C\u5185\u5BB9\u66F4\u65B0\u3002",paraId:1,tocIndex:0},{value:`class _AntdPullToRefreshDemoStateDemo extends State<AntdPullToRefreshDemo> {
  List<int> data = List.generate(10, (i) => i);
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: AntdPullToRefresh(
              onRefresh: () async {
                await Future.delayed(const Duration(milliseconds: 200));
                setState(() {
                  data = [...data, ...List.generate(10, (i) => i)];
                });
              },
              onChange: (status) {
                AntdToast.show("$status", position: AntdToastPosition.top);
              },
              initialDelay: const Duration(seconds: 2),
              initialPrompt: AntdBox(
                  style: style.copyWith(height: getHeight().toDouble()),
                  child: const Text("\u6211\u662F\u521D\u59CB\u5C55\u793A\u7684\u5185\u5BB9")),
              releasePrompt: AntdBox(
                  style: style.copyWith(height: getHeight().toDouble()),
                  child: const Text("\u73B0\u5728\u91CA\u653E\u7ACB\u5373\u5237\u65B0")),
              completionPrompt: AntdBox(
                  style: style.copyWith(height: getHeight().toDouble()),
                  child: const Text("\u5237\u65B0\u5B8C\u6210\u4E86")),
              pullingPrompt: AntdBox(
                  style: style.copyWith(height: getHeight().toDouble()),
                  child: const Text("\u7528\u529B\u4E0B\u62C9\u5237\u65B0")),
              refreshingPrompt: AntdBox(
                  style: style.copyWith(height: getHeight().toDouble()),
                  child: const AntdLoading(
                      spinning: true,
                      circular: true,
                      style: AntdLoadingStyle(size: 24),
                      text: Text("\u6B63\u5728\u5237\u65B0\u4E2D"))),
              child: SizedBox(
                  height: 300,
                  child: AntdList(
                      physics: const ClampingScrollPhysics(),
                      items: data.map((value) {
                        return Text(
                            style: const TextStyle(color: Colors.black),
                            generateRandomString(5));
                      }).toList()))))
    ]);
  }
}

`,paraId:2,tocIndex:2},{value:`class _AntdPullToRefreshMixDemoStateDemo
    extends State<AntdPullToRefreshMixDemo> {
  List<int> data = List.generate(10, (i) => i);
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdPullToRefresh(
          releasePrompt: AntdBox(
              style: style.copyWith(height: 40), child: const Text("\u677E\u5F00\u5237\u65B0")),
          refreshingPrompt: AntdBox(
              style: style.copyWith(height: 60), child: const Text("\u73A9\u547D\u52A0\u8F7D\u4E2D...")),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              data = [...data, ...List.generate(10, (i) => i)];
            });
          },
          child: Column(children: [
            AntdBox(
                style: AntdBoxStyle(
                    alignment: Alignment.center,
                    color: token.colorWhite,
                    padding: token.size.md.all,
                    border: token.border.bottom),
                child: const Text("\u6211\u662F\u5185\u5BB91")),
            AntdBox(
                style: AntdBoxStyle(
                    alignment: Alignment.center,
                    color: token.colorWhite,
                    padding: token.size.md.all,
                    border: token.border.bottom),
                child: const Text("\u6211\u662F\u5185\u5BB92")),
            AntdTabs(tabs: [
              AntdTab(
                  title: const Text("\u9762\u677FA"),
                  value: "A",
                  child: SizedBox(
                      height: 300,
                      child: AntdList(
                          physics: const ClampingScrollPhysics(),
                          items: data.map((value) {
                            return Text(generateRandomString(5));
                          }).toList()))),
              AntdTab(
                  title: const Text("\u9762\u677FB"),
                  value: "B",
                  child: SizedBox(
                      height: 300,
                      child: AntdList(
                          physics: const ClampingScrollPhysics(),
                          items: data.map((value) {
                            return Text(generateRandomString(5));
                          }).toList())))
            ])
          ]))
    ]);
  }
}

`,paraId:3,tocIndex:3},{value:`
  `,paraId:4},{value:"\u5C5E\u6027\u540D",paraId:5,tocIndex:4},{value:"\u8BF4\u660E",paraId:5,tocIndex:4},{value:"\u7C7B\u578B",paraId:5,tocIndex:4},{value:"\u9ED8\u8BA4\u503C",paraId:5,tocIndex:4},{value:"\u7248\u672C",paraId:5,tocIndex:4},{value:"key",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"Key",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"style",paraId:5,tocIndex:4},{value:"\u6837\u5F0F",paraId:5,tocIndex:4},{value:"AntdBoxStyle",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"styleBuilder",paraId:5,tocIndex:4},{value:"\u52A8\u6001\u6837\u5F0F",paraId:5,tocIndex:4},{value:"AntdStyleBuilder<AntdBoxStyle, AntdPullToRefresh>",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"initialPrompt",paraId:5,tocIndex:4},{value:"\u521D\u59CB\u72B6\u6001\u4E0B\u663E\u793A\u7684\u63D0\u793A\u5185\u5BB9",paraId:5,tocIndex:4},{value:"Widget",paraId:5,tocIndex:4},{value:'const Text("\u7528\u529B\u4E0B\u62C9\u89E6\u53D1\u5237\u65B0")',paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"initialDelay",paraId:5,tocIndex:4},{value:"\u521D\u59CB\u63D0\u793A\u5185\u5BB9\u7684\u5C55\u793A\u6301\u7EED\u65F6\u95F4",paraId:5,tocIndex:4},{value:"Duration",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"child",paraId:5,tocIndex:4},{value:"\u4E3B\u8981\u5185\u5BB9\u533A\u57DF",paraId:5,tocIndex:4},{value:"Widget",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"releasePrompt",paraId:5,tocIndex:4},{value:"\u53EF\u91CA\u653E\u5237\u65B0\u65F6\u663E\u793A\u7684\u63D0\u793A\u5185\u5BB9",paraId:5,tocIndex:4},{value:"Widget",paraId:5,tocIndex:4},{value:'const Text("\u91CA\u653E\u7ACB\u5373\u5237\u65B0")',paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"completionDelay",paraId:5,tocIndex:4},{value:"\u5237\u65B0\u5B8C\u6210\u540E\u63D0\u793A\u5185\u5BB9\u7684\u5C55\u793A\u6301\u7EED\u65F6\u95F4",paraId:5,tocIndex:4},{value:"Duration",paraId:5,tocIndex:4},{value:"const Duration(milliseconds: 1000)",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"completionPrompt",paraId:5,tocIndex:4},{value:"\u5237\u65B0\u5B8C\u6210\u65F6\u663E\u793A\u7684\u63D0\u793A\u5185\u5BB9",paraId:5,tocIndex:4},{value:"Widget",paraId:5,tocIndex:4},{value:'const Text("\u5237\u65B0\u6210\u529F")',paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"onRefresh",paraId:5,tocIndex:4},{value:"\u5237\u65B0\u89E6\u53D1\u65F6\u7684\u5F02\u6B65\u56DE\u8C03\u51FD\u6570",paraId:5,tocIndex:4},{value:"FutureVoidCallback",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"pullingPrompt",paraId:5,tocIndex:4},{value:"\u4E0B\u62C9\u8FC7\u7A0B\u4E2D\u663E\u793A\u7684\u63D0\u793A\u5185\u5BB9",paraId:5,tocIndex:4},{value:"Widget",paraId:5,tocIndex:4},{value:'const Text("\u7528\u529B\u4E0B\u62C9\u89E6\u53D1\u5237\u65B0")',paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"refreshingPrompt",paraId:5,tocIndex:4},{value:"\u6B63\u5728\u5237\u65B0\u65F6\u663E\u793A\u7684\u63D0\u793A\u5185\u5BB9",paraId:5,tocIndex:4},{value:"Widget",paraId:5,tocIndex:4},{value:'const Text("\u52A0\u8F7D\u4E2D...")',paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"duration",paraId:5,tocIndex:4},{value:"\u52A8\u753B\u5468\u671F",paraId:5,tocIndex:4},{value:"Duration",paraId:5,tocIndex:4},{value:"const Duration(milliseconds: 200)",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"onChange",paraId:5,tocIndex:4},{value:"\u4E8B\u4EF6",paraId:5,tocIndex:4},{value:"AntdPullToRefreshOnChange",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4}]}}]);
