---
group:
  title: 信息展示
  order: 11
title: FloatingPanel
subtitle: 浮动面板
---
内容型面板。
## 何时使用
用户可自由灵活上下滑动浏览内容，常用于地图导航。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdFloatingPanel'></iframe>
</div>
<div style='flex: 1;'>

### 基础使用


```dart
class AntdFloatingDemo extends StatelessWidget {
  const AntdFloatingDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdFloatingPanel(
          content: AntdList(
              shrinkWrap: true,
              items: data.map((value) {
                return Text(value);
              }).toList()),
          child: AntdBox(
              style: AntdBoxStyle(
                  width: double.infinity,
                  height: 500,
                  color: token.colorBgLayout),
              onTap: () {
                debugPrint("111");
              },
              child: const Text("我是背景")))
    ]);
  }
}

```

### 顶部的面板


```dart
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
              child: const Text("我是指示灯")),
          content: SizedBox(
              height: 400,
              child: AntdList(
                  items: data.map((value) {
                return Text(value);
              }).toList())),
          child: AntdBox(
              onTap: () {
                AntdToast.show("背景点击事件");
              },
              style: AntdBoxStyle(
                  width: double.infinity,
                  height: 500,
                  color: token.colorBgLayout),
              child: const Text("我是背景内容，我可以被正常点击")))
    ]);
  }
}

```

### 固定拖拽区域


```dart
class AntdFloatingAnchorsDemo extends StatelessWidget {
  const AntdFloatingAnchorsDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdFloatingPanel(
          anchors: const [0.3, 0.6, 0.8],
          content: AntdList(
              shrinkWrap: true,
              items: data.map((value) {
                return Text(value);
              }).toList()),
          child: AntdBox(
              onTap: () {
                AntdToast.show("背景点击事件");
              },
              style: AntdBoxStyle(
                  width: double.infinity,
                  height: 500,
                  color: token.colorBgLayout),
              child: const Text("我是背景内容，我可以被正常点击")))
    ]);
  }
}

```

### 自定义指示灯


```dart
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
              child: const Text("我是指示灯")),
          content: SizedBox(
              height: 400,
              child: AntdList(
                  items: data.map((value) {
                return Text(value);
              }).toList())),
          child: AntdBox(
              onTap: () {
                AntdToast.show("背景点击事件");
              },
              style: AntdBoxStyle(
                  width: double.infinity,
                  height: 500,
                  color: token.colorBgLayout),
              child: const Text("我是背景内容，我可以被正常点击")))
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
| style | 样式 | AntdFloatingPanelStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdFloatingPanelStyle, AntdFloatingPanel&gt; | - | - |
| child | 子类 | Widget | - | - |
| content | 内容 | Widget | - | - |
| anchors | 可拖拽至哪些高度,屏幕百分比 | List&lt;double&gt; | - | - |
| indicator | 指示灯 | Widget | - | - |
| onHeightChange | 高度变化 | AntdFloatingPanelHeightCallback | - | - |
| position | 面板的位置:`top` \| `bottom` | AntdFloatingPanelPosition | bottom | - |


## 浮动面板(FloatingPanel)的样式配置(AntdFloatingPanelStyle) <a id='AntdFloatingPanelStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 面板内容区域的样式（背景色、内边距等） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| headerStyle | 面板头部的样式（高度、背景色等） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| indicatorStyle | 拖拽指示器的样式（高度、颜色等） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |


