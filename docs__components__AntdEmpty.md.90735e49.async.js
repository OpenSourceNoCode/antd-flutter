"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[5672,9614],{8223:function(s,d,n){n.r(d);var _=n(47420),c=n(3372),x=n(8086),p=n(21623),h=n(61286),l=n(18326),r=n(90871),m=n(90715),v=n(77171),I=n(3500),j=n(92181),y=n(2249),f=n(25329),a=n(50100),o=n(7580),i=n(75271),t=n(63089),e=n(52676);function u(){return(0,e.jsx)(a.dY,{children:(0,e.jsx)(i.Suspense,{fallback:(0,e.jsx)(o.Z,{}),children:(0,e.jsx)(e.Fragment,{children:(0,e.jsxs)("div",{className:"markdown",children:[(0,e.jsx)("p",{children:t.texts[0].value}),(0,e.jsxs)("h2",{id:"\u4F55\u65F6\u4F7F\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4F55\u65F6\u4F7F\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4F55\u65F6\u4F7F\u7528"]}),(0,e.jsx)("p",{children:t.texts[1].value}),(0,e.jsxs)("h2",{id:"\u4EE3\u7801\u5C55\u793A",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4EE3\u7801\u5C55\u793A",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4EE3\u7801\u5C55\u793A"]}),(0,e.jsxs)("div",{className:"preview-container",children:[(0,e.jsx)("div",{className:"phone-preview",children:(0,e.jsx)("iframe",{src:"https://opensourcenocode.github.io/antd-flutter?target=AntdEmpty"})}),(0,e.jsxs)("div",{style:{flex:"1"},children:[(0,e.jsxs)("h3",{id:"\u57FA\u7840\u7528\u6CD5",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u57FA\u7840\u7528\u6CD5",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u57FA\u7840\u7528\u6CD5"]}),(0,e.jsx)(l.Z,{lang:"dart",children:t.texts[2].value}),(0,e.jsxs)("h3",{id:"\u63CF\u8FF0\u6587\u5B57",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u63CF\u8FF0\u6587\u5B57",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u63CF\u8FF0\u6587\u5B57"]}),(0,e.jsx)(l.Z,{lang:"dart",children:t.texts[3].value}),(0,e.jsxs)("h3",{id:"\u81EA\u5B9A\u4E49\u6837\u5F0F",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u81EA\u5B9A\u4E49\u6837\u5F0F",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u81EA\u5B9A\u4E49\u6837\u5F0F"]}),(0,e.jsx)(l.Z,{lang:"dart",children:t.texts[4].value})]})]}),t.texts[5].value,(0,e.jsx)("style",{dangerouslySetInnerHTML:{__html:`
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
`}}),(0,e.jsxs)("h2",{id:"\u5C5E\u6027",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5C5E\u6027",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5C5E\u6027"]}),(0,e.jsxs)(r.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[6].value}),(0,e.jsx)("th",{children:t.texts[7].value}),(0,e.jsx)("th",{children:t.texts[8].value}),(0,e.jsx)("th",{children:t.texts[9].value}),(0,e.jsx)("th",{children:t.texts[10].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[11].value}),(0,e.jsx)("td",{children:t.texts[12].value}),(0,e.jsx)("td",{children:t.texts[13].value}),(0,e.jsx)("td",{children:t.texts[14].value}),(0,e.jsx)("td",{children:t.texts[15].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[16].value}),(0,e.jsx)("td",{children:t.texts[17].value}),(0,e.jsx)("td",{children:t.texts[18].value}),(0,e.jsx)("td",{children:t.texts[19].value}),(0,e.jsx)("td",{children:t.texts[20].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[21].value}),(0,e.jsx)("td",{children:t.texts[22].value}),(0,e.jsx)("td",{children:t.texts[23].value}),(0,e.jsx)("td",{children:t.texts[24].value}),(0,e.jsx)("td",{children:t.texts[25].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[26].value}),(0,e.jsx)("td",{children:t.texts[27].value}),(0,e.jsx)("td",{children:t.texts[28].value}),(0,e.jsx)("td",{children:t.texts[29].value}),(0,e.jsx)("td",{children:t.texts[30].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[31].value}),(0,e.jsx)("td",{children:t.texts[32].value}),(0,e.jsx)("td",{children:t.texts[33].value}),(0,e.jsx)("td",{children:t.texts[34].value}),(0,e.jsx)("td",{children:t.texts[35].value})]})]})]}),(0,e.jsxs)("h2",{id:"\u7A7A\u72B6\u6001\u6837\u5F0Fantdemptystyle",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u7A7A\u72B6\u6001\u6837\u5F0Fantdemptystyle",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u7A7A\u72B6\u6001\u6837\u5F0F(AntdEmptyStyle) ",(0,e.jsx)("a",{id:"AntdEmptyStyle"})]}),(0,e.jsxs)(r.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[36].value}),(0,e.jsx)("th",{children:t.texts[37].value}),(0,e.jsx)("th",{children:t.texts[38].value}),(0,e.jsx)("th",{children:t.texts[39].value}),(0,e.jsx)("th",{children:t.texts[40].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[41].value}),(0,e.jsx)("td",{children:t.texts[42].value}),(0,e.jsx)("td",{children:t.texts[43].value}),(0,e.jsx)("td",{children:t.texts[44].value}),(0,e.jsx)("td",{children:t.texts[45].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[46].value}),(0,e.jsx)("td",{children:t.texts[47].value}),(0,e.jsx)("td",{children:(0,e.jsx)(a.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[48].value})}),(0,e.jsx)("td",{children:t.texts[49].value}),(0,e.jsx)("td",{children:t.texts[50].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[51].value}),(0,e.jsx)("td",{children:t.texts[52].value}),(0,e.jsx)("td",{children:(0,e.jsx)(a.rU,{to:"/components/antd-flex/#AntdFlexStyle",children:t.texts[53].value})}),(0,e.jsx)("td",{children:t.texts[54].value}),(0,e.jsx)("td",{children:t.texts[55].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[56].value}),(0,e.jsx)("td",{children:t.texts[57].value}),(0,e.jsx)("td",{children:(0,e.jsx)(a.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[58].value})}),(0,e.jsx)("td",{children:t.texts[59].value}),(0,e.jsx)("td",{children:t.texts[60].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[61].value}),(0,e.jsx)("td",{children:t.texts[62].value}),(0,e.jsx)("td",{children:t.texts[63].value}),(0,e.jsx)("td",{children:t.texts[64].value}),(0,e.jsx)("td",{children:t.texts[65].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[66].value}),(0,e.jsx)("td",{children:t.texts[67].value}),(0,e.jsx)("td",{children:(0,e.jsx)(a.rU,{to:"/components/antd-image/#AntdImageStyle",children:t.texts[68].value})}),(0,e.jsx)("td",{children:t.texts[69].value}),(0,e.jsx)("td",{children:t.texts[70].value})]})]})]})]})})})})}d.default=u},215:function(s,d,n){n.d(d,{Z:function(){return _.Z}});var _=n(11521)},63089:function(s,d,n){n.r(d),n.d(d,{texts:function(){return _}});const _=[{value:"\u4F7F\u7528\u573A\u666F\u63D2\u753B\u8868\u793A\u5185\u5BB9\u4E3A\u7A7A\u3002",paraId:0},{value:"\u9002\u7528\u4E8E\u4E8E\u4FE1\u606F\u4E3A\u7A7A\u65F6\u7684\u5360\u4F4D\u63D0\u793A\u3002",paraId:1,tocIndex:0},{value:`class AntdEmptyDemo extends StatelessWidget {
  const AntdEmptyDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdEmpty(image: AntdImage(image: AssetImage("assets/images/empty.png")))
    ]);
  }
}

`,paraId:2,tocIndex:2},{value:`class AntdEmptyDescriptionDemo extends StatelessWidget {
  const AntdEmptyDescriptionDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdEmpty(
          image: AntdImage(image: AssetImage("assets/images/empty.png")),
          description: Text("\u6682\u65E0\u6570\u636E"))
    ]);
  }
}

`,paraId:3,tocIndex:3},{value:`class AntdEmptyCustomerDemo extends StatelessWidget {
  const AntdEmptyCustomerDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdEmpty(
          style: AntdEmptyStyle(
              bodyStyle: AntdBoxStyle(color: token.colorPrimary)),
          image: const AntdImage(image: AssetImage("assets/images/empty.png")),
          description: const Text("\u6682\u65E0\u6570\u636E"))
    ]);
  }
}

`,paraId:4,tocIndex:4},{value:`
  `,paraId:5},{value:"\u5C5E\u6027\u540D",paraId:6,tocIndex:5},{value:"\u8BF4\u660E",paraId:6,tocIndex:5},{value:"\u7C7B\u578B",paraId:6,tocIndex:5},{value:"\u9ED8\u8BA4\u503C",paraId:6,tocIndex:5},{value:"\u7248\u672C",paraId:6,tocIndex:5},{value:"key",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"Key",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"style",paraId:6,tocIndex:5},{value:"\u6837\u5F0F",paraId:6,tocIndex:5},{value:"AntdEmptyStyle",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"styleBuilder",paraId:6,tocIndex:5},{value:"\u52A8\u6001\u6837\u5F0F",paraId:6,tocIndex:5},{value:"AntdStyleBuilder<AntdEmptyStyle, AntdEmpty>",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"image",paraId:6,tocIndex:5},{value:"\u81EA\u5B9A\u4E49\u56FE\u6807",paraId:6,tocIndex:5},{value:"Widget",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"description",paraId:6,tocIndex:5},{value:"\u63CF\u8FF0",paraId:6,tocIndex:5},{value:"Widget",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"\u5C5E\u6027\u540D",paraId:7,tocIndex:6},{value:"\u8BF4\u660E",paraId:7,tocIndex:6},{value:"\u7C7B\u578B",paraId:7,tocIndex:6},{value:"\u9ED8\u8BA4\u503C",paraId:7,tocIndex:6},{value:"\u7248\u672C",paraId:7,tocIndex:6},{value:"inherit",paraId:7,tocIndex:6},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:7,tocIndex:6},{value:"bool",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"bodyStyle",paraId:7,tocIndex:6},{value:"\u7A7A\u72B6\u6001\u5BB9\u5668\u6837\u5F0F\uFF08\u63A7\u5236\u6574\u4F53\u5E03\u5C40\u3001\u8FB9\u8DDD\u7B49\uFF09",paraId:7,tocIndex:6},{value:"AntdBoxStyle",paraId:8,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"bodyColumnStyle",paraId:7,tocIndex:6},{value:"\u7A7A\u72B6\u6001\u5BB9\u5668\u6837\u5F0F\uFF08\u63A7\u5236\u6574\u4F53\u5E03\u5C40\u3001\u8FB9\u8DDD\u7B49\uFF09",paraId:7,tocIndex:6},{value:"AntdFlexStyle",paraId:9,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"descriptionStyle",paraId:7,tocIndex:6},{value:"\u63CF\u8FF0\u6587\u672C\u6837\u5F0F\uFF08\u63A7\u5236\u6587\u5B57\u989C\u8272\u3001\u5927\u5C0F\u3001\u95F4\u8DDD\u7B49\uFF09",paraId:7,tocIndex:6},{value:"AntdBoxStyle",paraId:10,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"image",paraId:7,tocIndex:6},{value:"\u5360\u4F4D\u7684\u56FE\u7247(\u4E5F\u53EF\u4EE5\u662F\u5176\u4ED6\u7684Widget)",paraId:7,tocIndex:6},{value:"Widget",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"imageStyle",paraId:7,tocIndex:6},{value:"\u5982\u679C\u662F\u56FE\u7247\u8FD9\u4E2A\u6837\u5F0F\u4F1A\u751F\u6548",paraId:7,tocIndex:6},{value:"AntdImageStyle",paraId:11,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6}]}}]);
