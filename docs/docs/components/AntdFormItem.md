---
group:
  title: 信息录入
  order: 41
title: FormItem
subtitle: 表单项
---
与表单搭配使用，只是属性太多单独列出来了
## 何时使用


## 代码展示

<div class='preview-container'>
<div>

### 必填和禁用,同[AntdForm]的disabled


```dart
class AntdFormItemDemo extends StatelessWidget {
  const AntdFormItemDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          disabled: true,
          required: true,
          hasFeedback: true,
          initialValues: const {"name": '王xx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("姓名"),
                  name: "name",
                  rules: const [AntdFormRule(len: 5)],
                  builder: <String>(ctx) {
                    return const AntdInput(placeholder: Text("请输入姓名"));
                  }),
              AntdFormItem(
                  required: false,
                  disabled: false,
                  hasFeedback: true,
                  label: const Text("姓名1"),
                  name: "name1",
                  rules: const [AntdFormRule(len: 5)],
                  builder: <String>(ctx) {
                    return const AntdInput(placeholder: Text("请输入姓名1"));
                  })
            ]);
          })
    ]);
  }
}

```

### 布局


```dart
class AntdFormLayoutDemo extends StatelessWidget {
  const AntdFormLayoutDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          layout: AntdFormLayout.vertical,
          initialValues: const {"name": '王xx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("姓名"),
                  name: "name",
                  help: const Text("不能超过5个哈"),
                  rules: const [AntdFormRule(len: 5)],
                  builder: <String>(ctx) {
                    return const AntdInput(placeholder: Text("请输入姓名"));
                  })
            ]);
          }),
      AntdForm(
          layout: AntdFormLayout.horizontal,
          initialValues: const {"name": '王xx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("姓名"),
                  name: "name",
                  help: const Text("不能超过5个哈"),
                  helpIcon: const AntdIcon(icon: AntdIcons.message),
                  rules: const [AntdFormRule(len: 5)],
                  builder: <String>(ctx) {
                    return const AntdInput(placeholder: Text("请输入姓名"));
                  })
            ]);
          }),
      AntdForm(
          layout: AntdFormLayout.horizontal,
          initialValues: const {"name": '王xx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("自定义"),
                  name: "name",
                  help: const Text("我是提示"),
                  extra: const Text("我是额外区域"),
                  rules: const [AntdFormRule(len: 5)],
                  builder: <String>(ctx) {
                    return const AntdInput(placeholder: Text("请输入姓名"));
                  },
                  layoutBuilder: (ctx) {
                    return Column(children: [
                      if (ctx.label != null) ctx.label!,
                      if (ctx.feedback != null) ctx.feedback!,
                      ctx.item,
                      if (ctx.extra != null) ctx.extra!
                    ]);
                  })
            ]);
          })
    ]);
  }
}

```

### 初始值


```dart
class AntdFormInitialValueDemo extends StatelessWidget {
  const AntdFormInitialValueDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          initialValues: const {"name": '王xx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("姓名"),
                  name: "name",
                  initialValue: "我覆盖了王xx",
                  builder: (ctx) {
                    return const AntdInput(placeholder: Text("请输入姓名"));
                  })
            ]);
          })
    ]);
  }
}

```

### OnChang


```dart
class AntdFormOnChangeDemo extends StatelessWidget {
  const AntdFormOnChangeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          initialValues: const {"name": '王xx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("姓名"),
                  name: "name",
                  onChange: (controller, value) {
                    AntdToast.show("$value");
                  },
                  builder: (ctx) {
                    return const AntdInput(placeholder: Text("请输入姓名"));
                  })
            ]);
          })
    ]);
  }
}

```

### normalize,通过normalize可以在值变更放入表单之前做处理

如果你在normalize改变了value,那么builder的时候一定不要返回const

```dart
class AntdFormNormalizeDemo extends StatelessWidget {
  const AntdFormNormalizeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          initialValues: const {"name": '王xx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("姓名"),
                  name: "name",
                  normalize: (value) {
                    return value + "222";
                  },
                  builder: (ctx) {
                    return AntdInput(placeholder: Text("请输入姓名"));
                  },
                  shouUpdate: (value, bef) {
                    return true;
                  })
            ]);
          })
    ]);
  }
}

```

### 依赖和更新


```dart
class AntdFormDependenciesDemo extends StatelessWidget {
  const AntdFormDependenciesDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          initialValues: const {"name": '王xx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("姓名"),
                  name: "name",
                  builder: (ctx) {
                    return const AntdInput(placeholder: Text("请输入姓名"));
                  }),
              AntdFormItem(
                  label: const Text("年龄"),
                  name: "age",
                  dependencies: const ['name'],
                  builder: (ctx) {
                    var name = controller.getFieldValue(name: "name");
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (name == null || name.isEmpty)
                            const Text("请先输入年龄"),
                          AntdInput(
                              disabled: name == null || name.isEmpty,
                              placeholder: const Text("请输入年龄"))
                        ]);
                  }),
              AntdFormItem(
                  label: const Text("性别"),
                  name: "sex",
                  builder: (ctx) {
                    return const AntdInput(placeholder: Text("请输入性别"));
                  })
            ]);
          })
    ]);
  }
}

```

### 校验


