---
group:
  title: 布局
  order: 3
title: Divider
subtitle: 分割线
---
区隔内容的分割线。
## 何时使用
对不同章节的文本段落进行分割,,对行内文字/链接进行分割，例如表格的操作列

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdDivider'></iframe>
</div>
<div style='flex: 1;'>

### 基础分割线

默认水平最宽

```dart
class AntdDividerDemo extends StatelessWidget {
  const AntdDividerDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [AntdDivider()]);
  }
}

```

### 自定义样式

通过[AntdDividerStyle](/antd-divider-style)覆盖默认样式

```dart
class AntdDividerStyleDemo extends StatelessWidget {
  const AntdDividerStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdDivider(
          style: AntdDividerStyle(color: token.colorPrimary, width: 4),
          child: const Text("默认中间"))
    ]);
  }
}

```

### 垂直分割线

设置vertical为ture

```dart
class AntdDividerVerticalDemo extends StatelessWidget {
  const AntdDividerVerticalDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      Row(children: [
        Text("我在左边", style: token.font.sm),
        const AntdDivider(vertical: true),
        const Text("我在右边"),
        const AntdDivider(vertical: true),
        const Text("最右边")
      ])
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
| style | 样式 | AntdDividerStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdDividerStyle, AntdDivider&gt; | - | - |
| color | 线的颜色:`fill` \| `primary` \| `success` \| `warning` \| `danger` \| `info` \| `link` | AntdColor | - | - |
| child | 内容 | Widget | - | - |
| vertical | 垂直还是水平 | bool | false | - |
| position | 文字位置:`left` \| `center` \| `right` | AntdDividerPosition | - | - |


## 分割线样式(AntdDividerStyle) <a id='AntdDividerStyle'></a>
| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| width | 水平分割线的宽度 | double | - | - |
| verticalHeight | 垂直分割线的高度 | double | - | - |
| color | 分割线的颜色值 | Color | - | - |
| margin | 分割线外边距 | double | - | - |
| childStyle |  | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |


