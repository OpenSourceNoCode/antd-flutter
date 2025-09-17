---
group:
  title: 导航
  order: 10
title: Tabs
subtitle: 标签页
---
内容组之间进行导航切换。
## 何时使用
当前内容需要分成同层级结构的组，进行内容切换展示，常用在表单或者列表的顶部。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdTabs'></iframe>
</div>
<div style='flex: 1;'>

### 没有内容区域

底部的边框也会随着内容区域一起消失

```dart
class AntdTabsNoChildDemo extends StatelessWidget {
  const AntdTabsNoChildDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      AntdTabs(tabs: [
        AntdTab(title: Text("水果"), value: "1"),
        AntdTab(title: Text("蔬菜"), value: "2"),
        AntdTab(title: Text("动物"), value: "3")
      ])
    ]);
  }
}

```

### 对齐方式

当内容不足的时候 tab如何对齐

```dart
class AntdTabsTabAlignmentDemo extends StatelessWidget {
  const AntdTabsTabAlignmentDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      AntdTabs(tabAlignment: AntdTabAlignment.left, tabs: [
        AntdTab(title: Text("水果"), value: "1"),
        AntdTab(title: Text("蔬菜"), value: "2"),
        AntdTab(title: Text("动物"), value: "3")
      ]),
      AntdTabs(tabAlignment: AntdTabAlignment.center, tabs: [
        AntdTab(title: Text("水果"), value: "1"),
        AntdTab(title: Text("蔬菜"), value: "2"),
        AntdTab(title: Text("动物"), value: "3")
      ])
    ]);
  }
}

```

### 绑定多个panel,多个panel不会互相影响

通过更改physics实现不同的内容滚动效果
通过alignment 可以控制第二个内容到达那里时再切页 默认是滚动一半时切页

```dart
class AntdTabsTabPhysicsDemo extends StatelessWidget {
  const AntdTabsTabPhysicsDemo({super.key});
  @override
  Widget build(BuildContext context) {
    AntdTabController tabController = AntdTabController();
    return DemoWrapper(outline: false, child: [
      AntdTabs(
          controller: tabController,
          tabs: List.generate(
              15,
              (i) => AntdTab(
                  title: Text("Tab$i"), value: "$i", disabled: i % 4 == 0))),
      AntdTabPanel(
          physics: const PageScrollPhysics(),
          alignment: AntdEdge.center,
          tabController: tabController,
          items: List.generate(15, (i) {
            return AntdBox(
                style: AntdBoxStyle(color: getRandomColor(), padding: 12.all),
                child: Text("我是Tab$i的Child"));
          })),
      AntdTabPanel(
          physics: const BouncingScrollPhysics(),
          alignment: AntdEdge.end,
          tabController: tabController,
          items: List.generate(15, (i) {
            return AntdBox(
                style: AntdBoxStyle(color: getRandomColor(), padding: 12.all),
                child: Text("我是Tab$i的Child"));
          }))
    ]);
  }
}

```

### 事件


```dart
class AntdTabsTabOnChangeDemo extends StatelessWidget {
  const AntdTabsTabOnChangeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    AntdTabController tabController = AntdTabController();
    return DemoWrapper(outline: false, child: [
      AntdTabs(
          onChange: (value, index) {
            AntdToast.show("当前index:$index");
          },
          controller: tabController,
          tabs: List.generate(
              15,
              (i) => AntdTab(
                  title: Text("Tab$i"), value: "$i", disabled: i % 4 == 0))),
      AntdTabPanel(
          physics: const BouncingScrollPhysics(),
          alignment: AntdEdge.start,
          tabController: tabController,
          items: List.generate(15, (i) {
            return AntdBox(
                style: AntdBoxStyle(
                    color: getRandomColor(),
                    padding: 12.all,
                    textStyle: const TextStyle(color: Colors.white)),
                child: Text("我是Tab$i的Child，index:${i}"));
          }))
    ]);
  }
}

```

### 搭配badge使用以及左右扩展区域


```dart
class AntdTabsBadgeDemo extends StatelessWidget {
  const AntdTabsBadgeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      AntdTabs(
          leftExtra: AntdIcon(icon: AntdIcons.left),
          rightExtra: AntdIcon(icon: AntdIcons.rightright),
          tabs: [
            AntdTab(
                title: AntdBadge(badge: Text("11"), child: Text("Espresso")),
                value: "1",
                child: Text("1")),
            AntdTab(title: Text("Coffee Latte"), value: "2", child: Text("2")),
            AntdTab(title: Text("Cappuccino"), value: "3", child: Text("3")),
            AntdTab(title: Text("Americano"), value: "4", child: Text("4")),
            AntdTab(title: Text("Flat White"), value: "5", child: Text("5")),
            AntdTab(
                title: Text("Caramel Macchiato"), value: "6", child: Text("6"))
          ])
    ]);
  }
}

```

### 自定义样式


```dart
class AntdTabsStyleDemo extends StatelessWidget {
  const AntdTabsStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdTabs(
          style: AntdTabsStyle(
              titleStyle: AntdBoxStyle(
                  textStyle:
                      token.font.sm.copyWith(color: token.colorWarning))),
          tabs: const [
            AntdTab(title: Text("Espresso"), value: "1", child: Text("1")),
            AntdTab(title: Text("Coffee Latte"), value: "2", child: Text("2")),
            AntdTab(title: Text("Cappuccino"), value: "3", child: Text("3")),
            AntdTab(title: Text("Americano"), value: "4", child: Text("4")),
            AntdTab(title: Text("Flat White"), value: "5", child: Text("5")),
            AntdTab(
                title: Text("Caramel Macchiato"), value: "6", child: Text("6"))
          ])
    ]);
  }
}

```

