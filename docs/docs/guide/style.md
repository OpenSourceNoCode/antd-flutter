---
group:
  title: 如何使用
  order: 2
order: 1
title: 样式系统
timeline: true
---

# 样式系统概述

Antd Flutter 实现了一套轻量级但功能强大的样式系统，支持静态样式和动态样式两种配置方式。动态样式系统允许开发者根据组件属性和当前主题动态生成样式，为UI定制提供了极大的灵活性。

## 核心概念

每个组件都支持以下两个样式属性：

* style: 静态样式配置
* styleBuilder: 动态样式构建器

动态样式构建器签名如下：

```dart
typedef AntdStyleBuilder<Style extends AntdStyle, WidgetType> = Style Function(
  BuildContext context,  // 构建上下文
  WidgetType widget,     // 当前组件实例
  Style defaultStyle,    // 已构建的默认样式
  AntdMapToken token); // 主题token
```

## 全局样式和局部样式

### 全局样式配置

通过`AntdTheme`可以统一配置所有组件的默认样式：

```dart
import 'package:antd_flutter_mobile/index.dart';
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
    return AntdProvider(
      theme: AntdTheme(
        buttonStyle: (context, button, style, token) {
          return AntdButtonStyle(
            buttonStyle:
            AntdBoxStyle(radius: token.radius.lg.radius.all));
        }),
      builder: (context, theme) {
        return const AntdButton(
          style: AntdButtonStyle(
            buttonStyle: AntdBoxStyle(textStyle: TextStyle(fontSize: 15))),
          child: Text("我是一个按钮"),
        );
      });
  }
}

```

### 局部样式覆盖

使用`AntdStyleProvider`或`AntdStyleBuilderProvider`可以在任意节点覆盖子组件的样式：

```dart
import 'package:antd_flutter_mobile/index.dart';
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
    ///style和styleBuilder任选其一即可,当同时存在时，styleBuilder优先级更高 因为它更灵活
    return AntdStyleProvider<AntdButtonStyle>(
      style:
      const AntdButtonStyle(buttonStyle: AntdBoxStyle(color: Colors.red)),
      child: AntdStyleBuilderProvider<AntdButtonStyle, AntdButton>(
        builder: (context, button, style, token) {
          if (button.size == AntdSize.large) {
            return AntdButtonStyle(
              buttonStyle: AntdBoxStyle(color: token.colorPrimary));
          }
          return AntdButtonStyle(
            buttonStyle: AntdBoxStyle(color: token.colorError));
        },
        child: const AntdButton(
          child: Text("我是一个按钮"),
        )));
  }
}

```

> 提示：style和styleBuilder可以单独使用，同时存在时styleBuilder优先级更高。

## 样式优先级规则

### Antd样式系统遵循"就近原则"和"动态优先"的优先级规则：

* 动态样式 > 静态样式
* 组件级样式 > `AntdStyleBuilderProvider`样式 > `AntdStyleProvider`样式 > `AntdTheme`全局样式

### 具体优先级顺序（从高到低）：

* 组件上的`styleBuilder`静态样式
* 组件上的`style`动态样式
* `AntdStyleBuilderProvider`提供的style静态样式
* `AntdStyleProvider`提供的builder动态样式
* `AntdTheme`中定义的全局样式
* 组件中定义的默认样式

## 样式合并机制

样式系统采用智能合并策略，确保样式属性能够层层叠加而不冲突：

```dart
import 'package:antd_flutter_mobile/index.dart';
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
    return AntdProvider(
      theme: AntdTheme(buttonStyle: (context, button, style, token) {
        /// 1 主题动态构建的样式
        return AntdButtonStyle(
          buttonStyle: AntdBoxStyle(radius: token.radius.lg.all));
      }), builder: (context, theme) {
      return AntdStyleProvider<AntdButtonStyle>(

        /// 2 局部静态样式
        style: const AntdButtonStyle(
          buttonStyle: AntdBoxStyle(color: Colors.red)),

        /// 3 局部动态样式
        child: AntdStyleBuilderProvider<AntdButtonStyle, AntdButton>(
          builder: (context, button, style, token) {
            if (button.size == AntdSize.large) {
              return AntdButtonStyle(
                buttonStyle: AntdBoxStyle(color: token.colorPrimary));
            }
            return AntdButtonStyle(
              buttonStyle: AntdBoxStyle(color: token.colorError));
          },
          child: AntdButton(
            /// 4 组件静态样式
            style: AntdButtonStyle(
              buttonStyle: AntdBoxStyle(
                textStyle: const TextStyle(fontSize: 15),
                radius: 15.radius.all),
            ),
            child: const Text("我是一个按钮"),
          )));
    });
  }
}

```

### 合并流程示例：

* `AntdTheme`提供基础radius样式
* `AntdStyleProvider` 覆盖颜色属性
* 组件最终样式将合并所有来源的有效属性