```dart
class AntdFormRulesDemo extends StatelessWidget {
  const AntdFormRulesDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdForm(
          initialValues: const {"name": '王xx'},
          builder: (controller) {
            return AntdList(shrinkWrap: true, items: [
              AntdFormItem(
                  label: const Text("姓名"),
                  name: "name",
                  builder: (ctx) {
                    return const AntdInput(placeholder: Text("请输入姓名"));
                  },
                  rules: [
                    const AntdFormRule(len: 5),
                    AntdFormRule(validator: (item, value, fromValue) async {
                      if (value is String) {
                        return value.contains("a") ? "不能存在字母a" : null;
                      }
                      return null;
                    })
                  ])
            ]);
          })
    ]);
  }
}

```

### 自定义收集值


```dart
class AntdFormBuilderDemo extends StatelessWidget {
  const AntdFormBuilderDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdForm(
          initialValues: const {
            "tags": <int>[1, 3]
          },
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
                    label: const Text("姓名"),
                    name: "tags",
                    builder: (ctx) {
                      var values = ctx.value == null ? [] : ctx.value as List;
                      return Row(
                          children: List.generate(5, (i) {
                        return AntdBox(
                            style: AntdBoxStyle(margin: 4.horizontal),
                            child: AntdTag(
                                style: AntdTagStyle(
                                    bodyStyle: values.contains(i)
                                        ? AntdBoxStyle(
                                            color: token.colorPrimary)
                                        : null),
                                onTap: () {
                                  if (values.contains(i)) {
                                    values.remove(i);
                                  } else {
                                    values.add(i);
                                  }
                                  ctx.onChange(values);
                                },
                                child: Text("Tag $i")));
                      }));
                    },
                    rules: [
                      const AntdFormRule(len: 3),
                      AntdFormRule(validator: (item, value, fromValue) async {
                        return (value as List).contains(2) ? "不能选择第2个" : null;
                      })
                    ])
              ])
            ]);
          })
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='https://antd-flutter-git-example-howie206s-projects.vercel.app/AntdFormItem'></iframe>
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
| style | 样式 | AntdFormItemStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdFormItemStyle, AntdFormItem&gt; | - | - |
| readOnly | 只读 | bool | - | - |
| disabled | 禁用 | bool | - | - |
| hasFeedback | 是否展示错误反馈 | bool | - | - |
| layout | 布局模式:`vertical` \| `horizontal` | AntdFormLayout | - | - |
| preserve | 当字段被删除时保留字段值 | bool | - | - |
| required | 是否必选，需要注意的是这个属性仅仅用来控制外观，并不包含校验逻辑 | bool | - | - |
| trigger | 设置收集字段值变更的时机:`onChange` \| `onFocus` \| `any` | AntdFormTrigger | - | - |
| validateFirst | 当某一规则校验不通过时，是否停止剩下的规则的校验。设置 parallel 时会并行校验 | bool | - | - |
| validateTrigger | 设置字段校验的时机:`onChange` \| `onFocus` \| `any` | AntdFormTrigger | - | - |
| help | 提示文本 | Widget | - | - |
| helpIcon | 提示图标 | Widget | const AntdIcon(icon: AntdIcons.questionCircle) | - |
| hidden | 是否隐藏整个字段 | bool | - | - |
| initialValue | 设置子元素默认值，如果与 Form 的 initialValues 冲突则以 Form 为准 | dynamic | - | - |
| onChange | 数据改变时调用 | AntdFormItemChange | - | - |
| label | 标签名 | Widget | - | - |
| name | 字段名,嵌套的路径如 "user.address.city" | String | - | - |
| dependencies | 依赖的字段信息 | List&lt;String&gt; | - | - |
| normalize | 组件获取值后进行转换，再放入 Form 中。不支持异步 | AntdFormItemNormalize | - | - |
| rules | 校验规则，设置字段的校验逻辑 | List&lt;AntdFormRule&gt; | - | - |
| extra | 右侧扩展区 | Widget | - | - |
| builder | 内容 | AntdFormItemBuilder | - | - |
| layoutBuilder | 自定义布局 | AntdFormItemLayoutBuilder | - | - |
| shouUpdate | 更新判断函数 | AntdFormItemShouUpdate | - | - |


## 检验规则(AntdFormRule) <a id='AntdFormRule'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| message | 错误信息，不设置时会通过模板自动生成 | String | - | - |
| validator | 自定义校验 | AntdFormRuleValidator | - | - |
| trigger | 设置触发验证时机:`onChange` \| `onFocus` \| `any` | AntdFormTrigger | - | - |
| warningOnly | 仅警告，不阻塞表单提交 | bool | - | - |
| enums | 是否匹配枚举中的值（需要将 type 设置为 enum） | List&lt;String&gt; | - | - |
| len | string 类型时为字符串长度；number 类型时为确定数字； array 类型时为数组长度 | int | - | - |
| max | 必须设置 type：string 类型为字符串最大长度；number 类型时为最大值；array 类型时为数组最大长度 | int | - | - |
| min | 必须设置 type：string 类型为字符串最小长度；number 类型时为最小值；array 类型时为数组最小长度 | int | - | - |
| pattern | 正则表达式匹配 | RegExp | - | - |
| required | 是否为必选字段 | bool | - | - |
| whitespace | 如果字段仅包含空格则校验不通过 | bool | - | - |
| type | 类型:`string` \| `number` | AntdFormRuleType | - | - |


