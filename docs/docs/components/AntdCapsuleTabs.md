---
group:
  title: 导航
  order: 4
title: CapsuleTabs
subtitle: 胶囊选项卡
---
内容组之间进行导航切换。实现自[AntdTab](/antd-tab)支持他的所有行为
## 何时使用
选项卡的另外一种样式，用在展示型界面的列表或模块中。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdCapsuleTabs'></iframe>
</div>
<div style='flex: 1;'>

### 扩展区

左右两侧均可以放置扩展区域

```dart
class AntdCapsuleTabsExtraDemo extends StatelessWidget {
  const AntdCapsuleTabsExtraDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      DemoTitle(
          child: AntdCapsuleTabs(
              leftExtra: AntdBox(
                  style: AntdBoxStyle(padding: 6.right),
                  child: const Text("left")),
              rightExtra: const AntdIcon(icon: AntdIcons.ant),
              tabs: const [
            AntdTab(title: Text("Espresso"), value: "1", child: Text("1")),
            AntdTab(title: Text("Coffee Latte"), value: "2", child: Text("2")),
            AntdTab(title: Text("Cappuccino"), value: "3", child: Text("3")),
            AntdTab(title: Text("Americano"), value: "4", child: Text("4")),
            AntdTab(title: Text("Flat White"), value: "5", child: Text("5")),
            AntdTab(
                title: Text("Caramel Macchiato"), value: "6", child: Text("6"))
          ]))
    ]);
  }
}

```

### 事件

AntdTab的value支持任意值，这样你可以很方便的携带业务数据

```dart
class AntdCapsuleTabsOnChangeDemo extends StatelessWidget {
  const AntdCapsuleTabsOnChangeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      DemoTitle(
          title: "AntdTab的value 是字符串",
          child: AntdCapsuleTabs(
              onChange: (value, index) {
                AntdToast.show("value:$value,index:$index",
                    position: AntdToastPosition.top);
              },
              tabs: const [
                AntdTab(title: Text("Espresso"), value: "1", child: Text("1")),
                AntdTab(
                    title: Text("Coffee Latte"), value: "2", child: Text("2")),
                AntdTab(
                    title: Text("Cappuccino"), value: "3", child: Text("3")),
                AntdTab(title: Text("Americano"), value: "4", child: Text("4")),
                AntdTab(
                    title: Text("Flat White"), value: "5", child: Text("5")),
                AntdTab(
                    title: Text("Caramel Macchiato"),
                    value: "6",
                    child: Text("6"))
              ])),
      DemoTitle(
          title: "AntdTab的value是对象，字符串等混合值",
          child: AntdCapsuleTabs(
              onChange: (value, index) {
                AntdToast.show("value:$value,index:$index",
                    position: AntdToastPosition.top);
              },
              tabs: const [
                AntdTab(
                    title: Text("对象类型"),
                    value: _Data(value: 1),
                    child: Text("我的值是对象")),
                AntdTab(
                    title: Text("字符串"), value: "2", child: Text("我的值是字符串2")),
                AntdTab(
                    title: Text("对象类型"),
                    value: _Data(value: 2),
                    child: Text("我的值是对象")),
                AntdTab(
                    title: Text("字符串"), value: "4", child: Text("我的值是字符串4")),
                AntdTab(
                    title: Text("字符串"), value: "5", child: Text("我的值是字符串5")),
                AntdTab(title: Text("字符串"), value: "6", child: Text("我的值是字符串6"))
              ]))
    ]);
  }
}

```

### 指定激活某个选项(支持任意类型的值)


```dart
class _AntdCapsuleTabsActiveValueDemoStateDemo
    extends State<AntdCapsuleTabsActiveValueDemo> {
  dynamic activeValue = 3;
  AntdTabController antdTabController = AntdTabController();
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      DemoTitle(
          title: "当使用activeValue控制可选项时，必须使用onChange同步",
          extra: Wrap(spacing: 12, children: [
            AntdButton(
                onTap: () {
                  setState(() {
                    activeValue = 4;
                  });
                },
                child: const Text("激活第4个")),
            AntdButton(
                onTap: () {
                  setState(() {
                    activeValue = 6;
                  });
                },
                child: const Text("激活第6个"))
          ]),
          child: AntdCapsuleTabs(
              activeValue: activeValue,
              onChange: (value, index) {
                setState(() {
                  activeValue = value;
                });
              },
              tabs: List.generate(
                  10,
                  (i) => AntdTab(
                      title: Text("Tab$i"), value: i, child: Text("$i"))))),
      DemoTitle(
          title: "使用controller控制选中项",
          extra: Wrap(spacing: 12, children: [
            AntdButton(
                onTap: () {
                  antdTabController.switchTo(4);
                },
                child: const Text("激活第4个")),
            AntdButton(
                onTap: () {
                  antdTabController.switchTo(6);
                },
                child: const Text("激活第6个"))
          ]),
          child: AntdCapsuleTabs(
              controller: antdTabController,
              tabs: List.generate(
                  10,
                  (i) => AntdTab(
                      title: Text("Tab$i"), value: i, child: Text("$i")))))
    ]);
  }
}

```

### 对齐方式

当内容充满屏幕时选择卡如何对齐

```dart
class AntdCapsuleTabsAlignmentDemo extends StatelessWidget {
  const AntdCapsuleTabsAlignmentDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      DemoTitle(
          title: "tabAlignment:AntdTabAlignment.left 选择卡在左侧",
          child: AntdCapsuleTabs(tabAlignment: AntdTabAlignment.left, tabs: [
            AntdTab(title: Text("Tab1"), value: "1", child: Text("1")),
            AntdTab(title: Text("Tab2"), value: "2", child: Text("2")),
            AntdTab(title: Text("Tab3"), value: "3", child: Text("3"))
          ])),
      DemoTitle(
          title: "tabAlignment:AntdTabAlignment.center 选择居中 并强制自动均分宽度",
          child: AntdCapsuleTabs(tabAlignment: AntdTabAlignment.center, tabs: [
            AntdTab(title: Text("Tab1"), value: "1", child: Text("1")),
            AntdTab(title: Text("Tab2"), value: "2", child: Text("2")),
            AntdTab(title: Text("Tab3"), value: "3", child: Text("3"))
          ]))
    ]);
  }
}

```

### 震动反馈

通过hapticFeedback属性 当选项卡切换时提供震动反馈

```dart
class AntdCapsuleTabsHapticFeedbackDemo extends StatelessWidget {
  const AntdCapsuleTabsHapticFeedbackDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      DemoTitle(
          child:
              AntdCapsuleTabs(hapticFeedback: AntdHapticFeedback.heavy, tabs: [
        AntdTab(title: Text("Espresso"), value: "1", child: Text("1")),
        AntdTab(title: Text("Coffee Latte"), value: "2", child: Text("2")),
        AntdTab(title: Text("Cappuccino"), value: "3", child: Text("3")),
        AntdTab(title: Text("Americano"), value: "4", child: Text("4")),
        AntdTab(title: Text("Flat White"), value: "5", child: Text("5")),
        AntdTab(title: Text("Caramel Macchiato"), value: "6", child: Text("6"))
      ]))
    ]);
  }
}

```

### 自定义样式

使用AntdTabsStyle自定义样式

```dart
class AntdCapsuleTabsStyleDemo extends StatelessWidget {
  const AntdCapsuleTabsStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      DemoTitle(
          child: AntdCapsuleTabs(
              style: AntdTabsStyle(
                  activeTitleStyle: AntdBoxStyle(
                      color: token.colorSuccess,
                      textStyle: TextStyle(color: token.colorText)),
                  titleStyle: AntdBoxStyle(
                      color: token.colorPrimary,
                      textStyle: TextStyle(color: token.colorWhite))),
              tabs: const [
            AntdTab(title: Text("Espresso"), value: "1", child: Text("1")),
            AntdTab(title: Text("Coffee Latte"), value: "2", child: Text("2")),
            AntdTab(title: Text("Cappuccino"), value: "3", child: Text("3")),
            AntdTab(title: Text("Americano"), value: "4", child: Text("4")),
            AntdTab(title: Text("Flat White"), value: "5", child: Text("5")),
            AntdTab(
                title: Text("Caramel Macchiato"), value: "6", child: Text("6"))
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
| style | 样式 | AntdTabsStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdTabsStyle, AntdTabs&gt; | - | - |
| leftExtra | 标签栏左侧扩展内容区域 | Widget | - | - |
| rightExtra | 标签栏右侧扩展内容区域 | Widget | - | - |
| controller | 控制器 | AntdTabController&lt;AntdTab&gt; | - | - |
| activeValue | 默认选中的标签key（为空时不激活任何一个） | dynamic | - | - |
| onChange | 标签切换时的回调（参数为当前选中key） | AntdTabsOnChange&lt;AntdTab&gt; | - | - |
| tabAlignment | 标签对齐方式（居中时会自动启用滚动或填充）:`left` \| `center` | AntdTabAlignment | center | - |
| tabs | 标签页配置列表（至少包含一个标签） | List&lt;AntdTab&gt; | - | - |
| hapticFeedback | 开启反馈:`light` \| `medium` \| `heavy` \| `none` | AntdHapticFeedback | - | - |


## 标签页样式(AntdTabsStyle) <a id='AntdTabsStyle'></a>
| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| tabStyle | 标签栏容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| panelStyle | 内容面板容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| titleStyle | 标签标题默认样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeTitleStyle | 选中标签标题样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| indicatorStyle | 底部指示条样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |

## 标签页项定义(AntdTab) <a id='AntdTab'></a>
| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| title | 标签标题内容组件 | Widget | - | - |
| value | 标签唯一标识（默认使用索引） | dynamic | - | - |
| disabled | 是否禁用当前标签 | bool | - | - |
| child | 标签页对应的内容组件 | Widget | - | - |


