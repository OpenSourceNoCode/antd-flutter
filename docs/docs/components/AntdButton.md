---
group:
  title: 通用
  order: 1
title: Button
subtitle: 按钮
---
用于开始一个即时操作。
## 何时使用
标记了一个或封装一组操作命令，响应用户点击行为，触发相应的业务逻辑。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdButton'></iframe>
</div>
<div style='flex: 1;'>

### 填充模式


```dart
class AntdButtonFillDemo extends StatelessWidget {
  const AntdButtonFillDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdButton(fill: AntdButtonFill.solid, child: Text('solid')),
      AntdButton(fill: AntdButtonFill.outline, child: Text('outline')),
      AntdButton(fill: AntdButtonFill.none, child: Text('none'))
    ]);
  }
}

```

### 块级按钮


```dart
class AntdButtonBlockDemo extends StatelessWidget {
  const AntdButtonBlockDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdButton(block: true, size: AntdSize.large, child: Text('solid'))
    ]);
  }
}

```

### 不同尺寸


```dart
class AntdButtonSizeDemo extends StatelessWidget {
  const AntdButtonSizeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
        child: AntdSize.values.map((size) {
      return AntdButton(size: size, child: Text(size.name));
    }).toList());
  }
}

```

### 语意按钮


```dart
class AntdButtonColorDemo extends StatelessWidget {
  const AntdButtonColorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
        child: AntdColor.values.map((color) {
      return AntdButton(color: color, child: Text(color.name));
    }).toList());
  }
}

```

### 自定义图标

前缀可是任意的[Widget](/widget)

```dart
class AntdButtonIconDemo extends StatelessWidget {
  const AntdButtonIconDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdButton(
          icon: AntdIcon(icon: AntdIcons.search),
          color: AntdColor.warning,
          fill: AntdButtonFill.solid,
          child: Text("搜索"))
    ]);
  }
}

```

### 自定样式

通过style属性覆盖默认样式

```dart
class AntdButtonStyleDemo extends StatelessWidget {
  const AntdButtonStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          style: const AntdButtonStyle(
              buttonStyle: AntdBoxStyle(color: Colors.green)),
          styleBuilder: (context, button, style, token) {
            if (button.size == AntdSize.large) {
              return AntdButtonStyle(
                  buttonStyle: AntdBoxStyle(
                      textStyle:
                          token.font.xxl.copyWith(color: token.colorWarning)));
            }
            return style;
          },
          child: const Text("自定义样式")),
      AntdStyleBuilderProvider<AntdButtonStyle, AntdButton>(
          builder: (context, button, style, token) {
            return AntdButtonStyle(
                buttonStyle: AntdBoxStyle(
                    border: token.border
                        .copyWith(width: 4, color: token.colorSuccess)
                        .all));
          },
          child: Column(children: [
            AntdStyleProvider<AntdButtonStyle>(
                style: const AntdButtonStyle(
                    buttonStyle: AntdBoxStyle(opacity: 0.5)),
                child: AntdButton(
                    size: AntdSize.large,
                    style: AntdButtonStyle(
                        buttonStyle: AntdBoxStyle(
                            border:
                                const BorderSide(width: 2, color: Colors.red)
                                    .all)),
                    styleBuilder: (context, button, style, token) {
                      if (button.size == AntdSize.large) {
                        return AntdButtonStyle(
                            buttonStyle: AntdBoxStyle(
                                color: token.colorPrimary,
                                textStyle: token.font.xxl
                                    .copyWith(color: token.colorWarning)));
                      }
                      return style;
                    },
                    child: const Text("Button"))),
            const AntdButton(child: Text("Button"))
          ]))
    ]);
  }
}

```

### 加载中

基于AntdLoading实现

```dart
class AntdButtonLoadingDemo extends StatelessWidget {
  const AntdButtonLoadingDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      const AntdButton(
          loading: true,
          color: AntdColor.primary,
          fill: AntdButtonFill.solid,
          child: Text("默认按钮")),
      AntdButton(
          onLoadingTap: () async {
            await Future.delayed(Duration(seconds: 3));
          },
          fill: AntdButtonFill.solid,
          child: const Text("自动loading"))
    ]);
  }
}

```

### 节流和防抖

当存在onTap时可以开启,并且没有禁用

```dart
class AntdButtonThrottleDebounceDemo extends StatelessWidget {
  const AntdButtonThrottleDebounceDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          throttle: const Duration(milliseconds: 200),
          fill: AntdButtonFill.solid,
          child: const Text("节流按钮"),
          onTap: () {
            AntdToast.show('节流触发点击:${DateTime.now().millisecondsSinceEpoch}');
          }),
      AntdButton(
          debounce: const Duration(milliseconds: 200),
          fill: AntdButtonFill.solid,
          child: const Text("防抖按钮"),
          onTap: () {
            AntdToast.show('防抖触发点击:${DateTime.now().millisecondsSinceEpoch}');
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
| style | 样式 | AntdButtonStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdButtonStyle, AntdButton&gt; | - | - |
| block | 是否充满父容器宽度 | bool | - | - |
| color | 按钮主题色:`primary` \| `success` \| `warning` \| `danger` \| `info` \| `link` | AntdColor | primary | - |
| disabled | 是否禁用状态 | bool | - | - |
| fill | 按钮填充模式:`solid` \| `outline` \| `none` | AntdButtonFill | solid | - |
| shape | 按钮形状样式:`rounded` \| `rectangular` | AntdButtonShape | - | - |
| size | 按钮尺寸规格:`mini` \| `small` \| `middle` \| `large` | AntdSize | middle | - |
| onTap | 点击事件回调 | GestureTapCallback | - | - |
| onLoadingTap | 支持自动loading状态的异步点击事件 | FutureVoidCallback | - | - |
| icon | 前缀图标组件 | Widget | - | - |
| child | 按钮内容组件 | Widget | - | - |
| loading | 是否显示加载状态 | bool | - | - |
| throttle | 点击事件节流间隔（默认开启） | Duration | - | - |
| debounce | 点击事件防抖间隔（默认关闭） | Duration | - | - |
| behavior | 点击事件命中测试行为 | HitTestBehavior | - | - |


## 按钮样式(AntdButtonStyle) <a id='AntdButtonStyle'></a>
定义按钮的所有可定制样式属性
| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| iconStyle | 按钮图标的样式配置 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| buttonStyle | 按钮容器的样式配置 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| loadingWidget | 当按钮处于加载状态时显示的组件,如果为null，则使用[AntdLoading](/antd-loading) | Widget | - | - |


