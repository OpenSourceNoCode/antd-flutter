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

### 自定义样式

自定义样式

```dart
class AntdCapsuleTabsStyleDemo extends StatelessWidget {
  const AntdCapsuleTabsStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: false, child: [
      AntdCapsuleTabs(
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


