---
group:
  title: 信息展示
  order: 22
title: Steps
subtitle: 步骤条
---
引导用户按照流程完成任务的导航条。
## 何时使用
当任务复杂或者存在先后关系时，将其分解成一系列步骤，从而简化任务。

## 代码展示

<div class='preview-container'>
<div>

### 基础使用


```dart
class AntdStepsDemo extends StatelessWidget {
  const AntdStepsDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSteps(current: 1, steps: [
        AntdStep(title: Text("标题1"), description: Text("描述")),
        AntdStep(title: Text("标题2"), description: Text("描述")),
        AntdStep(title: Text("标题3"), description: Text("描述"))
      ])
    ]);
  }
}

```

### 带失败节点


```dart
class AntdStepsErrorDemo extends StatelessWidget {
  const AntdStepsErrorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSteps(current: 2, steps: [
        AntdStep(title: Text("第一步")),
        AntdStep(title: Text("第二步")),
        AntdStep(title: Text("第三步"), status: AntdStepStatus.error),
        AntdStep(title: Text("第四步"))
      ])
    ]);
  }
}

```

### 纵向步骤条


```dart
class AntdStepsVerticalDemo extends StatelessWidget {
  const AntdStepsVerticalDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSteps(current: 0, vertical: true, steps: [
        AntdStep(title: Text("填写机构信息")),
        AntdStep(title: Text("签约机构")),
        AntdStep(title: Text("关联服务区"))
      ])
    ]);
  }
}

```

### 纵向步骤条带失败


```dart
class AntdStepsVerticalErrorDemo extends StatelessWidget {
  const AntdStepsVerticalErrorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSteps(
          current: 1,
          vertical: true,
          style: AntdStepsStyle(
              titleStyle: AntdBoxStyle(textStyle: TextStyle(fontSize: 18)),
              activeTitleStyle:
                  AntdBoxStyle(textStyle: TextStyle(fontSize: 18)),
              stepStyle: AntdBoxStyle(
                  padding: 6.all, size: 24, radius: 24.radius.all)),
          steps: [
            AntdStep(
                title: Text("填写机构信息"),
                icon: AntdIcon(
                    icon: AntdIcons.check,
                    style: AntdIconStyle(color: Colors.white)),
                description: Text("完成时间：2020-12-01 12:30")),
            AntdStep(
                title: Text("签约机构"),
                icon: AntdIcon(
                    icon: AntdIcons.close,
                    style: AntdIconStyle(color: Colors.white)),
                description: Text("完成时间：2020-12-01 12:30"),
                status: AntdStepStatus.error),
            AntdStep(
                title: Text("关联服务区"),
                icon: AntdIcon(
                    icon: AntdIcons.link,
                    style: AntdIconStyle(color: Colors.white)),
                description: Text("完成时间：2020-12-01 12:30"))
          ])
    ]);
  }
}

```

### 自定义图标及大小


```dart
class AntdStepsVerticalCustomDemo extends StatelessWidget {
  const AntdStepsVerticalCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSteps(current: 1, vertical: true, steps: [
        AntdStep(title: Text("填写机构信息"), description: Text("这里是一些描述")),
        AntdStep(
            title: Text("签约机构"),
            description: Column(children: [
              Text("这里是一些描述"),
              AntdButton(color: AntdColor.primary, child: Text("去看看"))
            ]),
            status: AntdStepStatus.error),
        AntdStep(title: Text("关联服务区"), description: Text("这里是一些描述"))
      ])
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='https://antd-flutter-git-example-howie206s-projects.vercel.app/AntdSteps'></iframe>
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
| style | 样式 | AntdStepsStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdStepsStyle, AntdSteps&gt; | - | - |
| current | 指定当前步骤，从 0 开始记数。在子 Step 元素中，可以通过 status 属性覆盖状态 | int | 0 | - |
| vertical | 指定步骤条方向。目前支持水平（horizontal）和竖直（vertical）两种方向 | bool | false | - |
| steps | 步骤 | List&lt;AntdStep&gt; | - | - |


## 步骤条样式(AntdStepsStyle) <a id='AntdStepsStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| titleStyle | 标题样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeTitleStyle | 激活标题样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| descStyle | 描述样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeDescStyle | 激活描述样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| lineStyle | 线的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeLineStyle | 激活线的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| stepStyle | 节点样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| stepColumnStyle | 轴对齐样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |

## 步骤条定义(AntdStep) <a id='AntdStep'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| description | 步骤的详情描述，可选 | Widget | - | - |
| icon | 步骤图标的类型 | Widget | - | - |
| status | 指定状态。当不配置该属性时，会使用 Steps 的 current 来自动指定状态；如果该属性与 current 指定的状态不匹配会覆盖自动匹配的状态:`wait` \| `process` \| `finish` \| `error` | AntdStepStatus | - | - |
| title | 标题 | Widget | - | - |


