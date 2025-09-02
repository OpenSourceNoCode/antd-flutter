"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[8097,9614],{83109:function(l,n,d){d.r(n);var a=d(72335),u=d(56218),i=d(88362),v=d(90260),p=d(13573),s=d(71121),r=d(584),h=d(66902),I=d(31577),m=d(18525),j=d(47425),f=d(91937),b=d(87825),_=d(63016),o=d(93463),x=d(75271),t=d(52541),e=d(52676);function c(){return(0,e.jsx)(_.dY,{children:(0,e.jsx)(x.Suspense,{fallback:(0,e.jsx)(o.Z,{}),children:(0,e.jsx)(e.Fragment,{children:(0,e.jsxs)("div",{className:"markdown",children:[(0,e.jsx)("p",{children:t.texts[0].value}),(0,e.jsxs)("h2",{id:"\u4F55\u65F6\u4F7F\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4F55\u65F6\u4F7F\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4F55\u65F6\u4F7F\u7528"]}),(0,e.jsx)("p",{children:t.texts[1].value}),(0,e.jsxs)("h2",{id:"\u4EE3\u7801\u5C55\u793A",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4EE3\u7801\u5C55\u793A",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4EE3\u7801\u5C55\u793A"]}),(0,e.jsxs)("div",{className:"preview-container",children:[(0,e.jsxs)("div",{children:[(0,e.jsxs)("h3",{id:"\u57FA\u7840\u7528\u6CD5",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u57FA\u7840\u7528\u6CD5",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u57FA\u7840\u7528\u6CD5"]}),(0,e.jsx)(s.Z,{lang:"dart",children:t.texts[2].value})]}),(0,e.jsx)("div",{className:"phone-preview",children:(0,e.jsx)("iframe",{src:"https://antd-flutter-git-example-howie206s-projects.vercel.app/AntdCascader"})})]}),t.texts[3].value,(0,e.jsx)("style",{dangerouslySetInnerHTML:{__html:`
.preview-container {
  display: flex;
  gap: 24px;
  margin: 32px 0;
  align-items: start;
}

