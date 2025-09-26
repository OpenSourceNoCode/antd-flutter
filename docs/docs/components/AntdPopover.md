---
group:
  title: 反馈
  order: 12
title: Popover
subtitle: 气泡弹出框
---
点击元素，弹出气泡式的菜单。
## 何时使用
适用于功能的导航，只可由导航栏上图标唤起，通常用于收纳低频使用的功能。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdPopover'></iframe>
</div>
<div style='flex: 1;'>

### 基础用法


```dart
class AntdPopoverDemo extends StatelessWidget {
  const AntdPopoverDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdPopover(
          mode: AntdPopoverMode.light,
          placement: AntdPlacement.topLeft,
          builder: (close, ctx) {
            return const AntdBox(child: Text("Hello World"));
          },
          child: const AntdButton(child: Text("亮色"))),
      AntdPopover(
          mode: AntdPopoverMode.dark,
          builder: (close, ctx) {
            return const AntdBox(child: Text("Hello World"));
          },
          child: const AntdButton(child: Text("暗色"))),
      AntdPopover(
          trigger: AntdPopoverTrigger.longPress,
          mode: AntdPopoverMode.dark,
          builder: (close, ctx) {
            return const AntdBox(child: Text("我是长按打开的内容"));
          },
          child: const AntdButton(child: Text("长按打开")))
    ]);
  }
}

```

### 事件


```dart
class AntdPopoverEventDemo extends StatelessWidget {
  const AntdPopoverEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdPopover(
          mode: AntdPopoverMode.light,
          placement: AntdPlacement.topLeft,
          onClosed: () {
            AntdToast.show("关闭了Popover");
          },
          onOpened: () {
            AntdToast.show("打开了Popover");
          },
          onMaskTap: () {
            AntdToast.show("点击了Popover背景");
          },
          builder: (close, ctx) {
            return const AntdBox(child: Text("Hello World"));
          },
          child: const AntdButton(child: Text("事件")))
    ]);
  }
}

```

### 手动打开等待弹窗完成


```dart
class AntdPopoverWaitDemo extends StatelessWidget {
  const AntdPopoverWaitDemo({super.key});
  @override
  Widget build(BuildContext context) {
    final AntdPopoverController controller = AntdPopoverController();
    return DemoWrapper(child: [
      AntdPopover(
          controller: controller,
          mode: AntdPopoverMode.light,
          placement: AntdPlacement.topLeft,
          builder: (close, ctx) {
            return const AntdBox(child: Text("Hello World"));
          },
          child: const AntdButton(child: Text('我上边有气泡'))),
      AntdButton(
          child: const Text("点我打开"),
          onTap: () {
            controller.open();
          })
    ]);
  }
}

```

### 不同的弹出位置


```dart
class AntdPlacementDemo extends StatelessWidget {
  const AntdPlacementDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
        child: AntdPlacement.values.map((value) {
      return AntdPopover(
          placement: value,
          builder: (close, ctx) {
            return const Column(mainAxisSize: MainAxisSize.min, children: [
              AntdBox(child: Text("Hello World1")),
              AntdBox(child: Text("Hello World2")),
              AntdBox(child: Text("Hello World3")),
              AntdBox(child: Text("Hello World4"))
            ]);
          },
          child: AntdButton(child: Text(value.name)));
    }).toList());
  }
}

```

### 多种激活方式


```dart
class AntdPopoverTriggerDemo extends StatelessWidget {
  const AntdPopoverTriggerDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdPopover(
          placement: AntdPlacement.top,
          trigger: AntdPopoverTrigger.tap,
          builder: (close, ctx) {
            return const AntdBox(child: Text("Hello World1"));
          },
          child: const AntdButton(child: Text("点击"))),
      AntdPopover(
          placement: AntdPlacement.top,
          trigger: AntdPopoverTrigger.longPress,
          builder: (close, ctx) {
            return const AntdBox(child: Text("Hello World1"));
          },
          child: const AntdButton(child: Text("长按")))
    ]);
  }
}

```

### 气泡菜单


```dart
class AntdPopoverActionDemo extends StatelessWidget {
  const AntdPopoverActionDemo({super.key});
  @override
  Widget build(BuildContext context) {
    final actions = [
      AntdPopoverAction(
          onTap: (_) {
            AntdToast.show("我触摸了扫一扫");
          },
          child: Text("扫一扫"),
          icon: const AntdIcon(icon: AntdIcons.scanning)),
      AntdPopoverAction(
          child: const Text("付钱/收钱"),
          icon: const AntdIcon(icon: AntdIcons.handPayCircle)),
      AntdPopoverAction(
          child: const Text("乘车码"),
          icon: const AntdIcon(icon: AntdIcons.transportQRcode)),
      AntdPopoverAction(
          child: const Text("智能助理"), icon: const AntdIcon(icon: AntdIcons.ant))
    ];
    return DemoWrapper(child: [
      AntdPopover(
          placement: AntdPlacement.topLeft,
          actions: actions,
          child: const AntdButton(child: Text("亮色"))),
      AntdPopover(
          mode: AntdPopoverMode.dark,
          actions: actions,
          child: const AntdButton(child: Text("暗色"))),
      AntdPopover(
          actions: actions.map((value) {
            return AntdPopoverAction(child: value.child);
          }).toList(),
          child: const AntdButton(child: Text("没有图标")))
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
| style | 样式 | AntdPopoverStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdPopoverStyle, AntdPopover&gt; | - | - |
| onClosed | 完全关闭后触发 | VoidCallback | - | - |
| onOpened | 完全展示后触发 | VoidCallback | - | - |
| onMaskTap | 点击蒙层自身触发,mask为true才有效 | VoidCallback | - | - |
| builder | 内容 | AntdMaskBuilder&lt;AntdPopoverState&gt; | - | - |
| opacity | 透明度,mask为true才有效:`transparent` \| `thin` \| `thick` | AntdMaskOpacity | transparent | - |
| dismissOnMaskTap | 点击背景板是否关闭,mask为true才有效 | bool | true | - |
| showMask | 是否显示背景蒙版 | bool | true | - |
| child | 弹出内容，比actions优先级更高 | Widget | - | - |
| dismissOnAction | 当执行action后关闭 | bool | true | - |
| actions | 菜单 | List&lt;AntdPopoverAction&gt; | - | - |
| placement | 弹出的位置:`top` \| `topLeft` \| `topRight` \| `bottom` \| `bottomLeft` \| `bottomRight` \| `left` \| `leftTop` \| `leftBottom` \| `right` \| `rightTop` \| `rightBottom` | AntdPlacement | top | - |
| mode | 设置亮色模式或者黑色模式:`light` \| `dark` | AntdPopoverMode | light | - |
| controller | 控制器,如果使用了控制器必须要手动打开，内部的点击会失效 | AntdPopoverController | - | - |
| trigger | 如何触发气泡:`tap` \| `longPress` \| `show` | AntdPopoverTrigger | tap | - |
| hapticFeedback | 开启反馈:`light` \| `medium` \| `heavy` | AntdHapticFeedback | light | - |
| animation | popover内容动画 | AntdPopoverAnimation | - | - |


## 样式(AntdPopoverActionStyle) <a id='AntdPopoverActionStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 操作项整体容器的样式配置 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| childStyle | 操作项内容构建区域的样式配置 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| childRowStyle | 对齐样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| iconStyle | 操作项图标的样式配置 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |

## action(AntdPopoverAction) <a id='AntdPopoverAction'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| style | 样式 | AntdPopoverActionStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdPopoverActionStyle, AntdPopoverAction&gt; | - | - |
| disabled | 是否禁用该操作项，禁用时不可点击且样式变灰 | bool | - | - |
| icon | 操作项前显示的图标组件 | Widget | - | - |
| child | 点击操作项时的回调函数，接收一个关闭弹层的方法 | Widget | - | - |
| onTap | 点击 | AntdActionOnTap | - | - |

## 弹出框整体样式配置类（继承自遮罩样式）(AntdPopoverStyle) <a id='AntdPopoverStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| maskColor | 背景色 | Color | - | - |
| maskOpacity | 透明度 | double | - | - |
| childStyle | child的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| actionStyle | Action的样式 | [AntdPopoverActionStyle](../components/antd-popover-action/#AntdPopoverActionStyle) | - | - |
| actionColumnStyle | Action的对齐样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| popoverBoxStyle | 弹出层样式 | [AntdPopoverBoxStyle](../components/antd-popover-box/#AntdPopoverBoxStyle) | - | - |
| animation | popover内容动画 | AntdPopoverAnimation | - | - |


