---
group:
  title: 信息录入
  order: 52
title: Switch
subtitle: 开关
---
开关选择器。
## 何时使用
需要表示开关状态/两种状态之间的切换时

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdSwitch'></iframe>
</div>
<div style='flex: 1;'>

### 基础使用

使用defaultValue来指定业务数据，支持任意数据类型

```dart
class AntdSwitchDemo extends StatelessWidget {
  const AntdSwitchDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSwitch(
          defaultValue: 1,
          content: const Text("关闭"),
          activeContent: const Text("打开"),
          onChange: (value) async {
            AntdToast.show("当前值:$value");
          }),
      AntdSwitch(
          defaultValue: 2,
          content: const Text("关闭"),
          activeContent: const Text("打开"),
          onChange: (value) async {
            AntdToast.show("当前值:$value");
          }),
      AntdSwitch(
          defaultValue: 3,
          onChange: (value) async {
            AntdToast.show("当前值:$value");
          })
    ]);
  }
}

```

### 自定义样式


```dart
class AntdSwitchCustomDemo extends StatelessWidget {
  const AntdSwitchCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdSwitch(
          style: AntdSwitchStyle(
              trackStyle: AntdBoxStyle(color: token.colorError),
              activeTrackStyle:
                  AntdBoxStyle(color: token.colorSuccess, padding: 10.all),
              thumbStyle: AntdBoxStyle(height: 14, color: token.colorPrimary)))
    ]);
  }
}

```

### 受控模式

通过value为null来关闭，只要value不是null 就是打开状态

```dart
class _AntdSwitchValueDemoStateDemo extends State<AntdSwitchValueDemo> {
  String? status;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSwitch(
          value: status,
          content: const Text("关闭"),
          activeContent: const Text("打开"),
          onChange: (value) async {
            AntdToast.show("当前值:$value");
          }),
      Wrap(spacing: 12, children: [
        AntdButton(
            child: const Text("打开"),
            onTap: () {
              setState(() {
                status = "open";
              });
            }),
        AntdButton(
            child: const Text("关闭"),
            onTap: () {
              setState(() {
                status = null;
              });
            })
      ])
    ]);
  }
}

```

### 只读和禁用


```dart
class AntdSwitchDisabledDemo extends StatelessWidget {
  const AntdSwitchDisabledDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSwitch(disabled: true, content: Text("禁用")),
      AntdSwitch(readOnly: true, value: true, activeContent: Text("只读"))
    ]);
  }
}

```

### 与表单配合


```dart
class _AntdSwitchFormDemoStateDemo extends State<AntdSwitchFormDemo> {
  String? value;
  String? value1;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "最基础 在AntdFormItem中使用会自动收集AntdSwitch的值,务必指定一个defaultValue",
          child: AntdForm(builder: (controller) {
            return FormValue(
                controller: controller,
                child: AntdFormItem(
                    name: "switch",
                    builder: (ctx) {
                      return const AntdSwitch(defaultValue: "1");
                    }));
          })),
      DemoTitle(
          outline: false,
          title: "表单控制默认值",
          child: AntdForm(
              initialValues: {"switch": '1'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "switch",
                        builder: (ctx) {
                          return const AntdSwitch();
                        }));
              })),
      DemoTitle(
          outline: false,
          title:
              "表单控制只读禁用,属性的优先级遵守最近原则,虽然AntdFormItem指定的disabled,但是AntdSwitch覆盖了",
          child: AntdForm(
              initialValues: {"switch": '1'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "switch",
                        readOnly: true,
                        disabled: true,
                        builder: (ctx) {
                          return const AntdSwitch(disabled: false);
                        }));
              })),
      DemoTitle(
          outline: false,
          title: "不要表单自动收集 必须在合适的时候手动 否则不会同步",
          child: AntdForm(
              initialValues: {"switch": '1'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "switch",
                        builder: (ctx) {
                          return const AntdSwitch(autoCollect: false);
                        }));
              })),
      AntdButton(
          child: const Text('点我修改'),
          onTap: () {
            setState(() {
              value = value == null ? "1" : null;
            });
          }),
      DemoTitle(
          outline: false,
          title: "autoCollect:true的时候外部改变 Value 也会同步至表单",
          child: AntdForm(
              initialValues: {"switch": '1'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "switch",
                        builder: (ctx) {
                          return AntdSwitch(
                              value: value,
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
              value1 = value1 == null ? "1" : null;
            });
          }),
      DemoTitle(
          outline: false,
          title: "使用shouldTriggerChange 控制当外部的value改变时要不要触发onChange",
          child: AntdForm(
              initialValues: {"switch": '1'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "switch",
                        builder: (ctx) {
                          return AntdSwitch(
                              value: value1,
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
| style | 样式 | AntdSwitchStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdSwitchStyle, AntdSwitch&gt; | - | - |
| disabled | 禁用 | bool | - | - |
| readOnly | 只读 | bool | - | - |
| defaultValue | 默认值 | dynamic | - | - |
| value | 值 | dynamic | - | - |
| autoCollect | 自动同步值到表单 | bool | - | - |
| onChange | 变更事件 | ValueChanged&lt;dynamic&gt; | - | - |
| shouldTriggerChange | 当value手动控制的时候 是否应该触发onChange | bool | - | - |
| hapticFeedback | 开启反馈:`light` \| `medium` \| `heavy` \| `none` | AntdHapticFeedback | - | - |
| content | 选中时的内容 | Widget | - | - |
| activeContent | 未选中时的内容 | Widget | - | - |
| duration | 动画周期 | Duration | const Duration(milliseconds: 200) | - |


## 开关组件的基础样式（包含所有状态）(AntdSwitchStyle) <a id='AntdSwitchStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 主体样式，可以开启切换时震动反馈 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| trackStyle | 开关轨道样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeTrackStyle | 激活后开关轨道样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| thumbStyle | 开关手柄样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeThumbStyle | 激活后开关手柄样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| contentStyle | 开关内部子内容样式（如文字/图标） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeContentStyle | 开关内部子内容样式（如文字/图标） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| content | 选中时的内容 | Widget | - | - |
| activeContent | 未选中时的内容 | Widget | - | - |


