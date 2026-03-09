<div align="center">
<div align="center">
<img height="90" src="https://gw.alipayobjects.com/zos/rmsportal/KDpgvguMpGfqaHPjicRK.svg">
<img height="90" src="https://storage.googleapis.com/cms-storage-bucket/lockup_flutter_horizontal.847ae81f5430402216fd.svg">
</div>
<h1>Antd Flutter Mobile</h1>

Antd Flutter Mobile是 Ant Design Mobile 在 Flutter 平台的实现版本。零依赖、超轻量（整包仅 200k），50+ 高质量组件，覆盖主题，弹层、表单、列表精准定位等常见交互场景。

[English](https://github.com/OpenSourceNoCode/antd-flutter) · 中文

</div>

[文档](https://antd-flutter.vercel.app/) · [Web Demo](https://opensourcenocode.github.io/antd-flutter/)

## 项目状态说明

## 本项目目前尚处于早期测试阶段。请注意，组件的属性（API）可能会在进行不另行通知的情况下直接调整。我们强烈建议您在评估后再决定是否在项目中使用。
## 您可以通过以下渠道联系我们，以获取第一时间的支持与最佳实践指导：

* QQ 交流群：697050187
* X (Twitter) 私信：https://x.com/howie3526371309
* GitHub Issues：https://github.com/OpenSourceNoCode/antd-flutter/issues**

## ✨ 特性

- 零依赖，暗黑模式开箱即用,安装即完成
- 超轻量，包含icon后整包仅218K
- 创新的样式系统，不绑定任何特定UI实现，灵活强大，允许你定制看到的每一个元素
- 自包含解决方案，从弹窗到滚动交互，一个组件库满足所有需求
- 列表触底触顶无缝滚动，任意位置任意内容布局跳转

## 📦 安装

```bash
flutter pub add antd_flutter_mobile
```

## 🔨 示例

```dart
import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    builder: (context, child) {
      return const Center(
        child: AntdButton(
          child: Text("Button"),
        ),
      );
    },
  ));
}
```

## 🔨 使用弹层

```dart
import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    navigatorObservers: [AntdLayer.observer],
    home: AntdTokenBuilder(builder: (context, token) {
      return AntdBox(
        style: AntdBoxStyle(
            color: token.colorFillTertiary, alignment: Alignment.center),
        child: AntdButton(
          onTap: () {
            AntdToast.show(
              "Toast",
              position: AntdToastPosition.top,
            );
          },
          child: const Text("Button"),
        ),
      );
    }),
  ));
}
```

## 🔨 自定义主题

```dart
import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AntdProvider(
      theme: AntdTheme(
          mode: AntdThemeMode.light,
          buttonStyle: (context, button, style, token) {
            if (button.size == AntdSize.large) {
              return AntdButtonStyle(
                  buttonStyle: AntdBoxStyle(color: token.colorWarning));
            }
            return style;
          },
          token: const AntdSeedToken(
            radius: 6,
            colorError: Color(0xffff3141),
            colorInfo: Color(0xff1677ff),
            colorLink: Color(0xff1677ff),
            colorPrimary: Color(0xffad05ef),
            colorSuccess: Color(0xff00b578),
            colorText: Color(0xff171717),
            colorBgBase: Color(0xffffffff),
            colorWarning: Color(0xffff8f1f),
            fontSize: 14,
            lineWidth: 2,
            sizeStep: 4,
            sizeUnit: 2,
            arrow: Size(16, 8),
          )),
      builder: (context, theme) {
        return MaterialApp(
          builder: (context, child) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AntdButton(
                  child: Text("Pick Button"),
                ),
                AntdButton(
                  size: AntdSize.large,
                  child: Text("Waining Button"),
                )
              ],
            );
          },
        );
      }));
}
```
## 🔨 样式系统

优先级: 3>4>1>2

```dart
import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AntdStyleBuilderProvider<AntdBoxStyle, AntdBox>(
      /// 1
        builder: (context, box, style, token,) {
          return AntdBoxStyle(
              color: token.colorPrimary,
              size: 100,
              textStyle: token.font.md.copyWith(color: token.colorSuccess),
              alignment: Alignment.center);
        },
        child: Row(
          children: [
            AntdStyleProvider<AntdBoxStyle>(
              /// 2
                style: const AntdBoxStyle(size: 50),
                child: AntdBox(
                  /// 4
                  style: AntdBoxStyle(
                      radius: 10.radius.all,
                      textStyle: const TextStyle(color: Colors.white)),
                  /// 3
                  styleBuilder: (context, box, style, token,) {
                    return AntdBoxStyle(
                        border: token.border
                            .copyWith(color: token.colorSuccess, width: 3)
                            .all);
                  },
                  child: const Text("box1"),
                )),
            AntdBox(
              style: AntdBoxStyle(margin: 10.left),
              child: const Text("box2"),
            )
          ],
        )),
  ));
}
```
