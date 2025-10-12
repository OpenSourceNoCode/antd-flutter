---
group:
  title: 导航
  order: 7
title: NavBar
subtitle: 导航栏
---
为页面提供全局性的导航功能。
## 何时使用
需要显示当前页面内容的标题和操作。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdNavBar'></iframe>
</div>
<div style='flex: 1;'>

### 返回区域


```dart
class AntdNavBarBackDemo extends StatelessWidget {
  const AntdNavBarBackDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      DemoTitle(
          outline: false,
          title: "仅文字描述",
          child: AntdNavBar(back: Text("我是back"), title: Text("导航"))),
      DemoTitle(
          outline: false,
          title: "带图标",
          child: AntdNavBar(
              title: Text("导航"),
              back: Text("我是back"),
              backIcon: AntdIcon(icon: AntdIcons.app))),
      DemoTitle(
          outline: false,
          title: "backIcon 可以是任意Widget",
          child: AntdNavBar(
              title: Text("导航"),
              back: Text("我是back"),
              backIcon:
                  AntdBox(style: AntdBoxStyle(size: 24, color: Colors.red)))),
      DemoTitle(
          outline: false,
          title: "在back区域左侧放置widget",
          child: AntdNavBar(
              title: Text("导航"),
              back: Text("back"),
              left: AntdIcon(icon: AntdIcons.left),
              backIcon:
                  AntdBox(style: AntdBoxStyle(size: 24, color: Colors.red))))
    ]);
  }
}

```

### 标题和子标题


```dart
class AntdNavBarTitleDemo extends StatelessWidget {
  const AntdNavBarTitleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      DemoTitle(
          outline: false,
          title: '特别长的标题',
          child: AntdNavBar(
              title: Text("标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题"),
              subTitle: Text("111"),
              left: Text("关闭"),
              right: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Icon(AntdIcons.search, size: 24),
                Icon(AntdIcons.more, size: 24)
              ]))),
      DemoTitle(
          outline: false,
          title: '特别长时省略',
          child: AntdNavBar(
              title: Text("标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题",
                  overflow: TextOverflow.ellipsis),
              subTitle: Text("111"),
              left: Text("关闭"),
              right: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Icon(AntdIcons.search, size: 24),
                Icon(AntdIcons.more, size: 24)
              ]))),
      DemoTitle(
          outline: false,
          title: '特别长尽量展示完',
          child: AntdNavBar(
              style: AntdNavBarStyle(
                  rightExpanded: false,
                  backRowStyle: AntdFlexStyle(expanded: false)),
              title: Text("标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题"),
              subTitle: Text("111"),
              left: Text("关闭"),
              right: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Icon(AntdIcons.search, size: 24),
                Icon(AntdIcons.more, size: 24)
              ])))
    ]);
  }
}

```

### 事件

触发整体触发OnTap，触摸返回区域触发OnBack

```dart
class AntdNavBarEventDemo extends StatelessWidget {
  const AntdNavBarEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: false, child: [
      DemoTitle(
          outline: false,
          title: "同时存在onTap和onBack，一起触发",
          child: AntdNavBar(
              onTap: () {
                AntdToast.show("触发了OnTap事件", position: AntdToastPosition.top);
              },
              onBack: () {
                AntdToast.show("触发了onBack事件", position: AntdToastPosition.top);
              },
              backIcon: const AntdIcon(icon: AntdIcons.link),
              back: const Text("返回"),
              title: const Text("标题"))),
      DemoTitle(
          outline: false,
          title: "同时存在onTap和onBack，阻止onBack事件穿透",
          child: AntdNavBar(
              style: const AntdNavBarStyle(
                  bodyStyle: AntdBoxStyle(
                      options: AntdTapOptions(alwaysReceiveTap: false))),
              onTap: () {
                AntdToast.show("触发了OnTap事件", position: AntdToastPosition.top);
              },
              onBack: () {
                AntdToast.show("触发了onBack事件", position: AntdToastPosition.top);
              },
              backIcon: const AntdIcon(icon: AntdIcons.link),
              back: const Text("返回"),
              title: const Text("标题")))
    ]);
  }
}

```

### 安全区


```dart
class AntdNavBarSafeAreaDemo extends StatelessWidget {
  const AntdNavBarSafeAreaDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      AntdNavBar(
          safeArea: AntdPosition.top,
          backIcon: AntdIcon(icon: AntdIcons.link),
          back: Text("返回"),
          title: Text("标题"))
    ]);
  }
}

```

### 自定义样式


```dart
class AntdNavBarIconDemo extends StatelessWidget {
  const AntdNavBarIconDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdNavBar(
          style: AntdNavBarStyle(
              titleStyle: AntdBoxStyle(
                  textStyle: token.font.lg
                      .copyWith(color: token.colorWhite, fontSize: 32)),
              backIconStyle: AntdIconStyle(color: token.colorPrimary),
              bodyStyle: AntdBoxStyle(
                  color: token.colorWarning,
                  textStyle: token.font.lg.copyWith(color: token.colorWhite),
                  height: 60,
                  border: Border(
                      bottom:
                          BorderSide(color: token.colorSuccess, width: 2)))),
          backIcon: const AntdIcon(icon: AntdIcons.link),
          back: const Text("返回"),
          title: const Text("标题"))
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
| style | 样式 | AntdNavBarStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdNavBarStyle, AntdNavBar&gt; | - | - |
| back | 返回区域的文字，如果为 null 的话，backIcon 也不会渲染 | Widget | - | - |
| backIcon | 返回图标 | Widget | - | - |
| title | 标题 | Widget | - | - |
| subTitle | 子标题 | Widget | - | - |
| left | 左侧区域 | Widget | - | - |
| right | 右侧区域 | Widget | - | - |
| safeArea | 安全区:`top` \| `bottom` \| `left` \| `right` \| `horizontal` \| `vertical` \| `all` | AntdPosition | - | - |
| onTap | 点击事件 | VoidCallback | - | - |
| onBack | 返回事件 | VoidCallback | - | - |


## 导航样式(AntdNavBarStyle) <a id='AntdNavBarStyle'></a>
| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 主体大小 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| bodyRowStyle | 主体轴对齐方式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| backIconStyle | 返回按钮图标样式 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| backRowStyle | 返回区域轴对齐方式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| backStyle | 标题样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| titleStyle | 子标题样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| subTitleStyle | 子标题样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| titleColumnStyle | 标题轴对齐方式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| rightExpanded | 右侧是否以Expanded渲染 | bool | - | - |


