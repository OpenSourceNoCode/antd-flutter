---
group:
  title: 信息展示
  order: 25
title: Tag
subtitle: 标签
---
进行标记和分类的小标签。
## 何时使用
适用于标记事物的属性和维度。

## 代码展示

<div class='preview-container'>
<div>

### 事件


```dart
class AntdTagRoundDemo extends StatelessWidget {
  const AntdTagRoundDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdTag(
          onTap: () {
            AntdToast.show("触摸了");
          },
          color: AntdColor.primary,
          child: const Text("触摸事件")),
      AntdTag(
          onTap: () {
            AntdToast.show("我是触摸事件");
          },
          onClose: () {
            AntdToast.show("我是关闭事件");
          },
          color: AntdColor.primary,
          round: true,
          close: const AntdIcon(icon: AntdIcons.close),
          child: const Text("关闭事件"))
    ]);
  }
}

```

### 自定义样式


```dart
class AntdTagCustomDemo extends StatelessWidget {
  const AntdTagCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdTag(
          style: AntdTagStyle(
              bodyStyle:
                  AntdBoxStyle(color: token.colorPrimary, padding: 4.all),
              closeStyle: AntdBoxStyle(color: token.colorWarning)),
          child: const Text("自定义样式"),
          close: AntdBox(child: Text("取消")))
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='https://antd-flutter-git-example-howie206s-projects.vercel.app/AntdTag'></iframe>
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
| style | 样式 | AntdTagStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdTagStyle, AntdTag&gt; | - | - |
| color | 标签色:`default_` \| `primary` \| `success` \| `warning` \| `danger` \| `info` \| `link` | AntdColor | default_ | - |
| fill | 填充模式:`solid` \| `outline` | AntdTagFill | solid | - |
| round | 是否圆角 | bool | false | - |
| close | 关闭区域 | Widget | - | - |
| onClose | 关闭事件 | VoidCallback | - | - |
| onTap | 标签点击事件 | VoidCallback | - | - |
| child | 内容 | Widget | - | - |


## 标签样式(AntdTagStyle) <a id='AntdTagStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 主体样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| closeStyle | 关闭样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| closeIconStyle | 关闭样式 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| rowStyle | 轴对齐 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |


