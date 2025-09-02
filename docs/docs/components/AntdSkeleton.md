---
group:
  title: 反馈
  order: 31
title: Skeleton
subtitle: 骨架屏
---
用图形表示内容占位。
## 何时使用
在需要等待加载内容的位置提供一个占位图形组合。

## 代码展示

<div class='preview-container'>
<div>

### 基础使用

不开启动画

```dart
class AntdSkeletonDemo extends StatelessWidget {
  const AntdSkeletonDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [AntdSkeleton(animated: false)]);
  }
}

```

### 动画和标题行

动画使用

```dart
class AntdSkeletonAnimatedDemo extends StatelessWidget {
  const AntdSkeletonAnimatedDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
        child: [AntdSkeleton(animated: true, title: true)]);
  }
}

```

### 多行


```dart
class AntdSkeletonRowsDemo extends StatelessWidget {
  const AntdSkeletonRowsDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
        child: [AntdSkeleton(animated: true, title: true, rows: 6)]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='https://antd-flutter-git-example-howie206s-projects.vercel.app/AntdSkeleton'></iframe>
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
| style | 样式 | AntdSkeletonStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdSkeletonStyle, AntdSkeleton&gt; | - | - |
| animated | 是否开启动画 | bool | true | - |
| title | 展示标题 | bool | true | - |
| rows | 行数 | int | 3 | - |
| duration | 动画周期 | Duration | const Duration(milliseconds: 1200) | - |


## 骨架屏样式(AntdSkeletonStyle) <a id='AntdSkeletonStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 主体样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| titleStyle | 内容样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| rowStyle | 内容样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| lastRowStyle | 内容样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| color | 动画的颜色 | Color | const Color(0xffe1e1e1) | - |


