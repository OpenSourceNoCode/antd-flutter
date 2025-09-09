---
group:
  title: 引导提示
  order: 88
title: NoticeBar
subtitle: 通告栏
---
展示一组消息通知。
## 何时使用
适用于当前页面内信息的通知，是一种较醒目的页面内通知方式。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdNoticeBar'></iframe>
</div>
<div style='flex: 1;'>

### 通告栏语义


```dart
class AntdNoticeBarDemo extends StatelessWidget {
  const AntdNoticeBarDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdNoticeBar(content: "默认"),
      AntdNoticeBar(color: AntdColor.warning, content: "警告"),
      AntdNoticeBar(color: AntdColor.danger, content: "错误"),
      AntdNoticeBar(color: AntdColor.primary, content: "信息"),
      AntdNoticeBar(color: AntdColor.info, content: "信息"),
      AntdNoticeBar(color: AntdColor.link, content: "链接")
    ]);
  }
}

```

### 可关闭


```dart
class AntdNoticeBarCloseableDemo extends StatelessWidget {
  const AntdNoticeBarCloseableDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
        child: [AntdNoticeBar(closeable: true, content: "默认")]);
  }
}

```

### 超长滚动


```dart
class AntdNoticeBarWrapFalseDemo extends StatelessWidget {
  const AntdNoticeBarWrapFalseDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdNoticeBar(
          wrap: false,
          color: AntdColor.warning,
          content: "veniam "
              "culpa "
              "occaecat"
              " ad dolore incididunt fugiat consequat Lorem est "
              "enim consectetur duis sint adipisicing adipisicing l"
              "aboris sunt adipisicing officia")
    ]);
  }
}

```

### 多行展示


```dart
class AntdNoticeBarWrapDemo extends StatelessWidget {
  const AntdNoticeBarWrapDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdNoticeBar(
          wrap: true,
          color: AntdColor.warning,
          content: "适用于当前页面内信息的通知，是一种较醒目的页面内通知方式")
    ]);
  }
}

```

### 自定义


```dart
class AntdNoticeBarCustomDemo extends StatelessWidget {
  const AntdNoticeBarCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdNoticeBar(
          closeable: true,
          icon: AntdIcon(icon: AntdIcons.receivePayment),
          closeIcon: AntdIcon(icon: AntdIcons.closeCircle),
          content: "自定义图标"),
      AntdNoticeBar(
          closeable: true,
          icon: AntdIcon(icon: AntdIcons.receivePayment),
          closeIcon: AntdIcon(icon: AntdIcons.closeCircle),
          content: "自定义右侧功能区",
          extra: Row(children: [Text("查看详情"), Text("关闭")]))
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
| style | 样式 | AntdNoticeBarStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdNoticeBarStyle, AntdNoticeBar&gt; | - | - |
| closeable | 是否可关闭 | bool | - | - |
| closeIcon | 自定义关闭按钮图标 | Widget | const AntdIcon(icon: AntdIcons.close) | - |
| color | 通告栏的类型:`default_` \| `primary` \| `success` \| `warning` \| `danger` \| `info` \| `link` | AntdColor | - | - |
| content | 公告内容 | String | - | - |
| delay | 开始滚动的延迟，单位 ms | Duration | const Duration(milliseconds: 1000) | - |
| speed | 滚动的速度 | double | 50.0 | - |
| extra | 额外操作区域，显示在关闭按钮左侧 | Widget | - | - |
| icon | 额外操作区域，显示在关闭按钮左侧 | Widget | const AntdIcon(icon: AntdIcons.sound) | - |
| onClose | 关闭时的回调 | VoidCallback | - | - |
| onClick | 点击事件 | VoidCallback | - | - |
| wrap | 是否多行展示 | bool | true | - |


## 通告栏样式(AntdNoticeBarStyle) <a id='AntdNoticeBarStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| iconStyle | 左侧图标大小 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| closeStyle | 关闭区域样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| bodyStyle | 内容的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| extraStyle | 扩展区域样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |


