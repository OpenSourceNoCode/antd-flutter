"use strict";(self.webpackChunkantd_flutter_mobile=self.webpackChunkantd_flutter_mobile||[]).push([[4825,9614],{43352:function(u,n,e){e.r(n);var a=e(55110),i=e(18734),m=e(9332),c=e(14082),p=e(95238),d=e(92731),x=e(23162),h=e(74182),v=e(33729),f=e(56953),E=e(15480),I=e(96174),j=e(552),s=e(56703),r=e(27601),l=e(75271),t=e(20427),_=e(52676);function o(){return(0,_.jsx)(s.dY,{children:(0,_.jsx)(l.Suspense,{fallback:(0,_.jsx)(r.Z,{}),children:(0,_.jsx)(_.Fragment,{children:(0,_.jsxs)("div",{className:"markdown",children:[(0,_.jsxs)("h2",{id:"\u5B89\u88C5",children:[(0,_.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5B89\u88C5",children:(0,_.jsx)("span",{className:"icon icon-link"})}),"\u5B89\u88C5"]}),(0,_.jsx)("p",{children:t.texts[0].value}),(0,_.jsx)(d.Z,{title:"\u6700\u65B0\u7248\u672C",lang:"bash",children:t.texts[1].value}),(0,_.jsx)("p",{children:t.texts[2].value}),(0,_.jsx)(d.Z,{title:"\u6307\u5B9A\u7248\u672C",lang:"bash",children:t.texts[3].value}),(0,_.jsxs)("h2",{id:"\u5F15\u5165",children:[(0,_.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u5F15\u5165",children:(0,_.jsx)("span",{className:"icon icon-link"})}),"\u5F15\u5165"]}),(0,_.jsx)("p",{children:t.texts[4].value}),(0,_.jsx)(d.Z,{lang:"dart",children:t.texts[5].value}),(0,_.jsxs)("p",{children:[t.texts[6].value,(0,_.jsx)("code",{children:t.texts[7].value}),t.texts[8].value,(0,_.jsx)("code",{children:t.texts[9].value}),t.texts[10].value]}),(0,_.jsx)(d.Z,{lang:"dart",children:t.texts[11].value}),(0,_.jsxs)("h2",{id:"\u4F7F\u7528",children:[(0,_.jsx)("a",{"aria-hidden":"true",tabIndex:"-1",href:"#\u4F7F\u7528",children:(0,_.jsx)("span",{className:"icon icon-link"})}),"\u4F7F\u7528"]}),(0,_.jsxs)("p",{children:[t.texts[12].value,(0,_.jsx)(s.rU,{to:"/components",children:t.texts[13].value})]}),(0,_.jsx)(d.Z,{lang:"dart",children:t.texts[14].value})]})})})})}n.default=o},11247:function(u,n,e){e.d(n,{Z:function(){return a.Z}});var a=e(95897)},20427:function(u,n,e){e.r(n),e.d(n,{texts:function(){return a}});const a=[{value:"\u6700\u65B0\u7248\u672C",paraId:0,tocIndex:0},{value:`flutter pub add antd_flutter_mobile
`,paraId:1,tocIndex:0},{value:"\u6307\u5B9A\u7248\u672C",paraId:2,tocIndex:0},{value:`\u6DFB\u52A0\u4EE5\u4E0B\u4F9D\u8D56\u5230\u4F60\u7684 pubspec.yaml,\u5177\u4F53\u7684\u7248\u672C\u53EF\u4EE5\u5728 \u66F4\u65B0\u65E5\u5FD7 \u4E2D\u627E\u5230

dependencies:
  antd_flutter_mobile: \u7248\u672C
`,paraId:3,tocIndex:0},{value:"\u5728\u9700\u8981\u7684\u9875\u9762\u5F15\u5165",paraId:4,tocIndex:1},{value:`import 'package:antd_flutter_mobile/index.dart';
`,paraId:5,tocIndex:1},{value:"\u6DFB\u52A0 ",paraId:6,tocIndex:1},{value:"AntdProvider",paraId:6,tocIndex:1},{value:" \u5305\u88F9\u4F60\u7684\u9879\u76EE\u6839\u76EE\u5F55\uFF0C\u7136\u540E \u4E3A\u8DEF\u7531\u5F15\u5165 ",paraId:6,tocIndex:1},{value:"AntdLayer.observer",paraId:6,tocIndex:1},{value:" \u4ED6\u662F\u5B9E\u73B0\u5F39\u5C42\u7684\u57FA\u7840",paraId:6,tocIndex:1},{value:`
import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const App());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    ///\u5982\u679C\u4F60\u9700\u8981\u81EA\u5B9A\u4E49\u4E3B\u9898 \u53EF\u4EE5\u4E3A AntdProvider\u7684theme\u4F20\u503C\uFF0C\u5173\u4E8E\u4E3B\u9898\u53EF\u4EE5\u53C2\u8003\u4E3B\u9898\u83DC\u5355
    return MaterialApp(
      builder: (context, child) {
        return AntdProvider(builder: (context, token) {
          return child ?? const AntdBox();
        });
      },
      navigatorObservers: [
        AntdLayer.observer,
      ],
    );
  }
}

`,paraId:7,tocIndex:1},{value:"\u4E00\u4E2A\u6309\u94AE\u7684\u793A\u4F8B \u66F4\u591A",paraId:8,tocIndex:2},{value:"\u7EC4\u4EF6",paraId:9,tocIndex:2},{value:`import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const AntdButton(
      child: Text("\u6211\u662F\u4E00\u4E2A\u6309\u94AE"),
    );
  }
}
`,paraId:10,tocIndex:2}]}}]);
