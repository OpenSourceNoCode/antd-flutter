---
group:
  title: 导航
  order: 8
title: SliderBar
subtitle: 侧边导航
---
垂直展示导航栏。
## 何时使用
需要用户快速导航至某一项内容集合，并可以在多个内容之间来回切换。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdSliderBar'></iframe>
</div>
<div style='flex: 1;'>

### 事件


```dart
class AntdSliderBarDemo extends StatelessWidget {
  const AntdSliderBarDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      SizedBox(
          height: 500,
          child: AntdSliderBar(
              onChange: (item) {
                AntdToast.show("我是:${item.value}");
              },
              items: const [
                AntdSliderBarItem(
                    value: "1", content: Text("选项1"), title: Text("我是标题1")),
                AntdSliderBarItem(
                    value: "2", content: Text("选项2"), title: Text("我是标题2")),
                AntdSliderBarItem(
                    value: "3", content: Text("选项3"), title: Text("我是标题3")),
                AntdSliderBarItem(
                    value: "4", content: Text("选项4"), title: Text("我是标题4"))
              ]))
    ]);
  }
}

```

### 自定义样式

通过style 可以覆盖默认样式

```dart
class AntdSliderBarStyleDemo extends StatelessWidget {
  const AntdSliderBarStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      SizedBox(
          height: 500,
          child: AntdSliderBar(items: [
            AntdSliderBarItem(
                value: "1",
                content: Row(children: [
                  const Text("选项1"),
                  Text("(8)",
                      style: token.font.default_
                          .copyWith(color: token.colorTextTertiary))
                ]),
                title: const Text("我是标题1")),
            const AntdSliderBarItem(
                value: "2",
                disabled: true,
                content: Text("选项2"),
                title: Text("我是标题2")),
            const AntdSliderBarItem(
                value: "3", content: Text("选项3"), title: Text("我是标题3")),
            const AntdSliderBarItem(
                value: "4", content: Text("选项4"), title: Text("我是标题4"))
          ]))
    ]);
  }
}

```

### 超多内容填满

每个页面可以自己适应内容的高度

```dart
class AntdSliderBarBigContentDemo extends StatelessWidget {
  const AntdSliderBarBigContentDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      SizedBox(
          height: 500,
          child: AntdSliderBar(
              style: const AntdSliderBarStyle(
                  activeCornerRadius: 0, bodyStyle: AntdBoxStyle(width: 150)),
              items: [
                AntdSliderBarItem(
                    value: "1",
                    content:
                        _Child(title: "选项1", desc: generateRandomString(1000)),
                    title: const Text("我是标题1")),
                AntdSliderBarItem(
                    value: "2",
                    disabled: true,
                    content:
                        _Child(title: "选项2", desc: generateRandomString(1200)),
                    title: const Text("我是标题2")),
                AntdSliderBarItem(
                    value: "3",
                    content:
                        _Child(title: "选项3", desc: generateRandomString(1400)),
                    title: const Text("我是标题3")),
                AntdSliderBarItem(
                    value: "4",
                    content:
                        _Child(title: "选项4", desc: generateRandomString(200)),
                    title: const Text("我是标题4"))
              ]))
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
| style | 样式 | AntdSliderBarStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdSliderBarStyle, AntdSliderBar&gt; | - | - |
| controller | 控制器 | AntdSliderBarController | - | - |
| onItemPosition | item变更事件 | AntdItemPositionListener&lt;AntdSliderBarItem&gt; | - | - |
| onEdgeReached | 当触碰到边界时的回调 | AntdOnScrollEdge | - | - |
| virtual | 启动虚拟滚动 | bool | false | - |
| alignment | 根据方向自动优化视图边界:`start` \| `center` \| `end` | AntdEdge | - | - |
| items | 滚动的数据 | List&lt;AntdSliderBarItem&gt; | - | - |
| onChange | 变更事件 | AntdSliderBarOnChange | - | - |


## 滑动选择器(SliderBar)的样式配置(AntdSliderBarStyle) <a id='AntdSliderBarStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 滑动条整体容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| contentStyle | 未选中状态的标题样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| titleStyle | 未选中状态的标题样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeTitleStyle | 选中状态的标题样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| indicatorStyle | 未选中状态的指示器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeIndicatorStyle | 选中状态的指示器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeCornerRadius | 选中项的圆角半径（单位：像素） | int | - | - |

## 滑动选择器(SliderBar)的单个选项定义(AntdSliderBarItem) <a id='AntdSliderBarItem'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| value | 选项的唯一标识值 | String | - | - |
| content | 自定义内容组件（优先级高于title） | Widget | - | - |
| title | 默认标题内容（当content为空时使用） | Widget | - | - |
| disabled | 是否禁用该选项 | bool | false | - |


