---
group:
  title: 信息展示
  order: 27
title: Footer
subtitle: 页脚
---

## 何时使用
适用于页面底部信息描述。

## 代码展示

<div class='preview-container'>
<div>

### 基础页脚


```dart
class AntdFooterDemo extends StatelessWidget {
  const AntdFooterDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [AntdFooter(label: Text("没有更多了"))]);
  }
}

```

### 自定义 label


```dart
class AntdFooterLabelDemo extends StatelessWidget {
  const AntdFooterLabelDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdFooter(
          label: Row(children: [
        AntdIcon(icon: AntdIcons.handPayCircle),
        Text("蚂蚁财富")
      ]))
    ]);
  }
}

```

### 带内容的页脚


```dart
class AntdFooterContentDemo extends StatelessWidget {
  const AntdFooterContentDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdFooter(content: Text("@ 2004-2020 Alipay.com All rights reserved"))
    ]);
  }
}

```

### 带链接的页脚


```dart
class AntdFooterLinksDemo extends StatelessWidget {
  const AntdFooterLinksDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [AntdFooter(links: links)]);
  }
}

```

### 带标签的页脚


```dart
class AntdFooterChipsDemo extends StatelessWidget {
  const AntdFooterChipsDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [AntdFooter(chips: chips)]);
  }
}

```

### 标签可点击


```dart
class AntdFooterChipsActiveDemo extends StatelessWidget {
  const AntdFooterChipsActiveDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [AntdFooter(chips: chipActives)]);
  }
}

```

### 组合使用


```dart
class AntdFooterChipsAllDemo extends StatelessWidget {
  const AntdFooterChipsAllDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdFooter(
          label: Text("没有更多了"),
          content: Text("@ 2004-2020 Alipay.com All rights reserved"),
          links: links,
          chips: chipActives)
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='http://localhost:49470/AntdFooter'></iframe>
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
| style | 样式 | AntdFooterStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdFooterStyle, AntdFooter&gt; | - | - |
| label | 带分割线的顶部内容 | Widget | - | - |
| links | 链接内容 | List&lt;Widget&gt; | - | - |
| content | 普通的内容部分 | Widget | - | - |
| chips | 底部标签 | List&lt;AntdFooterChip&gt; | - | - |


## 页脚样式类(AntdFooterStyle) <a id='AntdFooterStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| labelStyle | 标签文本样式（如版权信息等静态文本） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| linkStyle | 链接文本样式（可点击的链接元素） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| contentStyle | 内容区域容器样式（包裹所有内容的容器） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| chipStyle | 标签项默认样式（如分类标签/Tab标签） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| chipActiveStyle | 标签项激活状态样式（当前选中标签） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |

## 页脚标签项数据类(AntdFooterChip) <a id='AntdFooterChip'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| chip | 标签项组件（可自定义Widget内容） | Widget | - | - |
| active | 是否处于激活状态（控制高亮显示） | bool | - | - |


