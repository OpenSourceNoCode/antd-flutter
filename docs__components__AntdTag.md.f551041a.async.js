"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[8625,9614],{86845:function(s,n,d){d.r(n);var a=d(41332),u=d(26069),i=d(28610),h=d(30200),v=d(79722),r=d(75299),_=d(58602),p=d(69091),I=d(65935),m=d(54067),j=d(13664),f=d(35064),y=d(70702),l=d(15177),o=d(4393),c=d(75271),t=d(19746),e=d(52676);function x(){return(0,e.jsx)(l.dY,{children:(0,e.jsx)(c.Suspense,{fallback:(0,e.jsx)(o.Z,{}),children:(0,e.jsx)(e.Fragment,{children:(0,e.jsxs)("div",{className:"markdown",children:[(0,e.jsx)("p",{children:t.texts[0].value}),(0,e.jsxs)("h2",{id:"\u4F55\u65F6\u4F7F\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4F55\u65F6\u4F7F\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4F55\u65F6\u4F7F\u7528"]}),(0,e.jsx)("p",{children:t.texts[1].value}),(0,e.jsxs)("h2",{id:"\u4EE3\u7801\u5C55\u793A",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4EE3\u7801\u5C55\u793A",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4EE3\u7801\u5C55\u793A"]}),(0,e.jsxs)("div",{className:"preview-container",children:[(0,e.jsx)("div",{className:"phone-preview",children:(0,e.jsx)("iframe",{src:"https://opensourcenocode.github.io/antd-flutter?target=AntdTag"})}),(0,e.jsxs)("div",{style:{flex:"1"},children:[(0,e.jsxs)("h3",{id:"\u4E8B\u4EF6",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4E8B\u4EF6",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4E8B\u4EF6"]}),(0,e.jsx)(r.Z,{lang:"dart",children:t.texts[2].value}),(0,e.jsxs)("h3",{id:"\u81EA\u5B9A\u4E49\u6837\u5F0F",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u81EA\u5B9A\u4E49\u6837\u5F0F",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u81EA\u5B9A\u4E49\u6837\u5F0F"]}),(0,e.jsx)(r.Z,{lang:"dart",children:t.texts[3].value})]})]}),t.texts[4].value,(0,e.jsx)("style",{dangerouslySetInnerHTML:{__html:`
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
`}}),(0,e.jsxs)("h2",{id:"\u5C5E\u6027",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5C5E\u6027",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5C5E\u6027"]}),(0,e.jsxs)(_.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[5].value}),(0,e.jsx)("th",{children:t.texts[6].value}),(0,e.jsx)("th",{children:t.texts[7].value}),(0,e.jsx)("th",{children:t.texts[8].value}),(0,e.jsx)("th",{children:t.texts[9].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[10].value}),(0,e.jsx)("td",{children:t.texts[11].value}),(0,e.jsx)("td",{children:t.texts[12].value}),(0,e.jsx)("td",{children:t.texts[13].value}),(0,e.jsx)("td",{children:t.texts[14].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[15].value}),(0,e.jsx)("td",{children:t.texts[16].value}),(0,e.jsx)("td",{children:t.texts[17].value}),(0,e.jsx)("td",{children:t.texts[18].value}),(0,e.jsx)("td",{children:t.texts[19].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[20].value}),(0,e.jsx)("td",{children:t.texts[21].value}),(0,e.jsx)("td",{children:t.texts[22].value}),(0,e.jsx)("td",{children:t.texts[23].value}),(0,e.jsx)("td",{children:t.texts[24].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[25].value}),(0,e.jsxs)("td",{children:[t.texts[26].value,(0,e.jsx)("code",{children:t.texts[27].value}),t.texts[28].value,(0,e.jsx)("code",{children:t.texts[29].value}),t.texts[30].value,(0,e.jsx)("code",{children:t.texts[31].value}),t.texts[32].value,(0,e.jsx)("code",{children:t.texts[33].value}),t.texts[34].value,(0,e.jsx)("code",{children:t.texts[35].value}),t.texts[36].value,(0,e.jsx)("code",{children:t.texts[37].value}),t.texts[38].value,(0,e.jsx)("code",{children:t.texts[39].value})]}),(0,e.jsx)("td",{children:t.texts[40].value}),(0,e.jsx)("td",{children:t.texts[41].value}),(0,e.jsx)("td",{children:t.texts[42].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[43].value}),(0,e.jsxs)("td",{children:[t.texts[44].value,(0,e.jsx)("code",{children:t.texts[45].value}),t.texts[46].value,(0,e.jsx)("code",{children:t.texts[47].value})]}),(0,e.jsx)("td",{children:t.texts[48].value}),(0,e.jsx)("td",{children:t.texts[49].value}),(0,e.jsx)("td",{children:t.texts[50].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[51].value}),(0,e.jsx)("td",{children:t.texts[52].value}),(0,e.jsx)("td",{children:t.texts[53].value}),(0,e.jsx)("td",{children:t.texts[54].value}),(0,e.jsx)("td",{children:t.texts[55].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[56].value}),(0,e.jsx)("td",{children:t.texts[57].value}),(0,e.jsx)("td",{children:t.texts[58].value}),(0,e.jsx)("td",{children:t.texts[59].value}),(0,e.jsx)("td",{children:t.texts[60].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[61].value}),(0,e.jsx)("td",{children:t.texts[62].value}),(0,e.jsx)("td",{children:t.texts[63].value}),(0,e.jsx)("td",{children:t.texts[64].value}),(0,e.jsx)("td",{children:t.texts[65].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[66].value}),(0,e.jsx)("td",{children:t.texts[67].value}),(0,e.jsx)("td",{children:t.texts[68].value}),(0,e.jsx)("td",{children:t.texts[69].value}),(0,e.jsx)("td",{children:t.texts[70].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[71].value}),(0,e.jsx)("td",{children:t.texts[72].value}),(0,e.jsx)("td",{children:t.texts[73].value}),(0,e.jsx)("td",{children:t.texts[74].value}),(0,e.jsx)("td",{children:t.texts[75].value})]})]})]}),(0,e.jsxs)("h2",{id:"\u6807\u7B7E\u6837\u5F0Fantdtagstyle",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u6807\u7B7E\u6837\u5F0Fantdtagstyle",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u6807\u7B7E\u6837\u5F0F(AntdTagStyle) ",(0,e.jsx)("a",{id:"AntdTagStyle"})]}),(0,e.jsxs)(_.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[76].value}),(0,e.jsx)("th",{children:t.texts[77].value}),(0,e.jsx)("th",{children:t.texts[78].value}),(0,e.jsx)("th",{children:t.texts[79].value}),(0,e.jsx)("th",{children:t.texts[80].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[81].value}),(0,e.jsx)("td",{children:t.texts[82].value}),(0,e.jsx)("td",{children:t.texts[83].value}),(0,e.jsx)("td",{children:t.texts[84].value}),(0,e.jsx)("td",{children:t.texts[85].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[86].value}),(0,e.jsx)("td",{children:t.texts[87].value}),(0,e.jsx)("td",{children:(0,e.jsx)(l.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[88].value})}),(0,e.jsx)("td",{children:t.texts[89].value}),(0,e.jsx)("td",{children:t.texts[90].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[91].value}),(0,e.jsx)("td",{children:t.texts[92].value}),(0,e.jsx)("td",{children:(0,e.jsx)(l.rU,{to:"/components/antd-icon/#AntdIconStyle",children:t.texts[93].value})}),(0,e.jsx)("td",{children:t.texts[94].value}),(0,e.jsx)("td",{children:t.texts[95].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[96].value}),(0,e.jsx)("td",{children:t.texts[97].value}),(0,e.jsx)("td",{children:(0,e.jsx)(l.rU,{to:"/components/antd-flex/#AntdFlexStyle",children:t.texts[98].value})}),(0,e.jsx)("td",{children:t.texts[99].value}),(0,e.jsx)("td",{children:t.texts[100].value})]})]})]})]})})})})}n.default=x},19604:function(s,n,d){d.d(n,{Z:function(){return a.Z}});var a=d(45456)},19746:function(s,n,d){d.r(n),d.d(n,{texts:function(){return a}});const a=[{value:"\u8FDB\u884C\u6807\u8BB0\u548C\u5206\u7C7B\u7684\u5C0F\u6807\u7B7E\u3002",paraId:0},{value:"\u9002\u7528\u4E8E\u6807\u8BB0\u4E8B\u7269\u7684\u5C5E\u6027\u548C\u7EF4\u5EA6\u3002",paraId:1,tocIndex:0},{value:`class AntdTagRoundDemo extends StatelessWidget {
  const AntdTagRoundDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdTag(
          onTap: () {
            AntdToast.show("\u89E6\u6478\u4E86");
          },
          color: AntdColor.primary,
          child: const Text("\u89E6\u6478\u4E8B\u4EF6")),
      AntdTag(
          onTap: () {
            AntdToast.show("\u6211\u662F\u89E6\u6478\u4E8B\u4EF6");
          },
          onClose: () {
            AntdToast.show("\u6211\u662F\u5173\u95ED\u4E8B\u4EF6");
          },
          color: AntdColor.primary,
          round: true,
          close: const AntdIcon(icon: AntdIcons.close),
          child: const Text("\u5173\u95ED\u4E8B\u4EF6"))
    ]);
  }
}

