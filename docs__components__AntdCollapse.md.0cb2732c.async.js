"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[6481,9614],{81227:function(x,a,d){d.r(a);var l=d(47420),u=d(3372),_=d(8086),h=d(21623),I=d(61286),s=d(18326),r=d(90871),v=d(90715),p=d(77171),j=d(3500),m=d(92181),y=d(2249),f=d(25329),n=d(50100),o=d(7580),c=d(75271),t=d(45818),e=d(52676);function i(){return(0,e.jsx)(n.dY,{children:(0,e.jsx)(c.Suspense,{fallback:(0,e.jsx)(o.Z,{}),children:(0,e.jsx)(e.Fragment,{children:(0,e.jsxs)("div",{className:"markdown",children:[(0,e.jsx)("p",{children:t.texts[0].value}),(0,e.jsxs)("h2",{id:"\u4F55\u65F6\u4F7F\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4F55\u65F6\u4F7F\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4F55\u65F6\u4F7F\u7528"]}),(0,e.jsx)("p",{children:t.texts[1].value}),(0,e.jsxs)("h2",{id:"\u4EE3\u7801\u5C55\u793A",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4EE3\u7801\u5C55\u793A",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4EE3\u7801\u5C55\u793A"]}),(0,e.jsxs)("div",{className:"preview-container",children:[(0,e.jsx)("div",{className:"phone-preview",children:(0,e.jsx)("iframe",{src:"https://opensourcenocode.github.io/antd-flutter?target=AntdCollapse"})}),(0,e.jsxs)("div",{style:{flex:"1"},children:[(0,e.jsxs)("h3",{id:"\u4E8B\u4EF6",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4E8B\u4EF6",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4E8B\u4EF6"]}),(0,e.jsx)(s.Z,{lang:"dart",children:t.texts[2].value}),(0,e.jsxs)("h3",{id:"\u6837\u5F0F",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u6837\u5F0F",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u6837\u5F0F"]}),(0,e.jsx)(s.Z,{lang:"dart",children:t.texts[3].value}),(0,e.jsxs)("h3",{id:"\u52A8\u6001\u5185\u5BB9",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u52A8\u6001\u5185\u5BB9",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u52A8\u6001\u5185\u5BB9"]}),(0,e.jsx)(s.Z,{lang:"dart",children:t.texts[4].value})]})]}),t.texts[5].value,(0,e.jsx)("style",{dangerouslySetInnerHTML:{__html:`
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
`}}),(0,e.jsxs)("h2",{id:"\u5C5E\u6027",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5C5E\u6027",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5C5E\u6027"]}),(0,e.jsxs)(r.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[6].value}),(0,e.jsx)("th",{children:t.texts[7].value}),(0,e.jsx)("th",{children:t.texts[8].value}),(0,e.jsx)("th",{children:t.texts[9].value}),(0,e.jsx)("th",{children:t.texts[10].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[11].value}),(0,e.jsx)("td",{children:t.texts[12].value}),(0,e.jsx)("td",{children:t.texts[13].value}),(0,e.jsx)("td",{children:t.texts[14].value}),(0,e.jsx)("td",{children:t.texts[15].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[16].value}),(0,e.jsx)("td",{children:t.texts[17].value}),(0,e.jsx)("td",{children:t.texts[18].value}),(0,e.jsx)("td",{children:t.texts[19].value}),(0,e.jsx)("td",{children:t.texts[20].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[21].value}),(0,e.jsx)("td",{children:t.texts[22].value}),(0,e.jsx)("td",{children:t.texts[23].value}),(0,e.jsx)("td",{children:t.texts[24].value}),(0,e.jsx)("td",{children:t.texts[25].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[26].value}),(0,e.jsx)("td",{children:t.texts[27].value}),(0,e.jsx)("td",{children:t.texts[28].value}),(0,e.jsx)("td",{children:t.texts[29].value}),(0,e.jsx)("td",{children:t.texts[30].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[31].value}),(0,e.jsx)("td",{children:t.texts[32].value}),(0,e.jsx)("td",{children:t.texts[33].value}),(0,e.jsx)("td",{children:t.texts[34].value}),(0,e.jsx)("td",{children:t.texts[35].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[36].value}),(0,e.jsx)("td",{children:t.texts[37].value}),(0,e.jsx)("td",{children:t.texts[38].value}),(0,e.jsx)("td",{children:t.texts[39].value}),(0,e.jsx)("td",{children:t.texts[40].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[41].value}),(0,e.jsx)("td",{children:t.texts[42].value}),(0,e.jsx)("td",{children:t.texts[43].value}),(0,e.jsx)("td",{children:t.texts[44].value}),(0,e.jsx)("td",{children:t.texts[45].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[46].value}),(0,e.jsx)("td",{children:t.texts[47].value}),(0,e.jsx)("td",{children:t.texts[48].value}),(0,e.jsx)("td",{children:t.texts[49].value}),(0,e.jsx)("td",{children:t.texts[50].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[51].value}),(0,e.jsx)("td",{children:t.texts[52].value}),(0,e.jsx)("td",{children:t.texts[53].value}),(0,e.jsx)("td",{children:t.texts[54].value}),(0,e.jsx)("td",{children:t.texts[55].value})]})]})]}),(0,e.jsxs)("h2",{id:"\u6298\u53E0\u9762\u677Fcollapse\u7684\u6574\u4F53\u6837\u5F0F\u914D\u7F6Eantdcollapsestyle",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u6298\u53E0\u9762\u677Fcollapse\u7684\u6574\u4F53\u6837\u5F0F\u914D\u7F6Eantdcollapsestyle",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u6298\u53E0\u9762\u677F(Collapse)\u7684\u6574\u4F53\u6837\u5F0F\u914D\u7F6E(AntdCollapseStyle) ",(0,e.jsx)("a",{id:"AntdCollapseStyle"})]}),(0,e.jsxs)(r.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[56].value}),(0,e.jsx)("th",{children:t.texts[57].value}),(0,e.jsx)("th",{children:t.texts[58].value}),(0,e.jsx)("th",{children:t.texts[59].value}),(0,e.jsx)("th",{children:t.texts[60].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[61].value}),(0,e.jsx)("td",{children:t.texts[62].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[63].value})}),(0,e.jsx)("td",{children:t.texts[64].value}),(0,e.jsx)("td",{children:t.texts[65].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[66].value}),(0,e.jsx)("td",{children:t.texts[67].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[68].value})}),(0,e.jsx)("td",{children:t.texts[69].value}),(0,e.jsx)("td",{children:t.texts[70].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[71].value}),(0,e.jsx)("td",{children:t.texts[72].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[73].value})}),(0,e.jsx)("td",{children:t.texts[74].value}),(0,e.jsx)("td",{children:t.texts[75].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[76].value}),(0,e.jsx)("td",{children:t.texts[77].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[78].value})}),(0,e.jsx)("td",{children:t.texts[79].value}),(0,e.jsx)("td",{children:t.texts[80].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[81].value}),(0,e.jsx)("td",{children:t.texts[82].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[83].value})}),(0,e.jsx)("td",{children:t.texts[84].value}),(0,e.jsx)("td",{children:t.texts[85].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[86].value}),(0,e.jsx)("td",{children:t.texts[87].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-icon/#AntdIconStyle",children:t.texts[88].value})}),(0,e.jsx)("td",{children:t.texts[89].value}),(0,e.jsx)("td",{children:t.texts[90].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[91].value}),(0,e.jsx)("td",{children:t.texts[92].value}),(0,e.jsx)("td",{children:t.texts[93].value}),(0,e.jsx)("td",{children:t.texts[94].value}),(0,e.jsx)("td",{children:t.texts[95].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[96].value}),(0,e.jsx)("td",{children:t.texts[97].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-icon/#AntdIconStyle",children:t.texts[98].value})}),(0,e.jsx)("td",{children:t.texts[99].value}),(0,e.jsx)("td",{children:t.texts[100].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[101].value}),(0,e.jsx)("td",{children:t.texts[102].value}),(0,e.jsx)("td",{children:t.texts[103].value}),(0,e.jsx)("td",{children:t.texts[104].value}),(0,e.jsx)("td",{children:t.texts[105].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[106].value}),(0,e.jsx)("td",{children:t.texts[107].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-icon/#AntdIconStyle",children:t.texts[108].value})}),(0,e.jsx)("td",{children:t.texts[109].value}),(0,e.jsx)("td",{children:t.texts[110].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[111].value}),(0,e.jsx)("td",{children:t.texts[112].value}),(0,e.jsx)("td",{children:t.texts[113].value}),(0,e.jsx)("td",{children:t.texts[114].value}),(0,e.jsx)("td",{children:t.texts[115].value})]})]})]}),(0,e.jsxs)("h2",{id:"\u6298\u53E0\u9762\u677F\u4E2D\u7684\u5355\u4E2A\u53EF\u6298\u53E0\u9879antdcollapseitem",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u6298\u53E0\u9762\u677F\u4E2D\u7684\u5355\u4E2A\u53EF\u6298\u53E0\u9879antdcollapseitem",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u6298\u53E0\u9762\u677F\u4E2D\u7684\u5355\u4E2A\u53EF\u6298\u53E0\u9879(AntdCollapseItem) ",(0,e.jsx)("a",{id:"AntdCollapseItem"})]}),(0,e.jsxs)(r.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[116].value}),(0,e.jsx)("th",{children:t.texts[117].value}),(0,e.jsx)("th",{children:t.texts[118].value}),(0,e.jsx)("th",{children:t.texts[119].value}),(0,e.jsx)("th",{children:t.texts[120].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[121].value}),(0,e.jsx)("td",{children:t.texts[122].value}),(0,e.jsx)("td",{children:t.texts[123].value}),(0,e.jsx)("td",{children:t.texts[124].value}),(0,e.jsx)("td",{children:t.texts[125].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[126].value}),(0,e.jsx)("td",{children:t.texts[127].value}),(0,e.jsx)("td",{children:t.texts[128].value}),(0,e.jsx)("td",{children:t.texts[129].value}),(0,e.jsx)("td",{children:t.texts[130].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[131].value}),(0,e.jsx)("td",{children:t.texts[132].value}),(0,e.jsx)("td",{children:t.texts[133].value}),(0,e.jsx)("td",{children:t.texts[134].value}),(0,e.jsx)("td",{children:t.texts[135].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[136].value}),(0,e.jsx)("td",{children:t.texts[137].value}),(0,e.jsx)("td",{children:t.texts[138].value}),(0,e.jsx)("td",{children:t.texts[139].value}),(0,e.jsx)("td",{children:t.texts[140].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[141].value}),(0,e.jsx)("td",{children:t.texts[142].value}),(0,e.jsx)("td",{children:t.texts[143].value}),(0,e.jsx)("td",{children:t.texts[144].value}),(0,e.jsx)("td",{children:t.texts[145].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[146].value}),(0,e.jsx)("td",{children:t.texts[147].value}),(0,e.jsx)("td",{children:t.texts[148].value}),(0,e.jsx)("td",{children:t.texts[149].value}),(0,e.jsx)("td",{children:t.texts[150].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[151].value}),(0,e.jsx)("td",{children:t.texts[152].value}),(0,e.jsx)("td",{children:t.texts[153].value}),(0,e.jsx)("td",{children:t.texts[154].value}),(0,e.jsx)("td",{children:t.texts[155].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[156].value}),(0,e.jsx)("td",{children:t.texts[157].value}),(0,e.jsx)("td",{children:t.texts[158].value}),(0,e.jsx)("td",{children:t.texts[159].value}),(0,e.jsx)("td",{children:t.texts[160].value})]})]})]})]})})})})}a.default=i},215:function(x,a,d){d.d(a,{Z:function(){return l.Z}});var l=d(11521)},45818:function(x,a,d){d.r(a),d.d(a,{texts:function(){return l}});const l=[{value:"\u53EF\u4EE5\u6298\u53E0/\u5C55\u5F00\u7684\u5185\u5BB9\u533A\u57DF\u3002",paraId:0},{value:"\u5BF9\u590D\u6742\u533A\u57DF\u8FDB\u884C\u5206\u7EC4\u548C\u9690\u85CF\uFF0C\u4FDD\u6301\u9875\u9762\u7684\u6574\u6D01\u3002",paraId:1,tocIndex:0},{value:`class AntdCollapseDemo extends StatelessWidget {
  const AntdCollapseDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      AntdCollapse(
          value: const [1],
          onChange: (index, check) {
            AntdToast.show("\u89E6\u53D1\u4E86index:\${index},\u5F53\u524D\u9009\u4E2D:\${check}",
                position: AntdToastPosition.top);
          },
          items: const [
            AntdCollapseItem(title: Text("\u7B2C\u4E00\u9879"), content: text),
            AntdCollapseItem(title: Text("\u7B2C\u4E8C\u9879"), content: text),
            AntdCollapseItem(title: Text("\u7B2C\u4E09\u9879"), content: text)
          ])
    ]);
  }
}