.phone-preview {
  flex: 1;
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
`}}),(0,e.jsxs)("h2",{id:"\u5C5E\u6027",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5C5E\u6027",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5C5E\u6027"]}),(0,e.jsxs)(r.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[4].value}),(0,e.jsx)("th",{children:t.texts[5].value}),(0,e.jsx)("th",{children:t.texts[6].value}),(0,e.jsx)("th",{children:t.texts[7].value}),(0,e.jsx)("th",{children:t.texts[8].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[9].value}),(0,e.jsx)("td",{children:t.texts[10].value}),(0,e.jsx)("td",{children:t.texts[11].value}),(0,e.jsx)("td",{children:t.texts[12].value}),(0,e.jsx)("td",{children:t.texts[13].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[14].value}),(0,e.jsx)("td",{children:t.texts[15].value}),(0,e.jsx)("td",{children:t.texts[16].value}),(0,e.jsx)("td",{children:t.texts[17].value}),(0,e.jsx)("td",{children:t.texts[18].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[19].value}),(0,e.jsx)("td",{children:t.texts[20].value}),(0,e.jsx)("td",{children:t.texts[21].value}),(0,e.jsx)("td",{children:t.texts[22].value}),(0,e.jsx)("td",{children:t.texts[23].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[24].value}),(0,e.jsx)("td",{children:t.texts[25].value}),(0,e.jsx)("td",{children:t.texts[26].value}),(0,e.jsx)("td",{children:t.texts[27].value}),(0,e.jsx)("td",{children:t.texts[28].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[29].value}),(0,e.jsx)("td",{children:t.texts[30].value}),(0,e.jsx)("td",{children:t.texts[31].value}),(0,e.jsx)("td",{children:t.texts[32].value}),(0,e.jsx)("td",{children:t.texts[33].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[34].value}),(0,e.jsx)("td",{children:t.texts[35].value}),(0,e.jsx)("td",{children:t.texts[36].value}),(0,e.jsx)("td",{children:t.texts[37].value}),(0,e.jsx)("td",{children:t.texts[38].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[39].value}),(0,e.jsx)("td",{children:t.texts[40].value}),(0,e.jsx)("td",{children:t.texts[41].value}),(0,e.jsx)("td",{children:t.texts[42].value}),(0,e.jsx)("td",{children:t.texts[43].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[44].value}),(0,e.jsx)("td",{children:t.texts[45].value}),(0,e.jsx)("td",{children:t.texts[46].value}),(0,e.jsx)("td",{children:t.texts[47].value}),(0,e.jsx)("td",{children:t.texts[48].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[49].value}),(0,e.jsx)("td",{children:t.texts[50].value}),(0,e.jsx)("td",{children:t.texts[51].value}),(0,e.jsx)("td",{children:t.texts[52].value}),(0,e.jsx)("td",{children:t.texts[53].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[54].value}),(0,e.jsx)("td",{children:t.texts[55].value}),(0,e.jsx)("td",{children:t.texts[56].value}),(0,e.jsx)("td",{children:t.texts[57].value}),(0,e.jsx)("td",{children:t.texts[58].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[59].value}),(0,e.jsxs)("td",{children:[t.texts[60].value,(0,e.jsx)("code",{children:t.texts[61].value}),t.texts[62].value,(0,e.jsx)("code",{children:t.texts[63].value}),t.texts[64].value,(0,e.jsx)("code",{children:t.texts[65].value}),t.texts[66].value,(0,e.jsx)("code",{children:t.texts[67].value}),t.texts[68].value,(0,e.jsx)("code",{children:t.texts[69].value}),t.texts[70].value,(0,e.jsx)("code",{children:t.texts[71].value}),t.texts[72].value,(0,e.jsx)("code",{children:t.texts[73].value})]}),(0,e.jsx)("td",{children:t.texts[74].value}),(0,e.jsx)("td",{children:t.texts[75].value}),(0,e.jsx)("td",{children:t.texts[76].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[77].value}),(0,e.jsx)("td",{children:t.texts[78].value}),(0,e.jsx)("td",{children:t.texts[79].value}),(0,e.jsx)("td",{children:t.texts[80].value}),(0,e.jsx)("td",{children:t.texts[81].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[82].value}),(0,e.jsx)("td",{children:t.texts[83].value}),(0,e.jsx)("td",{children:t.texts[84].value}),(0,e.jsx)("td",{children:t.texts[85].value}),(0,e.jsx)("td",{children:t.texts[86].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[87].value}),(0,e.jsx)("td",{children:t.texts[88].value}),(0,e.jsx)("td",{children:t.texts[89].value}),(0,e.jsx)("td",{children:t.texts[90].value}),(0,e.jsx)("td",{children:t.texts[91].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[92].value}),(0,e.jsx)("td",{children:t.texts[93].value}),(0,e.jsx)("td",{children:t.texts[94].value}),(0,e.jsx)("td",{children:t.texts[95].value}),(0,e.jsx)("td",{children:t.texts[96].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[97].value}),(0,e.jsx)("td",{children:t.texts[98].value}),(0,e.jsx)("td",{children:t.texts[99].value}),(0,e.jsx)("td",{children:t.texts[100].value}),(0,e.jsx)("td",{children:t.texts[101].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[102].value}),(0,e.jsx)("td",{children:t.texts[103].value}),(0,e.jsx)("td",{children:t.texts[104].value}),(0,e.jsx)("td",{children:t.texts[105].value}),(0,e.jsx)("td",{children:t.texts[106].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[107].value}),(0,e.jsx)("td",{children:t.texts[108].value}),(0,e.jsx)("td",{children:t.texts[109].value}),(0,e.jsx)("td",{children:t.texts[110].value}),(0,e.jsx)("td",{children:t.texts[111].value})]})]})]})]})})})})}n.default=c},215:function(l,n,d){d.d(n,{Z:function(){return a.Z}});var a=d(42486)},52541:function(l,n,d){d.r(n),d.d(n,{texts:function(){return a}});const a=[{value:"\u591A\u5C42\u7EA7\u6570\u636E\u7684\u9009\u62E9\u3002",paraId:0},{value:"\u9700\u8981\u4ECE\u4E00\u7EC4\u76F8\u5173\u8054\u7684\u6570\u636E\u96C6\u5408\u8FDB\u884C\u9009\u62E9\uFF0C\u4F8B\u5982\u7701\u5E02\u533A\uFF0C\u516C\u53F8\u5C42\u7EA7\uFF0C\u4E8B\u7269\u5206\u7C7B\u7B49\u3002",paraId:1,tocIndex:0},{value:`class AntdCascaderDemo extends StatelessWidget {
  const AntdCascaderDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdButton(
          child: const Text("\u9009\u62E9"),
          onTap: () {
            AntdLayer.open(AntdCascader(
                onConfirm: (values) {
                  AntdToast.show(values.join(","));
                },
                onCancel: (values) {
                  AntdToast.show(values.join(","));
                },
                titleWidget: const Text("\u5730\u5740\u9009\u62E9"),
                cascaderView:
                    const AntdCascaderView(options: cascaderOptions)));
          })
    ]);
  }
}