`,paraId:2,tocIndex:2},{value:`class AntdTagCustomDemo extends StatelessWidget {
  const AntdTagCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdTag(
          style: AntdTagStyle(
              bodyStyle:
                  AntdBoxStyle(color: token.colorPrimary, padding: 4.all),
              closeIconStyle: AntdIconStyle(
                  bodyStyle: AntdBoxStyle(color: token.colorWarning))),
          close: const AntdBox(child: Text("\u53D6\u6D88")),
          child: const Text("\u81EA\u5B9A\u4E49\u6837\u5F0F"))
    ]);
  }
}

`,paraId:3,tocIndex:3},{value:`
  `,paraId:4},{value:"\u5C5E\u6027\u540D",paraId:5,tocIndex:4},{value:"\u8BF4\u660E",paraId:5,tocIndex:4},{value:"\u7C7B\u578B",paraId:5,tocIndex:4},{value:"\u9ED8\u8BA4\u503C",paraId:5,tocIndex:4},{value:"\u7248\u672C",paraId:5,tocIndex:4},{value:"key",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"Key",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"style",paraId:5,tocIndex:4},{value:"\u6837\u5F0F",paraId:5,tocIndex:4},{value:"AntdTagStyle",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"styleBuilder",paraId:5,tocIndex:4},{value:"\u52A8\u6001\u6837\u5F0F",paraId:5,tocIndex:4},{value:"AntdStyleBuilder<AntdTagStyle, AntdTag>",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"color",paraId:5,tocIndex:4},{value:"\u6807\u7B7E\u8272:",paraId:5,tocIndex:4},{value:"fill",paraId:5,tocIndex:4},{value:" | ",paraId:5,tocIndex:4},{value:"primary",paraId:5,tocIndex:4},{value:" | ",paraId:5,tocIndex:4},{value:"success",paraId:5,tocIndex:4},{value:" | ",paraId:5,tocIndex:4},{value:"warning",paraId:5,tocIndex:4},{value:" | ",paraId:5,tocIndex:4},{value:"danger",paraId:5,tocIndex:4},{value:" | ",paraId:5,tocIndex:4},{value:"info",paraId:5,tocIndex:4},{value:" | ",paraId:5,tocIndex:4},{value:"link",paraId:5,tocIndex:4},{value:"AntdColor",paraId:5,tocIndex:4},{value:"primary",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"fill",paraId:5,tocIndex:4},{value:"\u586B\u5145\u6A21\u5F0F:",paraId:5,tocIndex:4},{value:"solid",paraId:5,tocIndex:4},{value:" | ",paraId:5,tocIndex:4},{value:"outline",paraId:5,tocIndex:4},{value:"AntdTagFill",paraId:5,tocIndex:4},{value:"solid",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"round",paraId:5,tocIndex:4},{value:"\u662F\u5426\u5706\u89D2",paraId:5,tocIndex:4},{value:"bool",paraId:5,tocIndex:4},{value:"false",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"close",paraId:5,tocIndex:4},{value:"\u5173\u95ED\u533A\u57DF",paraId:5,tocIndex:4},{value:"Widget",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"onClose",paraId:5,tocIndex:4},{value:"\u5173\u95ED\u4E8B\u4EF6",paraId:5,tocIndex:4},{value:"VoidCallback",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"onTap",paraId:5,tocIndex:4},{value:"\u6807\u7B7E\u70B9\u51FB\u4E8B\u4EF6",paraId:5,tocIndex:4},{value:"VoidCallback",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"child",paraId:5,tocIndex:4},{value:"\u5185\u5BB9",paraId:5,tocIndex:4},{value:"Widget",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"\u5C5E\u6027\u540D",paraId:6,tocIndex:5},{value:"\u8BF4\u660E",paraId:6,tocIndex:5},{value:"\u7C7B\u578B",paraId:6,tocIndex:5},{value:"\u9ED8\u8BA4\u503C",paraId:6,tocIndex:5},{value:"\u7248\u672C",paraId:6,tocIndex:5},{value:"inherit",paraId:6,tocIndex:5},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:6,tocIndex:5},{value:"bool",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"bodyStyle",paraId:6,tocIndex:5},{value:"\u4E3B\u4F53\u6837\u5F0F",paraId:6,tocIndex:5},{value:"AntdBoxStyle",paraId:7,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"closeIconStyle",paraId:6,tocIndex:5},{value:"\u5173\u95ED\u6837\u5F0F",paraId:6,tocIndex:5},{value:"AntdIconStyle",paraId:8,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"rowStyle",paraId:6,tocIndex:5},{value:"\u8F74\u5BF9\u9F50",paraId:6,tocIndex:5},{value:"AntdFlexStyle",paraId:9,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5}]}}]);
