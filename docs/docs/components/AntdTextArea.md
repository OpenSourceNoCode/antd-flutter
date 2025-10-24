---
group:
  title: 信息录入
  order: 53
title: TextArea
subtitle: 文本域
---
通过键盘输入内容，是最基础的表单域包装。
## 何时使用
需要折行的长文本输入。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdTextArea'></iframe>
</div>
<div style='flex: 1;'>

### 基础


```dart
class AntdTextAreaDemo extends StatelessWidget {
  const AntdTextAreaDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdTextArea(
          onChange: (value) {
            AntdToast.show("当前的输入值:$value", position: AntdToastPosition.top);
          },
          placeholder: const Text("请输入内容"))
    ]);
  }
}

```

### 默认值


```dart
class AntdTextAreaDefaultValueDemo extends StatelessWidget {
  const AntdTextAreaDefaultValueDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdTextArea(
          value: "默认值",
          onChange: (value) {
            AntdToast.show("当前的输入值:$value", position: AntdToastPosition.top);
          },
          placeholder: const Text("请输入内容"))
    ]);
  }
}

```

### 只读/禁用


```dart
class AntdTextAreaReadOnlyDisabledDemo extends StatelessWidget {
  const AntdTextAreaReadOnlyDisabledDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "只读",
          child: AntdTextArea(
              value: "默认值", readOnly: true, placeholder: Text("请输入内容"))),
      DemoTitle(
          outline: false,
          title: "禁用",
          child: AntdTextArea(
              value: "默认值", disabled: true, placeholder: Text("请输入内容")))
    ]);
  }
}

```

### 指定行数


```dart
class AntdTextAreaMinLinesDemo extends StatelessWidget {
  const AntdTextAreaMinLinesDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "最小行",
          child: AntdTextArea(minLines: 5, placeholder: Text("请输入内容"))),
      DemoTitle(
          outline: false,
          title: "最大行",
          child: AntdTextArea(maxLines: 5, placeholder: Text("请输入内容")))
    ]);
  }
}

```

### 字数统计


```dart
class AntdTextAreaShowCountDemo extends StatelessWidget {
  const AntdTextAreaShowCountDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "统计",
          child: AntdTextArea(
              showCount: true, minLines: 5, value: "北极星垂地，东山月满川。")),
      DemoTitle(
          outline: false,
          title: "最大长度",
          child: AntdTextArea(
              showCount: true,
              maxLength: 10,
              minLines: 5,
              value: "北极星垂地，东山月满川。"))
    ]);
  }
}

```

### 键盘类型


```dart
class AntdTextAreaKeyboardTypeDemo extends StatelessWidget {
  const AntdTextAreaKeyboardTypeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "数字",
          child: AntdTextArea(
              showCount: true,
              placeholder: Text("请输入"),
              keyboardType: TextInputType.number)),
      DemoTitle(
          outline: false,
          title: "手机号",
          child: AntdTextArea(
              showCount: true,
              placeholder: Text("请输入"),
              keyboardType: TextInputType.phone)),
      DemoTitle(
          outline: false,
          title: "日期",
          child: AntdTextArea(
              showCount: true,
              placeholder: Text("请输入"),
              keyboardType: TextInputType.datetime))
    ]);
  }
}

```

### 事件


```dart
class AntdTextAreaEventDemo extends StatelessWidget {
  const AntdTextAreaEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "onChange",
          child: AntdTextArea(
              showCount: true,
              placeholder: const Text("请输入"),
              onChange: (value) {
                AntdToast.show("当前的输入值:$value",
                    position: AntdToastPosition.top);
              })),
      DemoTitle(
          outline: false,
          title: "onClear 点击清理图标",
          child: AntdTextArea(
              showCount: true,
              placeholder: const Text("请输入"),
              onChange: (value) {
                AntdToast.show("当前的输入值:$value",
                    position: AntdToastPosition.top);
              },
              onClear: () {
                AntdToast.show("触发clear", position: AntdToastPosition.top);
              })),
      DemoTitle(
          outline: false,
          title: "onTap 触摸事件",
          child: AntdTextArea(
              showCount: true,
              placeholder: const Text("请输入"),
              onChange: (value) {
                AntdToast.show("当前的输入值:$value",
                    position: AntdToastPosition.top);
              },
              onTap: () {
                AntdToast.show("触发onTap", position: AntdToastPosition.top);
              })),
      DemoTitle(
          outline: false,
          title: "onFocus 焦点事件",
          child: AntdTextArea(
              showCount: true,
              placeholder: const Text("请输入"),
              onChange: (value) {
                AntdToast.show("当前的输入值:$value",
                    position: AntdToastPosition.top);
              },
              onFocus: (value) {
                AntdToast.show("触发onFocus:$value",
                    position: AntdToastPosition.top);
              }))
    ]);
  }
}

```

### 与表单配合


```dart
class _AntdTextAreaFormDemoStateDemo extends State<AntdTextAreaFormDemo> {
  AntdInputController inputController = AntdInputController();
  AntdInputController inputController1 = AntdInputController();
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "最基础 在AntdFormItem中使用会自动收集AntdTextArea的值",
          child: AntdForm(builder: (controller) {
            return FormValue(
                controller: controller,
                child: AntdFormItem(
                    name: "textarea",
                    builder: (ctx) {
                      return const AntdTextArea(
                          minLines: 2, placeholder: Text("请输入"));
                    }));
          })),
      DemoTitle(
          outline: false,
          title: "表单控制默认值",
          child: AntdForm(
              initialValues: const {"textarea": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        builder: (ctx) {
                          return const AntdTextArea(
                              minLines: 2, placeholder: Text("请输入"));
                        }));
              })),
      DemoTitle(
          outline: false,
          title:
              "表单控制只读禁用,属性的优先级遵守最近原则,虽然AntdFormItem指定的disabled,但是AntdTextArea覆盖了",
          child: AntdForm(
              initialValues: const {"textarea": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        readOnly: true,
                        disabled: true,
                        builder: (ctx) {
                          return const AntdTextArea(
                              disabled: false, placeholder: Text("请输入"));
                        }));
              })),
      DemoTitle(
          outline: false,
          title: "不要表单自动收集 必须在合适的时候手动 否则不会同步",
          child: AntdForm(
              initialValues: const {"textarea": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        builder: (ctx) {
                          return const AntdTextArea(
                              autoCollect: false, placeholder: Text("请输入"));
                        }));
              })),
      AntdButton(
          child: const Text('点我修改'),
          onTap: () {
            setState(() {
              inputController.text = "我是外部设置的值";
            });
          }),
      DemoTitle(
          outline: false,
          title: "autoCollect:true的时候外部改变 Value 也会同步至表单",
          child: AntdForm(
              initialValues: const {"textarea": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        builder: (ctx) {
                          return AntdTextArea(
                              controller: inputController,
                              placeholder: const Text("请输入"),
                              onChange: (value) {
                                AntdToast.show("当前的输入值:$value",
                                    position: AntdToastPosition.top);
                              });
                        }));
              })),
      AntdButton(
          child: const Text('点我修改'),
          onTap: () {
            setState(() {
              inputController1.text = "我是外部设置的值";
            });
          }),
      DemoTitle(
          outline: false,
          title: "使用shouldTriggerChange 控制当外部的value改变时要不要触发onChange",
          child: AntdForm(
              initialValues: const {"textarea": '来自form的默认值'},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "textarea",
                        builder: (ctx) {
                          return AntdTextArea(
                              controller: inputController1,
                              placeholder: const Text("请输入"),
                              onChange: (value) {
                                AntdToast.show("当前的输入值:$value",
                                    position: AntdToastPosition.top);
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
| style | 样式 | AntdInputStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdInputStyle, AntdTextArea&gt; | - | - |
| focusNode | 控制输入框的焦点状态 | FocusNode | - | - |
| clearable | 是否显示清除按钮（点击会清空输入内容） | bool | true | - |
| value | 值 | String | - | - |
| disabled | 禁用 | bool | - | - |
| onChange | 变更事件 | ValueChanged&lt;String&gt; | - | - |
| onEditingComplete | 编辑完成时的回调（通常点击键盘完成/下一步时触发） | VoidCallback | - | - |
| onSubmitted | 文本提交时的回调（通常点击键盘发送/搜索时触发） | ValueChanged&lt;String&gt; | - | - |
| onClear | 点击清除按钮时的回调函数 | VoidCallback | - | - |
| placeholder | 输入框为空时显示的提示文本 | Widget | - | - |
| readOnly | 只读 | bool | - | - |
| controller | 输入框的控制器，用于程序化控制文本内容 | AntdInputController | - | - |
| autoCollect | 自动同步值到表单 | bool | - | - |
| autocorrect | 是否自动校正拼写错误（如iOS键盘的自动修正），默认为true | bool | false | - |
| maxLines | 输入框的最大行数（多行文本时生效） | int | - | - |
| minLines | 输入框的最小行数（多行文本时生效） | int | - | - |
| maxLength | 允许输入的最大字符数 | int | - | - |
| keyboardType | 键盘类型（如数字键盘、邮箱键盘等） | TextInputType | text | - |
| inputAction | 键盘动作按钮类型（如搜索、发送等） | TextInputAction | - | - |
| onSelectionChanged | 文本选中范围变化时的回调 | SelectionChangedCallback | - | - |
| formatters | 输入内容格式过滤器（如限制数字、正则匹配等） | List&lt;TextInputFormatter&gt; | - | - |
| prefix | 输入框前缀部件（如图标、标签等） | Widget | - | - |
| suffix | 输入框后缀部件（如图标、按钮等） | Widget | - | - |
| onTap | 输入框点击事件回调 | VoidCallback | - | - |
| contextMenuBuilder | 自定义上下文菜单构建器（长按文本时弹出的菜单） | EditableTextContextMenuBuilder | - | - |
| undoController | 撤销/重做历史控制器 | UndoHistoryController | - | - |
| spellCheckConfiguration | 拼写检查配置（如启用/禁用、错误文本样式等） | SpellCheckConfiguration | - | - |
| magnifierConfiguration | 文本放大镜配置（长按选中文本时的放大效果） | TextMagnifierConfiguration | - | - |
| onAppPrivateCommand | 处理来自键盘的私有命令（如第三方键盘扩展功能） | AppPrivateCommandCallback | - | - |
| dragStartBehavior | 拖动行为的起始方式（如立即响应或延迟响应） | DragStartBehavior | start | - |
| scrollController | 滚动控制器（用于控制多行文本的滚动位置） | ScrollController | - | - |
| scrollPhysics | 滚动物理效果（如滚动边界行为） | ScrollPhysics | const NeverScrollableScrollPhysics() | - |
| clipBehavior | 内容裁剪方式（如抗锯齿裁剪） | Clip | hardEdge | - |
| onFocus | 焦点事件 | AntdOnFocus | - | - |
| shouldTriggerChange | 当value手动控制的时候 是否应该触发onChange | bool | true | - |
| hapticFeedback | 开启反馈:`light` \| `medium` \| `heavy` \| `none` | AntdHapticFeedback | - | - |
| manual | 受控模式 value的值必须手动更新 默认不开启 | bool | - | - |
| showCount | 是否展示字数统计 | bool | true | - |
| countBuilder | 自定义统计数字 | AntdTextAreaCountBuilder | - | - |


## 输入框整体样式配置(AntdInputStyle) <a id='AntdInputStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| placeholderStyle | 占位符文本样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| textStyle | 常规文本样式 | [TextStyle](../components/text/#TextStyle) | - | - |
| obscureTextStyle | 密码模式文本样式 | [TextStyle](../components/text/#TextStyle) | - | - |
| bodyStyle | 输入框容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| cursorStyle | 光标样式配置 | [AntInputCursorStyle](../components/ant-input-cursor/#AntInputCursorStyle) | - | - |
| obscuringCharacter | 密码模式替代字符，默认"•" | String | - | - |
| clearIconStyle | 图标样式配置 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| selectionStyle | 文本选择样式配置 | [AntdSelectionStyle](../components/antd-selection/#AntdSelectionStyle) | - | - |
| keyboardStyle | 键盘样式配置 | [AntdKeyboardStyle](../components/antd-keyboard/#AntdKeyboardStyle) | - | - |
| clearIcon | 清除按钮图标 | Widget | - | - |
| obscureIconStyle | 密码隐藏状态图标样式配置 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| obscureIcon | 密码隐藏状态图标 | Widget | - | - |
| activeObscureIconStyle | 密码显示状态图标样式配置 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| activeObscureIcon | 密码显示状态图标 | Widget | - | - |
| rowStyle | 布局行样式配置 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| autocorrectionColor | 自动修正文本区域颜色 | Color | - | - |


