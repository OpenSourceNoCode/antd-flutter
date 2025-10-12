---
group:
  title: 信息录入
  order: 50
title: Slider
subtitle: 滑动输入条
---
滑动型输入器，展示当前值和可选范围。
## 何时使用
当用户需要在数值区间/自定义区间内进行选择时，可为连续或离散值。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdSlider'></iframe>
</div>
<div style='flex: 1;'>

### 基础用法


```dart
class AntdSliderDemo extends StatelessWidget {
  const AntdSliderDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdSlider(onChange: (value) {
        AntdToast.show("当前选中值为start:${value?.start},end:${value?.end}");
      })
    ]);
  }
}

```

### 显示刻度并指定步距


```dart
class AntdSliderTicksStepDemo extends StatelessWidget {
  const AntdSliderTicksStepDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSlider(
          ticks: true,
          step: 10,
          onChange: (value) {
            AntdToast.show("当前选中值为start:${value?.start},end:${value?.end}");
          })
    ]);
  }
}

```

### 传入刻度标记


```dart
class AntdSliderTicksStepMarkDemo extends StatelessWidget {
  const AntdSliderTicksStepMarkDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSlider(
          ticks: true,
          step: 10,
          onChange: (value) {
            AntdToast.show("当前选中值为${value?.start}");
          },
          renderTicks: (value) {
            return Text("$value");
          })
    ]);
  }
}

```

### 最大/最小值(50~80)


```dart
class AntdSliderMaxMinDemo extends StatelessWidget {
  const AntdSliderMaxMinDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSlider(
          ticks: true,
          step: 10,
          max: 80,
          min: 50,
          onChange: (value) {
            AntdToast.show("当前选中值为${value?.end}");
          })
    ]);
  }
}

```

### 默认值


```dart
class AntdSliderDefaultDemo extends StatelessWidget {
  const AntdSliderDefaultDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSlider(
          ticks: true,
          step: 10,
          defaultValue: AntdSliderValue(start: 20, end: 0))
    ]);
  }
}

```

### 双滑块


```dart
class AntdSliderRangeDemo extends StatelessWidget {
  const AntdSliderRangeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSlider(
          ticks: true,
          step: 10,
          range: true,
          defaultValue: const AntdSliderValue(start: 20, end: 40),
          onChange: (value) {
            AntdToast.show("当前选中值为start:${value?.start},end:${value?.end}");
          })
    ]);
  }
}

```

### 禁用状态


```dart
class AntdSliderDisabledDemo extends StatelessWidget {
  const AntdSliderDisabledDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSlider(
          ticks: true,
          step: 10,
          range: true,
          disabled: true,
          value: AntdSliderValue(start: 20, end: 20))
    ]);
  }
}

```

### 自定义样式（通过 style）


```dart
class AntdSliderCustomDemo extends StatelessWidget {
  const AntdSliderCustomDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdSlider(
          style: AntdSliderStyle(
              activeMarkStyle: AntdBoxStyle(color: token.colorError),
              activeTrackStyle: AntdBoxStyle(color: token.colorSuccess)),
          ticks: true,
          step: 10,
          range: true,
          defaultValue: const AntdSliderValue(start: 20, end: 20))
    ]);
  }
}

```

### 受控模式


```dart
class _AntdSliderControllerDemoStateDemo
    extends State<AntdSliderControllerDemo> {
  AntdSliderValue? value = const AntdSliderValue(start: 20, end: 30);
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSlider(
          ticks: true,
          step: 10,
          range: true,
          value: value,
          onChange: (value) {
            setState(() {
              this.value = value;
            });
          }),
      AntdButton(
          onTap: () {
            setState(() {
              value = const AntdSliderValue(start: 20, end: 30);
            });
          },
          child: const Text("动态修改"))
    ]);
  }
}

```

### 与表单配合


```dart
class _AntdSliderFormDemoStateDemo extends State<AntdSliderFormDemo> {
  AntdSliderValue? value;
  AntdSliderValue? value1;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      DemoTitle(
          outline: false,
          title: "最基础 在AntdFormItem中使用会自动收集AntdSlider的值,务必指定一个defaultValue",
          child: AntdForm(builder: (controller) {
            return FormValue(
                controller: controller,
                child: AntdFormItem(
                    name: "slider",
                    builder: (ctx) {
                      return const AntdSlider(
                          ticks: true, step: 10, range: true);
                    }));
          })),
      DemoTitle(
          outline: false,
          title: "表单控制默认值",
          child: AntdForm(
              initialValues: {"slider": AntdSliderValue(start: 20, end: 40)},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "slider",
                        builder: (ctx) {
                          return const AntdSlider(
                              ticks: true, step: 10, range: true);
                        }));
              })),
      DemoTitle(
          outline: false,
          title:
              "表单控制只读禁用,属性的优先级遵守最近原则,虽然AntdFormItem指定的disabled,但是AntdSlider覆盖了",
          child: AntdForm(
              initialValues: {"slider": AntdSliderValue(start: 20, end: 40)},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "slider",
                        readOnly: true,
                        disabled: true,
                        builder: (ctx) {
                          return const AntdSlider(
                              disabled: false,
                              ticks: true,
                              step: 10,
                              range: true);
                        }));
              })),
      DemoTitle(
          outline: false,
          title: "不要表单自动收集 必须在合适的时候手动 否则不会同步",
          child: AntdForm(
              initialValues: {"slider": AntdSliderValue(start: 20, end: 40)},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "slider",
                        builder: (ctx) {
                          return const AntdSlider(
                              autoCollect: false,
                              ticks: true,
                              step: 10,
                              range: true);
                        }));
              })),
      AntdButton(
          child: const Text('点我修改'),
          onTap: () {
            setState(() {
              value = AntdSliderValue(start: 20, end: 30);
            });
          }),
      DemoTitle(
          outline: false,
          title: "autoCollect:true的时候外部改变 Value 也会同步至表单",
          child: AntdForm(
              initialValues: {"slider": AntdSliderValue(start: 20, end: 40)},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "slider",
                        builder: (ctx) {
                          return AntdSlider(
                              value: value,
                              ticks: true,
                              step: 10,
                              range: true,
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
              value1 = AntdSliderValue(start: 20, end: 30);
            });
          }),
      DemoTitle(
          outline: false,
          title: "使用shouldTriggerChange 控制当外部的value改变时要不要触发onChange",
          child: AntdForm(
              initialValues: {"slider": AntdSliderValue(start: 20, end: 40)},
              builder: (controller) {
                return FormValue(
                    controller: controller,
                    child: AntdFormItem(
                        name: "slider",
                        builder: (ctx) {
                          return AntdSlider(
                              value: value1,
                              ticks: true,
                              step: 10,
                              range: true,
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
| style | 样式 | AntdSliderStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdSliderStyle, AntdSlider&gt; | - | - |
| disabled | 禁用 | bool | - | - |
| readOnly | 只读 | bool | - | - |
| defaultValue | 默认值 | AntdSliderValue | - | - |
| value | 值 | AntdSliderValue | - | - |
| autoCollect | 自动同步值到表单 | bool | - | - |
| onChange | 变更事件 | ValueChanged&lt;AntdSliderValue&gt; | - | - |
| shouldTriggerChange | 当value手动控制的时候 是否应该触发onChange | bool | - | - |
| hapticFeedback | 开启反馈:`light` \| `medium` \| `heavy` \| `none` | AntdHapticFeedback | - | - |
| slider | 滑块的图标 | Widget | - | - |
| max | 最大值 | int | - | - |
| min | 最小值 | int | - | - |
| length | 长度 | int | 100 | - |
| range | 是否为双滑块 | bool | false | - |
| step | 步距，取值必须大于 0，并且 (max - min) 可被 step 整除。当 marks 不为空对象时，step 的配置失效 | int | 1 | - |
| ticks | 是否显示刻度 | bool | false | - |
| renderTicks | 渲染的tick | AntdSliderRenderTicks | - | - |


## 样式(AntdSliderStyle) <a id='AntdSliderStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 主体样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| markStyle | 滑块刻度标记点的默认样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeMarkStyle | 滑块激活状态下刻度标记点的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| markTextStyle | 滑块刻度文本的默认样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeMarkTextStyle | 滑块激活状态下刻度文本的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| trackStyle | 滑块轨道的默认样式（未激活部分） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeTrackStyle | 滑块轨道的激活部分样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| slider | 滑块图标 | Widget | - | - |
| sliderIconStyle | 滑块手柄内图标的样式（如果有的话） | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |


