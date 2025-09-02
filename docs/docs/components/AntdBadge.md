---
group:
  title: 引导提示
  order: 88
title: Badge
subtitle: 徽标
---
在右上角展示数字、文字、小红点。
## 何时使用
适用于产品化的新消息、新功能、新服务等内容的提醒，通过醒目视觉形式吸引用户处理。

## 代码展示

<div class='preview-container'>
<div>

### 基础用法


```dart
class AntdBadgeDemo extends StatelessWidget {
  const AntdBadgeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdBadge(badge: Text("5"), child: _antdBox),
      AntdBadge(badge: Text("新"), child: _antdBox),
      AntdBadge(badge: Text("5"), dot: true, child: _antdBox)
    ]);
  }
}

```

### 带边框


```dart
class AntdBadgeBorderDemo extends StatelessWidget {
  const AntdBadgeBorderDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdBadge(
          badge: Text("更新了"),
          bordered: true,
          child: AntdBox(
              style: AntdBoxStyle(
                  height: 30,
                  width: 30,
                  radius: BorderRadius.all(Radius.circular(4)),
                  color: Color(0xff666666))))
    ]);
  }
}

```

### 独立使用

不设置child

```dart
class AntdBadgeSelfDemo extends StatelessWidget {
  const AntdBadgeSelfDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
        child: [AntdBadge(badge: Text("99+")), AntdBadge(badge: Text("新消息!"))]);
  }
}

```

### 自定义颜色和偏移量

通过position和color

```dart
class AntdBadgePositionColorDemo extends StatelessWidget {
  const AntdBadgePositionColorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdBadge(
          dot: true,
          color: AntdColor.primary,
          position: AntdBadgePosition.bottomLeft,
          child: _antdBox),
      AntdBadge(
          dot: true,
          color: AntdColor.success,
          position: AntdBadgePosition.topLeft,
          child: _antdBox),
      AntdBadge(
          dot: true,
          color: AntdColor.danger,
          position: AntdBadgePosition.topRight,
          child: _antdBox),
      AntdBadge(
          dot: true,
          color: AntdColor.warning,
          position: AntdBadgePosition.bottomRight,
          child: _antdBox)
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='http://localhost:49470/AntdBadge'></iframe>
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
| style | 样式 | AntdBadgeStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdBadgeStyle, AntdBadge&gt; | - | - |
| bordered | 是否显示边框（默认false） | bool | - | - |
| color | 徽标背景色/小圆点颜色:`default_` \| `primary` \| `success` \| `warning` \| `danger` \| `info` \| `link` | AntdColor | danger | - |
| badge | 徽标显示内容（数字/文字等） | Widget | - | - |
| dot | 是否显示为小红点而非内容（默认false） | bool | - | - |
| position | 徽标相对于子组件的位置:`topLeft` \| `topRight` \| `bottomLeft` \| `bottomRight` | AntdBadgePosition | topRight | - |
| child | 徽标包裹的子组件 | Widget | - | - |
| offset | 徽标自定义偏移量（相对默认位置调整） | Offset | - | - |


## 角标样式(AntdBadgeStyle) <a id='AntdBadgeStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| dotStyle | 徽标小圆点的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| badgeStyle | 徽标容器的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| bodyStyle | 徽标包裹内容的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| offset | 徽标的位置偏移量 | Offset | - | - |


