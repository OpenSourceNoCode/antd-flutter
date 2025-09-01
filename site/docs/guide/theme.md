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

* `AntdTheme` - 主题提供者
* `AntdBaseToken` - 基础样式变量（主色、警告色、圆角等基础属性）
* `AntdAliasToken` - 完整样式变量集（由基础Token派生）

```dart
AntdAliasToken token = generateToken(AntdBaseToken());
AntdTheme theme = AntdTheme(token: token);
```

## 默认Token配置

系统提供开箱即用的默认样式配置：

```dart
AntdAliasToken defaultToken = generateToken(const AntdBaseToken(
  radiusSize: 6,
  colorError: Color(0xffff3141),
  colorInfo: Color(0xff1677ff),
  colorLink: Color(0xff1677ff),
  colorPrimary: Color(0xff1677ff),
  colorSuccess: Color(0xff00b578),
  colorTextBase: Color(0xff171717),
  colorBgBase: Color(0xffffffff),
  colorWarning: Color(0xffff8f1f),
  fontSize: 14,
  lineType: '',
  lineWidth: 1,
  sizeStep: 4,
  sizeUnit: 2,
));
```

## 主题定制

完全自定义主题

```dart
AntdAliasToken token = generateToken(AntdBaseToken(
  ///传入基础主题配置 比如圆角主色等
));
AntdTheme theme = AntdTheme(token: token);
```

局部覆盖现有主题

```dart
AntdAliasToken token = generateToken(defaultToken);
AntdTheme theme = AntdTheme(token: token).copyWith(
  ///任意Token
);
```

## 主题使用

全局获取主题

```dart
AntdTheme theme = AntdTheme.of(context);
AntdAliasToken token = AntdTheme.ofToken(context);
```

局部主题覆盖

使用 `AntdTokenBuilder` 在特定区域覆盖主题：

```dart
AntdTokenBuilder(
      builder: (context, token) {
        return AntdBox(
          style: AntdBoxStyle(color: token.colorPrimary),
        );
      },
    );
```
