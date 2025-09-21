"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[5937,9614],{43386:function(s,n,d){d.r(n);var a=d(32435),x=d(48621),u=d(64926),p=d(26995),h=d(84193),r=d(12873),_=d(4606),v=d(46421),I=d(77171),j=d(3500),m=d(92181),f=d(2249),E=d(25329),l=d(22741),o=d(97170),i=d(75271),t=d(50142),e=d(52676);function c(){return(0,e.jsx)(l.dY,{children:(0,e.jsx)(i.Suspense,{fallback:(0,e.jsx)(o.Z,{}),children:(0,e.jsx)(e.Fragment,{children:(0,e.jsxs)("div",{className:"markdown",children:[(0,e.jsx)("p",{children:t.texts[0].value}),(0,e.jsxs)("h2",{id:"\u4F55\u65F6\u4F7F\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4F55\u65F6\u4F7F\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4F55\u65F6\u4F7F\u7528"]}),(0,e.jsx)("p",{children:t.texts[1].value}),(0,e.jsxs)("h2",{id:"\u4EE3\u7801\u5C55\u793A",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4EE3\u7801\u5C55\u793A",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4EE3\u7801\u5C55\u793A"]}),(0,e.jsxs)("div",{className:"preview-container",children:[(0,e.jsx)("div",{className:"phone-preview",children:(0,e.jsx)("iframe",{src:"https://opensourcenocode.github.io/antd-flutter?target=AntdEllipsis"})}),(0,e.jsxs)("div",{style:{flex:"1"},children:[(0,e.jsxs)("h3",{id:"\u4E8B\u4EF6",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4E8B\u4EF6",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4E8B\u4EF6"]}),(0,e.jsx)(r.Z,{lang:"dart",children:t.texts[2].value})]})]}),t.texts[3].value,(0,e.jsx)("style",{dangerouslySetInnerHTML:{__html:`
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
`}}),(0,e.jsxs)("h2",{id:"\u5C5E\u6027",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5C5E\u6027",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5C5E\u6027"]}),(0,e.jsxs)(_.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[4].value}),(0,e.jsx)("th",{children:t.texts[5].value}),(0,e.jsx)("th",{children:t.texts[6].value}),(0,e.jsx)("th",{children:t.texts[7].value}),(0,e.jsx)("th",{children:t.texts[8].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[9].value}),(0,e.jsx)("td",{children:t.texts[10].value}),(0,e.jsx)("td",{children:t.texts[11].value}),(0,e.jsx)("td",{children:t.texts[12].value}),(0,e.jsx)("td",{children:t.texts[13].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[14].value}),(0,e.jsx)("td",{children:t.texts[15].value}),(0,e.jsx)("td",{children:t.texts[16].value}),(0,e.jsx)("td",{children:t.texts[17].value}),(0,e.jsx)("td",{children:t.texts[18].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[19].value}),(0,e.jsx)("td",{children:t.texts[20].value}),(0,e.jsx)("td",{children:t.texts[21].value}),(0,e.jsx)("td",{children:t.texts[22].value}),(0,e.jsx)("td",{children:t.texts[23].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[24].value}),(0,e.jsx)("td",{children:t.texts[25].value}),(0,e.jsx)("td",{children:t.texts[26].value}),(0,e.jsx)("td",{children:t.texts[27].value}),(0,e.jsx)("td",{children:t.texts[28].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[29].value}),(0,e.jsx)("td",{children:t.texts[30].value}),(0,e.jsx)("td",{children:t.texts[31].value}),(0,e.jsx)("td",{children:t.texts[32].value}),(0,e.jsx)("td",{children:t.texts[33].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[34].value}),(0,e.jsx)("td",{children:t.texts[35].value}),(0,e.jsx)("td",{children:t.texts[36].value}),(0,e.jsx)("td",{children:t.texts[37].value}),(0,e.jsx)("td",{children:t.texts[38].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[39].value}),(0,e.jsx)("td",{children:t.texts[40].value}),(0,e.jsx)("td",{children:t.texts[41].value}),(0,e.jsx)("td",{children:t.texts[42].value}),(0,e.jsx)("td",{children:t.texts[43].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[44].value}),(0,e.jsx)("td",{children:t.texts[45].value}),(0,e.jsx)("td",{children:t.texts[46].value}),(0,e.jsx)("td",{children:t.texts[47].value}),(0,e.jsx)("td",{children:t.texts[48].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[49].value}),(0,e.jsx)("td",{children:t.texts[50].value}),(0,e.jsx)("td",{children:t.texts[51].value}),(0,e.jsx)("td",{children:t.texts[52].value}),(0,e.jsx)("td",{children:t.texts[53].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[54].value}),(0,e.jsx)("td",{children:t.texts[55].value}),(0,e.jsx)("td",{children:t.texts[56].value}),(0,e.jsx)("td",{children:t.texts[57].value}),(0,e.jsx)("td",{children:t.texts[58].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[59].value}),(0,e.jsx)("td",{children:t.texts[60].value}),(0,e.jsx)("td",{children:t.texts[61].value}),(0,e.jsx)("td",{children:t.texts[62].value}),(0,e.jsx)("td",{children:t.texts[63].value})]})]})]}),(0,e.jsxs)("h2",{id:"\u6587\u672C\u7701\u7565ellipsis\u7EC4\u4EF6\u7684\u6837\u5F0F\u914D\u7F6Eantdellipsisstyle",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u6587\u672C\u7701\u7565ellipsis\u7EC4\u4EF6\u7684\u6837\u5F0F\u914D\u7F6Eantdellipsisstyle",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u6587\u672C\u7701\u7565\uFF08Ellipsis\uFF09\u7EC4\u4EF6\u7684\u6837\u5F0F\u914D\u7F6E(AntdEllipsisStyle) ",(0,e.jsx)("a",{id:"AntdEllipsisStyle"})]}),(0,e.jsxs)(_.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:t.texts[64].value}),(0,e.jsx)("th",{children:t.texts[65].value}),(0,e.jsx)("th",{children:t.texts[66].value}),(0,e.jsx)("th",{children:t.texts[67].value}),(0,e.jsx)("th",{children:t.texts[68].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[69].value}),(0,e.jsx)("td",{children:t.texts[70].value}),(0,e.jsx)("td",{children:(0,e.jsx)(l.rU,{to:"/components/text/#TextStyle",children:t.texts[71].value})}),(0,e.jsx)("td",{children:t.texts[72].value}),(0,e.jsx)("td",{children:t.texts[73].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[74].value}),(0,e.jsx)("td",{children:t.texts[75].value}),(0,e.jsx)("td",{children:(0,e.jsx)(l.rU,{to:"/components/text/#TextStyle",children:t.texts[76].value})}),(0,e.jsx)("td",{children:t.texts[77].value}),(0,e.jsx)("td",{children:t.texts[78].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:t.texts[79].value}),(0,e.jsx)("td",{children:t.texts[80].value}),(0,e.jsx)("td",{children:(0,e.jsx)(l.rU,{to:"/components/text/#TextStyle",children:t.texts[81].value})}),(0,e.jsx)("td",{children:t.texts[82].value}),(0,e.jsx)("td",{children:t.texts[83].value})]})]})]})]})})})})}n.default=c},10650:function(s,n,d){d.d(n,{Z:function(){return a.Z}});var a=d(11521)},50142:function(s,n,d){d.r(n),d.d(n,{texts:function(){return a}});const a=[{value:"\u5C55\u793A\u7A7A\u95F4\u4E0D\u8DB3\u65F6\uFF0C\u9690\u53BB\u90E8\u5206\u5185\u5BB9\u5E76\u7528\u201C...\u201D\u66FF\u4EE3\u3002",paraId:0},{value:"\u6587\u672C\u5185\u5BB9\u957F\u5EA6\u6216\u9AD8\u5EA6\u8D85\u8FC7\u5217\u5BBD\u6216\u884C\u9AD8\u3002\u56FE\u8868\u4E2D\u7A7A\u95F4\u6709\u9650\uFF0C\u6587\u672C\u5185\u5BB9\u65E0\u6CD5\u5B8C\u5168\u663E\u793A\u3002",paraId:1,tocIndex:0},{value:`class AntdEllipsisCustomDemo extends StatelessWidget {
  const AntdEllipsisCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdEllipsis(
          onCollapseTap: () {
            AntdToast.show("\u70B9\u51FB\u4E86\u6536\u8D77");
          },
          onExpandTap: () {
            AntdToast.show("\u70B9\u51FB\u4E86\u5C55\u5F00");
          },
          onTextTap: () {
            AntdToast.show("\u70B9\u51FB\u4E86\u6587\u672C");
          },
          content: ellipsisText,
          collapseText: "\u70B9\u6211\u6536\u8D77",
          expandText: "\u70B9\u6211\u5C55\u5F00")
    ]);
  }
}

