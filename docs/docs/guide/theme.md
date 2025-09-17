---
group:
  title: 如何使用
  order: 2
order: 1
title: 主题
timeline: true
---

# 主题系统概述

Antd Flutter 的主题系统继承自 Ant Design 设计体系，并针对移动端特性进行了优化调整，包括默认字体、行高等样式属性。系统采用 Antd Color 标准算法实现，提供完整的主题定制能力。

## 核心架构

主题系统由三个关键部分组成：

* `AntdProvider` - 主题提供者
* `AntdTheme` - 主题
* `AntdSeedToken` - 基础样式变量（主色、警告色、圆角等基础属性）
* `AntdMapToken` - 完整样式变量集（由基础Token派生）

```dart
import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AntdProvider(
    theme: const AntdTheme(
      /// 亮色 或者 暗色两个枚举
      mode: AntdThemeMode.light,
    ),
    builder: (context, theme) {
      return MaterialApp(
        builder: (context, child) {
          return const AntdButton(
            size: AntdSize.large,
            child: Text("Waining Button"),
          );
        },
      );
    }));
}

```

## 默认Token配置

系统提供开箱即用的默认样式配置：

```dart
///亮色主题
const defaultLightToken = AntdSeedToken(
  radius: 4,
  colorError: Color(0xffff3141),
  colorInfo: Color(0xff1677ff),
  colorLink: Color(0xff1677ff),
  colorPrimary: Color(0xff1677ff),
  colorSuccess: Color(0xff00b578),
  colorText: Color(0xff333333),
  colorBgBase: Color(0xffffffff),
  colorWarning: Color(0xffff8f1f),
  fontSize: 14,
  lineWidth: 1,
  sizeStep: 4,
  sizeUnit: 2,
  arrow: Size(16, 8));

///暗色主题
const defaultDartToken = AntdSeedToken(
  radius: 4,
  colorError: Color(0xffff4a58),
  colorInfo: Color(0xff3086ff),
  colorLink: Color(0xff3086ff),
  colorPrimary: Color(0xff3086ff),
  colorSuccess: Color(0xff34b368),
  colorText: Color(0xffe6e6e6),
  colorBgBase: Color(0xff1a1a1a),
  colorWarning: Color(0xffffa930),
  fontSize: 14,
  lineWidth: 1,
  sizeStep: 4,
  sizeUnit: 2,
  opacityDefine: defaultDartOpacity,
  arrow: Size(16, 8));
```

## 主题定制

完全自定义主题

```dart
void main_customer() {
  runApp(AntdProvider(
    theme: const AntdTheme(

      /// 亮色 或者 暗色两个枚举
      mode: AntdThemeMode.light,

      /// 传入你的Token 比如主色，文字色
      token: AntdSeedToken(),

      /// 一般不需要你实现算法 使用mode 即可
      algorithms: []),
    builder: (context, theme) {
      return MaterialApp(
        builder: (context, child) {
          return const AntdButton(
            size: AntdSize.large,
            child: Text("Waining Button"),
          );
        },
      );
    }));
}
```

## 主题使用

全局获取主题

```dart
AntdTheme theme = AntdTheme.of(context);
AntdMapToken token = AntdTheme.ofToken(context);
```

局部主题覆盖

使用 `AntdTokenBuilder` 在任何区域使用主题：

```dart
AntdTokenBuilder(
      builder: (context, token) {
        return AntdBox(
          style: AntdBoxStyle(color: token.colorPrimary),
        );
      },
    );
```

<embed src="./_theme_table.md"></embed>
