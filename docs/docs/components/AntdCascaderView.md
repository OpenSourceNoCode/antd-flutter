---
group:
  title: 信息录入
  order: 39
title: CascaderView
subtitle: 级联选择视图
---
CascaderView 是 Cascader 的内容区域。
## 何时使用
需要从一组相关联的数据集合进行选择，例如省市区，公司层级，事物分类等。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdCascaderView'></iframe>
</div>
<div style='flex: 1;'>

### 基础用法


```dart
class AntdCascaderViewDemo extends StatelessWidget {
  const AntdCascaderViewDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdCascaderView(
          onChange: (values) {
            AntdToast.show(values.join(","));
          },
          options: cascaderOptions)
    ]);
  }
}

```

### 默认选中


```dart
class AntdCascaderViewDefaultDemo extends StatelessWidget {
  const AntdCascaderViewDefaultDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdCascaderView(value: ['2-1', '3-1'], options: cascaderOptions)
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
| style | 样式 | AntdCascaderViewStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdCascaderViewStyle, AntdCascaderView&gt; | - | - |
| placeholder | 未选中时的提示文案 | Widget | const Text("请选择") | - |
| value | 配置每一列的选项 | List&lt;String&gt; | - | - |
| options | 配置每一列的选项 | List&lt;AntdCascaderOption&gt; | - | - |
| onTabsChange | 默认选中项 | AntdTabsOnChange&lt;AntdTab&gt; | - | - |
| onChange | 选项变化时的回调 | AntdCascaderViewChange | - | - |
| hapticFeedback | 开启反馈:`light` \| `medium` \| `heavy` | AntdHapticFeedback | light | - |


## 配置项样式(AntdCascaderOptionStyle) <a id='AntdCascaderOptionStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| childStyle | 子选项的容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| checkChildStyle | 选中状态下子选项的容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| flexStyle | 布局使用的Flex样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| checkIcon | 选中状态下显示的图标 | Widget | - | - |
| uncheckIcon | 未选中状态下显示的图标 | Widget | - | - |

## 选项(AntdCascaderOption) <a id='AntdCascaderOption'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| style | 样式 | AntdCascaderOptionStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdCascaderOptionStyle, AntdCascaderOption&gt; | - | - |
| value | 选项的唯一标识值 | String | - | - |
| parentValue | 父级选项的值，用于构建层级关系 | String | - | - |
| title | 选项标题组件 | Widget | - | - |
| child | 选项内容组件 | Widget | - | - |
| checkIcon | 选中状态下显示的图标 | Widget | - | - |
| uncheckIcon | 未选中状态下显示的图标 | Widget | - | - |
| check | 是否选中该选项 | bool | false | - |
| disabled | 是否禁用该选项 | bool | false | - |
| onTap | 选项点击回调函数 | VoidCallback | - | - |

## 选项(AntdCascaderViewStyle) <a id='AntdCascaderViewStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 级联选择器主体容器的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| tabsStyle | 选项卡组件的样式配置 | [AntdTabsStyle](../components/antd-tabs/#AntdTabsStyle) | - | - |
| listStyle | 列表组件的样式配置 | [AntdListStyle](../components/antd-list/#AntdListStyle) | - | - |
| optionStyle | 级联选项的样式配置 | [AntdCascaderOptionStyle](../components/antd-cascader-option/#AntdCascaderOptionStyle) | - | - |