`,paraId:2,tocIndex:2},{value:`
  `,paraId:3},{value:"\u5C5E\u6027\u540D",paraId:4,tocIndex:3},{value:"\u8BF4\u660E",paraId:4,tocIndex:3},{value:"\u7C7B\u578B",paraId:4,tocIndex:3},{value:"\u9ED8\u8BA4\u503C",paraId:4,tocIndex:3},{value:"\u7248\u672C",paraId:4,tocIndex:3},{value:"key",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"Key",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"style",paraId:4,tocIndex:3},{value:"\u6837\u5F0F",paraId:4,tocIndex:3},{value:"AntdEllipsisStyle",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"styleBuilder",paraId:4,tocIndex:3},{value:"\u52A8\u6001\u6837\u5F0F",paraId:4,tocIndex:3},{value:"AntdStyleBuilder<AntdEllipsisStyle, AntdEllipsis>",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"content",paraId:4,tocIndex:3},{value:"\u6587\u672C\u5185\u5BB9",paraId:4,tocIndex:3},{value:"String",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"collapseText",paraId:4,tocIndex:3},{value:"\u6536\u8D77\u64CD\u4F5C\u7684\u6587\u6848",paraId:4,tocIndex:3},{value:"String",paraId:4,tocIndex:3},{value:'"\u6536\u8D77"',paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"expandText",paraId:4,tocIndex:3},{value:"\u5C55\u5F00\u64CD\u4F5C\u7684\u6587\u6848",paraId:4,tocIndex:3},{value:"String",paraId:4,tocIndex:3},{value:'"\u5C55\u5F00"',paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"onTextTap",paraId:4,tocIndex:3},{value:"\u70B9\u51FB\u6587\u672C\u5185\u5BB9\u65F6\u89E6\u53D1",paraId:4,tocIndex:3},{value:"VoidCallback",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"onExpandTap",paraId:4,tocIndex:3},{value:"\u70B9\u51FB\u5C55\u5F00\u6587\u672C\u5185\u5BB9\u65F6\u89E6\u53D1",paraId:4,tocIndex:3},{value:"VoidCallback",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"onCollapseTap",paraId:4,tocIndex:3},{value:"\u70B9\u51FB\u6536\u8D77\u6587\u672C\u5185\u5BB9\u65F6\u89E6\u53D1",paraId:4,tocIndex:3},{value:"VoidCallback",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"defaultExpanded",paraId:4,tocIndex:3},{value:"\u662F\u5426\u9ED8\u8BA4\u5C55\u5F00",paraId:4,tocIndex:3},{value:"bool",paraId:4,tocIndex:3},{value:"false",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"rows",paraId:4,tocIndex:3},{value:"\u5C55\u793A\u51E0\u884C",paraId:4,tocIndex:3},{value:"int",paraId:4,tocIndex:3},{value:"1",paraId:4,tocIndex:3},{value:"-",paraId:4,tocIndex:3},{value:"\u5C5E\u6027\u540D",paraId:5,tocIndex:4},{value:"\u8BF4\u660E",paraId:5,tocIndex:4},{value:"\u7C7B\u578B",paraId:5,tocIndex:4},{value:"\u9ED8\u8BA4\u503C",paraId:5,tocIndex:4},{value:"\u7248\u672C",paraId:5,tocIndex:4},{value:"textStyle",paraId:5,tocIndex:4},{value:"\u4E3B\u6587\u672C\u7684\u6837\u5F0F\u914D\u7F6E\uFF08\u5B57\u4F53\u3001\u989C\u8272\u7B49\uFF09",paraId:5,tocIndex:4},{value:"TextStyle",paraId:6,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"expandStyle",paraId:5,tocIndex:4},{value:"\u5C55\u5F00\u7684\u6587\u672C\u6837\u5F0F",paraId:5,tocIndex:4},{value:"TextStyle",paraId:7,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"collapseStyle",paraId:5,tocIndex:4},{value:"\u6536\u8D77\u7684\u6587\u672C\u6837\u5F0F",paraId:5,tocIndex:4},{value:"TextStyle",paraId:8,tocIndex:4},{value:"-",paraId:5,tocIndex:4},{value:"-",paraId:5,tocIndex:4}]}}]);
