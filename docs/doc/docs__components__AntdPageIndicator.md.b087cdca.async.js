"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[8194],{26954:function(u,l,n){n.r(l);var h=n(42874),x=n(28657),j=n(69019),m=n(67118),p=n(34738),s=n(15911),t=n(23813),v=n(93200),f=n(41154),E=n(28258),b=n(90535),D=n(53716),P=n(95796),d=n(10688),i=n(26509),r=n(75271),e=n(52676);function a(){var o=(0,d.eL)(),_=o.texts;return(0,e.jsx)(e.Fragment,{children:(0,e.jsxs)("div",{className:"markdown",children:[(0,e.jsx)("p",{children:_[0].value}),(0,e.jsxs)("h2",{id:"\u4F55\u65F6\u4F7F\u7528",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4F55\u65F6\u4F7F\u7528",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4F55\u65F6\u4F7F\u7528"]}),(0,e.jsx)("p",{children:_[1].value}),(0,e.jsxs)("h2",{id:"\u4EE3\u7801\u5C55\u793A",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4EE3\u7801\u5C55\u793A",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4EE3\u7801\u5C55\u793A"]}),(0,e.jsxs)("div",{className:"preview-container",children:[(0,e.jsxs)("div",{children:[(0,e.jsxs)("h3",{id:"\u4E8B\u4EF6",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4E8B\u4EF6",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u4E8B\u4EF6"]}),(0,e.jsx)(s.Z,{lang:"dart",children:_[2].value}),(0,e.jsxs)("h3",{id:"\u5782\u76F4\u65B9\u5411",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5782\u76F4\u65B9\u5411",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5782\u76F4\u65B9\u5411"]}),(0,e.jsx)(s.Z,{lang:"dart",children:_[3].value}),(0,e.jsxs)("h3",{id:"\u81EA\u5B9A\u4E49\u6837\u5F0F",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u81EA\u5B9A\u4E49\u6837\u5F0F",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u81EA\u5B9A\u4E49\u6837\u5F0F"]}),(0,e.jsx)(s.Z,{lang:"dart",children:_[4].value})]}),(0,e.jsx)("div",{className:"phone-preview",children:(0,e.jsx)("iframe",{src:"http://localhost:49470/AntdPageIndicator"})})]}),_[5].value,(0,e.jsx)("style",{dangerouslySetInnerHTML:{__html:`
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
`}}),(0,e.jsxs)("h2",{id:"\u5C5E\u6027",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5C5E\u6027",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5C5E\u6027"]}),(0,e.jsxs)(t.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:_[6].value}),(0,e.jsx)("th",{children:_[7].value}),(0,e.jsx)("th",{children:_[8].value}),(0,e.jsx)("th",{children:_[9].value}),(0,e.jsx)("th",{children:_[10].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:_[11].value}),(0,e.jsx)("td",{children:_[12].value}),(0,e.jsx)("td",{children:_[13].value}),(0,e.jsx)("td",{children:_[14].value}),(0,e.jsx)("td",{children:_[15].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:_[16].value}),(0,e.jsx)("td",{children:_[17].value}),(0,e.jsx)("td",{children:_[18].value}),(0,e.jsx)("td",{children:_[19].value}),(0,e.jsx)("td",{children:_[20].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:_[21].value}),(0,e.jsx)("td",{children:_[22].value}),(0,e.jsx)("td",{children:_[23].value}),(0,e.jsx)("td",{children:_[24].value}),(0,e.jsx)("td",{children:_[25].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:_[26].value}),(0,e.jsxs)("td",{children:[_[27].value,(0,e.jsx)("code",{children:_[28].value}),_[29].value,(0,e.jsx)("code",{children:_[30].value}),_[31].value,(0,e.jsx)("code",{children:_[32].value}),_[33].value,(0,e.jsx)("code",{children:_[34].value}),_[35].value,(0,e.jsx)("code",{children:_[36].value}),_[37].value,(0,e.jsx)("code",{children:_[38].value}),_[39].value,(0,e.jsx)("code",{children:_[40].value})]}),(0,e.jsx)("td",{children:_[41].value}),(0,e.jsx)("td",{children:_[42].value}),(0,e.jsx)("td",{children:_[43].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:_[44].value}),(0,e.jsx)("td",{children:_[45].value}),(0,e.jsx)("td",{children:_[46].value}),(0,e.jsx)("td",{children:_[47].value}),(0,e.jsx)("td",{children:_[48].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:_[49].value}),(0,e.jsx)("td",{children:_[50].value}),(0,e.jsx)("td",{children:_[51].value}),(0,e.jsx)("td",{children:_[52].value}),(0,e.jsx)("td",{children:_[53].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:_[54].value}),(0,e.jsx)("td",{children:_[55].value}),(0,e.jsx)("td",{children:_[56].value}),(0,e.jsx)("td",{children:_[57].value}),(0,e.jsx)("td",{children:_[58].value})]})]})]}),(0,e.jsxs)("h2",{id:"\u5206\u9875\u7B26\u6837\u5F0Fantdpageindicatorstyle",children:[(0,e.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5206\u9875\u7B26\u6837\u5F0Fantdpageindicatorstyle",children:(0,e.jsx)("span",{className:"icon icon-link"})}),"\u5206\u9875\u7B26\u6837\u5F0F(AntdPageIndicatorStyle) ",(0,e.jsx)("a",{id:"AntdPageIndicatorStyle"})]}),(0,e.jsxs)(t.Z,{children:[(0,e.jsx)("thead",{children:(0,e.jsxs)("tr",{children:[(0,e.jsx)("th",{children:_[59].value}),(0,e.jsx)("th",{children:_[60].value}),(0,e.jsx)("th",{children:_[61].value}),(0,e.jsx)("th",{children:_[62].value}),(0,e.jsx)("th",{children:_[63].value})]})}),(0,e.jsxs)("tbody",{children:[(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:_[64].value}),(0,e.jsx)("td",{children:_[65].value}),(0,e.jsx)("td",{children:_[66].value}),(0,e.jsx)("td",{children:_[67].value}),(0,e.jsx)("td",{children:_[68].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:_[69].value}),(0,e.jsx)("td",{children:_[70].value}),(0,e.jsx)("td",{children:(0,e.jsx)(d.rU,{to:"/components/antd-box/#AntdBoxStyle",children:_[71].value})}),(0,e.jsx)("td",{children:_[72].value}),(0,e.jsx)("td",{children:_[73].value})]}),(0,e.jsxs)("tr",{children:[(0,e.jsx)("td",{children:_[74].value}),(0,e.jsx)("td",{children:_[75].value}),(0,e.jsx)("td",{children:(0,e.jsx)(d.rU,{to:"/components/antd-box/#AntdBoxStyle",children:_[76].value})}),(0,e.jsx)("td",{children:_[77].value}),(0,e.jsx)("td",{children:_[78].value})]})]})]})]})})}function c(){return(0,e.jsx)(d.dY,{children:(0,e.jsx)(r.Suspense,{fallback:(0,e.jsx)(i.Z,{}),children:(0,e.jsx)(a,{})})})}l.default=c}}]);
