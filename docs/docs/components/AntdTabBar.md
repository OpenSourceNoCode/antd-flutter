---
group:
  title: 导航
  order: 9
title: TabBar
subtitle: 标签栏
---
页面底部导航标签。
## 何时使用
适用于在不同页面之间进行切换。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdTabBar'></iframe>
</div>
<div style='flex: 1;'>

### 自定义构建


```dart
class AntdTabBarBadgeDemo extends StatelessWidget {
  const AntdTabBarBadgeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdTabBar(items: [
        const AntdTabBarItem(
            icon: AntdBadge(
                badge: Text("15"), child: AntdIcon(icon: AntdIcons.appstore)),
            title: Text("首页")),
        AntdTabBarItem(
            icon: const AntdIcon(icon: AntdIcons.unorderedList),
            builder: (child, index, active) {
              return AntdBox(
                  style: const AntdBoxStyle(color: Colors.green), child: child);
            },
            title: const Text("待办")),
        const AntdTabBarItem(
            icon: AntdIcon(icon: AntdIcons.send),
            title: AntdBadge(badge: Text("6"), child: Text("消息"))),
        const AntdTabBarItem(
            icon: AntdIcon(icon: AntdIcons.user), title: Text("我的"))
      ], activeIndex: 1)
    ]);
  }
}

```

### 仅图标/标题


```dart
class AntdTabBarIconDemo extends StatelessWidget {
  const AntdTabBarIconDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdTabBar(items: [
        AntdTabBarItem(icon: AntdIcon(icon: AntdIcons.app)),
        AntdTabBarItem(icon: AntdIcon(icon: AntdIcons.unorderedList)),
        AntdTabBarItem(icon: AntdIcon(icon: AntdIcons.send)),
        AntdTabBarItem(icon: AntdIcon(icon: AntdIcons.user))
      ], activeIndex: 1),
      AntdTabBar(items: [
        AntdTabBarItem(title: Text("首页")),
        AntdTabBarItem(title: Text("待办")),
        AntdTabBarItem(title: Text("消息")),
        AntdTabBarItem(title: Text("我的"))
      ], activeIndex: 1)
    ]);
  }
}

```

### 自定义样式


```dart
class AntdTabBarTitleDemo extends StatelessWidget {
  const AntdTabBarTitleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdTabBar(
          style: AntdTabBarStyle(
              bodyStyle: AntdBoxStyle(
                  textStyle: token.font.xl.copyWith(color: token.colorWhite),
                  color: token.colorPrimary.withValues(alpha: 0.5),
                  backdropFilter: 32),
              activeIconStyle: AntdIconStyle(size: 53),
              iconStyle: AntdIconStyle(size: 32)),
          items: const [
            AntdTabBarItem(
                icon: AntdIcon(icon: AntdIcons.app), title: Text("首页")),
            AntdTabBarItem(
                icon: AntdIcon(icon: AntdIcons.app), title: Text("待办")),
            AntdTabBarItem(
                icon: AntdIcon(icon: AntdIcons.app), title: Text("消息")),
            AntdTabBarItem(
                icon: AntdIcon(icon: AntdIcons.app), title: Text("我的"))
          ],
          activeIndex: 1)
    ]);
  }
}

```

### 事件


```dart
class AntdTabBarSafeAreaDemo extends StatefulWidget {
  const AntdTabBarSafeAreaDemo({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AntdTabBarSafeAreaDemoStateDemo();
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
| style | 样式 | AntdTabBarStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdTabBarStyle, AntdTabBar&gt; | - | - |
| activeIndex | 激活的索引 | int | 1 | - |
| onChange | 切换面板的回调 | AntdTabBarOnChange | - | - |
| safeArea | 是否开启安全区适配:`top` \| `bottom` \| `left` \| `right` \| `horizontal` \| `vertical` \| `all` | AntdPosition | - | - |
| items | 列表项 | List&lt;AntdTabBarItem&gt; | - | - |


## TabBar 基础样式定义（包含默认/激活状态的图标和标题样式）(AntdTabBarBaseStyle) <a id='AntdTabBarBaseStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| iconStyle | 默认状态下的图标样式 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| activeIconStyle | 激活状态下的图标样式 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| titleStyle | 默认状态下的标题文本样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeTitleStyle | 激活状态下的标题文本样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |

## TabBar 完整样式（扩展基础样式，增加容器样式）(AntdTabBarStyle) <a id='AntdTabBarStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| iconStyle | 默认状态下的图标样式 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| activeIconStyle | 激活状态下的图标样式 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| titleStyle | 默认状态下的标题文本样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeTitleStyle | 激活状态下的标题文本样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| bodyStyle | 内容区域容器样式（通常用于包裹整个TabBar） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| itemStyle | 单个Tab项的容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| itemColumnStyle | item的Column样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |

## TabBar 单个选项卡项的定义(AntdTabBarItem) <a id='AntdTabBarItem'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| icon | 默认状态下显示的图标 | Widget | - | - |
| title | 选项卡标题（支持任意Widget） | Widget | - | - |
| activeIcon | 激活状态下显示的图标（未设置时回退使用icon） | Widget | - | - |
| builder | 自定义内容构建器（参数：child-基础内容, index-选项卡索引, active-是否激活） | Widget Function(Widget child, int index, bool active) | - | - |


