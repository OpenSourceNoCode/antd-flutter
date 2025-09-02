---
group:
  title: 信息录入
  order: 41
title: Form
subtitle: 表单
---
高性能表单控件，自带数据域管理。包含数据录入、校验以及对应样式。
## 何时使用
适用于创建一个实体或收集信息。需要对输入的数据类型进行校验时。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdForm'></iframe>
</div>
<div style='flex: 1;'>

### 基础使用


```dart
class AntdFormDemo extends StatelessWidget {
  const AntdFormDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
          layout: AntdFormLayout.horizontal,
          initialValues: const {"name": '王xx', "address": 'xx地址 xx小区'},
          builder: (controller) {
            return Column(children: [
              ListenableBuilder(
                  listenable: controller,
                  builder: (BuildContext context, Widget? child) {
                    return AntdBox(
                        style: AntdBoxStyle(
                            color: token.colorWhite,
                            padding: 12.all,
                            width: double.infinity),
                        child: Text(jsonEncode(controller.getFieldsValue())));
                  }),
              AntdList(shrinkWrap: true, items: [
                AntdFormItem(
                    required: true,
                    label: const Text("姓名"),
                    name: "name",
                    rules: const [AntdFormRule(len: 5)],
                    builder: <String>(ctx) {
                      return const AntdInput(placeholder: Text("请输入姓名"));
                    }),
                AntdFormItem(
                    required: true,
                    label: const Text("喜爱的水果"),
                    name: "apple",
                    builder: <String>(ctx) {
                      return const AntdSelector(options: [
                        AntdSelectorOption(label: Text("苹果"), value: "ap"),
                        AntdSelectorOption(label: Text("橘子"), value: "or"),
                        AntdSelectorOption(label: Text("香蕉"), value: "ba")
                      ]);
                    }),
                AntdFormItem(
                    label: const Text("地址"),
                    help: const Text("详情地址"),
                    name: "address",
                    builder: <String>(ctx) {
                      return const AntdTextArea(
                          maxLength: 60, placeholder: Text("请输入地址"));
                    }),
                Padding(
                    padding: 10.top,
                    child: AntdButton(
                        color: AntdColor.primary,
                        block: true,
                        onTap: () async {
                          var result = await controller.submit();
                          if (result) {
                            AntdToast.show("通过校验");
                            return;
                          }
                          var errors = controller
                              .getFieldErrors()
                              .map((value) =>
                                  "${value.name}:${value.firstMessage}")
                              .toList();
                          AntdToast.show(errors.join(","));
                        },
                        child: const Text("提交")))
              ])
            ]);
          })
    ]);
  }
}

```

### 使用trigger控制字段收集,默认在onChange时收集


```dart
class AntdFormTriggerDemo extends StatelessWidget {
  const AntdFormTriggerDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
          layout: AntdFormLayout.horizontal,
          trigger: AntdFormTrigger.onFocus,
          validateTrigger: AntdFormTrigger.onFocus,
          initialValues: const {"name": '王xx', "address": 'xx地址 xx小区'},
          builder: (controller) {
            return Column(children: [
              ListenableBuilder(
                  listenable: controller,
                  builder: (BuildContext context, Widget? child) {
                    return AntdBox(
                        style: AntdBoxStyle(
                            color: token.colorWhite,
                            padding: 12.all,
                            width: double.infinity),
                        child: Text(jsonEncode(controller.getFieldsValue())));
                  }),
              AntdList(
                  shrinkWrap: true,
                  style: AntdListStyle(
                      itemStyle: AntdBoxStyle(
                          focusStyle: AntdKitStyle(
                              border: token.borderSide
                                  .copyWith(color: token.colorPrimary, width: 3)
                                  .all))),
                  items: [
                    AntdFormItem(
                        required: true,
                        label: const Text("姓名"),
                        name: "name",
                        rules: const [AntdFormRule(len: 5)],
                        builder: <String>(ctx) {
                          return const AntdInput(placeholder: Text("请输入姓名"));
                        }),
                    AntdFormItem(
                        required: true,
                        label: const Text("喜爱的水果"),
                        name: "apple",
                        builder: (ctx) {
                          return const AntdSelector(options: [
                            AntdSelectorOption(label: Text("苹果"), value: "ap"),
                            AntdSelectorOption(label: Text("橘子"), value: "or"),
                            AntdSelectorOption(label: Text("香蕉"), value: "ba")
                          ]);
                        }),
                    AntdFormItem(
                        label: const Text("地址"),
                        help: const Text("详情地址"),
                        name: "address",
                        builder: <String>(ctx) {
                          return const AntdTextArea(
                              maxLength: 60, placeholder: Text("请输入地址"));
                        }),
                    Padding(
                        padding: 10.top,
                        child: AntdButton(
                            color: AntdColor.primary,
                            block: true,
                            onTap: () async {
                              var result = await controller.submit();
                              if (result) {
                                AntdToast.show("通过校验");
                                return;
                              }
                              var errors = controller
                                  .getFieldErrors()
                                  .map((value) =>
                                      "${value.name}:${value.firstMessage}")
                                  .toList();
                              AntdToast.show(errors.join(","));
                            },
                            child: const Text("提交")))
                  ])
            ]);
          })
    ]);
  }
}

```

### 事件


```dart
class AntdFormEventDemo extends StatelessWidget {
  const AntdFormEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
          onFinish: (values, rules) async {
            AntdToast.show("完成，表单值：$values");
          },
          onValuesChange: (controller, change) {
            change.forEach((name, value) {
              AntdToast.show("字段:$name 值：$value");
            });
          },
          layout: AntdFormLayout.horizontal,
          initialValues: const {"name": '王xx', "address": 'xx地址 xx小区'},
          builder: (controller) {
            return Column(children: [
              ListenableBuilder(
                  listenable: controller,
                  builder: (BuildContext context, Widget? child) {
                    return AntdBox(
                        style: AntdBoxStyle(
                            color: token.colorWhite,
                            padding: 12.all,
                            width: double.infinity),
                        child: Text(jsonEncode(controller.getFieldsValue())));
                  }),
              AntdList(shrinkWrap: true, items: [
                AntdFormItem(
                    required: true,
                    label: const Text("姓名"),
                    name: "name",
                    rules: const [AntdFormRule(len: 5)],
                    builder: <String>(ctx) {
                      return const AntdInput(placeholder: Text("请输入姓名"));
                    }),
                AntdFormItem(
                    label: const Text("地址"),
                    help: const Text("详情地址"),
                    name: "address",
                    builder: <String>(ctx) {
                      return const AntdTextArea(
                          maxLength: 60, placeholder: Text("请输入地址"));
                    }),
                Padding(
                    padding: 10.top,
                    child: AntdButton(
                        color: AntdColor.primary,
                        block: true,
                        onTap: () async {
                          await controller.submit();
                        },
                        child: const Text("提交")))
              ])
            ]);
          })
    ]);
  }
}

```

### 动态表单

可以通过preserve控制字段删除后值是否保留

```dart
class _AntdFormDynamicDemoStateDemo extends State<AntdFormDynamicDemo> {
  var number = 0;
  var fieldIds = <num>[];
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(onFieldsChange: (newNames, add, names) {
        AntdToast.show("字段${newNames.join("-")},${add ? '添加' : '删除'}");
      }, builder: (controller) {
        return Column(children: [
          ListenableBuilder(
              listenable: controller,
              builder: (BuildContext context, Widget? child) {
                return AntdBox(
                    style: AntdBoxStyle(
                        margin: 10.bottom,
                        color: token.colorWhite,
                        padding: 12.all,
                        width: double.infinity),
                    child: Text(jsonEncode(controller.getFieldsValue())));
              }),
          AntdList(
              card: true,
              shrinkWrap: true,
              items: fieldIds.map((id) {
                return AntdFormItem(
                    preserve: id % 2 == 0,
                    key: ValueKey(id.toString()),
                    name: id.toString(),
                    label: Text(id.toString()),
                    required: id % 2 == 0,
                    builder: <String>(ctx) {
                      return AntdInput(
                          placeholder: Text("请输入$id的内容"),
                          suffix: AntdButton(
                              size: AntdSize.mini,
                              onTap: () {
                                fieldIds.remove(id);
                                setState(() {});
                              },
                              child: const Text("移除")));
                    });
              }).toList(),
              footer: Column(children: [
                AntdButton(
                    block: true,
                    onTap: () {
                      number += 1;
                      fieldIds.add(number);
                      setState(() {});
                    },
                    child: const Text("增加一项")),
                AntdBox(
                    style: AntdBoxStyle(margin: 12.top),
                    child: AntdButton(
                        block: true,
                        onTap: () async {
                          var result = await controller.submit();
                          AntdToast.show("提交${result ? '成功' : '失败'}");
                        },
                        child: const Text("提交")))
              ]))
        ]);
      })
    ]);
  }
}

```

### 标题和卡片


```dart
class AntdFormCardDemo extends StatelessWidget {
  const AntdFormCardDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
          onFinish: (values, rules) async {
            AntdToast.show("完成，表单值：$values");
          },
          onValuesChange: (controller, change) {
            change.forEach((name, value) {
              AntdToast.show("字段:$name 值：$value");
            });
          },
          layout: AntdFormLayout.horizontal,
          initialValues: const {"name": '王xx', "address": 'xx地址 xx小区'},
          builder: (controller) {
            return Column(children: [
              ListenableBuilder(
                  listenable: controller,
                  builder: (BuildContext context, Widget? child) {
                    return AntdBox(
                        style: AntdBoxStyle(
                            color: token.colorWhite,
                            padding: 12.all,
                            width: double.infinity),
                        child: Text(jsonEncode(controller.getFieldsValue())));
                  }),
              AntdList(
                  header: const Text("我是标题"),
                  footer: Padding(
                      padding: 10.top,
                      child: AntdButton(
                          color: AntdColor.primary,
                          block: true,
                          onTap: () async {
                            await controller.submit();
                          },
                          child: const Text("提交"))),
                  card: true,
                  shrinkWrap: true,
                  items: [
                    AntdFormItem(
                        required: true,
                        label: const Text("手机号"),
                        name: "phone",
                        rules: const [AntdFormRule(len: 5)],
                        builder: <String>(ctx) {
                          return const AntdInput(placeholder: Text("请输入"));
                        }),
                    AntdFormItem(
                        required: true,
                        label: const Text("短信验证码"),
                        name: "code",
                        rules: const [AntdFormRule(len: 5)],
                        builder: <String>(ctx) {
                          return AntdInput(
                              placeholder: const Text("请输入"),
                              suffix: Text("获取验证码",
                                  style: TextStyle(color: token.colorLink)));
                        })
                  ])
            ]);
          })
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
| style | 样式 | AntdFormStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdFormStyle, AntdForm&gt; | - | - |
| readOnly | 只读 | bool | - | - |
| disabled | 禁用 | bool | - | - |
| hasFeedback | 是否展示错误反馈 | bool | - | - |
| layout | 布局模式:`vertical` \| `horizontal` | AntdFormLayout | - | - |
| preserve | 当字段被删除时保留字段值 | bool | - | - |
| required | 是否必选，需要注意的是这个属性仅仅用来控制外观，并不包含校验逻辑 | bool | - | - |
| trigger | 设置收集字段值变更的时机:`onChange` \| `onFocus` \| `any` | AntdFormTrigger | - | - |
| validateFirst | 当某一规则校验不通过时，是否停止剩下的规则的校验。设置 parallel 时会并行校验 | bool | - | - |
| validateTrigger | 设置字段校验的时机:`onChange` \| `onFocus` \| `any` | AntdFormTrigger | - | - |
| controller | 控制器 | AntdFormController | - | - |
| initialValues | 表单默认值，只有初始化以及重置时生效 | Map&lt;String, dynamic&gt; | - | - |
| builder | 子项 | AntdFormBuilder | - | - |
| onFieldsChange | 字段更新时触发 | AntdFormFieldsChange | - | - |
| onFinish | 提交表单且数据验证成功后触发 | AntdFormFinish | - | - |
| onValuesChange | 字段值更新时触发 | AntdFormValuesChange | - | - |


## 表单样式(AntdFormStyle) <a id='AntdFormStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| wrapStyle | 用于包裹整个表单组件，通常设置外边距、背景色等 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| headerStyle | 用于表单标题、操作按钮等头部内容的容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| bodyStyle | 用于表单字段项的主体内容容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| footerStyle | 用于提交按钮、底部说明等底部内容的容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |

## 表单项布局跨度配置(AntdFormItemSpan) <a id='AntdFormItemSpan'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| label | 标签部分所占栅格列数（默认2） | int | 2 | - |
| item | 控件部分所占栅格列数（默认4） | int | 4 | - |

## 必填标志的样式(AntdFormItemRequireStyle) <a id='AntdFormItemRequireStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| size | - | Size | const Size(5, 5) | - |
| color | - | Color | - | - |

## 表单项样式配置(AntdFormItemStyle) <a id='AntdFormItemStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 表单项整体容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| itemStyle | 表单控件容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| itemFlexStyle | item的对齐样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| labelStyle | 标签文本容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| labelFlexStyle | 标签文本容器样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| feedbackStyle | 校验反馈信息容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| helpIconStyle | 帮助提示图标样式 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| extraIconStyle | 额外操作图标样式 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| extraFlexStyle | 扩展区域的对齐样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| span | 栅格布局跨度配置 | AntdFormItemSpan | const AntdFormItemSpan() | - |
| requireStyle | 必填标记样式 | [AntdFormItemRequireStyle](../components/antd-form-item-require/#AntdFormItemRequireStyle) | - | - |


