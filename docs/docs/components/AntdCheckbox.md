---
group:
  title: 信息录入
  order: 42
title: Checkbox
subtitle: 复选框
---
在一组可选项中进行多选。
## 何时使用
单独使用可以表示两种状态之间的切换，和 switch 类似。区别在于切换 switch 会直接触发状态改变，而 checkbox 一般用于状态标记，需要和提交操作配合。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdCheckbox'></iframe>
</div>
<div style='flex: 1;'>

### 受控模式


```dart
class _AntdRadioValueDemoStateDemo extends State<AntdRadioValueDemo> {
  var check = false;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdRadio(value: check, extra: const Text("受控模式")),
      Row(children: [
        AntdButton(
            child: const Text("选中"),
            onTap: () {
              setState(() {
                check = true;
              });
            }),
        AntdButton(
            child: const Text("取消"),
            onTap: () {
              setState(() {
                check = false;
              });
            })
      ])
    ]);
  }
}

```

### 基础使用


```dart
class AntdCheckboxDemo extends StatelessWidget {
  const AntdCheckboxDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AntdCheckbox(
            onChange: (value) {
              AntdToast.show("变更为:$value");
            },
            extra: const Text("有描述的复选框")),
        const AntdCheckbox(disabled: true, extra: Text("禁用"))
      ])
    ]);
  }
}

```

### 全选和半选


```dart
class _AntdCheckboxIndeterminateDemoStateDemo
    extends State<AntdCheckboxIndeterminateDemo> {
  var values = <int>[];
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AntdCheckbox(
            value: true,
            indeterminate: values.length != 3,
            extra: const Text("半选")),
        ...(List.generate(3, (i) {
          return AntdCheckbox(
              value: values.contains(i),
              onChange: (check) {
                setState(() {
                  if (check == true) {
                    values.add(i);
                  } else {
                    values.remove(i);
                  }
                });
              },
              extra: Text("我是$i"));
        }))
      ])
    ]);
  }
}

```

### 自定义样式


```dart
class AntdCheckboxCustomDemo extends StatelessWidget {
  const AntdCheckboxCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdCheckbox(
          value: true,
          style: AntdCheckboxStyle(
              defaultIcon: const AntdIcon(icon: AntdIcons.smile),
              activeIcon: AntdIcon(
                  style: AntdIconStyle(color: token.colorPrimary),
                  icon: AntdIcons.smileFill),
              disableIcon: AntdIcon(
                  style: AntdIconStyle(color: token.colorPrimary),
                  icon: AntdIcons.delete),
              defaultStyle: const AntdBoxStyle(size: 16),
              activeStyle: const AntdBoxStyle(size: 16)),
          extra: const Text("我是自定义内容"))
    ]);
  }
}

```

### 列表选择


```dart
class _AntdCheckboxListDemoStateDemo extends State<AntdCheckboxListDemo> {
  var values = <int>[];
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdList(
          shrinkWrap: true,
          items: List.generate(5, (i) {
            return AntdCheckbox(
                value: values.contains(i),
                onChange: (check) {
                  if (check == true) {
                    values.add(i);
                  } else {
                    values.remove(i);
                  }
                },
                extra: Text("内容${i}"));
          }))
    ]);
  }
}

```

### 只读和禁用


```dart
class AntdCheckboxDisabledDemo extends StatelessWidget {
  const AntdCheckboxDisabledDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdCheckbox(disabled: true, extra: Text("禁用")),
      AntdCheckbox(readOnly: true, value: true, extra: Text("只读"))
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
| style | 样式 | AntdCheckboxStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdCheckboxStyle, AntdCheckbox&gt; | - | - |
| disabled | 禁用 | bool | - | - |
| readOnly | 只读 | bool | - | - |
| value | 值 | bool | - | - |
| autoCollect | 自动同步值到表单 | bool | - | - |
| onChange | 变更事件 | ValueChanged&lt;bool&gt; | - | - |
| indeterminate | 半选 | bool | - | - |
| extra | 内容 | Widget | - | - |


## 复选框组件样式配置类(AntdCheckboxStyle) <a id='AntdCheckboxStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 主体样式，可以开启切换时震动反馈 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| defaultStyle | 复选框未选中时的容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeStyle | 复选框选中时的容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| indeterminateStyle | 复选框半选状态(indeterminate)的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| extraStyle | 复选框文本标签的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| iconStyle | 复选框图标的样式配置 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| activeIcon | 选中状态下显示的图标组件 | Widget | - | - |
| defaultIcon | 默认未选中状态下显示的图标组件 | Widget | - | - |
| disableIcon | 禁用状态下显示的图标组件 | Widget | - | - |
| rowStyle | 对齐样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |


