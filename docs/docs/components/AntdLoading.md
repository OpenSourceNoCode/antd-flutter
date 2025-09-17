---
group:
  title: 反馈
  order: 6
title: Loading
subtitle: 加载中
---
用于页面和区块的加载中状态。
## 何时使用
页面局部处于等待异步数据或正在渲染过程时，合适的加载动效会有效缓解用户的焦虑。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdLoading'></iframe>
</div>
<div style='flex: 1;'>

### 默认


```dart
class AntdLoadingDemo extends StatelessWidget {
  const AntdLoadingDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
        child: [AntdLoading(), AntdLoading(circular: true)]);
  }
}

```

### 不同大小


```dart
class AntdLoadingSizeDemo extends StatelessWidget {
  const AntdLoadingSizeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdLoading(color: AntdColor.primary, size: 4),
      AntdLoading(color: AntdColor.primary, size: 6),
      AntdLoading(color: AntdColor.primary, size: 12),
      AntdLoading(color: AntdColor.primary, size: 24),
      AntdLoading(circular: true, color: AntdColor.primary, size: 12),
      AntdLoading(circular: true, color: AntdColor.primary, size: 16),
      AntdLoading(circular: true, color: AntdColor.primary, size: 24),
      AntdLoading(circular: true, color: AntdColor.primary, size: 32)
    ]);
  }
}

```

### 有子元素

loading自动居中，并且会自动添加遮罩层

```dart
class AntdLoadingChildDemo extends StatelessWidget {
  const AntdLoadingChildDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdLoading(
          circular: true,
          child: AntdBox(
              style: AntdBoxStyle(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  color: token.colorPrimary),
              child: const Text("子元素")))
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
| style | 样式 | AntdLoadingStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdLoadingStyle, AntdLoading&gt; | - | - |
| size | 加载指示器尺寸 | double | - | - |
| color | 加点的颜色:`primary` \| `success` \| `warning` \| `danger` \| `info` \| `link` | AntdColor | - | - |
| text | 加载中文案 | Widget | - | - |
| circular | 圆形加载中 | bool | false | - |
| child | 被包裹的widget | Widget | - | - |
| spinning | 是否是加载中 | bool | true | - |


## 加载中样式(AntdLoadingStyle) <a id='AntdLoadingStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| color | 加载指示器颜色（默认主题色） | Color | - | - |
| textStyle | 加载文字样式（字体、颜色等） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| size | 加载指示器尺寸 | double | - | - |
| duration | 动画周期 | Duration | const Duration(milliseconds: 1000) | - |


