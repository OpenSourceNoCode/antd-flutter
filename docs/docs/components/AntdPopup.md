---
group:
  title: 反馈
  order: 20
title: Popup
subtitle: 弹出层
---
从屏幕滑出或弹出一块自定义内容区。基于[AntdMask](/antd-mask)支持他的所有属性
## 何时使用
适用于展示弹窗、信息提示、选择输入、切换等内容，支持多个弹出层叠加展示。

## 代码展示

<div class='preview-container'>
<div>

### 弹出方向

上下左右四个方向

```dart
class AntdPopupDemo extends StatelessWidget {
  const AntdPopupDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("底部打开"),
          onTap: () async {
            AntdLayer.open(AntdPopup(
                position: AntdPosition.bottom,
                builder: (close, ctx) {
                  return getBox(true);
                }));
          }),
      AntdButton(
          child: const Text("顶部打开"),
          onTap: () {
            AntdLayer.open(AntdPopup(
                position: AntdPosition.top,
                builder: (close, ctx) {
                  return getBox(true);
                }));
          }),
      AntdButton(
          child: const Text("左侧打开"),
          onTap: () {
            AntdLayer.open(AntdPopup(
                position: AntdPosition.left,
                builder: (close, ctx) {
                  return getBox(false);
                }));
          }),
      AntdButton(
          child: const Text("右侧打开"),
          onTap: () {
            AntdLayer.open(AntdPopup(
                position: AntdPosition.right,
                builder: (close, ctx) {
                  return getBox(false);
                }));
          })
    ]);
  }
}

```

### 关闭按钮

左右两侧已经默认做了安全区域处理

```dart
class AntdPopupCloseDemo extends StatelessWidget {
  const AntdPopupCloseDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("左侧打开"),
          onTap: () {
            AntdLayer.open(AntdPopup(
                closeIcon: const AntdIcon(icon: AntdIcons.close),
                position: AntdPosition.left,
                builder: (close, ctx) {
                  return getBox(false);
                }));
          }),
      AntdButton(
          child: const Text("顶部打开"),
          onTap: () {
            AntdLayer.open(AntdPopup(
                closeIcon: const AntdIcon(icon: AntdIcons.close),
                position: AntdPosition.top,
                builder: (close, ctx) {
                  return getBox(true);
                }));
          })
    ]);
  }
}

```

### 自定义样式

通过style覆盖样式

```dart
class AntdPopupStyleDemo extends StatelessWidget {
  const AntdPopupStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("圆角"),
          onTap: () {
            AntdLayer.open(AntdPopup(
                style: AntdPopupStyle(
                    bodyStyle:
                        AntdBoxStyle(radius: token.radius.lg.radius.top)),
                closeIcon: const AntdIcon(icon: AntdIcons.close),
                position: AntdPosition.bottom,
                builder: (close, ctx) {
                  return getBox(true);
                }));
          })
    ]);
  }
}

```

### 嵌套弹出层

支持多重嵌套

```dart
class AntdPopupNestedDemo extends StatelessWidget {
  const AntdPopupNestedDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdPopup(
                position: AntdPosition.left,
                builder: (close, ctx) {
                  return AntdBox(
                      style: const AntdBoxStyle(alignment: Alignment.center),
                      child: AntdButton(
                          child: const Text("点我打开第二个"),
                          onTap: () {
                            AntdLayer.open(AntdPopup(builder: (close, ctx) {
                              return getBox(false);
                            }));
                          }));
                }));
          },
          child: const Text("点我打开第一个"))
    ]);
  }
}

```

### 事件


```dart
class AntdPopupEventDemo extends StatelessWidget {
  const AntdPopupEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdPopup(onClosed: () {
              AntdToast.show("关闭了弹出层");
            }, onOpened: () {
              AntdToast.show("打开了弹出层");
            }, onMaskTap: () {
              AntdToast.show("点击了弹出层");
            }, builder: (close, ctx) {
              return getBox(true);
            }));
          },
          child: const Text("事件"))
    ]);
  }
}

```

### 等待弹窗完成


```dart
class AntdPopupWaitDemo extends StatelessWidget {
  const AntdPopupWaitDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () async {
            await AntdLayer.open(AntdPopup(builder: (close, ctx) {
              return getBox(true);
            }));
            AntdToast.show("弹出层关闭了我才出现的", duration: Duration(seconds: 0));
          },
          child: const Text("等待完成"))
    ]);
  }
}

```

### 避开键盘


```dart
class AntdPopupAvoidKeyboardDemo extends StatelessWidget {
  const AntdPopupAvoidKeyboardDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdButton(
          onTap: () async {
            AntdPopup(
                avoidKeyboard: true,
                builder: (close, ctx) {
                  return Column(mainAxisSize: MainAxisSize.min, children: [
                    AntdInput(
                        placeholder: const Text("输入搜索内容"),
                        style: AntdInputStyle(
                            bodyStyle: AntdBoxStyle(
                                margin: token.size.md.all,
                                color: token.colorFillContent,
                                radius: token.radius.md.radius.all,
                                padding: token.size.md.all))),
                    getBox(true)
                  ]);
                }).open();
          },
          child: const Text("避开键盘"))
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdPopup'></iframe>
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
| style | 样式 | AntdPopupStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdPopupStyle, AntdPopup&gt; | - | - |
| onClosed | 完全关闭后触发 | VoidCallback | - | - |
| onOpened | 完全展示后触发 | VoidCallback | - | - |
| onMaskTap | 点击蒙层自身触发,mask为true才有效 | VoidCallback | - | - |
| dismissOnMaskTap | 点击背景板是否关闭,mask为true才有效 | bool | true | - |
| showMask | 是否显示背景蒙版 | bool | true | - |
| builder | 内容 | AntdMaskBuilder&lt;AntdPopupState&gt; | - | - |
| animationDuration | 内容动画时长 | Duration | const Duration(milliseconds: 400) | - |
| closeIcon | 自定义关闭按钮图标 | Widget | - | - |
| position | 弹出位置:`top` \| `bottom` \| `left` \| `right` \| `horizontal` \| `vertical` \| `all` | AntdPosition | bottom | - |
| avoidKeyboard | 当底部弹出式 避免键盘遮挡 | bool | true | - |


## 弹出层样式(AntdPopupStyle) <a id='AntdPopupStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| maskColor | 背景色 | Color | - | - |
| maskOpacity | 透明度 | double | - | - |
| bodyStyle | 内容样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| closeIconStyle | 关闭按钮大小 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |


