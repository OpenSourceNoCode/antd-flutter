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

### 基础使用


```dart
class AntdCheckboxDemo extends StatelessWidget {
  const AntdCheckboxDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AntdCheckbox(
            value: true,
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
              icon: const AntdIcon(icon: AntdIcons.smile),
              activeIcon: AntdIcon(
                  style: AntdIconStyle(size: 22, color: token.colorPrimary),
                  icon: AntdIcons.smileFill),
              disableIcon: AntdIcon(
                  style: AntdIconStyle(color: token.colorPrimary),
                  icon: AntdIcons.delete),
              activeIconStyle: AntdIconStyle(
                  bodyStyle: AntdBoxStyle(color: token.colorWhite))),
          extra: const Text("我是自定义内容"))
    ]);
  }
}

```

### 受控模式


```dart
class _AntdCheckboxValueDemoStateDemo extends State<AntdCheckboxValueDemo> {
  bool? check = false;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdCheckbox(value: check, manual: true, extra: const Text("受控模式")),
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
                check = null;
              });
            })
      ])
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

### 选择组


```dart
class AntdCheckboxGroupDemo extends StatelessWidget {
  const AntdCheckboxGroupDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdCheckboxGroup(
          items: const [
            AntdCheckbox(extra: Text("1"), value: 1),
            AntdCheckbox(extra: Text("2"), value: 2),
            AntdCheckbox(extra: Text("3"), value: 3)
          ],
          onChange: (values) {
            AntdToast.show(jsonEncode(values));
          })
    ]);
  }
}

```

### 与表单配合


```dart
class _AntdCheckboxFormDemoStateDemo extends State<AntdCheckboxFormDemo> {
  bool value = false;
  bool value1 = false;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "最基础 在AntdFormItem中使用会自动收集AntdCheckbox的值,务必指定一个value",
          child: AntdForm(builder: (controller) {
            return FormValue(
                controller: controller,
                child: AntdFormItem(
                    name: "checkbox",
                    builder: (ctx) {
                      return const AntdCheckbox(value: "1");
                    }));
          })),
      DemoTitle(
          outline: false,
          title: "表单控制默认值",
          child: AntdForm(
              initialValues: const {"checkbox": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "checkbox",
                        builder: (ctx) {
                          return const AntdCheckbox();
                        }));
              })),
      DemoTitle(
          outline: false,
          title:
              "表单控制只读禁用,属性的优先级遵守最近原则,虽然AntdFormItem指定的disabled,但是AntdCheckbox覆盖了",
          child: AntdForm(
              initialValues: const {"checkbox": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "checkbox",
                        readOnly: true,
                        disabled: true,
                        builder: (ctx) {
                          return const AntdCheckbox(disabled: false);
                        }));
              })),
      DemoTitle(
          outline: false,
          title: "不要表单自动收集 必须在合适的时候手动 否则不会同步",
          child: AntdForm(
              initialValues: const {"checkbox": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "checkbox",
                        builder: (ctx) {
                          return const AntdCheckbox(autoCollect: false);
                        }));
              })),
      AntdButton(
          child: const Text('点我修改'),
          onTap: () {
            setState(() {
              value = !value;
            });
          }),
      DemoTitle(
          outline: false,
          title: "autoCollect:true的时候外部改变 Value 也会同步至表单",
          child: AntdForm(
              initialValues: const {"checkbox": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "checkbox",
                        builder: (ctx) {
                          return AntdCheckbox(
                              value: value,
                              manual: true,
                              onChange: (value) {
                                AntdToast.show("当前的输入值:$value",
                                    position: AntdToastPosition.top);
                                setState(() {
                                  this.value = value;
                                });
                              });
                        }));
              })),
      AntdButton(
          child: const Text('点我修改'),
          onTap: () {
            setState(() {
              value1 = !value1;
            });
          }),
      DemoTitle(
          outline: false,
          title: "使用shouldTriggerChange 控制当外部的value改变时要不要触发onChange",
          child: AntdForm(
              initialValues: const {"checkbox": true},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "checkbox",
                        builder: (ctx) {
                          return AntdCheckbox(
                              value: value1,
                              manual: true,
                              onChange: (value) {
                                AntdToast.show("当前的输入值:$value",
                                    position: AntdToastPosition.top);
                                setState(() {
                                  this.value = value;
                                });
                              },
                              shouldTriggerChange: false);
                        }));
              }))
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
| value | 值 | dynamic | - | - |
| autoCollect | 自动同步值到表单 | bool | - | - |
| onChange | 变更事件 | ValueChanged&lt;dynamic&gt; | - | - |
| shouldTriggerChange | 当value手动控制的时候 是否应该触发onChange | bool | - | - |
| hapticFeedback | 开启反馈:`light` \| `medium` \| `heavy` \| `none` | AntdHapticFeedback | - | - |
| manual | 受控模式 value的值必须手动更新 默认不开启 | bool | - | - |
| indeterminate | 半选 | bool | - | - |
| extra | 内容 | Widget | - | - |


## 复选框组件样式配置类(AntdCheckboxStyle) <a id='AntdCheckboxStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 主体样式，可以开启切换时震动反馈 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| indeterminateStyle | 复选框半选状态(indeterminate)的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| extraStyle | 复选框文本标签的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeIconStyle | 选中框图标的样式配置 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| activeIcon | 选中状态下显示的图标组件 | Widget | - | - |
| iconStyle | 默认图标的样式配置 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| icon | 默认未选中状态下显示的图标组件 | Widget | - | - |
| disableIconStyle | 禁用图标的样式配置 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| disableIcon | 禁用状态下显示的图标组件 | Widget | - | - |
| rowStyle | 对齐样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |

## 多选选择组(AntdCheckboxGroup) <a id='AntdCheckboxGroup'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| disabled | 禁用 | bool | - | - |
| readOnly | 只读 | bool | - | - |
| value | 值 | T | - | - |
| autoCollect | 自动同步值到表单 | bool | - | - |
| onChange | 变更事件 | ValueChanged&lt;T&gt; | - | - |
| shouldTriggerChange | 当value手动控制的时候 是否应该触发onChange | bool | - | - |
| hapticFeedback | 开启反馈:`light` \| `medium` \| `heavy` \| `none` | AntdHapticFeedback | - | - |
| manual | 受控模式 value的值必须手动更新 默认不开启 | bool | - | - |
| items | 列表项 | List&lt;AntdCheckbox&gt; | - | - |
| builder | 自定义构建 默认使用List | Widget? Function(List&lt;AntdCheckbox&gt;? items) | - | - |


