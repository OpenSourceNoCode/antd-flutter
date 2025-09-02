---
group:
  title: 信息展示
  order: 11
title: Ellipsis
subtitle: 文本省略
---
展示空间不足时，隐去部分内容并用“...”替代。
## 何时使用
文本内容长度或高度超过列宽或行高。图表中空间有限，文本内容无法完全显示。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdEllipsis'></iframe>
</div>
<div style='flex: 1;'>

### 事件


```dart
class AntdEllipsisCustomDemo extends StatelessWidget {
  const AntdEllipsisCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdEllipsis(
          onCollapseTap: () {
            AntdToast.show("点击了收起");
          },
          onExpandTap: () {
            AntdToast.show("点击了展开");
          },
          onTextTap: () {
            AntdToast.show("点击了文本");
          },
          content: ellipsisText,
          collapseText: "点我收起",
          expandText: "点我展开")
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
| style | 样式 | AntdEllipsisStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdEllipsisStyle, AntdEllipsis&gt; | - | - |
| content | 文本内容 | String | - | - |
| collapseText | 收起操作的文案 | String | "收起" | - |
| expandText | 展开操作的文案 | String | "展开" | - |
| onTextTap | 点击文本内容时触发 | VoidCallback | - | - |
| onExpandTap | 点击展开文本内容时触发 | VoidCallback | - | - |
| onCollapseTap | 点击收起文本内容时触发 | VoidCallback | - | - |
| defaultExpanded | 是否默认展开 | bool | false | - |
| rows | 展示几行 | int | 1 | - |


## 文本省略（Ellipsis）组件的样式配置(AntdEllipsisStyle) <a id='AntdEllipsisStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| textStyle | 主文本的样式配置（字体、颜色等） | [TextStyle](../components/text/#TextStyle) | - | - |
| expandStyle | 展开的文本样式 | [TextStyle](../components/text/#TextStyle) | - | - |
| collapseStyle | 收起的文本样式 | [TextStyle](../components/text/#TextStyle) | - | - |


