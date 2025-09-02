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
<div>

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
                  height: 100,
                  width: 100,
                  color: token.colorPrimary,
                  radius: 40.radius.all,
                  border: token.borderSide
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
      AntdBox(
          style: AntdBoxStyle(
              height: 100,
              width: 150,
              color: token.colorPrimary,
              alignment: Alignment.center,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("指定宽高")),
      AntdBox(
          style: AntdBoxStyle(
              size: 100,
              radius: 100.radius.all,
              alignment: Alignment.center,
              color: token.colorPrimary,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("通过Size属性并指定圆角")),
      AntdBox(
          style: AntdBoxStyle(
              size: 100,
              color: token.colorError,
              alignment: Alignment.centerLeft),
          child: AntdBox(
              style: AntdBoxStyle(
                  width: 0.8,
                  height: 50,
                  layoutModes: [
                    AntdBoxLayoutMode.factorWidth,
                    AntdBoxLayoutMode.fixedHeight
                  ],
                  color: token.colorPrimary,
                  textStyle: token.font.md.copyWith(color: token.colorWhite)),
              child: const Text("宽度百分比高度固定"))),
      AntdBox(
          style: AntdBoxStyle(
              size: 100,
              color: token.colorError,
              alignment: Alignment.centerLeft),
          child: AntdBox(
              style: AntdBoxStyle(
                  height: 0.8,
                  width: 50,
                  color: token.colorPrimary,
                  layoutModes: [
                    AntdBoxLayoutMode.factorHeight,
                    AntdBoxLayoutMode.fixedWidth
                  ],
                  textStyle: token.font.md.copyWith(color: token.colorWhite)),
              child: const Text("高度百分比宽度固定"))),
      AntdBox(
          style: AntdBoxStyle(
              size: 100,
              color: token.colorError,
              alignment: Alignment.centerLeft),
          child: AntdBox(
              style: AntdBoxStyle(
                  height: 0.8,
                  width: 0.8,
                  color: token.colorPrimary,
                  layoutModes: [
                    AntdBoxLayoutMode.factorHeight,
                    AntdBoxLayoutMode.factorWidth
                  ],
                  textStyle: token.font.md.copyWith(color: token.colorWhite)),
              child: const Text("宽高百分比"))),
      AntdBox(
          style: AntdBoxStyle(
              size: 150, color: token.colorError, alignment: Alignment.center),
          child: AntdBox(
              style: AntdBoxStyle(
                  color: token.colorPrimary,
                  textStyle: token.font.md.copyWith(color: token.colorWhite)),
              child: const Text("内容自适应"))),
      AntdBox(
          style: AntdBoxStyle(
              height: 9,
              width: 16,
              layoutModes: [AntdBoxLayoutMode.aspectRatio],
              color: token.colorPrimary,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("16:9宽高比")),
      AntdBox(
          style: AntdBoxStyle(
              height: 3,
              width: 4,
              layoutModes: [AntdBoxLayoutMode.aspectRatio],
              color: token.colorPrimary,
              textStyle: token.font.md.copyWith(color: token.colorWhite)),
          child: const Text("4:3宽高比"))
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
                  color: token.colorPrimary.withValues(alpha: 0.8)),
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
class AntdVisibilityDemo extends StatelessWidget {
  const AntdVisibilityDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
        outline: true,
        style: AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: AntdBoxStyle(size: 100, visibility: AntdVisibility.hidden),
              child: Text("完全隐藏")),
          AntdBox(
              style:
                  AntdBoxStyle(size: 100, visibility: AntdVisibility.visible),
              child: Text("隐藏但是空间仍在"))
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
                  size: 120,
                  color: token.colorPrimary,
                  alignment: v,
                  textStyle: TextStyle(color: token.colorWhite)),
              child: Text("${v.toString().replaceAll("Alignment.", "")}"));
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
                  style: token.font.default_.copyWith(color: token.colorWhite)))
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
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              onTap: () {
                AntdToast.show("触发了单击");
              },
              child: const Text("单机")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              options: const AntdTapOptions(
                  hapticFeedback: AntdHapticFeedback.heavy),
              onDoubleTap: () {
                AntdToast.show("触发了双击");
              },
              child: const Text("双击")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              onLongPress: () {
                AntdToast.show("触发了长按");
              },
              child: const Text("长按")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              disabled: true,
              onTap: () {
                AntdToast.show("如果在触发之前移动手指则会重新计算");
              },
              onLongPress: () {
                AntdToast.show("触发了禁用");
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
                AntdToast.show("触发了单击");
              },
              options: const AntdTapOptions(allowOffset: true),
              child: const Text("移动后抬起任然触发")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              onTap: () {
                AntdToast.show("先触发了单机");
              },
              onDoubleTap: () {
                AntdToast.show("触发了长按");
              },
              options: const AntdTapOptions(
                  allowOffset: true, alwaysTriggerTap: true),
              child: const Text("自定义触摸配置")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              onTap: () {
                AntdToast.show("触发了单机");
              },
              options: const AntdTapOptions(
                  throttle: Duration(milliseconds: 1000),
                  debounce: Duration(milliseconds: 100)),
              child: const Text("节流和防抖")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 100,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: token.colorWhite),
                  color: token.colorPrimary),
              onDoubleTap: () {
                AntdToast.show("触发了双击");
              },
              onLongPress: () {
                AntdToast.show("触发了长按");
              },
              options: const AntdTapOptions(
                  doubleTapTimeout: 50, longPressTimeout: 100),
              child: const Text("自定义长按和双击间隔"))
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
    var focusNode = FocusNode();
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
              disabled: true,
              style: AntdBoxStyle(
                  size: 50,
                  color: Colors.green,
                  disabledStyle: AntdBoxStyle(
                      size: 100,
                      color: token.colorError,
                      border: token.borderSide
                          .copyWith(color: token.colorPrimary, width: 3)
                          .all)),
              child: const Text("禁用样式")),
          AntdBox(
              style: AntdBoxStyle(
                  size: 50,
                  color: Colors.white,
                  feedbackStyle: AntdBoxStyle(
                      size: 100,
                      alignment: Alignment.center,
                      color: token.colorError,
                      border: token.borderSide
                          .copyWith(color: token.colorPrimary, width: 3)
                          .all)),
              child: const Text("按下反馈样式")),
          AntdBox(
              options: const AntdTapOptions(alwaysTriggerTap: true),
              onDoubleTap: () {
                if (focusNode.hasFocus) {
                  focusNode.unfocus();
                }
              },
              style: AntdBoxStyle(
                  size: 50,
                  color: Colors.white,
                  focusStyle: AntdBoxStyle(
                      size: 100,
                      alignment: Alignment.center,
                      textStyle:
                          token.font.default_.copyWith(color: token.colorWhite),
                      color: token.colorPrimary,
                      border: token.borderSide
                          .copyWith(color: token.colorWarning, width: 3)
                          .all)),
              child: AntdBox(child: const Text("获取焦点样式(双击取消焦点)")))
        ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdBox'></iframe>
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


