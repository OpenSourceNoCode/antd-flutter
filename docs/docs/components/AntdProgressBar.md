---
group:
  title: 反馈
  order: 21
title: ProgressBar
subtitle: 进度条
---
用条状图形表示百分比进度。
## 何时使用
适用于展示任务当前进度。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdProgressBar'></iframe>
</div>
<div style='flex: 1;'>

### 基础用法


```dart
class _AntdProgressBarDemoStateDemo extends State<AntdProgressBarDemo> {
  double currentStep = 0.0;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Column(children: [
        Row(children: [
          AntdButton(
              disabled: currentStep == 0,
              onTap: () {
                setState(() {
                  currentStep = currentStep - 10;
                });
              },
              child: const Text("进度-10")),
          Padding(
              padding: 10.left,
              child: AntdButton(
                  disabled: currentStep == 100,
                  onTap: () {
                    setState(() {
                      currentStep = currentStep + 10;
                    });
                  },
                  child: const Text("进度+10")))
        ]),
        Padding(
            padding: 12.top,
            child: AntdProgressBar(
                onChange: (c) {
                  AntdToast.show('当前$c');
                },
                onFinish: () {
                  AntdToast.show('完成了');
                },
                percent: currentStep)),
        Padding(
            padding: 12.top,
            child: AntdProgressBar(
                percent: currentStep, child: Text("$currentStep%")))
      ])
    ]);
  }
}

```

### 显示进度文字

进度文字展示在末尾

```dart
class AntdProgressBarTextDemo extends StatelessWidget {
  const AntdProgressBarTextDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdProgressBar(percent: 30, child: Text("30%")),
      AntdProgressBar(percent: 50, child: Text("已完成 3/6 步"))
    ]);
  }
}

```

### 指定线条宽度

stroke指定宽度

```dart
class AntdProgressBarLineWidthDemo extends StatelessWidget {
  const AntdProgressBarLineWidthDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdProgressBar(percent: 30, stroke: 5),
      AntdProgressBar(percent: 40, stroke: 10)
    ]);
  }
}

```

### 指定线条颜色

color指定颜色

```dart
class AntdProgressBarLineColorDemo extends StatelessWidget {
  const AntdProgressBarLineColorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdProgressBar(percent: 30, color: AntdColor.danger, child: Text("30%")),
      AntdProgressBar(
          percent: 30, color: AntdColor.warning, child: Text("30%")),
      AntdProgressBar(percent: 30, color: AntdColor.success, child: Text("30%"))
    ]);
  }
}

```

### 自定义轨道和直角

通过style指定样式

```dart
class AntdProgressBarBgColorDemo extends StatelessWidget {
  const AntdProgressBarBgColorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdProgressBar(
          percent: 30,
          color: AntdColor.danger,
          style: AntdProgressBarStyle(color: token.colorPrimary)),
      AntdProgressBar(
          percent: 30,
          color: AntdColor.danger,
          style: AntdProgressBarStyle(color: token.colorSuccess, radius: 0))
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
| style | 样式 | AntdProgressBarStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdProgressBarStyle, W&gt; | - | - |
| child | 子组件 | Widget | - | - |
| color | 颜色:`primary` \| `success` \| `warning` \| `danger` \| `info` \| `link` | AntdColor | - | - |
| percent | 百分比 | double | 0.0 | - |
| stroke | 线的宽度 | double | 8.0 | - |
| duration | 周期 | Duration | const Duration(milliseconds: 1000) | - |
| onChange | 当每次变更时调用 | void Function(double percent) | - | - |
| onFinish | 当完成时调用 | VoidCallback | - | - |


## 进度条样式(AntdProgressBarStyle) <a id='AntdProgressBarStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| color | 背景色 | Color | - | - |
| progressColor | 前景色 | Color | - | - |
| textStyle | 默认的文本样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| radius | 圆角 | double | - | - |


