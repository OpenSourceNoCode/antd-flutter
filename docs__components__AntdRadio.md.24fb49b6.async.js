"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[6548,9614],{72822:function(r,a,d){d.r(a);var l=d(45612),i=d(51392),_=d(48838),h=d(32284),v=d(66413),s=d(57032),o=d(19259),I=d(33828),p=d(40597),j=d(33915),m=d(23293),f=d(89206),y=d(42810),n=d(94506),x=d(39922),c=d(75271),t=d(614),e=d(52676);function u(){return(0,e.jsx)(n.dY,{children:(0,e.jsx)(c.Suspense,{fallback:(0,e.jsx)(x.Z,{}),children:(0,e.jsx)(e.Fragment,{children:(0,e.jsxs)("div",{className:"markdown",children:[(0,e.jsx)("p",{children:t.texts[0].value}),(0,e.jsxs)("h2",{id:"\u4F55\u65F6\u4F7F\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4F55\u65F6\u4F7F\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4F55\u65F6\u4F7F\u7528"]}),(0,e.jsx)("p",{children:t.texts[1].value}),(0,e.jsxs)("h2",{id:"\u4EE3\u7801\u5C55\u793A",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4EE3\u7801\u5C55\u793A",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4EE3\u7801\u5C55\u793A"]}),(0,e.jsxs)("div",{className:"preview-container",children:[(0,e.jsx)("div",{className:"phone-preview",children:(0,e.jsx)("iframe",{src:"https://opensourcenocode.github.io/antd-flutter?target=AntdRadio"})}),(0,e.jsxs)("div",{style:{flex:"1"},children:[(0,e.jsxs)("h3",{id:"\u57FA\u7840\u4F7F\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u57FA\u7840\u4F7F\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u57FA\u7840\u4F7F\u7528"]}),(0,e.jsx)(s.Z,{lang:"dart",children:t.texts[2].value}),(0,e.jsxs)("h3",{id:"\u81EA\u5B9A\u4E49\u6837\u5F0F",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u81EA\u5B9A\u4E49\u6837\u5F0F",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u81EA\u5B9A\u4E49\u6837\u5F0F"]}),(0,e.jsx)(s.Z,{lang:"dart",children:t.texts[3].value}),(0,e.jsxs)("h3",{id:"\u5217\u8868\u9009\u62E9",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5217\u8868\u9009\u62E9",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5217\u8868\u9009\u62E9"]}),(0,e.jsx)(s.Z,{lang:"dart",children:t.texts[4].value}),(0,e.jsxs)("h3",{id:"\u53EA\u8BFB\u548C\u7981\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u53EA\u8BFB\u548C\u7981\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u53EA\u8BFB\u548C\u7981\u7528"]}),(0,e.jsx)(s.Z,{lang:"dart",children:t.texts[5].value})]})]}),t.texts[6].value,(0,e.jsx)("style",{dangerouslySetInnerHTML:{__html:`
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
`}}),(0,e.jsxs)("h2",{id:"\u5C5E\u6027",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5C5E\u6027",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5C5E\u6027"]}),(0,e.jsxs)(o.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[7].value}),(0,e.jsx)("th",{children:t.texts[8].value}),(0,e.jsx)("th",{children:t.texts[9].value}),(0,e.jsx)("th",{children:t.texts[10].value}),(0,e.jsx)("th",{children:t.texts[11].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[12].value}),(0,e.jsx)("td",{children:t.texts[13].value}),(0,e.jsx)("td",{children:t.texts[14].value}),(0,e.jsx)("td",{children:t.texts[15].value}),(0,e.jsx)("td",{children:t.texts[16].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[17].value}),(0,e.jsx)("td",{children:t.texts[18].value}),(0,e.jsx)("td",{children:t.texts[19].value}),(0,e.jsx)("td",{children:t.texts[20].value}),(0,e.jsx)("td",{children:t.texts[21].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[22].value}),(0,e.jsx)("td",{children:t.texts[23].value}),(0,e.jsx)("td",{children:t.texts[24].value}),(0,e.jsx)("td",{children:t.texts[25].value}),(0,e.jsx)("td",{children:t.texts[26].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[27].value}),(0,e.jsx)("td",{children:t.texts[28].value}),(0,e.jsx)("td",{children:t.texts[29].value}),(0,e.jsx)("td",{children:t.texts[30].value}),(0,e.jsx)("td",{children:t.texts[31].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[32].value}),(0,e.jsx)("td",{children:t.texts[33].value}),(0,e.jsx)("td",{children:t.texts[34].value}),(0,e.jsx)("td",{children:t.texts[35].value}),(0,e.jsx)("td",{children:t.texts[36].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[37].value}),(0,e.jsx)("td",{children:t.texts[38].value}),(0,e.jsx)("td",{children:t.texts[39].value}),(0,e.jsx)("td",{children:t.texts[40].value}),(0,e.jsx)("td",{children:t.texts[41].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[42].value}),(0,e.jsx)("td",{children:t.texts[43].value}),(0,e.jsx)("td",{children:t.texts[44].value}),(0,e.jsx)("td",{children:t.texts[45].value}),(0,e.jsx)("td",{children:t.texts[46].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[47].value}),(0,e.jsx)("td",{children:t.texts[48].value}),(0,e.jsx)("td",{children:t.texts[49].value}),(0,e.jsx)("td",{children:t.texts[50].value}),(0,e.jsx)("td",{children:t.texts[51].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[52].value}),(0,e.jsx)("td",{children:t.texts[53].value}),(0,e.jsx)("td",{children:t.texts[54].value}),(0,e.jsx)("td",{children:t.texts[55].value}),(0,e.jsx)("td",{children:t.texts[56].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[57].value}),(0,e.jsx)("td",{children:t.texts[58].value}),(0,e.jsx)("td",{children:t.texts[59].value}),(0,e.jsx)("td",{children:t.texts[60].value}),(0,e.jsx)("td",{children:t.texts[61].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[62].value}),(0,e.jsxs)("td",{children:[t.texts[63].value,(0,e.jsx)("code",{children:t.texts[64].value}),t.texts[65].value,(0,e.jsx)("code",{children:t.texts[66].value}),t.texts[67].value,(0,e.jsx)("code",{children:t.texts[68].value})]}),(0,e.jsx)("td",{children:t.texts[69].value}),(0,e.jsx)("td",{children:t.texts[70].value}),(0,e.jsx)("td",{children:t.texts[71].value})]})]})]}),(0,e.jsxs)("h2",{id:"\u5355\u9009\u6846\u7EC4\u4EF6\u6837\u5F0F\u914D\u7F6E\u7C7Bantdradiostyle",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5355\u9009\u6846\u7EC4\u4EF6\u6837\u5F0F\u914D\u7F6E\u7C7Bantdradiostyle",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5355\u9009\u6846\u7EC4\u4EF6\u6837\u5F0F\u914D\u7F6E\u7C7B(AntdRadioStyle) ",(0,e.jsx)("a",{id:"AntdRadioStyle"})]}),(0,e.jsxs)(o.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[72].value}),(0,e.jsx)("th",{children:t.texts[73].value}),(0,e.jsx)("th",{children:t.texts[74].value}),(0,e.jsx)("th",{children:t.texts[75].value}),(0,e.jsx)("th",{children:t.texts[76].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[77].value}),(0,e.jsx)("td",{children:t.texts[78].value}),(0,e.jsx)("td",{children:t.texts[79].value}),(0,e.jsx)("td",{children:t.texts[80].value}),(0,e.jsx)("td",{children:t.texts[81].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[82].value}),(0,e.jsx)("td",{children:t.texts[83].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[84].value})}),(0,e.jsx)("td",{children:t.texts[85].value}),(0,e.jsx)("td",{children:t.texts[86].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[87].value}),(0,e.jsx)("td",{children:t.texts[88].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[89].value})}),(0,e.jsx)("td",{children:t.texts[90].value}),(0,e.jsx)("td",{children:t.texts[91].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[92].value}),(0,e.jsx)("td",{children:t.texts[93].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-box/#AntdBoxStyle",children:t.texts[94].value})}),(0,e.jsx)("td",{children:t.texts[95].value}),(0,e.jsx)("td",{children:t.texts[96].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[97].value}),(0,e.jsx)("td",{children:t.texts[98].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-icon/#AntdIconStyle",children:t.texts[99].value})}),(0,e.jsx)("td",{children:t.texts[100].value}),(0,e.jsx)("td",{children:t.texts[101].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[102].value}),(0,e.jsx)("td",{children:t.texts[103].value}),(0,e.jsx)("td",{children:t.texts[104].value}),(0,e.jsx)("td",{children:t.texts[105].value}),(0,e.jsx)("td",{children:t.texts[106].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[107].value}),(0,e.jsx)("td",{children:t.texts[108].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-icon/#AntdIconStyle",children:t.texts[109].value})}),(0,e.jsx)("td",{children:t.texts[110].value}),(0,e.jsx)("td",{children:t.texts[111].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[112].value}),(0,e.jsx)("td",{children:t.texts[113].value}),(0,e.jsx)("td",{children:t.texts[114].value}),(0,e.jsx)("td",{children:t.texts[115].value}),(0,e.jsx)("td",{children:t.texts[116].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[117].value}),(0,e.jsx)("td",{children:t.texts[118].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-icon/#AntdIconStyle",children:t.texts[119].value})}),(0,e.jsx)("td",{children:t.texts[120].value}),(0,e.jsx)("td",{children:t.texts[121].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[122].value}),(0,e.jsx)("td",{children:t.texts[123].value}),(0,e.jsx)("td",{children:t.texts[124].value}),(0,e.jsx)("td",{children:t.texts[125].value}),(0,e.jsx)("td",{children:t.texts[126].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[127].value}),(0,e.jsx)("td",{children:t.texts[128].value}),(0,e.jsx)("td",{children:(0,e.jsx)(n.rU,{to:"/components/antd-flex/#AntdFlexStyle",children:t.texts[129].value})}),(0,e.jsx)("td",{children:t.texts[130].value}),(0,e.jsx)("td",{children:t.texts[131].value})]})]})]})]})})})})}a.default=u},215:function(r,a,d){d.d(a,{Z:function(){return l.Z}});var l=d(44569)},614:function(r,a,d){d.r(a),d.d(a,{texts:function(){return l}});const l=[{value:"\u5728\u4E00\u7EC4\u53EF\u9009\u9879\u4E2D\u8FDB\u884C\u5355\u9009\u3002",paraId:0},{value:"\u5355\u9009\u6846\u6240\u6709\u9009\u9879\u9ED8\u8BA4\u53EF\u89C1\uFF0C\u65B9\u4FBF\u7528\u6237\u5728\u6BD4\u8F83\u4E2D\u9009\u62E9\uFF0C\u56E0\u6B64\u9009\u9879\u4E0D\u5B9C\u8FC7\u591A\u3002",paraId:1,tocIndex:0},{value:`class AntdRadioDemo extends StatelessWidget {
  const AntdRadioDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AntdRadio(
            onChange: (value) {
              AntdToast.show("\u53D8\u66F4\u4E3A:$value");
            },
            extra: const Text("\u6709\u63CF\u8FF0\u7684\u5355\u9009\u6846")),
        const AntdRadio(indeterminate: true, extra: Text("\u534A\u9009")),
        const AntdRadio(disabled: true, extra: Text("\u7981\u7528"))
      ])
    ]);
  }
}

`,paraId:2,tocIndex:2},{value:`class AntdRadioCustomDemo extends StatelessWidget {
  const AntdRadioCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdRadio(
          style: AntdRadioStyle(
              defaultIcon: const AntdIcon(icon: AntdIcons.smile),
              activeIcon: AntdIcon(
                  style: AntdIconStyle(size: 22, color: token.colorPrimary),
                  icon: AntdIcons.smileFill),
              disableIcon: AntdIcon(
                  style: AntdIconStyle(color: token.colorPrimary),
                  icon: AntdIcons.delete),
              activeIconStyle: AntdIconStyle(
                  bodyStyle: AntdBoxStyle(color: token.colorWhite))),
          extra: const Text("\u6211\u662F\u81EA\u5B9A\u4E49\u5185\u5BB9"))
    ]);
  }
}

`,paraId:3,tocIndex:3},{value:`class AntdRadioListDemo extends StatefulWidget {
  const AntdRadioListDemo({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AntdRadioListDemoStateDemo();
  }
}

`,paraId:4,tocIndex:4},{value:`class AntdRadioDisabledDemo extends StatelessWidget {
  const AntdRadioDisabledDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdRadio(disabled: true, extra: Text("\u7981\u7528")),
      AntdRadio(readOnly: true, value: true, extra: Text("\u53EA\u8BFB"))
    ]);
  }
}

