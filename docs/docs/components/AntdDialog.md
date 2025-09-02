---
group:
  title: 反馈
  order: 3
title: Dialog
subtitle: 对话框
---
用于重要信息的告知或操作的反馈，并附带少量的选项供用户进行操作。
## 何时使用
需要用户处理事务，又不希望跳转页面以致打断工作流程时，可以使用 Dialog 在当前页面正中打开一个浮层，承载相应的操作。

## 代码展示

<div class='preview-container'>
<div>

### 基础用法

直接通过open打开

```dart
class AntdAlertDialogDemo extends StatelessWidget {
  const AntdAlertDialogDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("基础弹窗"),
          onTap: () {
            AntdDialog(
                title: const Text("我是标题"),
                header: const Text("我是Header"),
                builder: (controller, ctx) {
                  return const Center(child: Text("明月松间照，清泉石上流"));
                }).open();
          }),
      AntdButton(
          child: const Text("对话框"),
          onTap: () {
            AntdDialog.alert(const Text("明月松间照，清泉石上流"));
          }),
      AntdButton(
          child: const Text("确认框"),
          onTap: () {
            AntdDialog.confirm(const Text("明月松间照，清泉石上流"));
          })
    ]);
  }
}

```

### 自定义按钮

自定义对话框按钮列表

```dart
class AntdDialogCustomerDemo extends StatelessWidget {
  const AntdDialogCustomerDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("自定义按钮"),
          onTap: () {
            AntdLayer.open(AntdDialog(
                builder: (controller, ctx) =>
                    const Center(child: Text("明月松间照，清泉石上流")),
                dismissOnAction: true,
                actions: [
                  AntdDialogAction(
                      title: const Text("在线阅读"),
                      onTap: (_) async {
                        await Future.delayed(const Duration(seconds: 3));
                      }),
                  const AntdDialogAction(title: Text("下载文件")),
                  const AntdDialogAction(title: Text("取消"), bottom: true),
                  const AntdDialogAction(
                      title: Text("确认"), danger: true, bottom: true)
                ]));
          })
    ]);
  }
}

```

### 内容区域

可以自定义内容区域

```dart
class AntdDialogCustomerContentDemo extends StatelessWidget {
  const AntdDialogCustomerContentDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdButton(
          child: const Text(" 自定义内容区域"),
          onTap: () {
            AntdLayer.open(AntdDialog(
                header: AntdIcon(
                    icon: AntdIcons.exclamationShield,
                    style: AntdIconStyle(size: 48, color: token.colorWarning)),
                title: const Text("注意"),
                builder: (controller, ctx) => const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("请用手机拍摄手持工牌照，注意保持照片清晰"),
                          Text("明月松间照，清泉石上流")
                        ]),
                actions: [AntdDialogAction(title: Text("我知道了"))]));
          })
    ]);
  }
}

```

### 事件


```dart
class AntdDialogEventDemo extends StatelessWidget {
  const AntdDialogEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("对话框事件"),
          onTap: () {
            AntdLayer.open(AntdDialog(
                onClosed: () {
                  AntdToast.show("关闭了对话框");
                },
                onOpened: () {
                  AntdToast.show("打开了对话框");
                },
                onMaskTap: () {
                  AntdToast.show("点击了对话框");
                },
                builder: (controller, ctx) =>
                    const Center(child: Text("明月松间照，清泉石上流"))));
          })
    ]);
  }
}

```

### 等待对话框完成


```dart
class AntdDialogWaitDemo extends StatelessWidget {
  const AntdDialogWaitDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("对话框"),
          onTap: () async {
            await AntdDialog.alert(const Center(child: Text("明月松间照，清泉石上流")));
            AntdToast.show("对话框关闭了");
          })
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdDialog'></iframe>
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
| style | 样式 | AntdDialogStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdDialogStyle, AntdDialog&lt;T&gt;&gt; | - | - |
| onClosed | 完全关闭后触发 | VoidCallback | - | - |
| onOpened | 完全展示后触发 | VoidCallback | - | - |
| onMaskTap | 点击蒙层自身触发,mask为true才有效 | VoidCallback | - | - |
| dismissOnMaskTap | 点击背景板是否关闭,mask为true才有效 | bool | true | - |
| showMask | 是否显示背景蒙版 | bool | true | - |
| animationDuration | 内容动画时长 | Duration | const Duration(milliseconds: 400) | - |
| actions | 面板选项列表 | List&lt;T&gt; | - | - |
| dismissOnAction | 点击选项后是否关闭 | bool | - | - |
| builder | 内容 | AntdMaskBuilder&lt;AntdDialogState&gt; | - | - |
| closeIcon | 自定义关闭按钮图标 | Widget | - | - |
| header | 顶部区域 | Widget | - | - |
| title | 标题 | Widget | - | - |


## 对话框样式(AntdDialogStyle) <a id='AntdDialogStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 内容样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| closeIconStyle | 关闭按钮大小 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| maskColor | 背景色 | Color | - | - |
| maskOpacity | 透明度 | double | - | - |
| headerStyle | 对话框头部区域样式（包含标题和关闭按钮） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| titleStyle | 对话框标题文字样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| contentStyle | 对话框内容区域样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| actionStyle | 对话框操作按钮区域样式 | [AntdActionStyle](../components/antd-action/#AntdActionStyle) | - | - |
| bottomActionStyle | 对话框底部操作按钮区域样式 | [AntdActionStyle](../components/antd-action/#AntdActionStyle) | - | - |
| primaryActionStyle | 对话框确认操作按钮区域样式 | [AntdActionStyle](../components/antd-action/#AntdActionStyle) | - | - |

## 对话框定义(AntdDialogAction) <a id='AntdDialogAction'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| style | 样式 | AntdActionStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdActionStyle, AntdAction&gt; | - | - |
| danger | 是否为危险状态 | bool | - | - |
| description | 描述 | Widget | - | - |
| disabled | 是否为禁用状态 | bool | - | - |
| onTap | 点击时触发 | AntdActionOnTap | - | - |
| title | 标题 | Widget | - | - |
| bold | 标题是否加粗 | bool | - | - |
| bottom | 是否固定在底部（为true时会固定在对话框底部） | bool | - | - |
| primary | 是否是确认按钮（通常会影响按钮样式） | bool | - | - |


