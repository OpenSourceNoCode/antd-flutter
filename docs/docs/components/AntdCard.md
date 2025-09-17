---
group:
  title: 信息展示
  order: 9
title: Card
subtitle: 卡片
---
通用卡片容器。
## 何时使用
可承载文字、列表、图片、段落等，便于用户浏览内容。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdCard'></iframe>
</div>
<div style='flex: 1;'>

### 基础用法


```dart
class AntdCardDemo extends StatelessWidget {
  const AntdCardDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
        outline: true, child: [AntdCard(child: Text('卡片内容'))]);
  }
}

```

### 自定义卡片内容


```dart
class AntdCardCustomDemo extends StatelessWidget {
  const AntdCardCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdCard(
          extra: const AntdIcon(
              icon: AntdIcons.rightright, style: AntdIconStyle(size: 13)),
          icon: AntdIcon(
              icon: AntdIcons.ant,
              style: AntdIconStyle(color: token.colorPrimary)),
          title: const Text("卡片标题"),
          footer: const AntdBox(
              style: AntdBoxStyle(alignment: Alignment.centerRight),
              child: AntdButton(color: AntdColor.primary, child: Text("底部按钮"))),
          child: const Text('卡片内容'))
    ]);
  }
}

```

### 自定义卡片样式


```dart
class AntdCardCustomStyleDemo extends StatelessWidget {
  const AntdCardCustomStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdCard(
          style: AntdCardStyle(
              titleStyle: AntdBoxStyle(
                  textStyle: token.font.ms.copyWith(color: token.colorPrimary)),
              bodyStyle: AntdBoxStyle(
                  textStyle: token.font.ms.copyWith(color: token.colorError))),
          title: const Text("卡片标题"),
          child: const Text('卡片内容'))
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
| style | 样式 | AntdCardStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdCardStyle, AntdCard&gt; | - | - |
| icon | 标题右边的扩展区 | Widget | - | - |
| extra | 标题左边的扩展区 | Widget | - | - |
| title | 标题 | Widget | - | - |
| child | 卡片内容 | Widget | - | - |
| footer | 底部内容 | Widget | - | - |


## 卡片样式(AntdCardStyle) <a id='AntdCardStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | body样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| bodyColumnStyle | body样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| headerStyle | header样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| headerRowStyle | header样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| titleStyle | 标题样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| extraStyle | 额外样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| contentStyle | 内容样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| footerStyle | 底部样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |


