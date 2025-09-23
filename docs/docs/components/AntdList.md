---
group:
  title: 信息展示
  order: 20
title: List
subtitle: 列表
---
高性能通用列表解决方案，支持以下特性：
1. 精确索引跳转 - 支持根据索引值快速定位到指定位置
2. 虚拟滚动技术 - 优化大数据集性能，实现流畅滚动体验
3. 智能位置监听 - 实时监控列表项位置变化
4. 索引变更回调 - 提供索引变化事件监听机制
## 何时使用
以列表的形式干净高效的承载文字、列表、图片、段落等。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdList'></iframe>
</div>
<div style='flex: 1;'>

### 自定义builder

如果没有itemBuilder，那么如果items中是Widget的会自动使用[AntdListItem](/antd-list-item)包裹，否则不会做任何处理

```dart
class AntdListDemo extends StatelessWidget {
  const AntdListDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      SizedBox(
          height: 200,
          child: AntdList(
              itemBuilder: (context) {
                return AntdBox(
                    style: AntdBoxStyle(
                        color: Colors.blue,
                        border: const BorderSide(color: Colors.white, width: 1)
                            .bottom),
                    child: context.data);
              },
              items: List.generate(5, (i) {
                return Text("$i", style: const TextStyle(color: Colors.white));
              })))
    ]);
  }
}

```

### 带标题


```dart
class AntdListHeaderDemo extends StatelessWidget {
  const AntdListHeaderDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      SizedBox(
          height: 200,
          child: AntdList(
              header: const Text("我是Header"),
              items: List.generate(100, (i) {
                return Text("$i");
              })))
    ]);
  }
}

```

### 卡片样式


```dart
class AntdListHeaderCardDemo extends StatelessWidget {
  const AntdListHeaderCardDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      SizedBox(
          height: 200,
          child: AntdList(
              header: const Text("我是Header"),
              card: true,
              items: List.generate(100, (i) {
                return Text("$i");
              })))
    ]);
  }
}

```

### 事件


```dart
class AntdListOnItemPositionDemo extends StatelessWidget {
  const AntdListOnItemPositionDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      SizedBox(
          height: 200,
          child: AntdList(
              onItemPosition: (ctx) {
                AntdToast.show(
                    "当前是:${ctx.index},已进入的高度${ctx.visibleHeight},尚未进入的高度:${ctx.hiddenHeight}");
              },
              items: List.generate(100, (i) {
                return Text("$i");
              })))
    ]);
  }
}

```

### 指定索引跳转


```dart
class AntdListIndexDemo extends StatefulWidget {
  const AntdListIndexDemo({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AntdListIndexDemoStateDemo();
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
| style | 样式 | AntdListStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdListStyle, AntdList&lt;T&gt;&gt; | - | - |
| edgeThreshold | 触边阈值 (0-1表示百分比) | double | - | - |
| onEdgeReached | 当触碰到边界时的回调 | AntdOnScrollEdge | - | - |
| controller | 控制器 | AntdListController&lt;T&gt; | - | - |
| cacheExtent | 预渲染区域大小 | double | 1.5 | - |
| cacheExtentStyle | 预渲染区域计算方式 | [CacheExtentStyle](../components/cache-extent/#CacheExtentStyle) | viewport | - |
| physics | 滚动物理效果 | ScrollPhysics | const BouncingScrollPhysics() | - |
| dragStartBehavior | 拖动开始行为 | DragStartBehavior | start | - |
| scrollBehavior | 滚动行为 | ScrollBehavior | const CupertinoScrollBehavior() | - |
| vertical | 滚动方向 | bool | true | - |
| reversed | 是否反向滚动 | bool | false | - |
| shrinkWrap | 自动扩展高度 | bool | false | - |
| virtual | 启动虚拟滚动 | bool | false | - |
| fit | 自动适配策略:`fill` \| `split` \| `child` | AntdScrollItemFit | child | - |
| items | 滚动的数据 | List&lt;T&gt; | - | - |
| itemBuilder | 数据构造器 | AntdScrollItemBuilder&lt;T, AntdListController&lt;T&gt;&gt; | - | - |
| alignment | 根据方向自动优化视图边界:`start` \| `center` \| `end` | AntdEdge | - | - |
| onItemPosition | item变更事件 | AntdItemPositionListener&lt;T&gt; | - | - |
| throttle | 滚动事件节流时长 | Duration | - | - |
| headers | 头部的sliver | List&lt;Widget&gt; | - | - |
| footers | 尾部的sliver | List&lt;Widget&gt; | - | - |
| header | 标题内容 | Widget | - | - |
| footer | 标题内容 | Widget | - | - |
| card | 卡片式列表 | bool | - | - |


## 列表组件样式配置(AntdListStyle) <a id='AntdListStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 列表容器样式（背景色/边框/圆角等） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| headerStyle | 列表头部样式（文本/对齐/间距等） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| footerStyle | 列表底部样式（文本/对齐/间距等） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| itemStyle | 列表项样式（背景/边框/点击效果等） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| childStyle | 子类的样式,当没有使用itemBuilder的默认样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |


