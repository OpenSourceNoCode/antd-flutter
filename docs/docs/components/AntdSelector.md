---
group:
  title: 信息录入
  order: 48
title: Selector
subtitle: 选择组
---
在一组选项中选择一个或多个。
## 何时使用
提供多个选项供用户选择，一般在筛选和表单中使用。

## 代码展示

<div class='preview-container'>
<div>

### 基础使用


```dart
class AntdSelectorDemo extends StatelessWidget {
  const AntdSelectorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [AntdSelector(options: options)]);
  }
}

```

### 多列布局


```dart
class AntdSelectorColumnsDemo extends StatelessWidget {
  const AntdSelectorColumnsDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSelector(columns: 2, options: options),
      AntdSelector(columns: 3, options: options)
    ]);
  }
}

```

### 受控模式 不要忘记使用onChange更新


```dart
class _AntdSelectorValueDemoStateDemo extends State<AntdSelectorValueDemo> {
  var values = {"1"};
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSelector(
          value: values,
          onChange: (values) {
            this.values = values ?? {};
          },
          options: options
              .map((option) => AntdSelectorOption(
                  label: option.label, value: option.value, disabled: true))
              .toList()),
      Row(children: [
        AntdButton(
            child: Text("选中2"),
            onTap: () {
              setState(() {
                values.add("2");
              });
            }),
        AntdButton(
            child: Text("取消2"),
            onTap: () {
              setState(() {
                values.remove("2");
              });
            })
      ])
    ]);
  }
}

```

### 只读和禁用


```dart
class AntdSelectorDisabledDemo extends StatelessWidget {
  const AntdSelectorDisabledDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSelector(options: options, disabled: true),
      AntdSelector(readOnly: true, value: {"2"}, options: options)
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdSelector'></iframe>
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
| style | 样式 | AntdSelectorStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdSelectorStyle, AntdSelector&gt; | - | - |
| disabled | 禁用 | bool | - | - |
| readOnly | 只读 | bool | - | - |
| value | 值 | Set&lt;String&gt; | - | - |
| autoCollect | 自动同步值到表单 | bool | - | - |
| onChange | 变更事件 | ValueChanged&lt;Set&lt;String&gt;&gt; | - | - |
| columns | 列数 | int | 2 | - |
| options | 可选项 | List&lt;AntdSelectorOption&gt; | - | - |


## 选择器角标(AntdSelectorBadgeStyle) <a id='AntdSelectorBadgeStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| size | 角标尺寸配置（宽高） | Size | - | - |
| color | 角标背景颜色 | Color | - | - |

## 选择器选项数据类(AntdSelectorOption) <a id='AntdSelectorOption'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| style | 样式 | AntdSelectorOptionStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdSelectorOptionStyle, AntdSelectorOption&gt; | - | - |
| description | 选项的描述信息组件（显示在label下方） | Widget | - | - |
| disabled | 是否禁用该选项（默认false） | bool | false | - |
| check | 是否选中该选项（默认false） | bool | false | - |
| label | 选项的主标签组件 | Widget | - | - |
| value | 选项的唯一标识值 | String | - | - |
| onChange | 更改事件 | ValueChanged&lt;bool&gt; | - | - |

## 选择器样式配置类(AntdSelectorStyle) <a id='AntdSelectorStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 最外层样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| wrapStyle | 布局 | [AntdWrapStyle](../components/antd-wrap/#AntdWrapStyle) | - | - |
| optionStyle | 选项样式 | [AntdSelectorOptionStyle](../components/antd-selector-option/#AntdSelectorOptionStyle) | - | - |


