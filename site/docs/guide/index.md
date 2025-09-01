---
group:
  title: 如何使用
  order: 2
order: 1
title: 快速上手
timeline: true
---

## 安装

最新版本

```bash [最新版本]
flutter pub add antd_flutter_mobile
```

指定版本

```bash [指定版本]
添加以下依赖到你的 pubspec.yaml,具体的版本可以在 更新日志 中找到

dependencies:
  antd_flutter_mobile: 版本
```
## 引入

在需要的页面引入

```dart
import 'package:antd_flutter_mobile/index.dart';
```

添加 `AntdProvider` 包裹你的项目根目录，然后 为路由引入 `AntdLayer.observer` 他是实现弹层的基础
```dart

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
    ///如果你需要自定义主题 可以为 AntdProvider的theme传值，关于主题可以参考主题菜单
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

```

## 使用
一个按钮的示例 更多[组件](/components)

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
    return const AntdButton(
      child: Text("我是一个按钮"),
    );
  }
}
```
