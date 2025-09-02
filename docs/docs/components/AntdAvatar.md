---
group:
  title: 信息展示
  order: 8
title: Avatar
subtitle: 头像
---
用来代表用户或事物。
## 何时使用
需要更加直观的展现人物或事物特征。

## 代码展示

<div class='preview-container'>
<div>

### 基础用法


```dart
class AntdAvatarDemo extends StatelessWidget {
  const AntdAvatarDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdAvatar(image: NetworkImage(demoAvatarImages[0])),
      AntdAvatar(image: NetworkImage(demoAvatarImages[1])),
      AntdAvatar(image: NetworkImage(demoAvatarImages[2])),
      AntdAvatar(image: NetworkImage(demoAvatarImages[3]))
    ]);
  }
}

```

### 占位头像

如果你不传图片，或者图片加载失败，那么会显示一个默认的图像

```dart
class AntdAvatarPlaceholderDemo extends StatelessWidget {
  const AntdAvatarPlaceholderDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [AntdAvatar(image: AssetImage(""))]);
  }
}

```

### 不同大小


```dart
class AntdAvatarSizeDemo extends StatelessWidget {
  const AntdAvatarSizeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdAvatar(image: NetworkImage(demoAvatarImages[0]), size: 32),
      AntdAvatar(image: NetworkImage(demoAvatarImages[1]), size: 48),
      AntdAvatar(image: NetworkImage(demoAvatarImages[2]), size: 64)
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdAvatar'></iframe>
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
| style | 样式 | AntdImageStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdImageStyle, AntdImage&gt; | - | - |
| image | 图片 | ImageProvider | - | - |
| fit | 图片填充模式 | BoxFit | - | - |
| scale | 缩放 | double | 1.0 | - |
| alignment | 对齐方式 | AlignmentGeometry | Alignment.center | - |
| repeat | 重复方式 | ImageRepeat | noRepeat | - |
| filterQuality | 过滤质量 | FilterQuality | medium | - |
| size | 大小 | double | 45.0 | - |
| radius | 圆角 | double | - | - |


## 图片样式(AntdImageStyle) <a id='AntdImageStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 外层的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| frameBuilder | 每一帧占位 | ImageFrameBuilder | - | - |
| errorBuild | 加载失败时触发 | ImageErrorWidgetBuilder | - | - |
| loadBuild | 图片加载完时触发 | ImageLoadingBuilder | - | - |


