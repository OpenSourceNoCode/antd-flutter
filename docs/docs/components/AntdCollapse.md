---
group:
  title: 信息展示
  order: 10
title: Collapse
subtitle: 折叠面板
---
可以折叠/展开的内容区域。
## 何时使用
对复杂区域进行分组和隐藏，保持页面的整洁。

## 代码展示

<div class='preview-container'>
<div>

### 事件


```dart
class AntdCollapseDemo extends StatelessWidget {
  const AntdCollapseDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdCollapse(
          value: const [1],
          onChange: (index, check) {
            AntdToast.show("触发了index:${index},当前选中:${check}");
          },
          items: const [
            AntdCollapseItem(title: Text("第一项"), content: text),
            AntdCollapseItem(title: Text("第二项"), content: text),
            AntdCollapseItem(title: Text("第三项"), content: text)
          ])
    ]);
  }
}

```

### 样式


```dart
class AntdCollapseStyleDemo extends StatelessWidget {
  const AntdCollapseStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdCollapse(
          style: AntdCollapseStyle(
              bodyStyle: AntdBoxStyle(
                  color: token.colorPrimary,
                  textStyle: token.font.lg.copyWith(color: token.colorWhite))),
          onChange: (index, check) {
            AntdToast.show("触发了index:${index},当前选中:${check}");
          },
          items: const [
            AntdCollapseItem(title: Text("第13项"), content: text),
            AntdCollapseItem(title: Text("第二项"), content: text),
            AntdCollapseItem(title: Text("第三项"), content: text)
          ])
    ]);
  }
}

```

### 动态内容


```dart
class _AntdCollapseLoadingDemoStateDemo extends State<AntdCollapseLoadingDemo> {
  bool loading = false;
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdCollapse(
          value: [index],
          onChange: (index, check) {
            setState(() {
              this.index = check ? index : -1;
              if (check) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    loading = true;
                  });
                  Future.delayed(const Duration(seconds: 3)).then((_) {
                    setState(() {
                      loading = false;
                    });
                  });
                });
              }
            });
          },
          items: [
            AntdCollapseItem(
                title: const Text("第一项"),
                content: AntdLoading(
                    circular: true,
                    color: AntdColor.primary,
                    spinning: loading,
                    text: const Text("加载中"),
                    child: text)),
            const AntdCollapseItem(
                title: Text("第二项"),
                activeIcon: AntdIcon(icon: AntdIcons.app),
                content: text),
            const AntdCollapseItem(
                title: Text("第三项"),
                activeIcon: AntdIcon(icon: AntdIcons.smile),
                content: text)
          ])
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='http://localhost:49470/AntdCollapse'></iframe>
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
  flex: 1;
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
| style | 样式 | AntdCollapseStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdCollapseStyle, AntdCollapse&gt; | - | - |
| items | 滚动的数据 | List&lt;AntdCollapseItem&gt; | - | - |
| itemBuilder | 数据构造器 | AntdScrollItemBuilder&lt;AntdCollapseItem, AntdCollapseController&gt; | - | - |
| shrinkWrap | 自动扩展高度 | bool | true | - |
| controller | 控制器 | AntdCollapseController | - | - |
| value | 活动的索引 | List&lt;int&gt; | - | - |
| onChange | 变更时出触发 | AntdCollapseChange | - | - |


## 折叠面板(Collapse)的整体样式配置(AntdCollapseStyle) <a id='AntdCollapseStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| titleStyle | 面板标题的默认样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| bodyStyle | 面板内容区域的容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| itemStyle | 单个折叠项的容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| childStyle | 子类的样式,当没有使用itemBuilder的默认样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| contentStyle | 面板展开时的内容区域样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| iconStyle | 折叠图标的默认样式（颜色/大小等） | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| icon | 默认状态下的折叠图标 | Widget | - | - |
| activeIcon | 展开状态下的折叠图标 | Widget | - | - |
| disableIcon | 禁用状态下的折叠图标 | Widget | - | - |

## 折叠面板中的单个可折叠项(AntdCollapseItem) <a id='AntdCollapseItem'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| disabled | 是否禁用当前折叠项 | bool | false | - |
| title | 折叠项的标题内容 | Widget | - | - |
| content | 折叠项展开时显示的内容 | Widget | - | - |
| icon | 自定义折叠图标 | Widget | - | - |
| activeIcon | 展开状态下的自定义图标 | Widget | - | - |
| disableIcon | 禁用状态下的自定义图标 | Widget | - | - |
| onTap | 点击折叠项的回调函数 | VoidCallback | - | - |
| builder | 自定义项渲染构建器（参数：当前项实例/基础子组件） | Widget Function(AntdCollapseItem item, Widget child) | - | - |