`,paraId:5,tocIndex:5},{value:`
  `,paraId:6},{value:"\u5C5E\u6027\u540D",paraId:7,tocIndex:6},{value:"\u8BF4\u660E",paraId:7,tocIndex:6},{value:"\u7C7B\u578B",paraId:7,tocIndex:6},{value:"\u9ED8\u8BA4\u503C",paraId:7,tocIndex:6},{value:"\u7248\u672C",paraId:7,tocIndex:6},{value:"key",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"Key",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"style",paraId:7,tocIndex:6},{value:"\u6837\u5F0F",paraId:7,tocIndex:6},{value:"AntdRadioStyle",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"styleBuilder",paraId:7,tocIndex:6},{value:"\u52A8\u6001\u6837\u5F0F",paraId:7,tocIndex:6},{value:"AntdStyleBuilder<AntdRadioStyle, AntdRadio>",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"disabled",paraId:7,tocIndex:6},{value:"\u7981\u7528",paraId:7,tocIndex:6},{value:"bool",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"readOnly",paraId:7,tocIndex:6},{value:"\u53EA\u8BFB",paraId:7,tocIndex:6},{value:"bool",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"value",paraId:7,tocIndex:6},{value:"\u503C",paraId:7,tocIndex:6},{value:"bool",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"autoCollect",paraId:7,tocIndex:6},{value:"\u81EA\u52A8\u540C\u6B65\u503C\u5230\u8868\u5355",paraId:7,tocIndex:6},{value:"bool",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"onChange",paraId:7,tocIndex:6},{value:"\u53D8\u66F4\u4E8B\u4EF6",paraId:7,tocIndex:6},{value:"ValueChanged<bool>",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"indeterminate",paraId:7,tocIndex:6},{value:"\u534A\u9009",paraId:7,tocIndex:6},{value:"bool",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"extra",paraId:7,tocIndex:6},{value:"\u5185\u5BB9",paraId:7,tocIndex:6},{value:"Widget",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"hapticFeedback",paraId:7,tocIndex:6},{value:"\u5F00\u542F\u53CD\u9988:",paraId:7,tocIndex:6},{value:"light",paraId:7,tocIndex:6},{value:" | ",paraId:7,tocIndex:6},{value:"medium",paraId:7,tocIndex:6},{value:" | ",paraId:7,tocIndex:6},{value:"heavy",paraId:7,tocIndex:6},{value:"AntdHapticFeedback",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"-",paraId:7,tocIndex:6},{value:"\u5C5E\u6027\u540D",paraId:8,tocIndex:7},{value:"\u8BF4\u660E",paraId:8,tocIndex:7},{value:"\u7C7B\u578B",paraId:8,tocIndex:7},{value:"\u9ED8\u8BA4\u503C",paraId:8,tocIndex:7},{value:"\u7248\u672C",paraId:8,tocIndex:7},{value:"inherit",paraId:8,tocIndex:7},{value:"\u662F\u5426\u7EE7\u627F\u6837\u5F0F,\u5982\u679C\u4E3Afalse\u5219\u4E0D\u4F1A\u5411\u4E0A\u5408\u5E76\u5176\u4ED6\u7684\u6837\u5F0F",paraId:8,tocIndex:7},{value:"bool",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"bodyStyle",paraId:8,tocIndex:7},{value:"\u4E3B\u4F53\u6837\u5F0F\uFF0C\u53EF\u4EE5\u5F00\u542F\u5207\u6362\u65F6\u9707\u52A8\u53CD\u9988",paraId:8,tocIndex:7},{value:"AntdBoxStyle",paraId:9,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"indeterminateStyle",paraId:8,tocIndex:7},{value:"\u590D\u9009\u6846\u534A\u9009\u72B6\u6001(indeterminate)\u7684\u6837\u5F0F",paraId:8,tocIndex:7},{value:"AntdBoxStyle",paraId:10,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"extraStyle",paraId:8,tocIndex:7},{value:"\u590D\u9009\u6846\u6587\u672C\u6807\u7B7E\u7684\u6837\u5F0F",paraId:8,tocIndex:7},{value:"AntdBoxStyle",paraId:11,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"activeIconStyle",paraId:8,tocIndex:7},{value:"\u9009\u4E2D\u6846\u56FE\u6807\u7684\u6837\u5F0F\u914D\u7F6E",paraId:8,tocIndex:7},{value:"AntdIconStyle",paraId:12,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"activeIcon",paraId:8,tocIndex:7},{value:"\u9009\u4E2D\u72B6\u6001\u4E0B\u663E\u793A\u7684\u56FE\u6807\u7EC4\u4EF6",paraId:8,tocIndex:7},{value:"Widget",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"defaultIconStyle",paraId:8,tocIndex:7},{value:"\u9ED8\u8BA4\u56FE\u6807\u7684\u6837\u5F0F\u914D\u7F6E",paraId:8,tocIndex:7},{value:"AntdIconStyle",paraId:13,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"defaultIcon",paraId:8,tocIndex:7},{value:"\u9ED8\u8BA4\u672A\u9009\u4E2D\u72B6\u6001\u4E0B\u663E\u793A\u7684\u56FE\u6807\u7EC4\u4EF6",paraId:8,tocIndex:7},{value:"Widget",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"disableIconStyle",paraId:8,tocIndex:7},{value:"\u7981\u7528\u56FE\u6807\u7684\u6837\u5F0F\u914D\u7F6E",paraId:8,tocIndex:7},{value:"AntdIconStyle",paraId:14,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"disableIcon",paraId:8,tocIndex:7},{value:"\u7981\u7528\u72B6\u6001\u4E0B\u663E\u793A\u7684\u56FE\u6807\u7EC4\u4EF6",paraId:8,tocIndex:7},{value:"Widget",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"rowStyle",paraId:8,tocIndex:7},{value:"\u5BF9\u9F50\u6837\u5F0F",paraId:8,tocIndex:7},{value:"AntdFlexStyle",paraId:15,tocIndex:7},{value:"-",paraId:8,tocIndex:7},{value:"-",paraId:8,tocIndex:7}]}}]);
