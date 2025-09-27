---
group:
  title: 通用
  order: 0
title: Box
subtitle: 布局盒子
---
类似于Web中的div,小程序中的view,Android中的View,iOS中的UIView
## 何时使用


## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdBox'></iframe>
</div>
<div style='flex: 1;'>

### 基础用法


```dart
class AntdBoxDemo extends StatelessWidget {
  const AntdBoxDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: AntdBoxStyle(
                  alignment: Alignment.center,
                  size: 100,
                  color: token.colorPrimary,
                  radius: 40.radius.all,
                  border: token.border
                      .copyWith(color: token.colorSuccess, width: 10)
                      .all,
                  textStyle: token.font.md.copyWith(color: token.colorWhite)),
              child: const Text("我是文字"))
        ]);
  }
}

```

### 布局


```dart
class AntdLayoutDemo extends StatelessWidget {
  const AntdLayoutDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              height: 100,
              width: 200,
              color: token.colorSuccess,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("指定宽高"), Text("height:100,width: 150")]))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              size: 100,
              radius: 100.radius.all,
              alignment: Alignment.center,
              color: token.colorSuccess,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("圆角"))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              width: 0.6,
              height: 100,
              layoutModes: [
                AntdBoxLayoutMode.factorWidth,
                AntdBoxLayoutMode.fixedHeight
              ],
              color: token.colorSuccess,
              alignment: Alignment.center,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("宽度百分比高度固定"), Text("width: 0.6,height: 100")]))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              height: 0.6,
              width: 200,
              color: token.colorSuccess,
              layoutModes: [
                AntdBoxLayoutMode.factorHeight,
                AntdBoxLayoutMode.fixedWidth
              ],
              alignment: Alignment.center,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("高度百分比宽度固定"), Text("height: 0.6,width: 200,")]))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              height: 0.8,
              width: 0.8,
              color: token.colorSuccess,
              layoutModes: [
                AntdBoxLayoutMode.factorHeight,
                AntdBoxLayoutMode.factorWidth
              ],
              alignment: Alignment.center,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("宽高百分比,height: 0.8,width: 0.8"))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              color: token.colorSuccess,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("内容自适应"))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              height: 9,
              width: 16,
              layoutModes: [AntdBoxLayoutMode.aspectRatio],
              color: token.colorSuccess,
              alignment: Alignment.center,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("16:9宽高比"))),
      _buildBg(AntdBox(
          style: AntdBoxStyle(
              height: 3,
              width: 4,
              layoutModes: [AntdBoxLayoutMode.aspectRatio],
              color: token.colorSuccess,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("4:3宽高比")))
    ]);
  }
}

```

### 毛玻璃


```dart
class AntdBackdropFilterDemo extends StatelessWidget {
  const AntdBackdropFilterDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: AntdBoxStyle(
                  alignment: Alignment.center,
                  size: 100,
                  backdropFilter: 25,
                  color: token.colorSuccess.withValues(alpha: 0.8)),
              child: const Text("我是文字"))
        ]);
  }
}

```

### 阴影和渐变


```dart
class AntdShadowsGradientDemo extends StatelessWidget {
  const AntdShadowsGradientDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  color: token.colorPrimary,
                  radius: 6.radius.all,
                  textStyle: TextStyle(color: token.colorWhite),
                  gradient: LinearGradient(
                      colors: [token.colorSuccess, token.colorBlack]),
                  shadows: [
                    BoxShadow(
                        color: token.colorError,
                        offset: const Offset(-20, -20),
                        spreadRadius: 20,
                        blurRadius: 20)
                  ]),
              child: const Text("我是文字"))
        ]);
  }
}

```

### 隐藏和可见


```dart
class _AntdVisibilityDemoStateDemo extends State<AntdVisibilityDemo> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          Column(children: [
            AntdSegmented(
                value: value,
                onChange: (value) {
                  setState(() {
                    this.value = value;
                  });
                },
                items: [
                  AntdSegmentedItem(
                      value: AntdVisibility.hidden.name,
                      child: const Text("hidden(不占空间)")),
                  AntdSegmentedItem(
                      value: AntdVisibility.visible.name,
                      child: const Text("visible(空间不变)"))
                ]),
            AntdBox(
                style: AntdBoxStyle(
                    size: 100,
                    visibility: AntdVisibility.values
                        .where((data) => data.name == value)
                        .firstOrNull),
                child: const Text("完全隐藏"))
          ])
        ]);
  }
}

```

### 对齐模式


```dart
class AntdAlignmentDemo extends StatelessWidget {
  const AntdAlignmentDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: <Alignment>[
          Alignment.center,
          Alignment.centerLeft,
          Alignment.centerRight,
          Alignment.topCenter,
          Alignment.topLeft,
          Alignment.topRight,
          Alignment.bottomCenter,
          Alignment.bottomLeft,
          Alignment.bottomRight
        ].map((v) {
          return AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  color: token.colorPrimary,
                  alignment: v,
                  textStyle: TextStyle(color: token.colorWhite)),
              child: Text(v.toString().replaceAll("Alignment.", "")));
        }).toList());
  }
}

```

### 安全区 会自动合并margin和padding


```dart
class AntdSafeAreaDemo extends StatelessWidget {
  const AntdSafeAreaDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: AntdBoxStyle(color: token.colorError),
              child: AntdBox(
                  outerSafeArea: AntdPosition.bottom,
                  style: AntdBoxStyle(
                      size: 100,
                      padding: 30.bottom,
                      textStyle: TextStyle(color: token.colorWhite),
                      color: token.colorPrimary),
                  child: const Text("底部外安全区"))),
          AntdBox(
              child: AntdBox(
                  innerSafeArea: AntdPosition.top,
                  style: AntdBoxStyle(
                      size: 100,
                      color: token.colorError,
                      padding: 30.top,
                      textStyle: TextStyle(color: token.colorWhite)),
                  child: AntdBox(
                      style: AntdBoxStyle(color: token.colorPrimary),
                      child: const Text("顶部内安全区"))))
        ]);
  }
}

```

### style直接render一个Widget


```dart
class AntdStyleRenderDemo extends StatelessWidget {
  const AntdStyleRenderDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdKitStyle(
                  height: 50,
                  width: 50,
                  color: token.colorError,
                  alignment: Alignment.center)
              .render(),
          AntdKitStyle(
                  height: 50,
                  width: 50,
                  color: token.colorPrimary,
                  alignment: Alignment.center)
              .render(Text("Render",
                  style: token.font.ms.copyWith(color: token.colorWhite)))
        ]);
  }
}

```

### 事件


```dart
class AntdEventDemo extends StatelessWidget {
  const AntdEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var style = AntdBoxStyle(
        size: 100,
        alignment: Alignment.center,
        textStyle: TextStyle(color: token.colorWhite),
        color: token.colorPrimary);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: style,
              onTap: () {
                AntdToast.show("触发了单击");
              },
              child: const Text("单机")),
          AntdBox(
              style: style,
              onDoubleTap: () {
                AntdToast.show("触发了双击");
              },
              child: const Text("双击")),
          AntdBox(
              style: style,
              onLongPress: () {
                AntdToast.show("触发了长按");
              },
              child: const Text("长按")),
          AntdBox(
              style: style,
              onTap: () {
                AntdToast.show("单击");
              },
              onDoubleTap: () {
                AntdToast.show("双击");
              },
              onLongPress: () {
                AntdToast.show("长按");
              },
              child: const Text("同时存在")),
          AntdBox(
              style: style,
              disabled: true,
              onTap: () {
                AntdToast.show("单击");
              },
              onDoubleTap: () {
                AntdToast.show("双击");
              },
              onLongPress: () {
                AntdToast.show("长按");
              },
              options: const AntdTapOptions(alwaysTriggerTap: true),
              child: const Text("禁用")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              onTap: () {
                AntdToast.show("虽然移动了 但还是触发了单击");
              },
              options: const AntdTapOptions(allowOffset: true),
              child: const Text("移动后触发")),
          AntdBox(
              style: style,
              onTap: () {
                AntdToast.show("触发后500毫秒才执行单击");
              },
              onDoubleTap: () {
                AntdToast.show("触发后500毫秒才执行双击");
              },
              onLongPress: () {
                AntdToast.show("触发后500毫秒才执行长按");
              },
              options:
                  const AntdTapOptions(debounce: Duration(milliseconds: 500)),
              child: const Text("防抖 500毫秒")),
          AntdBox(
              style: style,
              onTap: () {
                AntdToast.show("1s内执行一次单击");
              },
              onDoubleTap: () {
                AntdToast.show("1s内执行一次双击");
              },
              onLongPress: () {
                AntdToast.show("1s内执行一次长按");
              },
              options:
                  const AntdTapOptions(debounce: Duration(milliseconds: 1000)),
              child: const Text("节流 1s")),
          AntdBox(
              style: style,
              onTap: () {
                AntdToast.show("触发单击");
              },
              onDoubleTap: () {
                AntdToast.show("触发双击");
              },
              onLongPress: () {
                AntdToast.show("触发长按");
              },
              options: const AntdTapOptions(alwaysTriggerTap: true),
              child: const Text("一直触发单击"))
        ]);
  }
}

```

### 穿透

蓝色会接收到所有事件,绿色和红色则不会

```dart
class AntdListenerDemo extends StatelessWidget {
  const AntdListenerDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var style = AntdBoxStyle(
        size: 300,
        alignment: Alignment.center,
        textStyle: TextStyle(color: token.colorWhite),
        color: token.colorPrimary);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: style,
              onTap: () {
                AntdToast.show("触发蓝色单击");
              },
              onDoubleTap: () {
                AntdToast.show("触发蓝色双击");
              },
              onLongPress: () {
                AntdToast.show("触发蓝色长按");
              },
              options: const AntdTapOptions(alwaysReceiveTap: true),
              child: AntdBox(
                  onTap: () {
                    AntdToast.show("触发红色单击");
                  },
                  onDoubleTap: () {
                    AntdToast.show("触发红色双击");
                  },
                  onLongPress: () {
                    AntdToast.show("触发红色长按");
                  },
                  style: style.copyFrom(
                      const AntdBoxStyle(size: 200, color: Colors.red)),
                  child: AntdBox(
                      onTap: () {
                        AntdToast.show("触发绿色单击");
                      },
                      onDoubleTap: () {
                        AntdToast.show("触发绿色双击");
                      },
                      onLongPress: () {
                        AntdToast.show("触发绿色长按");
                      },
                      style: style.copyFrom(
                          const AntdBoxStyle(size: 100, color: Colors.green)),
                      child: const Text("允许穿透"))))
        ]);
  }
}

```

### 按下时反馈

通过feedbackStyle完全自定义样式

```dart
class AntdFeedbackStyleDemo extends StatelessWidget {
  const AntdFeedbackStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var style = AntdBoxStyle(
        height: 200,
        width: double.infinity,
        alignment: Alignment.center,
        textStyle: TextStyle(color: token.colorWhite),
        border: token.border.copyWith(color: token.colorError).all,
        color: token.colorPrimary,
        feedbackStyle: AntdBoxStyle(
            textStyle: TextStyle(color: token.colorPrimary),
            border:
                token.border.copyWith(width: 2, color: token.colorPrimary).all,
            color: token.colorSuccess));
    return DemoWrapper(child: [
      AntdBox(style: style, child: const Text("按下时反馈")),
      AntdBox(
          style: style,
          options: const AntdTapOptions(feedbackDuration: Duration(seconds: 2)),
          child: const Text("自定义反馈时长"))
    ]);
  }
}

```

### 自定义样式


```dart
class AntdStylCustomDemo extends StatelessWidget {
  const AntdStylCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: AntdBoxStyle(
                  height: 200,
                  alignment: Alignment.center,
                  textStyle: token.font.lg.copyWith(color: token.colorWhite),
                  width: double.infinity,
                  color: token.colorPrimary,
                  border: token.border
                      .copyWith(color: token.colorSuccess, width: 2)
                      .all),
              child: const Text("通过style设置样式")),
          AntdBox(
              styleBuilder: (context, box, style, token) {
                return AntdBoxStyle(
                    height: 200,
                    alignment: Alignment.center,
                    textStyle: token.font.lg.copyWith(color: token.colorWhite),
                    width: double.infinity,
                    color: token.colorSuccess,
                    border: token.border
                        .copyWith(color: token.colorError, width: 2)
                        .all);
              },
              child: const Text("通过styleBuilder设置样式")),
          AntdStyleProvider(
              style: AntdBoxStyle(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  textStyle: token.font.lg.copyWith(color: token.colorWhite),
                  color: token.colorPrimary),
              child: Column(children: [
                AntdBox(child: Text("通过AntdStyleProvider统一设置")),
                AntdBox(
                    style: AntdBoxStyle(margin: 10.top),
                    child: Text("通过AntdStyleProvider统一设置"))
              ])),
          AntdStyleBuilderProvider<AntdBoxStyle, AntdBox>(
              builder: (context, box, style, token) {
                return AntdBoxStyle(
                    height: 100,
                    width: double.infinity,
                    alignment: Alignment.center,
                    textStyle: token.font.lg.copyWith(color: token.colorWhite),
                    color: token.colorSuccess);
              },
              child: Column(children: [
                const AntdBox(child: Text("通过AntdStyleBuilderProvider统一设置")),
                AntdBox(
                    style: AntdBoxStyle(margin: 10.top),
                    child: const Text("通过AntdStyleBuilderProvider统一设置"))
              ])),
          AntdBox(
              disabled: true,
              style: AntdBoxStyle(
                  height: 200,
                  width: double.infinity,
                  color: Colors.green,
                  disabledStyle: AntdBoxStyle(
                      size: 100,
                      color: token.colorError,
                      alignment: Alignment.center,
                      textStyle:
                          token.font.lg.copyWith(color: token.colorWhite),
                      border: token.border
                          .copyWith(color: token.colorPrimary, width: 3)
                          .all)),
              child: const Text("禁用样式"))
        ]);
  }
}

```

</div>
</div>

  <style>
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

/* Dart 代码高亮主题 - 基于 VS Code 暗色主题优化 */
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

/* 基础元素 */
.prism-code .hljs-keyword { color: #569cd6; font-weight: bold; }          /* 关键字 */
.prism-code .hljs-built_in { color: #4ec9b0; }                           /* 内置类型 */
.prism-code .hljs-type { color: #4ec9b0; }                               /* 类型声明 */
.prism-code .hljs-literal { color: #569cd6; }                            /* 字面量 */
.prism-code .hljs-number { color: #b5cea8; }                             /* 数字 */
.prism-code .hljs-string { color: #ce9178; }                             /* 字符串 */
.prism-code .hljs-comment { color: #6a9955; font-style: italic; }        /* 注释 */
.prism-code .hljs-meta { color: #9b9b9b; }                               /* 元信息 */

/* Dart 特有元素 */
.prism-code .hljs-constant { color: #4fc1ff; }                           /* const/final */
.prism-code .hljs-function { color: #dcdcaa; }                           /* 函数名 */
.prism-code .hljs-title.class_ { color: #4ec9b0; text-decoration: underline; } /* 类名 */
.prism-code .hljs-params { color: #9cdcfe; }                             /* 参数 */
.prism-code .hljs-variable { color: #9cdcfe; }                           /* 变量 */
.prism-code .hljs-annotation { color: #d4d4d4; background: #3a3a3a; }    /* 注解 */
.prism-code .hljs-punctuation { color: #d4d4d4; }                        /* 标点符号 */

/* 特殊增强 */
.prism-code .hljs-constructor { color: #c586c0; }                        /* 构造函数 */
.prism-code .hljs-named-parameter { color: #9cdcfe; font-style: italic; }/* 命名参数 */
.prism-code .hljs-generic { color: #4ec9b0; opacity: 0.8; }              /* 泛型符号 */
.prism-code .hljs-typedef { color: #4ec9b0; text-decoration: underline; }/* typedef */

/* 行号样式 (可选) */
.prism-code .hljs-ln-numbers {
  color: #858585;
  text-align: right;
  padding-right: 12px;
}
</style>

## 属性
| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| style | 样式 | AntdBoxStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdBoxStyle, AntdBox&gt; | - | - |
| outerSafeArea | 外部安全区域边距（通常用于避开系统UI如刘海屏）:`top` \| `bottom` \| `left` \| `right` \| `horizontal` \| `vertical` \| `all` | AntdPosition | - | - |
| innerSafeArea | 内部安全区域边距（内容与边界的保留间距）:`top` \| `bottom` \| `left` \| `right` \| `horizontal` \| `vertical` \| `all` | AntdPosition | - | - |
| onLayout | 参数包含视图的尺寸和全局位置信息 | AntdOnLayout | - | - |
| onFocus | 焦点变化回调（当组件获得/失去焦点时触发） | AntdOnFocus | - | - |
| onTap | 轻击事件回调 | VoidCallback | - | - |
| onDoubleTap | 双击事件回调 | VoidCallback | - | - |
| onLongPress | 长按事件回调 | VoidCallback | - | - |
| disabled | 禁用 | bool | - | - |
| options | 包括：双击间隔、长按时长、触觉反馈等 | AntdTapOptions | - | - |
| child | 子组件（通常为需要应用这些交互和布局约束的内容） | Widget | - | - |
| focusNode | 焦点 | FocusNode | - | - |
| scrollController | 滚动控制器 | ScrollController | - | - |


## 基础样式(AntdKitStyle) <a id='AntdKitStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| padding | 内边距 | EdgeInsets | - | - |
| margin | 外边距 | EdgeInsets | - | - |
| opacity | 透明度 | double | - | - |
| color | 背景色 | Color | - | - |
| border | 边框 | Border | - | - |
| radius | 圆角 | BorderRadius | - | - |
| textStyle | 共享的Text样式 | [TextStyle](../components/text/#TextStyle) | - | - |
| height | 高度 | double | - | - |
| minHeight | 最小高度 | double | - | - |
| width | 宽度 | double | - | - |
| minWidth | 最小宽度 | double | - | - |
| size | 统一尺寸（同时影响 width/height，优先级最低） | double | - | - |
| layoutModes | 布局行为模式 | List&lt;AntdBoxLayoutMode&gt; | - | - |
| backdropFilter | 毛玻璃效果 | double | - | - |
| shadows | 阴影 | List&lt;BoxShadow&gt; | - | - |
| gradient | 渐变 | Gradient | - | - |
| alignment | 子容器的对齐方式 | Alignment | - | - |
| visibility | 可见状态:`hidden` \| `visible` | AntdVisibility | - | - |
| hapticFeedback | 震动反馈:`light` \| `medium` \| `heavy` | AntdHapticFeedback | - | - |
| colorFilter | 颜色过滤 | ColorFilter | - | - |

## 盒子样式(AntdBoxStyle) <a id='AntdBoxStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| padding | 内边距 | EdgeInsets | - | - |
| margin | 外边距 | EdgeInsets | - | - |
| opacity | 透明度 | double | - | - |
| color | 背景色 | Color | - | - |
| border | 边框 | Border | - | - |
| radius | 圆角 | BorderRadius | - | - |
| textStyle | 共享的Text样式 | [TextStyle](../components/text/#TextStyle) | - | - |
| height | 高度 | double | - | - |
| minHeight | 最小高度 | double | - | - |
| width | 宽度 | double | - | - |
| minWidth | 最小宽度 | double | - | - |
| size | 统一尺寸（同时影响 width/height，优先级最低） | double | - | - |
| layoutModes | 布局行为模式 | List&lt;AntdBoxLayoutMode&gt; | - | - |
| backdropFilter | 毛玻璃效果 | double | - | - |
| shadows | 阴影 | List&lt;BoxShadow&gt; | - | - |
| gradient | 渐变 | Gradient | - | - |
| alignment | 子容器的对齐方式 | Alignment | - | - |
| visibility | 可见状态:`hidden` \| `visible` | AntdVisibility | - | - |
| hapticFeedback | 震动反馈:`light` \| `medium` \| `heavy` | AntdHapticFeedback | - | - |
| colorFilter | 颜色过滤 | ColorFilter | - | - |
| focusStyle |  | [AntdKitStyle](../components/antd-box/#AntdKitStyle) | - | - |
| disabledStyle |  | [AntdKitStyle](../components/antd-box/#AntdKitStyle) | - | - |
| feedbackStyle |  | [AntdKitStyle](../components/antd-box/#AntdKitStyle) | - | - |
| options | 触摸配置 优先级低于[AntdBox]上的options | AntdTapOptions | - | - |


