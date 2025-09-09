<div align="center">
<div align="center">
<img height="90" src="https://gw.alipayobjects.com/zos/rmsportal/KDpgvguMpGfqaHPjicRK.svg">
<img height="90" src="https://storage.googleapis.com/cms-storage-bucket/lockup_flutter_horizontal.847ae81f5430402216fd.svg">
</div>
<h1>Antd Flutter Mobile</h1>

Antd Flutter Mobile is an implementation of Ant Design Mobile for the Flutter platform. With zero dependencies and an ultra-lightweight package (only 200kB in total), it offers 50+ high-quality components covering common interaction scenarios such as themes, overlays, forms, and precise list positioning.

English · [中文](https://github.com/OpenSourceNoCode/antd-flutter/blob/main/README-zh_CN.md)
</div>

[Document](https://antd-flutter.vercel.app/) · [Web Demo](https://opensourcenocode.github.io/antd-flutter/)

## ✨ Features

- Zero dependencies, ready to use upon installation
- Feather-light, The complete package weighs in at just 218KB, icons included.
- Innovative style system, not bound to any specific UI implementation—flexible and powerful, allowing you to customize every element you see
- Self-contained solution, meeting all needs from pop-ups to scroll interactions with one component library

## 📦 Installation

```bash
flutter pub add antd_flutter_mobile
```

## 🔨 Example

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

## 🔨 Use Layer

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

## 🔨 Custom Theme

```dart
import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AntdProvider(
      theme: AntdTheme(
          buttonStyle: (context, button, style, token) {
            if (button.size == AntdSize.large) {
              return AntdButtonStyle(
                  buttonStyle: AntdBoxStyle(color: token.colorWarning));
            }
            return style;
          },
          token: generateToken(
            const AntdBaseToken(
              radiusSize: 6,
              colorError: Color(0xffff3141),
              colorInfo: Color(0xff1677ff),
              colorLink: Color(0xff1677ff),
              colorPrimary: Color(0xffad05ef),
              colorSuccess: Color(0xff00b578),
              colorTextBase: Color(0xff171717),
              colorBgBase: Color(0xffffffff),
              colorWarning: Color(0xffff8f1f),
              fontSize: 14,
              lineType: '',
              lineWidth: 2,
              sizeStep: 4,
              sizeUnit: 2,
            ),
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
## 🔨 Style System

Merge order: 4>3>2>1

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
                        border: token.borderSide
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
