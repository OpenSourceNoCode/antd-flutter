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

### 内容的高度


```dart
class AntdSliderBarFitDemo extends StatelessWidget {
  const AntdSliderBarFitDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "AntdScrollItemFit.fill每个内容撑满一屏",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  contentFit: AntdScrollItemFit.fill, items: _items))),
      DemoTitle(
          title: "AntdScrollItemFit.child根据自身的内容自适应",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  contentFit: AntdScrollItemFit.child, items: _items))),
      DemoTitle(
          title: "AntdScrollItemFit.split,内容无法撑满时自动均分，内容过多时自适应",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  contentFit: AntdScrollItemFit.split, items: _items)))
    ]);
  }
}

```

### 当内容滚动时标题栏如何对齐


```dart
class AntdSliderBarTitlePlacementDemo extends StatelessWidget {
  const AntdSliderBarTitlePlacementDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "最顶部对齐",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  titlePlacement: AntdEdge.start, items: _items))),
      DemoTitle(
          title: "中间对齐",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  titlePlacement: AntdEdge.center, items: _items))),
      DemoTitle(
          title: "底部对齐",
          child: SizedBox(
              height: 500,
              child:
                  AntdSliderBar(titlePlacement: AntdEdge.end, items: _items)))
    ]);
  }
}

```

### 震动反馈


```dart
class AntdSliderBarHapticFeedbackDemo extends StatelessWidget {
  const AntdSliderBarHapticFeedbackDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "关闭反馈",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  hapticFeedback: AntdHapticFeedback.none, items: _items))),
      DemoTitle(
          title: "hapticFeedback自定义反馈级别",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  hapticFeedback: AntdHapticFeedback.medium, items: _items)))
    ]);
  }
}

```

### 事件


```dart
class AntdSliderBarEventDemo extends StatelessWidget {
  const AntdSliderBarEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "AntdSliderBar的onChange,可以读取AntdSliderBarItem的完整属性",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  onChange: (item, index) {
                    AntdToast.show("我是:${item.value}");
                  },
                  items: _items))),
      DemoTitle(
          title: "标题栏目触底/触顶事件",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  onChange: (item, index) {
                    AntdToast.show("我是:${item.value}");
                  },
                  onEdgeReached: (offset, up) async {
                    AntdToast.show("到达${up ? '顶部' : '底部'}");
                  },
                  items: _items))),
      DemoTitle(
          title: "通过edgeThreshold控制触底/触顶阈值",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  onChange: (item, index) {
                    AntdToast.show("我是:${item.value}");
                  },
                  edgeThreshold: 0.3,
                  onEdgeReached: (offset, up) async {
                    AntdToast.show("到达${up ? '顶部' : '底部'}");
                  },
                  items: _items))),
      DemoTitle(
          title: "标题栏索引监听事件",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  onChange: (item, index) {
                    AntdToast.show("我是:${item.value}");
                  },
                  onEdgeReached: (offset, up) async {
                    AntdToast.show("到达${up ? '顶部' : '底部'}");
                  },
                  onItemPosition: (ctx) {
                    AntdToast.show("当前是:${ctx.index},进入:${ctx.visibleHeight},");
                  },
                  items: _items)))
    ]);
  }
}

```

### 标题栏宽度和填充方式


```dart
class AntdSliderBarTitleDemo extends StatelessWidget {
  const AntdSliderBarTitleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          title: "自定义标题栏宽度",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  style: const AntdSliderBarStyle(
                      titleStyle: AntdBoxStyle(width: 200)),
                  items: _items))),
      DemoTitle(
          title: "每行都填充宽度",
          child: SizedBox(
              height: 500,
              child:
                  AntdSliderBar(fit: AntdScrollItemFit.fill, items: _items))),
      DemoTitle(
          title: "自动均分",
          child: SizedBox(
              height: 500,
              child:
                  AntdSliderBar(fit: AntdScrollItemFit.split, items: _items))),
      DemoTitle(
          title: "内容自适应",
          child: SizedBox(
              height: 500,
              child:
                  AntdSliderBar(fit: AntdScrollItemFit.child, items: _items)))
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
                      style: token.font.ms
                          .copyWith(color: token.colorText.tertiary))
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

### 加载更多和懒加载


```dart
class _AntdSliderBarMoreDemoStateDemo extends State<AntdSliderBarMoreDemo> {
  var titleMoreItems = [..._items];
  final _laodingIndex = [];
  final _loadingingIndex = [];
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      DemoTitle(
          title: "标题栏触底加载更多",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  items: titleMoreItems,
                  onEdgeReached: (offset, up) async {
                    if (!up) {
                      AntdToast.show("触发加载");
                      setState(() {
                        titleMoreItems.addAll(List.generate(5, (i) {
                          var index = titleMoreItems.length + i;
                          return AntdSliderBarItem(
                              value: index,
                              content: AntdBox(
                                  style: AntdBoxStyle(
                                      color: getRandomColor(), height: 200),
                                  child: Text("内容$index,${DateTime.now()}")),
                              title: Text("新增$index"));
                        }));
                      });
                      await Future.delayed(const Duration(seconds: 2));
                    }
                  }))),
      DemoTitle(
          title: "内容懒加载",
          child: SizedBox(
              height: 500,
              child: AntdSliderBar(
                  onChange: (item, index) async {
                    if (_laodingIndex.contains(index)) {
                      return;
                    }
                    setState(() {
                      _loadingingIndex.add(index);
                    });
                    await Future.delayed(const Duration(seconds: 3));
                    setState(() {
                      _laodingIndex.add(index);
                      _loadingingIndex.remove(index);
                    });
                  },
                  items: List.generate(20, (i) {
                    return AntdSliderBarItem(
                        value: i,
                        content: AntdBox(
                            style: AntdBoxStyle(
                                color: i % 2 == 0
                                    ? token.colorPrimary
                                    : token.colorSuccess,
                                height: 200),
                            child: AntdBox(
                                style: AntdBoxStyle(padding: 8.all),
                                child: _loadingingIndex.contains(i)
                                    ? const AntdSkeleton(rows: 3)
                                    : Text("内容$i"))),
                        title: Text("新增$i"));
                  }))))
    ]);
  }
}

```

### 使用Controller手动控制跳转


```dart
class _AntdSliderBarControllerDemoStateDemo
    extends State<AntdSliderBarControllerDemo> {
  AntdSliderBarController controller = AntdSliderBarController();
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Wrap(spacing: 12, children: [
        AntdButton(
            onTap: () {
              controller.toIndex(50);
            },
            child: const Text("跳转至50")),
        AntdButton(
            onTap: () {
              controller.toIndex(99);
            },
            child: const Text("跳转至99"))
      ]),
      SizedBox(
          height: 500,
          child: AntdSliderBar(controller: controller, items: _items))
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
| physics | 滚动物理效果 | ScrollPhysics | const BouncingScrollPhysics() | - |
| shrinkWrap | 自动扩展高度 | bool | - | - |
| controller | 控制器 | AntdSliderBarController | - | - |
| onItemPosition | item变更事件 | AntdItemPositionListener&lt;AntdSliderBarItem&gt; | - | - |
| throttle | 滚动事件节流时长 | Duration | - | - |
| edgeThreshold | 触边阈值 (0-1表示百分比) | double | - | - |
| onEdgeReached | 当触碰到边界时的回调 | AntdOnScrollEdge | - | - |
| virtual | 启动虚拟滚动 | bool | false | - |
| alignment | 根据方向自动优化视图边界:`start` \| `center` \| `end` | AntdEdge | - | - |
| fit | 自动适配策略:`fill` \| `split` \| `child` | AntdScrollItemFit | child | - |
| scrollBehavior | 滚动行为 | ScrollBehavior | - | - |
| cacheExtent | 预渲染区域大小 | double | 1.5 | - |
| cacheExtentStyle | 预渲染区域计算方式 | [CacheExtentStyle](../components/cache-extent/#CacheExtentStyle) | viewport | - |
| items | 滚动的数据 | List&lt;AntdSliderBarItem&gt; | - | - |
| contentFit | 内容如何填充:`fill` \| `split` \| `child` | AntdScrollItemFit | - | - |
| onChange | 变更事件 | AntdSliderBarOnChange | - | - |
| titlePlacement | 标题和视图的对齐方式:`start` \| `center` \| `end` | AntdEdge | center | - |
| hapticFeedback | 开启反馈:`light` \| `medium` \| `heavy` \| `none` | AntdHapticFeedback | light | - |


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
| activeCornerRadius | 选中项的圆角半径（单位：像素） | Radius | - | - |

## 滑动选择器(SliderBar)的单个选项定义(AntdSliderBarItem) <a id='AntdSliderBarItem'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| value | 选项的唯一标识值 | dynamic | - | - |
| content | 自定义内容组件（优先级高于title） | Widget | - | - |
| title | 默认标题内容（当content为空时使用） | Widget | - | - |
| disabled | 是否禁用该选项 | bool | false | - |
| onActive | item被激活后 | VoidCallback | - | - |


