import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

const data = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
];

/// @t 基础使用
/// @l [AntdFloatingPanel]
class AntdFloatingDemo extends StatelessWidget {
  const AntdFloatingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdFloatingPanel(
        // onHeightChange: (height) {
        //   AntdToast.show("当前的高度$height}"));
        // },
        content: AntdList(
            shrinkWrap: true,
            items: data.map((value) {
              return Text(value);
            }).toList()),
        child: AntdBox(
          child: Text("我是背景"),
          style: AntdBoxStyle(
              width: double.infinity, height: 500, color: token.colorBgLayout),
          onTap: () {
            print("111");
          },
        ),
      )
    ]);
  }
}

/// @t 顶部的面板
/// @l [AntdFloatingPanel]
class AntdFloatingPositionDemo extends StatelessWidget {
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
          child: const Text("我是指示灯"),
        ),
        content: SizedBox(
          height: 400,
          child: AntdList(
              items: data.map((value) {
            return Text(value);
          }).toList()),
        ),
        child: AntdBox(
          onTap: () {
            AntdToast.show("背景点击事件");
          },
          child: Text("我是背景内容，我可以被正常点击"),
          style: AntdBoxStyle(
              width: double.infinity, height: 500, color: token.colorBgLayout),
        ),
      )
    ]);
  }
}

/// @t 固定拖拽区域
/// @l [AntdFloatingPanel]
class AntdFloatingAnchorsDemo extends StatelessWidget {
  const AntdFloatingAnchorsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdFloatingPanel(
        anchors: const [0.3, 0.6, 0.8],
        child: AntdBox(
          onTap: () {
            AntdToast.show("背景点击事件");
          },
          child: Text("我是背景内容，我可以被正常点击"),
          style: AntdBoxStyle(
              width: double.infinity, height: 500, color: token.colorBgLayout),
        ),
        content: AntdList(
            shrinkWrap: true,
            items: data.map((value) {
              return Text(value);
            }).toList()),
      )
    ]);
  }
}

/// @t 自定义指示灯
/// @l [AntdFloatingPanel]
class AntdFloatingIndicatorDemo extends StatelessWidget {
  const AntdFloatingIndicatorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdFloatingPanel(
        anchors: const [0.3, 0.6, 0.8],
        indicator: AntdBox(
          style: AntdBoxStyle(color: token.colorPrimary),
          child: const Text("我是指示灯"),
        ),
        content: SizedBox(
          height: 400,
          child: AntdList(
              items: data.map((value) {
            return Text(value);
          }).toList()),
        ),
        child: AntdBox(
          onTap: () {
            AntdToast.show("背景点击事件");
          },
          child: Text("我是背景内容，我可以被正常点击"),
          style: AntdBoxStyle(
              width: double.infinity, height: 500, color: token.colorBgLayout),
        ),
      )
    ]);
  }
}
