"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[9567,9614],{99743:function(r,a,d){d.r(a);var l=d(11786),u=d(6100),i=d(11618),h=d(1522),v=d(12518),x=d(90756),s=d(98860),I=d(91613),p=d(51823),j=d(28263),m=d(33255),b=d(69830),f=d(47938),n=d(99925),_=d(31296),c=d(75271),t=d(45299),e=d(52676);function o(){return(0,e.jsx)(n.dY,{children:(0,e.jsx)(c.Suspense,{fallback:(0,e.jsx)(_.Z,{}),children:(0,e.jsx)(e.Fragment,{children:(0,e.jsxs)("div",{className:"markdown",children:[(0,e.jsxs)("p",{children:[t.texts[0].value,(0,e.jsx)(n.rU,{to:"/antd-tab",children:t.texts[1].value}),t.texts[2].value]}),(0,e.jsxs)("h2",{id:"\u4F55\u65F6\u4F7F\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4F55\u65F6\u4F7F\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4F55\u65F6\u4F7F\u7528"]}),(0,e.jsx)("p",{children:t.texts[3].value}),(0,e.jsxs)("h2",{id:"\u4EE3\u7801\u5C55\u793A",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4EE3\u7801\u5C55\u793A",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4EE3\u7801\u5C55\u793A"]}),(0,e.jsxs)("div",{className:"preview-container",children:[(0,e.jsx)("div",{className:"phone-preview",children:(0,e.jsx)("iframe",{src:"https://opensourcenocode.github.io/antd-flutter?target=AntdCapsuleTabs"})}),(0,e.jsxs)("div",{style:{flex:"1"},children:[(0,e.jsxs)("h3",{id:"\u81EA\u5B9A\u4E49\u6837\u5F0F",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u81EA\u5B9A\u4E49\u6837\u5F0F",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u81EA\u5B9A\u4E49\u6837\u5F0F"]}),(0,e.jsx)("p",{children:t.texts[4].value}),(0,e.jsx)(x.Z,{lang:"dart",children:t.texts[5].value})]})]}),t.texts[6].value,(0,e.jsx)("style",{dangerouslySetInnerHTML:{__html:`
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
`}}),(0,e.jsxs)("h2",{id:"\u5C5E\u6027",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5C5E\u6027",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5C5E\u6027"]}),(0,e.jsxs)(s.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[7].value}),(0,e.jsx)("th",{children:t.texts[8].value}),(0,e.jsx)("th",{children:t.texts[9].value}),(0,e.jsx)("th",{children:t.texts[10].value}),(0,e.jsx)("th",{children:t.texts[11].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[12].value}),(0,e.jsx)("td",{children:t.texts[13].value}),(0,e.jsx)("td",{children:t.texts[14].value}),(0,e.jsx)("td",{children:t.texts[15].value}),(0,e.jsx)("td",{children:t.texts[16].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[17].value}),(0,e.jsx)("td",{children:t.texts[18].value}),(0,e.jsx)("td",{children:t.texts[19].value}),(0,e.jsx)("td",{children:t.texts[20].value}),(0,e.jsx)("td",{children:t.texts[21].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[22].value}),(0,e.jsx)("td",{children:t.texts[23].value}),(0,e.jsx)("td",{children:t.texts[24].value}),(0,e.jsx)("td",{children:t.texts[25].value}),(0,e.jsx)("td",{children:t.texts[26].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[27].value}),(0,e.jsx)("td",{children:t.texts[28].value}),(0,e.jsx)("td",{children:t.texts[29].value}),(0,e.jsx)("td",{children:t.texts[30].value}),(0,e.jsx)("td",{children:t.texts[31].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[32].value}),(0,e.jsx)("td",{children:t.texts[33].value}),(0,e.jsx)("td",{children:t.texts[34].value}),(0,e.jsx)("td",{children:t.texts[35].value}),(0,e.jsx)("td",{children:t.texts[36].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[37].value}),(0,e.jsx)("td",{children:t.texts[38].value}),(0,e.jsx)("td",{children:t.texts[39].value}),(0,e.jsx)("td",{children:t.texts[40].value}),(0,e.jsx)("td",{children:t.texts[41].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[42].value}),(0,e.jsx)("td",{children:t.texts[43].value}),(0,e.jsx)("td",{children:t.texts[44].value}),(0,e.jsx)("td",{children:t.texts[45].value}),(0,e.jsx)("td",{children:t.texts[46].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[47].value}),(0,e.jsx)("td",{children:t.texts[48].value}),(0,e.jsx)("td",{children:t.texts[49].value}),(0,e.jsx)("td",{children:t.texts[50].value}),(0,e.jsx)("td",{children:t.texts[51].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[52].value}),(0,e.jsxs)("td",{children:[t.texts[53].value,(0,e.jsx)("code",{children:t.texts[54].value}),t.texts[55].value,(0,e.jsx)("code",{children:t.texts[56].value})]}),(0,e.jsx)("td",{children:t.texts[57].value}),(0,e.jsx)("td",{children:t.texts[58].value}),(0,e.jsx)("td",{children:t.texts[59].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[60].value}),(0,e.jsx)("td",{children:t.texts[61].value}),(0,e.jsx)("td",{children:t.texts[62].value}),(0,e.jsx)("td",{children:t.texts[63].value}),(0,e.jsx)("td",{children:t.texts[64].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[65].value}),(0,e.jsxs)("td",{children:[t.texts[66].value,(0,e.jsx)("code",{children:t.texts[67].value}),t.texts[68].value,(0,e.jsx)("code",{children:t.texts[69].value}),t.texts[70].value,(0,e.jsx)("code",{children:t.texts[71].value})]}),(0,e.jsx)("td",{children:t.texts[72].value}),(0,e.jsx)("td",{children:t.texts[73].value}),(0,e.jsx)("td",{children:t.texts[74].value})]})]})]}),(0,e.jsxs)("h2",{id:"\u6807\u7B7E\u9875\u6837\u5F0Fantdtabsstyle",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u6807\u7B7E\u9875\u6837\u5F0Fantdtabsstyle",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u6807\u7B7E\u9875\u6837\u5F0F(AntdTabsStyle) ",(0,e.jsx)("a",{id:"AntdTabsStyle"})]}),(0,e.jsxs)(s.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[75].value}),(0,e.jsx)("th",{children:t.texts[76].value}),(0,e.jsx)("th",{children:t.texts[77].value}),(0,e.jsx)("th",{children:t.texts[78].value}),(0,e.jsx)("th",{children:t.texts[79].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[80].value}),(0,e.jsx)("td",{children:t.texts[81].value}),(0,e.jsx)("td",{children:t.texts[82].value}),(0,e.jsx)("td",{children:t.texts[83].value}),(0,e.jsx)("td",{children:t.texts[84].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[85].value}),(0,e.jsx)("td",{children:t.texts[86].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[87].value})}),(0,e.jsx)("td",{children:t.texts[88].value}),(0,e.jsx)("td",{children:t.texts[89].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[90].value}),(0,e.jsx)("td",{children:t.texts[91].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[92].value})}),(0,e.jsx)("td",{children:t.texts[93].value}),(0,e.jsx)("td",{children:t.texts[94].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[95].value}),(0,e.jsx)("td",{children:t.texts[96].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[97].value})}),(0,e.jsx)("td",{children:t.texts[98].value}),(0,e.jsx)("td",{children:t.texts[99].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[100].value}),(0,e.jsx)("td",{children:t.texts[101].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[102].value})}),(0,e.jsx)("td",{children:t.texts[103].value}),(0,e.jsx)("td",{children:t.texts[104].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[105].value}),(0,e.jsx)("td",{children:t.texts[106].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[107].value})}),(0,e.jsx)("td",{children:t.texts[108].value}),(0,e.jsx)("td",{children:t.texts[109].value})]})]})]}),(0,e.jsxs)("h2",{id:"\u6807\u7B7E\u9875\u9879\u5B9A\u4E49antdtab",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u6807\u7B7E\u9875\u9879\u5B9A\u4E49antdtab",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u6807\u7B7E\u9875\u9879\u5B9A\u4E49(AntdTab) ",(0,e.jsx)("a",{id:"AntdTab"})]}),(0,e.jsxs)(s.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[110].value}),(0,e.jsx)("th",{children:t.texts[111].value}),(0,e.jsx)("th",{children:t.texts[112].value}),(0,e.jsx)("th",{children:t.texts[113].value}),(0,e.jsx)("th",{children:t.texts[114].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[115].value}),(0,e.jsx)("td",{children:t.texts[116].value}),(0,e.jsx)("td",{children:t.texts[117].value}),(0,e.jsx)("td",{children:t.texts[118].value}),(0,e.jsx)("td",{children:t.texts[119].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[120].value}),(0,e.jsx)("td",{children:t.texts[121].value}),(0,e.jsx)("td",{children:t.texts[122].value}),(0,e.jsx)("td",{children:t.texts[123].value}),(0,e.jsx)("td",{children:t.texts[124].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[125].value}),(0,e.jsx)("td",{children:t.texts[126].value}),(0,e.jsx)("td",{children:t.texts[127].value}),(0,e.jsx)("td",{children:t.texts[128].value}),(0,e.jsx)("td",{children:t.texts[129].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[130].value}),(0,e.jsx)("td",{children:t.texts[131].value}),(0,e.jsx)("td",{children:t.texts[132].value}),(0,e.jsx)("td",{children:t.texts[133].value}),(0,e.jsx)("td",{children:t.texts[134].value})]})]})]})]})})})})}a.default=o},52588:function(r,a,d){d.d(a,{Z:function(){return l.Z}});var l=d(69902)},45299:function(r,a,d){d.r(a),d.d(a,{texts:function(){return l}});const l=[{value:"\u5185\u5BB9\u7EC4\u4E4B\u95F4\u8FDB\u884C\u5BFC\u822A\u5207\u6362\u3002\u5B9E\u73B0\u81EA",paraId:0},{value:"AntdTab",paraId:1},{value:"\u652F\u6301\u4ED6\u7684\u6240\u6709\u884C\u4E3A",paraId:0},{value:"\u9009\u9879\u5361\u7684\u53E6\u5916\u4E00\u79CD\u6837\u5F0F\uFF0C\u7528\u5728\u5C55\u793A\u578B\u754C\u9762\u7684\u5217\u8868\u6216\u6A21\u5757\u4E2D\u3002",paraId:2,tocIndex:0},{value:"\u81EA\u5B9A\u4E49\u6837\u5F0F",paraId:3,tocIndex:2},{value:`class AntdCapsuleTabsStyleDemo extends StatelessWidget {
  const AntdCapsuleTabsStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdCapsuleTabs(
          style: AntdTabsStyle(
              titleStyle: AntdBoxStyle(
                  textStyle:
                      token.font.sm.copyWith(color: token.colorWarning))),
          tabs: const [
            AntdTab(title: Text("Espresso"), value: "1", child: Text("1")),
            AntdTab(title: Text("Coffee Latte"), value: "2", child: Text("2")),
            AntdTab(title: Text("Cappuccino"), value: "3", child: Text("3")),
            AntdTab(title: Text("Americano"), value: "4", child: Text("4")),
            AntdTab(title: Text("Flat White"), value: "5", child: Text("5")),
            AntdTab(
                title: Text("Caramel Macchiato"), value: "6", child: Text("6"))
          ])
    ]);
  }
}

