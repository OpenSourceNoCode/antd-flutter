---
group:
  title: 信息录入
  order: 47
title: SearchBar
subtitle: 搜索框
---
搜索场景的输入框组件。。
## 何时使用
在信息池中缩小范围，快速而轻松地获取目标信息。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdSearchBar'></iframe>
</div>
<div style='flex: 1;'>

### 获取焦点后显示取消按钮


```dart
class AntdSearchBarAutoShowExtraDemo extends StatelessWidget {
  const AntdSearchBarAutoShowExtraDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdSearchBar(
          extra: const Text("取消"),
          onExtraTap: () {
            AntdToast.show("点击了取消");
          },
          placeholder: const Text("请输入内容"))
    ]);
  }
}

```

### 取消按钮长显


```dart
class AntdSearchBarAutoShowExtraLongProcessDemo extends StatelessWidget {
  const AntdSearchBarAutoShowExtraLongProcessDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdSearchBar(
          showExtra: true, extra: Text("取消"), placeholder: Text("请输入内容"))
    ]);
  }
}

```

### 自定义样式


```dart
class AntdSearchBarAutoCustomDemo extends StatelessWidget {
  const AntdSearchBarAutoCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdSearchBar(
          style: AntdSearchBarStyle(
              bodyStyle: AntdBoxStyle(color: token.colorWhite),
              activeBodyStyle: AntdBoxStyle(radius: BorderRadius.circular(0))),
          placeholder: Text("请输入内容"))
    ]);
  }
}

```

### 自定义图标


```dart
class AntdSearchBarAutoCustomIconDemo extends StatelessWidget {
  const AntdSearchBarAutoCustomIconDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdSearchBar(
          prefix: AntdIcon(icon: AntdIcons.app), placeholder: Text("请输入内容"))
    ]);
  }
}

```

### 延迟激活


```dart
class AntdSearchBarLazyDemo extends StatelessWidget {
  const AntdSearchBarLazyDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdSearchBar(
          lazy: true,
          prefix: AntdIcon(icon: AntdIcons.app),
          extra: Text("取消"),
          placeholder: Text("请输入内容"))
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
| style | 样式 | AntdSearchBarStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdSearchBarStyle, AntdSearchBar&gt; | - | - |
| extra | 取消按钮的文案 | Widget | - | - |
| autoClear | 点击取消按钮后是否清空输入框 | bool | true | - |
| autoFocus | 自动获取焦点 | bool | true | - |
| showExtra | 点击取消按钮后是否清空输入框 | bool | false | - |
| clearable | 是否启用清除图标，点击清除图标后会清空输入框 | bool | true | - |
| prefix | 前缀 | Widget | - | - |
| onClear | 点击清除按钮后触发 | VoidCallback | - | - |
| onChange | 值变更 | ValueChanged&lt;String?&gt; | - | - |
| onExtraTap | 点击额外区域时触发 | VoidCallback | - | - |
| placeholder | 提示文本 | Widget | - | - |
| readOnly | 只读模式 | bool | false | - |
| controller | 搜索控制器 | AntdSearchBarController | - | - |
| lazy | 只有当激活后才出现输入框 | bool | false | - |
| duration | 动画时长 | Duration | const Duration(milliseconds: 200) | - |


## 搜索栏样式配置(AntdSearchBarStyle) <a id='AntdSearchBarStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 搜索栏容器默认样式（非激活状态） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| bodyFlexStyle | 对齐样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| inputStyle | 输入框样式配置 | [AntdInputStyle](../components/antd-input/#AntdInputStyle) | - | - |
| activeBodyStyle | 搜索栏激活状态容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| iconStyle | 占位符图标样式配置 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| extraStyle | 右侧附加内容容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| placeholder | 自定义占位符组件（替代默认文本占位符） | Widget | - | - |
| placeholderFlexStyle | 对齐样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |


