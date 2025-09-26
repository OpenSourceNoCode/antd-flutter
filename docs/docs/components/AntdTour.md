---
group:
  title: 信息展示
  order: -1
title: Tour
subtitle: 引导提示
---

## 何时使用
提示用户操作和交互

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdTour'></iframe>
</div>
<div style='flex: 1;'>

### 基础使用


```dart
class AntdTourDemo extends StatelessWidget {
  const AntdTourDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Center(
          child: AntdTour(
              child: Column(
                  children: List.generate(4, (i) {
        var index = i + 1;
        return AntdTourStep(
            index: index,
            defaultOpen: index == 1,
            title: Text("第$index个的标题"),
            description: Text("第$index个的描述"),
            child: AntdBox(
                style: AntdBoxStyle(size: index * 30, color: getRandomColor()),
                child: Text("$index")));
      }))))
    ]);
  }
}

```

### 使用Controller


```dart
class _AntdTourControllerDemoStateDemo extends State<AntdTourControllerDemo> {
  AntdTourController controller = AntdTourController();
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Center(
          child: AntdTour(
              controller: controller,
              child: Column(
                  children: List.generate(4, (i) {
                var index = i + 1;
                return AntdTourStep(
                    index: index,
                    title: Text("第$index个的标题"),
                    description: Text("第$index个的描述"),
                    child: AntdBox(
                        style: AntdBoxStyle(
                            size: index * 30, color: getRandomColor()),
                        child: Text("$index")));
              })))),
      AntdButton(
          child: const Text("打开第3个"),
          onTap: () {
            controller.open(3);
          })
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
| style | 样式 | AntdTourStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdTourStyle, AntdTour&gt; | - | - |
| onClosed | 完全关闭后触发 | VoidCallback | - | - |
| onOpened | 完全展示后触发 | VoidCallback | - | - |
| onMaskTap | 点击蒙层自身触发,mask为true才有效 | VoidCallback | - | - |
| builder | 内容 | AntdMaskBuilder&lt;AntdTourState&gt; | - | - |
| opacity | 透明度,mask为true才有效:`transparent` \| `thin` \| `thick` | AntdMaskOpacity | thin | - |
| dismissOnMaskTap | 点击背景板是否关闭,mask为true才有效 | bool | true | - |
| showMask | 是否显示背景蒙版 | bool | true | - |
| child | 需要被引导的高亮目标组件 | Widget | - | - |
| controller | 引导流程的控制器，用于手动控制步骤切换 | AntdTourController | - | - |
| animation | 动画 | AntdTourAnimation | - | - |


## 提示样式(AntdTourStyle) <a id='AntdTourStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| maskColor | 背景色 | Color | - | - |
| maskOpacity | 透明度 | double | - | - |
| stepStyle | 步骤条样式 | [AntdTourStepStyle](../components/antd-tour-step/#AntdTourStepStyle) | - | - |
| animation | 动画 | AntdTourAnimation | - | - |

## 提示的步骤样式(AntdTourStepStyle) <a id='AntdTourStepStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 弹出层内容区域的样式设置 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| arrowOffset | 箭头相对于弹出层的偏移量 | Offset | - | - |
| offset | 弹出层相对于目标元素的偏移量 | Offset | - | - |
| arrowStyle | 箭头的样式配置 | [AntdArrowStyle](../components/antd-arrow/#AntdArrowStyle) | - | - |
| contentStyle | 步骤内容区域的样式配置 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| skipStyle | 跳过按钮的样式配置 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| nextStyle | 下一步按钮的样式配置 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| titleStyle | 标题文本的样式配置 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| titleColumnStyle | 标题列的布局样式配置 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| descriptionStyle | 描述文本的样式配置 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| holdPadding | 高亮区域的padding设置 | EdgeInsets | - | - |
| holdRadius | 高亮区域的圆角半径 | double | - | - |

## 提示的步骤(AntdTourStep) <a id='AntdTourStep'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| style | 样式 | AntdTourStepStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdTourStepStyle, AntdTourStep&gt; | - | - |
| index | 当前步骤的索引位置（从0开始） | int | - | - |
| child | 需要被高亮显示的目标组件 | Widget | - | - |
| title | 步骤标题组件，显示在引导内容的顶部 | Widget | - | - |
| description | 步骤描述组件，显示在标题下方的主要内容区域 | Widget | - | - |
| skip | 当前是否允许跳过 | bool | true | - |
| placement | 引导弹窗的显示位置:`top` \| `topLeft` \| `topRight` \| `bottom` \| `bottomLeft` \| `bottomRight` \| `left` \| `leftTop` \| `leftBottom` \| `right` \| `rightTop` \| `rightBottom` | AntdPlacement | bottom | - |
| skipBuilder | [skip](/skip): 跳过回调函数
[currentIndex](/current-index): 当前步骤索引
[total](/total): 总步骤数 | Widget Function(VoidCallback skip, int currentIndex, int total) | - | - |
| nextBuilder | [next](/next): 下一步回调函数 | Widget Function(VoidCallback next) | - | - |
| builder | [skip](/skip): 跳过按钮组件
[next](/next): 下一步按钮组件 | Widget Function(Widget skip, Widget next) | - | - |
| defaultOpen | 默认打开 | bool | false | - |


