---
group:
  title: 反馈
  order: 2
title: ActionSheet
subtitle: 动作面板
---
从底部弹出的动作菜单面板。
## 何时使用
由用户操作触发，提供一组与当前场景操作相关的两个或多个选项，让用户在不离场的情况下完成操作。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdActionSheet'></iframe>
</div>
<div style='flex: 1;'>

### 基础用法

多种打开方式

```dart
class AntdActionSheetDemo extends StatelessWidget {
  const AntdActionSheetDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("静态方法"),
          onTap: () {
            AntdActionSheet.show(const [
              AntdSheetAction(title: Text("辅助")),
              AntdSheetAction(title: Text("修改")),
              AntdSheetAction(title: Text("保存"))
            ]);
          }),
      AntdButton(
          child: const Text("open 方法"),
          onTap: () {
            const AntdActionSheet(actions: [
              AntdSheetAction(title: Text("辅助")),
              AntdSheetAction(title: Text("修改")),
              AntdSheetAction(title: Text("保存"))
            ]).open();
          }),
      AntdButton(
          child: const Text("AntdLayer Open"),
          onTap: () {
            AntdLayer.open(const AntdActionSheet(actions: [
              AntdSheetAction(title: Text("辅助")),
              AntdSheetAction(title: Text("修改")),
              AntdSheetAction(title: Text("保存"))
            ]));
          })
    ]);
  }
}

```

### 取消和额外描述


```dart
class AntdActionSheetCancelExtraDemo extends StatelessWidget {
  const AntdActionSheetCancelExtraDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("取消和额外描述"),
          onTap: () {
            AntdLayer.open(const AntdActionSheet(
                extra: Text("请选择你要进行的操作"),
                cancelText: Text("取消"),
                actions: [
                  AntdSheetAction(title: Text("辅助")),
                  AntdSheetAction(title: Text("修改")),
                  AntdSheetAction(title: Text("保存"))
                ]));
          })
    ]);
  }
}

```

### 禁用和危险的选项


```dart
class AntdActionSheetDisableDanderDemo extends StatelessWidget {
  const AntdActionSheetDisableDanderDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("禁用和危险的选项"),
          onTap: () {
            AntdLayer.open(const AntdActionSheet(
                extra: Text("请选择你要进行的操作"),
                cancelText: Text("取消"),
                actions: [
                  AntdSheetAction(title: Text("辅助")),
                  AntdSheetAction(title: Text("修改"), disabled: true),
                  AntdSheetAction(
                      title: Text("删除"),
                      description: Text("删除后数据不可恢复"),
                      danger: true,
                      bold: true)
                ]));
          })
    ]);
  }
}

```

### 事件


```dart
class AntdActionSheetEventDemo extends StatelessWidget {
  const AntdActionSheetEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("事件"),
          onTap: () {
            AntdLayer.open(AntdActionSheet(
                onClosed: () {
                  AntdToast.show("关闭了弹出层");
                },
                onOpened: () {
                  AntdToast.show("打开了弹出层");
                },
                onMaskTap: () {
                  AntdToast.show("点击了弹出层");
                },
                extra: Text("请选择你要进行的操作"),
                cancelText: Text("取消"),
                actions: [
                  AntdSheetAction(
                      title: Text("辅助"),
                      onTap: (_) {
                        AntdToast.show("点击了辅助按钮");
                      }),
                  AntdSheetAction(title: Text("修改"), disabled: true),
                  AntdSheetAction(
                      title: Text("删除"),
                      description: Text("删除后数据不可恢复"),
                      danger: true,
                      bold: true)
                ]));
          })
    ]);
  }
}

```

### 等待弹窗结束


```dart
class AntdActionSheetWaitDemo extends StatelessWidget {
  const AntdActionSheetWaitDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("取消和额外描述"),
          onTap: () async {
            await AntdLayer.open(const AntdActionSheet(
                extra: Text("请选择你要进行的操作"),
                cancelText: Text("取消"),
                actions: [
                  AntdSheetAction(title: Text("辅助")),
                  AntdSheetAction(title: Text("修改")),
                  AntdSheetAction(title: Text("保存"))
                ]));
            AntdToast.show("弹出层关闭了我才出现的", duration: Duration(seconds: 0));
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
| style | 样式 | AntdActionSheetStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdActionSheetStyle, AntdActionSheet&gt; | - | - |
| onClosed | 完全关闭后触发 | VoidCallback | - | - |
| onOpened | 完全展示后触发 | VoidCallback | - | - |
| onMaskTap | 点击蒙层自身触发,mask为true才有效 | VoidCallback | - | - |
| dismissOnMaskTap | 点击背景板是否关闭,mask为true才有效 | bool | true | - |
| opacity | 透明度,mask为true才有效:`transparent` \| `thin` \| `thick` | AntdMaskOpacity | - | - |
| showMask | 是否显示背景蒙版 | bool | true | - |
| animation | mask内容动画 | AntdMaskAnimation&lt;AntdActionSheet, AntdActionSheetState&gt; | - | - |
| actions | 面板选项列表 | List&lt;AntdSheetAction&gt; | - | - |
| cancelText | 取消按钮文字，如果设置为空则不显示取消按钮 | Widget | - | - |
| dismissOnAction | 点击选项后是否关闭 | bool | true | - |
| extra | 顶部的额外区域 | Widget | - | - |
| onAction | 点击选项时触发，禁用或加载状态下不会触发 | AntdActionCallback | - | - |
| safeArea | 安全区 | bool | true | - |


## 定义(AntdSheetAction) <a id='AntdSheetAction'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| style | 样式 | AntdActionStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdActionStyle, AntdSheetAction&gt; | - | - |
| danger | 是否为危险状态 | bool | - | - |
| description | 描述 | Widget | - | - |
| disabled | 是否为禁用状态 | bool | - | - |
| title | 标题 | Widget | - | - |
| onTap | 点击时触发,单独使用无效 | AntdActionOnTap | - | - |
| bold | 标题是否加粗 | bool | - | - |
| safeArea | 安全区:`top` \| `bottom` \| `left` \| `right` \| `horizontal` \| `vertical` \| `all` | AntdPosition | - | - |

## 动作面板样式(AntdActionSheetStyle) <a id='AntdActionSheetStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 内容样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| maskColor | 背景色 | Color | - | - |
| maskOpacity | 透明度 | double | - | - |
| actionStyle | 样式 | [AntdActionStyle](../components/antd-action/#AntdActionStyle) | - | - |
| cancelActionStyle | 取消样式 | [AntdActionStyle](../components/antd-action/#AntdActionStyle) | - | - |
| extraStyle | 标题样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| animation | 动作面板动画 | AntdActionSheetAnimation | - | - |


