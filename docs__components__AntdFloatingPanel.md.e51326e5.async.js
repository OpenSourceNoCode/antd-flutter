"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[6742,9614],{12007:function(s,d,n){n.r(d);var a=n(55110),c=n(18734),x=n(9332),h=n(14082),p=n(95238),l=n(92731),r=n(23162),v=n(74182),m=n(33729),I=n(56953),j=n(15480),f=n(96174),A=n(552),o=n(56703),_=n(27601),i=n(75271),t=n(24551),e=n(52676);function u(){return(0,e.jsx)(o.dY,{children:(0,e.jsx)(i.Suspense,{fallback:(0,e.jsx)(_.Z,{}),children:(0,e.jsx)(e.Fragment,{children:(0,e.jsxs)("div",{className:"markdown",children:[(0,e.jsx)("p",{children:t.texts[0].value}),(0,e.jsxs)("h2",{id:"\u4F55\u65F6\u4F7F\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4F55\u65F6\u4F7F\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4F55\u65F6\u4F7F\u7528"]}),(0,e.jsx)("p",{children:t.texts[1].value}),(0,e.jsxs)("h2",{id:"\u4EE3\u7801\u5C55\u793A",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4EE3\u7801\u5C55\u793A",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4EE3\u7801\u5C55\u793A"]}),(0,e.jsxs)("div",{className:"preview-container",children:[(0,e.jsx)("div",{className:"phone-preview",children:(0,e.jsx)("iframe",{src:"https://opensourcenocode.github.io/antd-flutter?target=AntdFloatingPanel"})}),(0,e.jsxs)("div",{style:{flex:"1"},children:[(0,e.jsxs)("h3",{id:"\u57FA\u7840\u4F7F\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u57FA\u7840\u4F7F\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u57FA\u7840\u4F7F\u7528"]}),(0,e.jsx)(l.Z,{lang:"dart",children:t.texts[2].value}),(0,e.jsxs)("h3",{id:"\u9876\u90E8\u7684\u9762\u677F",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u9876\u90E8\u7684\u9762\u677F",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u9876\u90E8\u7684\u9762\u677F"]}),(0,e.jsx)(l.Z,{lang:"dart",children:t.texts[3].value}),(0,e.jsxs)("h3",{id:"\u56FA\u5B9A\u62D6\u62FD\u533A\u57DF",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u56FA\u5B9A\u62D6\u62FD\u533A\u57DF",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u56FA\u5B9A\u62D6\u62FD\u533A\u57DF"]}),(0,e.jsx)(l.Z,{lang:"dart",children:t.texts[4].value}),(0,e.jsxs)("h3",{id:"\u81EA\u5B9A\u4E49\u6307\u793A\u706F",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u81EA\u5B9A\u4E49\u6307\u793A\u706F",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u81EA\u5B9A\u4E49\u6307\u793A\u706F"]}),(0,e.jsx)(l.Z,{lang:"dart",children:t.texts[5].value})]})]}),t.texts[6].value,(0,e.jsx)("style",{dangerouslySetInnerHTML:{__html:`
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
`}}),(0,e.jsxs)("h2",{id:"\u5C5E\u6027",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5C5E\u6027",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5C5E\u6027"]}),(0,e.jsxs)(r.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[7].value}),(0,e.jsx)("th",{children:t.texts[8].value}),(0,e.jsx)("th",{children:t.texts[9].value}),(0,e.jsx)("th",{children:t.texts[10].value}),(0,e.jsx)("th",{children:t.texts[11].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[12].value}),(0,e.jsx)("td",{children:t.texts[13].value}),(0,e.jsx)("td",{children:t.texts[14].value}),(0,e.jsx)("td",{children:t.texts[15].value}),(0,e.jsx)("td",{children:t.texts[16].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[17].value}),(0,e.jsx)("td",{children:t.texts[18].value}),(0,e.jsx)("td",{children:t.texts[19].value}),(0,e.jsx)("td",{children:t.texts[20].value}),(0,e.jsx)("td",{children:t.texts[21].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[22].value}),(0,e.jsx)("td",{children:t.texts[23].value}),(0,e.jsx)("td",{children:t.texts[24].value}),(0,e.jsx)("td",{children:t.texts[25].value}),(0,e.jsx)("td",{children:t.texts[26].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[27].value}),(0,e.jsx)("td",{children:t.texts[28].value}),(0,e.jsx)("td",{children:t.texts[29].value}),(0,e.jsx)("td",{children:t.texts[30].value}),(0,e.jsx)("td",{children:t.texts[31].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[32].value}),(0,e.jsx)("td",{children:t.texts[33].value}),(0,e.jsx)("td",{children:t.texts[34].value}),(0,e.jsx)("td",{children:t.texts[35].value}),(0,e.jsx)("td",{children:t.texts[36].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[37].value}),(0,e.jsx)("td",{children:t.texts[38].value}),(0,e.jsx)("td",{children:t.texts[39].value}),(0,e.jsx)("td",{children:t.texts[40].value}),(0,e.jsx)("td",{children:t.texts[41].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[42].value}),(0,e.jsx)("td",{children:t.texts[43].value}),(0,e.jsx)("td",{children:t.texts[44].value}),(0,e.jsx)("td",{children:t.texts[45].value}),(0,e.jsx)("td",{children:t.texts[46].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[47].value}),(0,e.jsx)("td",{children:t.texts[48].value}),(0,e.jsx)("td",{children:t.texts[49].value}),(0,e.jsx)("td",{children:t.texts[50].value}),(0,e.jsx)("td",{children:t.texts[51].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[52].value}),(0,e.jsxs)("td",{children:[t.texts[53].value,(0,e.jsx)("code",{children:t.texts[54].value}),t.texts[55].value,(0,e.jsx)("code",{children:t.texts[56].value})]}),(0,e.jsx)("td",{children:t.texts[57].value}),(0,e.jsx)("td",{children:t.texts[58].value}),(0,e.jsx)("td",{children:t.texts[59].value})]})]})]}),(0,e.jsxs)("h2",{id:"\u6D6E\u52A8\u9762\u677Ffloatingpanel\u7684\u6837\u5F0F\u914D\u7F6Eantdfloatingpanelstyle",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u6D6E\u52A8\u9762\u677Ffloatingpanel\u7684\u6837\u5F0F\u914D\u7F6Eantdfloatingpanelstyle",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u6D6E\u52A8\u9762\u677F(FloatingPanel)\u7684\u6837\u5F0F\u914D\u7F6E(AntdFloatingPanelStyle) ",(0,e.jsx)("a",{id:"AntdFloatingPanelStyle"})]}),(0,e.jsxs)(r.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[60].value}),(0,e.jsx)("th",{children:t.texts[61].value}),(0,e.jsx)("th",{children:t.texts[62].value}),(0,e.jsx)("th",{children:t.texts[63].value}),(0,e.jsx)("th",{children:t.texts[64].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[65].value}),(0,e.jsx)("td",{children:t.texts[66].value}),(0,e.jsx)("td",{children:t.texts[67].value}),(0,e.jsx)("td",{children:t.texts[68].value}),(0,e.jsx)("td",{children:t.texts[69].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[70].value}),(0,e.jsx)("td",{children:t.texts[71].value}),(0,e.jsx)("td",{children:(0,e.jsx)(o.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[72].value})}),(0,e.jsx)("td",{children:t.texts[73].value}),(0,e.jsx)("td",{children:t.texts[74].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[75].value}),(0,e.jsx)("td",{children:t.texts[76].value}),(0,e.jsx)("td",{children:(0,e.jsx)(o.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[77].value})}),(0,e.jsx)("td",{children:t.texts[78].value}),(0,e.jsx)("td",{children:t.texts[79].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[80].value}),(0,e.jsx)("td",{children:t.texts[81].value}),(0,e.jsx)("td",{children:(0,e.jsx)(o.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[82].value})}),(0,e.jsx)("td",{children:t.texts[83].value}),(0,e.jsx)("td",{children:t.texts[84].value})]})]})]})]})})})})}d.default=u},11247:function(s,d,n){n.d(d,{Z:function(){return a.Z}});var a=n(95897)},24551:function(s,d,n){n.r(d),n.d(d,{texts:function(){return a}});const a=[{value:"\u5185\u5BB9\u578B\u9762\u677F\u3002",paraId:0},{value:"\u7528\u6237\u53EF\u81EA\u7531\u7075\u6D3B\u4E0A\u4E0B\u6ED1\u52A8\u6D4F\u89C8\u5185\u5BB9\uFF0C\u5E38\u7528\u4E8E\u5730\u56FE\u5BFC\u822A\u3002",paraId:1,tocIndex:0},{value:`class AntdFloatingDemo extends StatelessWidget {
  const AntdFloatingDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdFloatingPanel(
          content: AntdList(
              shrinkWrap: true,
              items: data.map((value) {
                return Text(value);
              }).toList()),
          child: AntdBox(
              style: AntdBoxStyle(
                  width: double.infinity,
                  height: 500,
                  color: token.colorBgLayout),
              onTap: () {
                debugPrint("111");
              },
              child: const Text("\u6211\u662F\u80CC\u666F")))
    ]);
  }
}

`,paraId:2,tocIndex:2},{value:`class AntdFloatingPositionDemo extends StatelessWidget {
  const AntdFloatingPositionDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdFloatingPanel(
          position: AntdFloatingPanelPosition.top,
          anchors: const [0.3, 0.6, 0.8],
          indicator: AntdBox(
              style: AntdBoxStyle(color: token.colorPrimary),
              child: const Text("\u6211\u662F\u6307\u793A\u706F")),
          content: SizedBox(
              height: 400,
              child: AntdList(
                  items: data.map((value) {
                return Text(value);
              }).toList())),
          child: AntdBox(
              onTap: () {
                AntdToast.show("\u80CC\u666F\u70B9\u51FB\u4E8B\u4EF6");
              },
              style: AntdBoxStyle(
                  width: double.infinity,
                  height: 500,
                  color: token.colorBgLayout),
              child: const Text("\u6211\u662F\u80CC\u666F\u5185\u5BB9\uFF0C\u6211\u53EF\u4EE5\u88AB\u6B63\u5E38\u70B9\u51FB")))
    ]);
  }
}

`,paraId:3,tocIndex:3},{value:`class AntdFloatingAnchorsDemo extends StatelessWidget {
  const AntdFloatingAnchorsDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdFloatingPanel(
          anchors: const [0.3, 0.6, 0.8],
          content: AntdList(
              shrinkWrap: true,
              items: data.map((value) {
                return Text(value);
              }).toList()),
          child: AntdBox(
              onTap: () {
                AntdToast.show("\u80CC\u666F\u70B9\u51FB\u4E8B\u4EF6");
              },
              style: AntdBoxStyle(
                  width: double.infinity,
                  height: 500,
                  color: token.colorBgLayout),
              child: const Text("\u6211\u662F\u80CC\u666F\u5185\u5BB9\uFF0C\u6211\u53EF\u4EE5\u88AB\u6B63\u5E38\u70B9\u51FB")))
    ]);
  }
}

`,paraId:4,tocIndex:4},{value:`class AntdFloatingIndicatorDemo extends StatelessWidget {
  const AntdFloatingIndicatorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdFloatingPanel(
          anchors: const [0.3, 0.6, 0.8],
          indicator: AntdBox(
              style: AntdBoxStyle(color: token.colorPrimary),
              child: const Text("\u6211\u662F\u6307\u793A\u706F")),
          content: SizedBox(
              height: 400,
              child: AntdList(
                  items: data.map((value) {
                return Text(value);
              }).toList())),
          child: AntdBox(
              onTap: () {
                AntdToast.show("\u80CC\u666F\u70B9\u51FB\u4E8B\u4EF6");
              },
              style: AntdBoxStyle(
                  width: double.infinity,
                  height: 500,
                  color: token.colorBgLayout),
              child: const Text("\u6211\u662F\u80CC\u666F\u5185\u5BB9\uFF0C\u6211\u53EF\u4EE5\u88AB\u6B63\u5E38\u70B9\u51FB")))
    ]);
  }
}

`,paraId:5,tocIndex:5},{value:`
  `,paraId:6},{value:"\u5C5E\u6027\u540D",paraId:7,tocIndex:6},{value:"\u8BF4\u660E",paraId:7,tocIndex:6},{value:"\u7C7B\u578B",paraId:7,tocIndex:6},{value:"\u9ED8\u8BA4\u503C",paraId:7,tocIndex:6},{value:"\u7248\u672C",paraId:7,tocIndex:6},{value:"key",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"Key",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"style",paraId:7,tocIndex:6},{value:"\u6837\u5F0F",paraId:7,tocIndex:6},{value:"AntdFloatingPanelStyle",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"styleBuilder",paraId:7,tocIndex:6},{value:"\u52A8\u6001\u6837\u5F0F",paraId:7,tocIndex:6},{value:"AntdStyleBuilder<AntdFloatingPanelStyle, AntdFloatingPanel>",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"child",paraId:7,tocIndex:6},{value:"\u5B50\u7C7B",paraId:7,tocIndex:6},{value:"Widget",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"content",paraId:7,tocIndex:6},{value:"\u5185\u5BB9",paraId:7,tocIndex:6},{value:"Widget",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"anchors",paraId:7,tocIndex:6},{value:"\u53EF\u62D6\u62FD\u81F3\u54EA\u4E9B\u9AD8\u5EA6,\u5C4F\u5E55\u767E\u5206\u6BD4",paraId:7,tocIndex:6},{value:"List<double>",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"indicator",paraId:7,tocIndex:6},{value:"\u6307\u793A\u706F",paraId:7,tocIndex:6},{value:"Widget",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"onHeightChange",paraId:7,tocIndex:6},{value:"\u9AD8\u5EA6\u53D8\u5316",paraId:7,tocIndex:6},{value:"AntdFloatingPanelHeightCallback",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"position",paraId:7,tocIndex:6},{value:"\u9762\u677F\u7684\u4F4D\u7F6E:",paraId:7,tocIndex:6},{value:"top",paraId:7,tocIndex:6},{value:" | ",paraId:7,tocIndex:6},{value:"bottom",paraId:7,tocIndex:6},{value:"AntdFloatingPanelPosition",paraId:7,tocIndex:6},{value:"bottom",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"\u5C5E\u6027\u540D",paraId:8,tocIndex:7},{value:"\u8BF4\u660E",paraId:8,tocIndex:7},{value:"\u7C7B\u578B",paraId:8,tocIndex:7},{value:"\u9ED8\u8BA4\u503C",paraId:8,tocIndex:7},{value:"\u7248\u672C",paraId:8,tocIndex:7},{value:"inherit",paraId:8,tocIndex:7},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:8,tocIndex:7},{value:"bool",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"bodyStyle",paraId:8,tocIndex:7},{value:"\u9762\u677F\u5185\u5BB9\u533A\u57DF\u7684\u6837\u5F0F\uFF08\u80CC\u666F\u8272\u3001\u5185\u8FB9\u8DDD\u7B49\uFF09",paraId:8,tocIndex:7},{value:"AntdBoxStyle",paraId:9,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"headerStyle",paraId:8,tocIndex:7},{value:"\u9762\u677F\u5934\u90E8\u7684\u6837\u5F0F\uFF08\u9AD8\u5EA6\u3001\u80CC\u666F\u8272\u7B49\uFF09",paraId:8,tocIndex:7},{value:"AntdBoxStyle",paraId:10,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"indicatorStyle",paraId:8,tocIndex:7},{value:"\u62D6\u62FD\u6307\u793A\u5668\u7684\u6837\u5F0F\uFF08\u9AD8\u5EA6\u3001\u989C\u8272\u7B49\uFF09",paraId:8,tocIndex:7},{value:"AntdBoxStyle",paraId:11,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7}]}}]);