### 自定义指示灯样式和动画时长


```dart
class AntdTabsIndicatorStyleDemo extends StatelessWidget {
  const AntdTabsIndicatorStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      AntdTabs(
          style: AntdTabsStyle(
              indicatorStyle:
                  AntdBoxStyle(color: Colors.red, width: 15, height: 4)),
          tabs: [
            AntdTab(title: Text("Espresso"), value: "1", child: Text("1")),
            AntdTab(title: Text("Coffee Latte"), value: "2", child: Text("2")),
            AntdTab(title: Text("Cappuccino"), value: "3", child: Text("3")),
            AntdTab(title: Text("Americano"), value: "4", child: Text("4")),
            AntdTab(title: Text("Flat White"), value: "5", child: Text("5")),
            AntdTab(
                title: Text("Caramel Macchiato"), value: "6", child: Text("6"))
          ])
    ]);
  }
}

```

### 自定义滑动方向和面板位置

如果面板不想默认出现在下方,那么[AntdTab](/antd-tab)中不能有child

```dart
class _AntdTabsPanelDemoStateDemo extends State<AntdTabsPanelDemo> {
  AntdTabController controller = AntdTabController();
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      Column(children: [
        AntdTabs(controller: controller, tabs: const [
          AntdTab(title: Text("Espresso"), value: "1"),
          AntdTab(title: Text("Coffee Latte"), value: "2"),
          AntdTab(title: Text("Cappuccino"), value: "3"),
          AntdTab(title: Text("Americano"), value: "4"),
          AntdTab(title: Text("Flat White"), value: "5"),
          AntdTab(title: Text("Caramel Macchiato"), value: "6")
        ]),
        AntdBox(
            style: AntdBoxStyle(
                color: token.colorPrimary,
                textStyle: token.font.ms.copyWith(color: token.colorWhite)),
            child: const Text("我是其他内容,我上边是独立的tab,下边是独立的panel")),
        AntdBox(
            style: const AntdBoxStyle(height: 400),
            child: AntdTabPanel(
                tabController: controller,
                vertical: true,
                physics: const ClampingScrollPhysics(),
                alignment: AntdEdge.start,
                items: List.generate(
                    6,
                    (i) => AntdBox(
                        style: AntdBoxStyle(
                            color: getRandomColor(),
                            alignment: Alignment.center),
                        child: Text("我是Tab$i的child,index:${i}")))))
      ])
    ]);
  }
}

```

### 懒加载



```dart
class _AntdTabsLoadingDemoStateDemo extends State<AntdTabsLoadingDemo> {
  final _loading = <int>[];
  final _loadinged = <int>[];
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      Column(children: [
        AntdTabs(
            onChange: (_, index) {
              if (index % 2 == 0 && !_loadinged.contains(index)) {
                setState(() {
                  _loading.add(index);
                });
                Future.delayed(const Duration(seconds: 3), () {
                  _loadinged.add(index);
                  setState(() {
                    _loading.remove(index);
                  });
                });
              }
            },
            tabs: List.generate(10, (i) {
              var child = AntdBox(
                  style: AntdBoxStyle(padding: 48.vertical),
                  child: Text(generateRandomString(i * 50)));
              return AntdTab(
                  title: Text("Tab$i"),
                  value: "$i",
                  child: AntdLoading(
                      circular: true,
                      color: AntdColor.primary,
                      spinning: _loading.contains(i),
                      text: const Text("正在加载中"),
                      child: _loading.contains(i)
                          ? AntdBox()
                          : Center(child: child)));
            }))
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
| style | 样式 | AntdTabsStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdTabsStyle, AntdTabs&gt; | - | - |
| leftExtra | 标签栏左侧扩展内容区域 | Widget | - | - |
| rightExtra | 标签栏右侧扩展内容区域 | Widget | - | - |
| controller | 控制器 | AntdTabController&lt;AntdTab&gt; | - | - |
| activeValue | 默认选中的标签key（为空时不激活任何一个） | String | - | - |
| onChange | 标签切换时的回调（参数为当前选中key） | AntdTabsOnChange&lt;AntdTab&gt; | - | - |
| tabAlignment | 标签对齐方式（居中时会自动启用滚动或填充）:`left` \| `center` | AntdTabAlignment | center | - |
| tabs | 标签页配置列表（至少包含一个标签） | List&lt;AntdTab&gt; | - | - |
| indicatorPosition | 指示器位置（顶部/底部）:`top` \| `bottom` | AntdIndicatorPosition | bottom | - |
| indicatorMode | 指示器宽度模式（固定/自适应标签宽度）:`full` \| `fixed` | AntdIndicatorMode | fixed | - |
| hapticFeedback | 开启反馈:`light` \| `medium` \| `heavy` | AntdHapticFeedback | - | - |


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
| value | 标签唯一标识（默认使用索引） | String | - | - |
| disabled | 是否禁用当前标签 | bool | - | - |
| child | 标签页对应的内容组件 | Widget | - | - |


