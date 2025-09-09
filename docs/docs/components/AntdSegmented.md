---
group:
  title: 信息展示
  order: 22
title: Segmented
subtitle: 分段控制器
---

## 何时使用
用于展示多个选项并允许用户选择其中单个选项

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdSegmented'></iframe>
</div>
<div style='flex: 1;'>

### 基础使用


```dart
class AntdSegmentedDemo extends StatelessWidget {
  const AntdSegmentedDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSegmented(
          activeIndex: 0,
          items: const [
            AntdSegmentedItem(child: Text("Daily")),
            AntdSegmentedItem(child: Text("Weekly")),
            AntdSegmentedItem(child: Text("Monthly")),
            AntdSegmentedItem(child: Text("Yearly"))
          ],
          onChange: (index) {
            AntdToast.show("当前index:$index");
          })
    ]);
  }
}

```

### 受控的 Segmented


```dart
class _AntdControllerDemoStateDemo extends State<AntdControllerDemo> {
  var value = 0;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSegmented(activeIndex: value, items: const [
        AntdSegmentedItem(child: Text("Daily")),
        AntdSegmentedItem(child: Text("Weekly")),
        AntdSegmentedItem(child: Text("Monthly")),
        AntdSegmentedItem(child: Text("Yearly"))
      ]),
      AntdButton(
          child: const Text("选择第3个"),
          onTap: () {
            setState(() {
              value = 2;
            });
          }),
      AntdButton(
          child: const Text("取消"),
          onTap: () {
            setState(() {
              value = 0;
            });
          })
    ]);
  }
}

```

### 禁用


```dart
class AntdDisabledDemo extends StatelessWidget {
  const AntdDisabledDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSegmented(activeIndex: 0, items: [
        AntdSegmentedItem(child: Text("Daily")),
        AntdSegmentedItem(disable: true, child: Text("Weekly")),
        AntdSegmentedItem(child: Text("Monthly")),
        AntdSegmentedItem(disable: true, child: Text("Yearly"))
      ]),
      AntdSegmented(disabled: true, activeIndex: 2, items: [
        AntdSegmentedItem(child: Text("Daily")),
        AntdSegmentedItem(disable: true, child: Text("Weekly")),
        AntdSegmentedItem(child: Text("Monthly")),
        AntdSegmentedItem(disable: true, child: Text("Yearly"))
      ])
    ]);
  }
}

```

### 设置图标



```dart
class AntdSegmentedIconDemo extends StatelessWidget {
  const AntdSegmentedIconDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSegmented(activeIndex: 0, items: [
        AntdSegmentedItem(
            child:
                Row(children: [AntdIcon(icon: AntdIcons.add), Text("Daily")])),
        AntdSegmentedItem(child: Text("Weekly")),
        AntdSegmentedItem(child: Text("Monthly")),
        AntdSegmentedItem(child: Text("Yearly"))
      ]),
      AntdSegmented(activeIndex: 0, items: [
        AntdSegmentedItem(child: AntdIcon(icon: AntdIcons.add)),
        AntdSegmentedItem(child: AntdIcon(icon: AntdIcons.appstore))
      ])
    ]);
  }
}

```

### 更多



```dart
class AntdSegmentedMoreDemo extends StatelessWidget {
  const AntdSegmentedMoreDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSegmented(activeIndex: 0, items: [
        AntdSegmentedItem(
            child: Column(children: [
          AntdAvatar(image: NetworkImage(demoAvatarImages[0])),
          const Row(children: [AntdIcon(icon: AntdIcons.add), Text("Daily")])
        ])),
        const AntdSegmentedItem(child: Text("Weekly")),
        const AntdSegmentedItem(child: Text("Monthly")),
        const AntdSegmentedItem(child: Text("Yearly"))
      ])
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
| disabled | 是否禁用整个分段控制器，为 true 时所有选项都不可交互 | bool | false | - |
| activeIndex | 当前选中的分段项索引，null 表示没有选中项 | int | - | - |
| items | 分段选项列表，至少需要包含两个选项 | List&lt;AntdSegmentedItem&gt; | - | - |
| onChange | 选项变化时的回调函数，返回选中项的索引 | ValueChanged&lt;int&gt; | - | - |
| duration | 选项切换时的动画过渡时长 | Duration | const Duration(milliseconds: 200) | - |
| hapticFeedback | 开启反馈:`light` \| `medium` \| `heavy` | AntdHapticFeedback | light | - |


## 分段项(AntdSegmentedItem) <a id='AntdSegmentedItem'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| style | 样式 | AntdBoxStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdBoxStyle, AntdSegmentedItem&gt; | - | - |
| disable | 是否禁用该分段项，禁用时不可点击且样式变灰 | bool | - | - |
| child | 分段项中显示的子组件，通常是文字或图标 | Widget | - | - |
| onTap | 点击分段项时的回调函数，为 null 时表示不可点击 | VoidCallback | - | - |

## 样式(AntdSegmentedStyle) <a id='AntdSegmentedStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 分段控制器整体容器的样式配置 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| bodyRowStyle | 分段控制器内部横向排列的Flex布局样式配置 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| itemStyle | 单个分段项的默认样式配置 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeItemStyle | 当前选中的分段项的活动状态样式配置 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |


