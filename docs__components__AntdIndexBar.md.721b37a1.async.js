"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[7078,9614],{20223:function(r,a,d){d.r(a);var l=d(72335),i=d(56218),c=d(88362),I=d(90260),h=d(13573),s=d(71121),x=d(584),v=d(66902),p=d(31577),j=d(18525),m=d(47425),f=d(91937),y=d(87825),n=d(63016),o=d(93463),u=d(75271),t=d(86168),e=d(52676);function _(){return(0,e.jsx)(n.dY,{children:(0,e.jsx)(u.Suspense,{fallback:(0,e.jsx)(o.Z,{}),children:(0,e.jsx)(e.Fragment,{children:(0,e.jsxs)("div",{className:"markdown",children:[(0,e.jsx)("p",{children:t.texts[0].value}),(0,e.jsxs)("h2",{id:"\u4F55\u65F6\u4F7F\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4F55\u65F6\u4F7F\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4F55\u65F6\u4F7F\u7528"]}),(0,e.jsx)("p",{children:t.texts[1].value}),(0,e.jsxs)("h2",{id:"\u4EE3\u7801\u5C55\u793A",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4EE3\u7801\u5C55\u793A",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4EE3\u7801\u5C55\u793A"]}),(0,e.jsxs)("div",{className:"preview-container",children:[(0,e.jsxs)("div",{children:[(0,e.jsxs)("h3",{id:"\u4E8B\u4EF6\u5217\u8868\u7D22\u5F15\u6539\u53D8",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4E8B\u4EF6\u5217\u8868\u7D22\u5F15\u6539\u53D8",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4E8B\u4EF6\uFF0C\u5217\u8868\u7D22\u5F15\u6539\u53D8"]}),(0,e.jsx)(s.Z,{lang:"dart",children:t.texts[2].value}),(0,e.jsxs)("h3",{id:"\u8D85\u591A\u6570\u636E",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u8D85\u591A\u6570\u636E",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u8D85\u591A\u6570\u636E"]}),(0,e.jsx)("p",{children:t.texts[3].value}),(0,e.jsx)(s.Z,{lang:"dart",children:t.texts[4].value})]}),(0,e.jsx)("div",{className:"phone-preview",children:(0,e.jsx)("iframe",{src:"https://opensourcenocode.github.io/antd-flutter?target=AntdIndexBar"})})]}),t.texts[5].value,(0,e.jsx)("style",{dangerouslySetInnerHTML:{__html:`
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
`}}),(0,e.jsxs)("h2",{id:"\u5C5E\u6027",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5C5E\u6027",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5C5E\u6027"]}),(0,e.jsxs)(x.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[6].value}),(0,e.jsx)("th",{children:t.texts[7].value}),(0,e.jsx)("th",{children:t.texts[8].value}),(0,e.jsx)("th",{children:t.texts[9].value}),(0,e.jsx)("th",{children:t.texts[10].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[11].value}),(0,e.jsx)("td",{children:t.texts[12].value}),(0,e.jsx)("td",{children:t.texts[13].value}),(0,e.jsx)("td",{children:t.texts[14].value}),(0,e.jsx)("td",{children:t.texts[15].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[16].value}),(0,e.jsx)("td",{children:t.texts[17].value}),(0,e.jsx)("td",{children:t.texts[18].value}),(0,e.jsx)("td",{children:t.texts[19].value}),(0,e.jsx)("td",{children:t.texts[20].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[21].value}),(0,e.jsx)("td",{children:t.texts[22].value}),(0,e.jsx)("td",{children:t.texts[23].value}),(0,e.jsx)("td",{children:t.texts[24].value}),(0,e.jsx)("td",{children:t.texts[25].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[26].value}),(0,e.jsx)("td",{children:t.texts[27].value}),(0,e.jsx)("td",{children:t.texts[28].value}),(0,e.jsx)("td",{children:t.texts[29].value}),(0,e.jsx)("td",{children:t.texts[30].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[31].value}),(0,e.jsx)("td",{children:t.texts[32].value}),(0,e.jsx)("td",{children:t.texts[33].value}),(0,e.jsx)("td",{children:t.texts[34].value}),(0,e.jsx)("td",{children:t.texts[35].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[36].value}),(0,e.jsx)("td",{children:t.texts[37].value}),(0,e.jsx)("td",{children:t.texts[38].value}),(0,e.jsx)("td",{children:t.texts[39].value}),(0,e.jsx)("td",{children:t.texts[40].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[41].value}),(0,e.jsx)("td",{children:t.texts[42].value}),(0,e.jsx)("td",{children:t.texts[43].value}),(0,e.jsx)("td",{children:t.texts[44].value}),(0,e.jsx)("td",{children:t.texts[45].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[46].value}),(0,e.jsx)("td",{children:t.texts[47].value}),(0,e.jsx)("td",{children:t.texts[48].value}),(0,e.jsx)("td",{children:t.texts[49].value}),(0,e.jsx)("td",{children:t.texts[50].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[51].value}),(0,e.jsx)("td",{children:t.texts[52].value}),(0,e.jsx)("td",{children:t.texts[53].value}),(0,e.jsx)("td",{children:t.texts[54].value}),(0,e.jsx)("td",{children:t.texts[55].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[56].value}),(0,e.jsx)("td",{children:t.texts[57].value}),(0,e.jsx)("td",{children:t.texts[58].value}),(0,e.jsx)("td",{children:t.texts[59].value}),(0,e.jsx)("td",{children:t.texts[60].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[61].value}),(0,e.jsx)("td",{children:t.texts[62].value}),(0,e.jsx)("td",{children:t.texts[63].value}),(0,e.jsx)("td",{children:t.texts[64].value}),(0,e.jsx)("td",{children:t.texts[65].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[66].value}),(0,e.jsx)("td",{children:t.texts[67].value}),(0,e.jsx)("td",{children:t.texts[68].value}),(0,e.jsx)("td",{children:t.texts[69].value}),(0,e.jsx)("td",{children:t.texts[70].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[71].value}),(0,e.jsx)("td",{children:t.texts[72].value}),(0,e.jsx)("td",{children:t.texts[73].value}),(0,e.jsx)("td",{children:t.texts[74].value}),(0,e.jsx)("td",{children:t.texts[75].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[76].value}),(0,e.jsx)("td",{children:t.texts[77].value}),(0,e.jsx)("td",{children:t.texts[78].value}),(0,e.jsx)("td",{children:t.texts[79].value}),(0,e.jsx)("td",{children:t.texts[80].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[81].value}),(0,e.jsx)("td",{children:t.texts[82].value}),(0,e.jsx)("td",{children:t.texts[83].value}),(0,e.jsx)("td",{children:t.texts[84].value}),(0,e.jsx)("td",{children:t.texts[85].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[86].value}),(0,e.jsx)("td",{children:t.texts[87].value}),(0,e.jsx)("td",{children:t.texts[88].value}),(0,e.jsx)("td",{children:t.texts[89].value}),(0,e.jsx)("td",{children:t.texts[90].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[91].value}),(0,e.jsx)("td",{children:t.texts[92].value}),(0,e.jsx)("td",{children:t.texts[93].value}),(0,e.jsx)("td",{children:t.texts[94].value}),(0,e.jsx)("td",{children:t.texts[95].value})]})]})]}),(0,e.jsxs)("h2",{id:"\u6837\u5F0Fantdindexbarstyle",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u6837\u5F0Fantdindexbarstyle",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u6837\u5F0F(AntdIndexBarStyle) ",(0,e.jsx)("a",{id:"AntdIndexBarStyle"})]}),(0,e.jsxs)(x.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[96].value}),(0,e.jsx)("th",{children:t.texts[97].value}),(0,e.jsx)("th",{children:t.texts[98].value}),(0,e.jsx)("th",{children:t.texts[99].value}),(0,e.jsx)("th",{children:t.texts[100].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[101].value}),(0,e.jsx)("td",{children:t.texts[102].value}),(0,e.jsx)("td",{children:t.texts[103].value}),(0,e.jsx)("td",{children:t.texts[104].value}),(0,e.jsx)("td",{children:t.texts[105].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[106].value}),(0,e.jsx)("td",{children:t.texts[107].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[108].value})}),(0,e.jsx)("td",{children:t.texts[109].value}),(0,e.jsx)("td",{children:t.texts[110].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[111].value}),(0,e.jsx)("td",{children:t.texts[112].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[113].value})}),(0,e.jsx)("td",{children:t.texts[114].value}),(0,e.jsx)("td",{children:t.texts[115].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[116].value}),(0,e.jsx)("td",{children:t.texts[117].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[118].value})}),(0,e.jsx)("td",{children:t.texts[119].value}),(0,e.jsx)("td",{children:t.texts[120].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[121].value}),(0,e.jsx)("td",{children:t.texts[122].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[123].value})}),(0,e.jsx)("td",{children:t.texts[124].value}),(0,e.jsx)("td",{children:t.texts[125].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[126].value}),(0,e.jsx)("td",{children:t.texts[127].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[128].value})}),(0,e.jsx)("td",{children:t.texts[129].value}),(0,e.jsx)("td",{children:t.texts[130].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[131].value}),(0,e.jsx)("td",{children:t.texts[132].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[133].value})}),(0,e.jsx)("td",{children:t.texts[134].value}),(0,e.jsx)("td",{children:t.texts[135].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[136].value}),(0,e.jsx)("td",{children:t.texts[137].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[138].value})}),(0,e.jsx)("td",{children:t.texts[139].value}),(0,e.jsx)("td",{children:t.texts[140].value})]})]})]})]})})})})}a.default=_},215:function(r,a,d){d.d(a,{Z:function(){return l.Z}});var l=d(42486)},86168:function(r,a,d){d.r(a),d.d(a,{texts:function(){return l}});const l=[{value:"\u6839\u636E\u5B57\u6BCD A \uFF5E Z \u6392\u5217\u5185\u5BB9\u3002",paraId:0},{value:"\u9002\u7528\u4E8E\u5217\u8868\u7684\u5206\u7C7B\u663E\u793A\u548C\u5FEB\u901F\u5B9A\u4F4D\u3002",paraId:1,tocIndex:0},{value:`class AntdIndexBarDemo extends StatelessWidget {
  const AntdIndexBarDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      SizedBox(
          height: 500,
          child: AntdIndexBar<AntdIndexBarDemoData>(
              items: getDemos(10),
              onIndexChange: (context, group, index) {
                AntdToast.show("\u5F53\u524D\u7D22\u5F15:$group,$index");
              },
              headerBuilder: (context, group, index) {
                return Text("$group-$index");
              },
              indexBuilder: (context, group, index) {
                return Text(group);
              },
              itemBuilder: (entity) {
                return Text(entity.data.text);
              }))
    ]);
  }
}

`,paraId:2,tocIndex:2},{value:"\u8D85\u5927\u6570\u636E\u91CF\uFF0C\u9ED8\u8BA4\u865A\u62DF\u6EDA\u52A8",paraId:3,tocIndex:3},{value:`class AntdIndexBarBigDataDemo extends StatelessWidget {
  const AntdIndexBarBigDataDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      SizedBox(
          height: 500,
          child: AntdIndexBar<AntdIndexBarDemoData>(
              items: getDemos(1000000),
              virtual: true,
              headerBuilder: (context, group, index) {
                return Text("$group-$index");
              },
              indexBuilder: (context, group, index) {
                return Text(group);
              },
              itemBuilder: (entity) {
                return Text(entity.data.text);
              }))
    ]);
  }
}

`,paraId:4,tocIndex:3},{value:`
  `,paraId:5},{value:"\u5C5E\u6027\u540D",paraId:6,tocIndex:4},{value:"\u8BF4\u660E",paraId:6,tocIndex:4},{value:"\u7C7B\u578B",paraId:6,tocIndex:4},{value:"\u9ED8\u8BA4\u503C",paraId:6,tocIndex:4},{value:"\u7248\u672C",paraId:6,tocIndex:4},{value:"key",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"Key",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"style",paraId:6,tocIndex:4},{value:"\u6837\u5F0F",paraId:6,tocIndex:4},{value:"AntdIndexBarStyle",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"styleBuilder",paraId:6,tocIndex:4},{value:"\u52A8\u6001\u6837\u5F0F",paraId:6,tocIndex:4},{value:"AntdStyleBuilder<AntdIndexBarStyle, AntdIndexBar<T>>",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"controller",paraId:6,tocIndex:4},{value:"\u63A7\u5236\u5668",paraId:6,tocIndex:4},{value:"AntdIndexBarController<T>",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"headers",paraId:6,tocIndex:4},{value:"\u5934\u90E8\u7684sliver",paraId:6,tocIndex:4},{value:"List<Widget>",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"footers",paraId:6,tocIndex:4},{value:"\u5C3E\u90E8\u7684sliver",paraId:6,tocIndex:4},{value:"List<Widget>",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"physics",paraId:6,tocIndex:4},{value:"\u6EDA\u52A8\u7269\u7406\u6548\u679C",paraId:6,tocIndex:4},{value:"ScrollPhysics",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"virtual",paraId:6,tocIndex:4},{value:"\u542F\u52A8\u865A\u62DF\u6EDA\u52A8",paraId:6,tocIndex:4},{value:"bool",paraId:6,tocIndex:4},{value:"true",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"shrinkWrap",paraId:6,tocIndex:4},{value:"\u81EA\u52A8\u6269\u5C55\u9AD8\u5EA6",paraId:6,tocIndex:4},{value:"bool",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"items",paraId:6,tocIndex:4},{value:"\u6EDA\u52A8\u7684\u6570\u636E",paraId:6,tocIndex:4},{value:"List<T>",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"itemBuilder",paraId:6,tocIndex:4},{value:"\u6570\u636E\u6784\u9020\u5668",paraId:6,tocIndex:4},{value:"AntdScrollItemBuilder<T, AntdIndexBarController<T>>",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"viewportOffset",paraId:6,tocIndex:4},{value:"\u504F\u79FB\u4F4D\u7F6E",paraId:6,tocIndex:4},{value:"double",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"onItemPosition",paraId:6,tocIndex:4},{value:"item\u53D8\u66F4\u4E8B\u4EF6",paraId:6,tocIndex:4},{value:"AntdItemPositionListener<T>",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"headerBuilder",paraId:6,tocIndex:4},{value:"\u5217\u8868\u5185\u5934\u90E8\u6784\u5EFA",paraId:6,tocIndex:4},{value:"AntdIndexBarIndexBuilder",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"indexBuilder",paraId:6,tocIndex:4},{value:"\u7D22\u5F15\u6784\u5EFA",paraId:6,tocIndex:4},{value:"AntdIndexBarIndexBuilder",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"headerFloatBuilder",paraId:6,tocIndex:4},{value:"\u5217\u8868\u5185\u5934\u90E8\u6784\u5EFA",paraId:6,tocIndex:4},{value:"AntdIndexBarIndexBuilder",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"onIndexChange",paraId:6,tocIndex:4},{value:"\u7D22\u5F15\u53D8\u66F4\u4E8B\u4EF6",paraId:6,tocIndex:4},{value:"AntdIndexBarOnIndexChange",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"-",paraId:6,tocIndex:4},{value:"\u5C5E\u6027\u540D",paraId:7,tocIndex:5},{value:"\u8BF4\u660E",paraId:7,tocIndex:5},{value:"\u7C7B\u578B",paraId:7,tocIndex:5},{value:"\u9ED8\u8BA4\u503C",paraId:7,tocIndex:5},{value:"\u7248\u672C",paraId:7,tocIndex:5},{value:"inherit",paraId:7,tocIndex:5},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:7,tocIndex:5},{value:"bool",paraId:7,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"bodyStyle",paraId:7,tocIndex:5},{value:"\u6D6E\u52A8\u5934\u7684\u6837\u5F0F",paraId:7,tocIndex:5},{value:"AntdBoxStyle",paraId:8,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"floatHeaderStyle",paraId:7,tocIndex:5},{value:"\u6D6E\u52A8\u5934\u7684\u6837\u5F0F",paraId:7,tocIndex:5},{value:"AntdBoxStyle",paraId:9,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"headerStyle",paraId:7,tocIndex:5},{value:"header\u7684\u6837\u5F0F",paraId:7,tocIndex:5},{value:"AntdBoxStyle",paraId:10,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"itemStyle",paraId:7,tocIndex:5},{value:"item\u7684\u6837\u5F0F",paraId:7,tocIndex:5},{value:"AntdBoxStyle",paraId:11,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"indexStyle",paraId:7,tocIndex:5},{value:"\u7D22\u5F15\u7684\u6837\u5F0F",paraId:7,tocIndex:5},{value:"AntdBoxStyle",paraId:12,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"activeIndexStyle",paraId:7,tocIndex:5},{value:"\u7D22\u5F15\u7684\u6837\u5F0F",paraId:7,tocIndex:5},{value:"AntdBoxStyle",paraId:13,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"indexMask",paraId:7,tocIndex:5},{value:"\u7D22\u5F15\u7684\u6837\u5F0F",paraId:7,tocIndex:5},{value:"AntdBoxStyle",paraId:14,tocIndex:5},{value:"-",paraId:7,tocIndex:5},{value:"-",paraId:7,tocIndex:5}]}}]);