`,paraId:2,tocIndex:2},{value:`
  `,paraId:3},{value:"\u5C5E\u6027\u540D",paraId:4,tocIndex:3},{value:"\u8BF4\u660E",paraId:4,tocIndex:3},{value:"\u7C7B\u578B",paraId:4,tocIndex:3},{value:"\u9ED8\u8BA4\u503C",paraId:4,tocIndex:3},{value:"\u7248\u672C",paraId:4,tocIndex:3},{value:"key",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"Key",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"style",paraId:4,tocIndex:3},{value:"\u6837\u5F0F",paraId:4,tocIndex:3},{value:"AntdCascaderStyle",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"styleBuilder",paraId:4,tocIndex:3},{value:"\u52A8\u6001\u6837\u5F0F",paraId:4,tocIndex:3},{value:"AntdStyleBuilder<AntdCascaderStyle, AntdCascader>",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"onClosed",paraId:4,tocIndex:3},{value:"\u5B8C\u5168\u5173\u95ED\u540E\u89E6\u53D1",paraId:4,tocIndex:3},{value:"VoidCallback",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"onOpened",paraId:4,tocIndex:3},{value:"\u5B8C\u5168\u5C55\u793A\u540E\u89E6\u53D1",paraId:4,tocIndex:3},{value:"VoidCallback",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"onMaskTap",paraId:4,tocIndex:3},{value:"\u70B9\u51FB\u8499\u5C42\u81EA\u8EAB\u89E6\u53D1,mask\u4E3Atrue\u624D\u6709\u6548",paraId:4,tocIndex:3},{value:"VoidCallback",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"dismissOnMaskTap",paraId:4,tocIndex:3},{value:"\u70B9\u51FB\u80CC\u666F\u677F\u662F\u5426\u5173\u95ED,mask\u4E3Atrue\u624D\u6709\u6548",paraId:4,tocIndex:3},{value:"bool",paraId:4,tocIndex:3},{value:"true",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"showMask",paraId:4,tocIndex:3},{value:"\u662F\u5426\u663E\u793A\u80CC\u666F\u8499\u7248",paraId:4,tocIndex:3},{value:"bool",paraId:4,tocIndex:3},{value:"true",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"animationDuration",paraId:4,tocIndex:3},{value:"\u5185\u5BB9\u52A8\u753B\u65F6\u957F",paraId:4,tocIndex:3},{value:"Duration",paraId:4,tocIndex:3},{value:"const Duration(milliseconds: 400)",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"closeIcon",paraId:4,tocIndex:3},{value:"\u81EA\u5B9A\u4E49\u5173\u95ED\u6309\u94AE\u56FE\u6807",paraId:4,tocIndex:3},{value:"Widget",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"position",paraId:4,tocIndex:3},{value:"\u5F39\u51FA\u4F4D\u7F6E:",paraId:4,tocIndex:3},{value:"top",paraId:4,tocIndex:3},{value:" | ",paraId:4,tocIndex:3},{value:"bottom",paraId:4,tocIndex:3},{value:" | ",paraId:4,tocIndex:3},{value:"left",paraId:4,tocIndex:3},{value:" | ",paraId:4,tocIndex:3},{value:"right",paraId:4,tocIndex:3},{value:" | ",paraId:4,tocIndex:3},{value:"horizontal",paraId:4,tocIndex:3},{value:" | ",paraId:4,tocIndex:3},{value:"vertical",paraId:4,tocIndex:3},{value:" | ",paraId:4,tocIndex:3},{value:"all",paraId:4,tocIndex:3},{value:"AntdPosition",paraId:4,tocIndex:3},{value:"bottom",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"avoidKeyboard",paraId:4,tocIndex:3},{value:"\u5F53\u5E95\u90E8\u5F39\u51FA\u5F0F \u907F\u514D\u952E\u76D8\u906E\u6321",paraId:4,tocIndex:3},{value:"bool",paraId:4,tocIndex:3},{value:"true",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"cancelWidget",paraId:4,tocIndex:3},{value:"\u53D6\u6D88\u6309\u94AE",paraId:4,tocIndex:3},{value:"Widget",paraId:4,tocIndex:3},{value:'const Text("\u53D6\u6D88")',paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"confirmWidget",paraId:4,tocIndex:3},{value:"\u786E\u8BA4\u6309\u94AE",paraId:4,tocIndex:3},{value:"Widget",paraId:4,tocIndex:3},{value:'const Text("\u786E\u5B9A")',paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"titleWidget",paraId:4,tocIndex:3},{value:"\u6807\u9898",paraId:4,tocIndex:3},{value:"Widget",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"onConfirm",paraId:4,tocIndex:3},{value:"\u53D6\u6D88\u4E8B\u4EF6",paraId:4,tocIndex:3},{value:"ValueChanged<List<String>>",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"onCancel",paraId:4,tocIndex:3},{value:"\u786E\u8BA4\u4E8B\u4EF6",paraId:4,tocIndex:3},{value:"ValueChanged<List<String>>",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"cascaderView",paraId:4,tocIndex:3},{value:"\u9009\u62E9\u5668",paraId:4,tocIndex:3},{value:"AntdCascaderView",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3}]}}]);