`,paraId:2,tocIndex:2},{value:`class AntdCollapseStyleDemo extends StatelessWidget {
  const AntdCollapseStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdCollapse(
          style: AntdCollapseStyle(
              bodyStyle: AntdBoxStyle(
                  color: token.colorPrimary,
                  textStyle: token.font.lg.copyWith(color: token.colorWhite))),
          onChange: (index, check) {
            AntdToast.show("\u89E6\u53D1\u4E86index:\${index},\u5F53\u524D\u9009\u4E2D:\${check}",
                position: AntdToastPosition.top);
          },
          items: const [
            AntdCollapseItem(title: Text("\u7B2C13\u9879"), content: text),
            AntdCollapseItem(title: Text("\u7B2C\u4E8C\u9879"), content: text),
            AntdCollapseItem(title: Text("\u7B2C\u4E09\u9879"), content: text)
          ])
    ]);
  }
}

`,paraId:3,tocIndex:3},{value:`class _AntdCollapseLoadingDemoStateDemo extends State<AntdCollapseLoadingDemo> {
  bool loading = false;
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      AntdCollapse(
          value: [index],
          onChange: (index, check) {
            setState(() {
              this.index = check ? index : -1;
              if (check) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    loading = true;
                  });
                  Future.delayed(const Duration(seconds: 3)).then((_) {
                    setState(() {
                      loading = false;
                    });
                  });
                });
              }
            });
          },
          items: [
            AntdCollapseItem(
                title: const Text("\u7B2C\u4E00\u9879"),
                content: AntdLoading(
                    circular: true,
                    color: AntdColor.primary,
                    spinning: loading,
                    text: const Text("\u52A0\u8F7D\u4E2D"),
                    child: text)),
            const AntdCollapseItem(
                title: Text("\u7B2C\u4E8C\u9879"),
                activeIcon: AntdIcon(icon: AntdIcons.app),
                content: text),
            const AntdCollapseItem(
                title: Text("\u7B2C\u4E09\u9879"),
                activeIcon: AntdIcon(icon: AntdIcons.smile),
                content: text)
          ])
    ]);
  }
}

`,paraId:4,tocIndex:4},{value:`
  `,paraId:5},{value:"\u5C5E\u6027\u540D",paraId:6,tocIndex:5},{value:"\u8BF4\u660E",paraId:6,tocIndex:5},{value:"\u7C7B\u578B",paraId:6,tocIndex:5},{value:"\u9ED8\u8BA4\u503C",paraId:6,tocIndex:5},{value:"\u7248\u672C",paraId:6,tocIndex:5},{value:"key",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"Key",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"style",paraId:6,tocIndex:5},{value:"\u6837\u5F0F",paraId:6,tocIndex:5},{value:"AntdCollapseStyle",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"styleBuilder",paraId:6,tocIndex:5},{value:"\u52A8\u6001\u6837\u5F0F",paraId:6,tocIndex:5},{value:"AntdStyleBuilder<AntdCollapseStyle, AntdCollapse>",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"items",paraId:6,tocIndex:5},{value:"\u6EDA\u52A8\u7684\u6570\u636E",paraId:6,tocIndex:5},{value:"List<AntdCollapseItem>",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"itemBuilder",paraId:6,tocIndex:5},{value:"\u6570\u636E\u6784\u9020\u5668",paraId:6,tocIndex:5},{value:"AntdScrollItemBuilder<AntdCollapseItem, AntdCollapseController>",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"shrinkWrap",paraId:6,tocIndex:5},{value:"\u81EA\u52A8\u6269\u5C55\u9AD8\u5EA6",paraId:6,tocIndex:5},{value:"bool",paraId:6,tocIndex:5},{value:"true",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"controller",paraId:6,tocIndex:5},{value:"\u63A7\u5236\u5668",paraId:6,tocIndex:5},{value:"AntdCollapseController",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"value",paraId:6,tocIndex:5},{value:"\u6D3B\u52A8\u7684\u7D22\u5F15",paraId:6,tocIndex:5},{value:"List<int>",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"onChange",paraId:6,tocIndex:5},{value:"\u53D8\u66F4\u65F6\u51FA\u89E6\u53D1",paraId:6,tocIndex:5},{value:"AntdCollapseChange",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"-",paraId:6,tocIndex:5},{value:"\u5C5E\u6027\u540D",paraId:7,tocIndex:6},{value:"\u8BF4\u660E",paraId:7,tocIndex:6},{value:"\u7C7B\u578B",paraId:7,tocIndex:6},{value:"\u9ED8\u8BA4\u503C",paraId:7,tocIndex:6},{value:"\u7248\u672C",paraId:7,tocIndex:6},{value:"titleStyle",paraId:7,tocIndex:6},{value:"\u9762\u677F\u6807\u9898\u7684\u9ED8\u8BA4\u6837\u5F0F",paraId:7,tocIndex:6},{value:"AntdBoxStyle",paraId:8,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"bodyStyle",paraId:7,tocIndex:6},{value:"\u9762\u677F\u5185\u5BB9\u533A\u57DF\u7684\u5BB9\u5668\u6837\u5F0F",paraId:7,tocIndex:6},{value:"AntdBoxStyle",paraId:9,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"itemStyle",paraId:7,tocIndex:6},{value:"\u5355\u4E2A\u6298\u53E0\u9879\u7684\u5BB9\u5668\u6837\u5F0F",paraId:7,tocIndex:6},{value:"AntdBoxStyle",paraId:10,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"childStyle",paraId:7,tocIndex:6},{value:"\u5B50\u7C7B\u7684\u6837\u5F0F,\u5F53\u6CA1\u6709\u4F7F\u7528itemBuilder\u7684\u9ED8\u8BA4\u6837\u5F0F",paraId:7,tocIndex:6},{value:"AntdBoxStyle",paraId:11,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"contentStyle",paraId:7,tocIndex:6},{value:"\u9762\u677F\u5C55\u5F00\u65F6\u7684\u5185\u5BB9\u533A\u57DF\u6837\u5F0F",paraId:7,tocIndex:6},{value:"AntdBoxStyle",paraId:12,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"iconStyle",paraId:7,tocIndex:6},{value:"\u6298\u53E0\u56FE\u6807\u7684\u9ED8\u8BA4\u6837\u5F0F",paraId:7,tocIndex:6},{value:"AntdIconStyle",paraId:13,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"icon",paraId:7,tocIndex:6},{value:"\u9ED8\u8BA4\u72B6\u6001\u4E0B\u7684\u6298\u53E0\u56FE\u6807",paraId:7,tocIndex:6},{value:"Widget",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"activeIconStyle",paraId:7,tocIndex:6},{value:"\u5C55\u5F00\u56FE\u6807\u7684\u9ED8\u8BA4\u6837\u5F0F",paraId:7,tocIndex:6},{value:"AntdIconStyle",paraId:14,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"activeIcon",paraId:7,tocIndex:6},{value:"\u5C55\u5F00\u72B6\u6001\u4E0B\u7684\u6298\u53E0\u56FE\u6807",paraId:7,tocIndex:6},{value:"Widget",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"disableIconStyle",paraId:7,tocIndex:6},{value:"\u7981\u7528\u56FE\u6807\u7684\u9ED8\u8BA4\u6837\u5F0F",paraId:7,tocIndex:6},{value:"AntdIconStyle",paraId:15,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"disableIcon",paraId:7,tocIndex:6},{value:"\u7981\u7528\u72B6\u6001\u4E0B\u7684\u6298\u53E0\u56FE\u6807",paraId:7,tocIndex:6},{value:"Widget",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"\u5C5E\u6027\u540D",paraId:16,tocIndex:7},{value:"\u8BF4\u660E",paraId:16,tocIndex:7},{value:"\u7C7B\u578B",paraId:16,tocIndex:7},{value:"\u9ED8\u8BA4\u503C",paraId:16,tocIndex:7},{value:"\u7248\u672C",paraId:16,tocIndex:7},{value:"disabled",paraId:16,tocIndex:7},{value:"\u662F\u5426\u7981\u7528\u5F53\u524D\u6298\u53E0\u9879",paraId:16,tocIndex:7},{value:"bool",paraId:16,tocIndex:7},{value:"false",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"title",paraId:16,tocIndex:7},{value:"\u6298\u53E0\u9879\u7684\u6807\u9898\u5185\u5BB9",paraId:16,tocIndex:7},{value:"Widget",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"content",paraId:16,tocIndex:7},{value:"\u6298\u53E0\u9879\u5C55\u5F00\u65F6\u663E\u793A\u7684\u5185\u5BB9",paraId:16,tocIndex:7},{value:"Widget",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"icon",paraId:16,tocIndex:7},{value:"\u81EA\u5B9A\u4E49\u6298\u53E0\u56FE\u6807",paraId:16,tocIndex:7},{value:"Widget",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"activeIcon",paraId:16,tocIndex:7},{value:"\u5C55\u5F00\u72B6\u6001\u4E0B\u7684\u81EA\u5B9A\u4E49\u56FE\u6807",paraId:16,tocIndex:7},{value:"Widget",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"disableIcon",paraId:16,tocIndex:7},{value:"\u7981\u7528\u72B6\u6001\u4E0B\u7684\u81EA\u5B9A\u4E49\u56FE\u6807",paraId:16,tocIndex:7},{value:"Widget",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"onTap",paraId:16,tocIndex:7},{value:"\u70B9\u51FB\u6298\u53E0\u9879\u7684\u56DE\u8C03\u51FD\u6570",paraId:16,tocIndex:7},{value:"VoidCallback",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"builder",paraId:16,tocIndex:7},{value:"\u81EA\u5B9A\u4E49\u9879\u6E32\u67D3\u6784\u5EFA\u5668\uFF08\u53C2\u6570\uFF1A\u5F53\u524D\u9879\u5B9E\u4F8B/\u57FA\u7840\u5B50\u7EC4\u4EF6\uFF09",paraId:16,tocIndex:7},{value:"Widget Function(AntdCollapseItem item, Widget child)",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7},{value:"-",paraId:16,tocIndex:7}]}}]);