`,paraId:4,tocIndex:2},{value:`
  `,paraId:5},{value:"\u5C5E\u6027\u540D",paraId:6,tocIndex:3},{value:"\u8BF4\u660E",paraId:6,tocIndex:3},{value:"\u7C7B\u578B",paraId:6,tocIndex:3},{value:"\u9ED8\u8BA4\u503C",paraId:6,tocIndex:3},{value:"\u7248\u672C",paraId:6,tocIndex:3},{value:"key",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"Key",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"style",paraId:6,tocIndex:3},{value:"\u6837\u5F0F",paraId:6,tocIndex:3},{value:"AntdTabsStyle",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"styleBuilder",paraId:6,tocIndex:3},{value:"\u52A8\u6001\u6837\u5F0F",paraId:6,tocIndex:3},{value:"AntdStyleBuilder<AntdTabsStyle, AntdTabs>",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"leftExtra",paraId:6,tocIndex:3},{value:"\u6807\u7B7E\u680F\u5DE6\u4FA7\u6269\u5C55\u5185\u5BB9\u533A\u57DF",paraId:6,tocIndex:3},{value:"Widget",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"rightExtra",paraId:6,tocIndex:3},{value:"\u6807\u7B7E\u680F\u53F3\u4FA7\u6269\u5C55\u5185\u5BB9\u533A\u57DF",paraId:6,tocIndex:3},{value:"Widget",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"controller",paraId:6,tocIndex:3},{value:"\u63A7\u5236\u5668",paraId:6,tocIndex:3},{value:"AntdTabController<AntdTab>",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"activeValue",paraId:6,tocIndex:3},{value:"\u9ED8\u8BA4\u9009\u4E2D\u7684\u6807\u7B7Ekey\uFF08\u4E3A\u7A7A\u65F6\u4E0D\u6FC0\u6D3B\u4EFB\u4F55\u4E00\u4E2A\uFF09",paraId:6,tocIndex:3},{value:"String",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"onChange",paraId:6,tocIndex:3},{value:"\u6807\u7B7E\u5207\u6362\u65F6\u7684\u56DE\u8C03\uFF08\u53C2\u6570\u4E3A\u5F53\u524D\u9009\u4E2Dkey\uFF09",paraId:6,tocIndex:3},{value:"AntdTabsOnChange<AntdTab>",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"tabAlignment",paraId:6,tocIndex:3},{value:"\u6807\u7B7E\u5BF9\u9F50\u65B9\u5F0F\uFF08\u5C45\u4E2D\u65F6\u4F1A\u81EA\u52A8\u542F\u7528\u6EDA\u52A8\u6216\u586B\u5145\uFF09:",paraId:6,tocIndex:3},{value:"left",paraId:6,tocIndex:3},{value:" | ",paraId:6,tocIndex:3},{value:"center",paraId:6,tocIndex:3},{value:"AntdTabAlignment",paraId:6,tocIndex:3},{value:"center",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"tabs",paraId:6,tocIndex:3},{value:"\u6807\u7B7E\u9875\u914D\u7F6E\u5217\u8868\uFF08\u81F3\u5C11\u5305\u542B\u4E00\u4E2A\u6807\u7B7E\uFF09",paraId:6,tocIndex:3},{value:"List<AntdTab>",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"hapticFeedback",paraId:6,tocIndex:3},{value:"\u5F00\u542F\u53CD\u9988:",paraId:6,tocIndex:3},{value:"light",paraId:6,tocIndex:3},{value:" | ",paraId:6,tocIndex:3},{value:"medium",paraId:6,tocIndex:3},{value:" | ",paraId:6,tocIndex:3},{value:"heavy",paraId:6,tocIndex:3},{value:"AntdHapticFeedback",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"-",paraId:6,tocIndex:3},{value:"\u5C5E\u6027\u540D",paraId:7,tocIndex:4},{value:"\u8BF4\u660E",paraId:7,tocIndex:4},{value:"\u7C7B\u578B",paraId:7,tocIndex:4},{value:"\u9ED8\u8BA4\u503C",paraId:7,tocIndex:4},{value:"\u7248\u672C",paraId:7,tocIndex:4},{value:"inherit",paraId:7,tocIndex:4},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:7,tocIndex:4},{value:"bool",paraId:7,tocIndex:4},{value:"-",paraId:7,tocIndex:4},{value:"-",paraId:7,tocIndex:4},{value:"tabStyle",paraId:7,tocIndex:4},{value:"\u6807\u7B7E\u680F\u5BB9\u5668\u6837\u5F0F",paraId:7,tocIndex:4},{value:"AntdBoxStyle",paraId:8,tocIndex:4},{value:"-",paraId:7,tocIndex:4},{value:"-",paraId:7,tocIndex:4},{value:"panelStyle",paraId:7,tocIndex:4},{value:"\u5185\u5BB9\u9762\u677F\u5BB9\u5668\u6837\u5F0F",paraId:7,tocIndex:4},{value:"AntdBoxStyle",paraId:9,tocIndex:4},{value:"-",paraId:7,tocIndex:4},{value:"-",paraId:7,tocIndex:4},{value:"titleStyle",paraId:7,tocIndex:4},{value:"\u6807\u7B7E\u6807\u9898\u9ED8\u8BA4\u6837\u5F0F",paraId:7,tocIndex:4},{value:"AntdBoxStyle",paraId:10,tocIndex:4},{value:"-",paraId:7,tocIndex:4},{value:"-",paraId:7,tocIndex:4},{value:"activeTitleStyle",paraId:7,tocIndex:4},{value:"\u9009\u4E2D\u6807\u7B7E\u6807\u9898\u6837\u5F0F",paraId:7,tocIndex:4},{value:"AntdBoxStyle",paraId:11,tocIndex:4},{value:"-",paraId:7,tocIndex:4},{value:"-",paraId:7,tocIndex:4},{value:"indicatorStyle",paraId:7,tocIndex:4},{value:"\u5E95\u90E8\u6307\u793A\u6761\u6837\u5F0F",paraId:7,tocIndex:4},{value:"AntdBoxStyle",paraId:12,tocIndex:4},{value:"-",paraId:7,tocIndex:4},{value:"-",paraId:7,tocIndex:4},{value:"\u5C5E\u6027\u540D",paraId:13,tocIndex:5},{value:"\u8BF4\u660E",paraId:13,tocIndex:5},{value:"\u7C7B\u578B",paraId:13,tocIndex:5},{value:"\u9ED8\u8BA4\u503C",paraId:13,tocIndex:5},{value:"\u7248\u672C",paraId:13,tocIndex:5},{value:"title",paraId:13,tocIndex:5},{value:"\u6807\u7B7E\u6807\u9898\u5185\u5BB9\u7EC4\u4EF6",paraId:13,tocIndex:5},{value:"Widget",paraId:13,tocIndex:5},{value:"-",paraId:13,tocIndex:5},{value:"-",paraId:13,tocIndex:5},{value:"value",paraId:13,tocIndex:5},{value:"\u6807\u7B7E\u552F\u4E00\u6807\u8BC6\uFF08\u9ED8\u8BA4\u4F7F\u7528\u7D22\u5F15\uFF09",paraId:13,tocIndex:5},{value:"String",paraId:13,tocIndex:5},{value:"-",paraId:13,tocIndex:5},{value:"-",paraId:13,tocIndex:5},{value:"disabled",paraId:13,tocIndex:5},{value:"\u662F\u5426\u7981\u7528\u5F53\u524D\u6807\u7B7E",paraId:13,tocIndex:5},{value:"bool",paraId:13,tocIndex:5},{value:"-",paraId:13,tocIndex:5},{value:"-",paraId:13,tocIndex:5},{value:"child",paraId:13,tocIndex:5},{value:"\u6807\u7B7E\u9875\u5BF9\u5E94\u7684\u5185\u5BB9\u7EC4\u4EF6",paraId:13,tocIndex:5},{value:"Widget",paraId:13,tocIndex:5},{value:"-",paraId:13,tocIndex:5},{value:"-",paraId:13,tocIndex:5}]}}]);
