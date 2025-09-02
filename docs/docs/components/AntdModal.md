---
group:
  title: 反馈
  order: 11
title: Modal
subtitle: 弹窗
---
用于重要信息的告知或操作的反馈，并附带少量的选项供用户进行操作。
## 何时使用
需要用户处理事务，又不希望跳转页面以致打断工作流程时，可以使用 Modal 在当前页面正中打开一个浮层，承载相应的操作。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdModal'></iframe>
</div>
<div style='flex: 1;'>

### 基础用法

直接通过open打开

```dart
class AntdAlertModalDemo extends StatelessWidget {
  const AntdAlertModalDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("基础弹窗"),
          onTap: () {
            AntdModal(
                title: const Text("我是标题"),
                header: const Text("我是Header"),
                builder: (controller, ctx) =>
                    const Center(child: Text("我是基础弹窗"))).open();
          }),
      AntdButton(
          child: const Text("提示对话框"),
          onTap: () {
            AntdModal.alert(const Center(child: Text("明月松间照，清泉石上流")));
          }),
      AntdButton(
          child: const Text("确认对话框"),
          onTap: () {
            AntdModal.confirm(const Center(child: Text("明月松间照，清泉石上流")));
          })
    ]);
  }
}

```

### 自定义按钮

自定义对话框按钮列表

```dart
class AntdModalCustomerDemo extends StatelessWidget {
  const AntdModalCustomerDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("自定义按钮"),
          onTap: () {
            AntdLayer.open(AntdModal(
                dismissOnAction: false,
                builder: (controller, ctx) {
                  return const Center(child: Text("明月松间照，清泉石上流"));
                },
                closeIcon: const AntdIcon(icon: AntdIcons.close),
                actions: [
                  AntdModalAction(
                      primary: true,
                      title: const Text("在线阅读"),
                      onTap: (_) async {
                        await Future.delayed(const Duration(seconds: 3));
                      }),
                  const AntdModalAction(title: Text("下载文件")),
                  AntdModalAction(
                      title: const Text("取消"),
                      onTap: (close) async {
                        await close();
                      }),
                  const AntdModalAction(title: Text("确认"))
                ]));
          })
    ]);
  }
}

```

### 内容区域

可以自定义内容区域

```dart
class AntdModalCustomerContentDemo extends StatelessWidget {
  const AntdModalCustomerContentDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdButton(
          child: const Text(" 自定义内容区域"),
          onTap: () {
            AntdLayer.open(AntdModal(
                header: AntdIcon(
                    icon: AntdIcons.exclamationShield,
                    style: AntdIconStyle(size: 48, color: token.colorWarning)),
                title: const Text("注意"),
                builder: (controller, ctx) => const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("请用手机拍摄手持工牌照，注意保持照片清晰"),
                          Text("明月松间照，清泉石上流")
                        ])));
          })
    ]);
  }
}

```

### 事件


```dart
class AntdModalEventDemo extends StatelessWidget {
  const AntdModalEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("弹窗事件"),
          onTap: () {
            AntdLayer.open(AntdModal(
                onClosed: () {
                  AntdToast.show("关闭了弹窗");
                },
                onOpened: () {
                  AntdToast.show("打开了弹窗");
                },
                onMaskTap: () {
                  AntdToast.show("点击了弹窗");
                },
                builder: (controller, ctx) =>
                    const Center(child: Text("明月松间照，清泉石上流"))));
          })
    ]);
  }
}

```

### 等待弹窗完成


```dart
class AntdModalWaitDemo extends StatelessWidget {
  const AntdModalWaitDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("弹窗"),
          onTap: () async {
            await AntdModal.alert(const Center(child: Text("明月松间照，清泉石上流")));
            AntdToast.show("弹窗关闭了");
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
| style | 样式 | AntdDialogStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdDialogStyle, AntdDialog&lt;T&gt;&gt; | - | - |
| onClosed | 完全关闭后触发 | VoidCallback | - | - |
| onOpened | 完全展示后触发 | VoidCallback | - | - |
| onMaskTap | 点击蒙层自身触发,mask为true才有效 | VoidCallback | - | - |
| dismissOnMaskTap | 点击背景板是否关闭,mask为true才有效 | bool | true | - |
| showMask | 是否显示背景蒙版 | bool | true | - |
| animationDuration | 内容动画时长 | Duration | const Duration(milliseconds: 400) | - |
| actions | 面板选项列表 | List&lt;AntdModalAction&gt; | - | - |
| dismissOnAction | 点击选项后是否关闭 | bool | - | - |
| builder | 内容 | AntdMaskBuilder&lt;AntdDialogState&gt; | - | - |
| closeIcon | 自定义关闭按钮图标 | Widget | - | - |
| header | 顶部区域 | Widget | - | - |
| title | 标题 | Widget | - | - |


## 弹窗定义(AntdModalAction) <a id='AntdModalAction'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| style | 样式 | AntdActionStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdActionStyle, AntdAction&gt; | - | - |
| description | 描述 | Widget | - | - |
| disabled | 是否为禁用状态 | bool | - | - |
| onTap | 点击时触发 | AntdActionOnTap | - | - |
| title | 标题 | Widget | - | - |
| bold | 标题是否加粗 | bool | - | - |
| danger | 是否为危险状态 | bool | - | - |
| primary | 是否是确认按钮（通常会影响按钮样式） | bool | - | - |


