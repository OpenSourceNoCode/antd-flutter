---
group:
  title: 反馈
  order: 34
title: Toast
subtitle: 轻提示
---
对操作结果的轻量级反馈，无需用户操作即可自行消失。
## 何时使用
适用于页面内容的变化不能直接反应操作结果时使用。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdToast'></iframe>
</div>
<div style='flex: 1;'>

### 事件

多种打开方式

```dart
class AntdToastDemo extends StatelessWidget {
  const AntdToastDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdToast.show("Toast");
          },
          child: Text("静态方法")),
      AntdButton(
          onTap: () {
            AntdToast(builder: (close, state) => const Text("Toast")).open();
          },
          child: const Text("open方法")),
      AntdButton(
          onTap: () {
            AntdLayer.open(
                AntdToast(builder: (close, state) => const Text("Toast")));
          },
          child: const Text("AntdLayer Open"))
    ]);
  }
}

```

### 图标

带一个前缀图标

```dart
class AntdToastIconDemo extends StatelessWidget {
  const AntdToastIconDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdToast.show("上传失败");
          },
          child: const Text("成功")),
      AntdButton(
          onTap: () {
            AntdToast.show("上传失败");
          },
          child: const Text("失败")),
      AntdButton(
          onTap: () {
            AntdToast.show("上传中", icon: const AntdIcon(icon: AntdIcons.upload));
          },
          child: const Text("自定义图标"))
    ]);
  }
}

```

### 更多功能

支持背景点击阻止，顶部底部和动态内容

```dart
class AntdToastMoreDemo extends StatelessWidget {
  const AntdToastMoreDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdToast.show("触摸我消失", position: AntdToastPosition.center);
          },
          child: const Text("触摸后消失")),
      AntdButton(
          onTap: () async {
            await AntdToast.show("我关闭后会再打开一个",
                position: AntdToastPosition.center);
            await AntdToast.show("我是自动打开的", position: AntdToastPosition.center);
          },
          child: const Text("等待返回")),
      AntdButton(
          onTap: () {
            AntdToast.show("顶部提示", position: AntdToastPosition.top);
          },
          child: const Text("顶部提示")),
      AntdButton(
          onTap: () {
            AntdToast.show("底部提示", position: AntdToastPosition.bottom);
          },
          child: const Text("底部提示")),
      AntdButton(
          onTap: () {
            AntdToast(
                    builder: (_, ctx) {
                      return const Text("请耐心等待, 不要退出");
                    },
                    showMask: true,
                    dismissOnMaskTap: false)
                .open();
          },
          child: const Text("阻止背景点击")),
      AntdButton(
          onTap: () {
            AntdToast.show("我5s后才会消失", duration: const Duration(seconds: 5));
          },
          child: const Text("自定义展示时长"))
    ]);
  }
}

```

### 手动关闭

手动需要将[Duration](/duration)设置为null或者0

```dart
class AntdToastManuleDemo extends StatelessWidget {
  const AntdToastManuleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdToast.show(
                key: const ValueKey("toask-close"), "这个不会自动消失", duration: null);
          },
          child: const Text("显示")),
      AntdButton(
          onTap: () {
            AntdLayer.closeByKey(const ValueKey("toask-close"));
          },
          child: const Text("关闭"))
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
| style | 样式 | AntdToastStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdToastStyle, AntdToast&gt; | - | - |
| onClosed | 完全关闭后触发 | VoidCallback | - | - |
| onOpened | 完全展示后触发 | VoidCallback | - | - |
| onMaskTap | 点击蒙层自身触发,mask为true才有效 | VoidCallback | - | - |
| builder | 内容 | AntdMaskBuilder&lt;AntdToastState&gt; | - | - |
| opacity | 透明度,mask为true才有效:`transparent` \| `thin` \| `thick` | AntdMaskOpacity | transparent | - |
| dismissOnMaskTap | 点击背景板是否关闭,mask为true才有效 | bool | true | - |
| showMask | 是否显示背景蒙版 | bool | false | - |
| animationDuration | 内容动画时长 | Duration | const Duration(milliseconds: 200) | - |
| duration | 提示持续时间，若为 0 则不会自动关闭 | Duration | const Duration(milliseconds: 2000) | - |
| icon | Toast 图标 | Widget | - | - |
| position | 垂直方向显示位置:`top` \| `bottom` \| `center` | AntdToastPosition | - | - |
| dismissOnTap | 当触摸的时候关闭 | bool | true | - |
| type | toast的类型:`success` \| `fail` \| `other` | AntdToastType | - | - |


## 轻提示样式(AntdToastStyle) <a id='AntdToastStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| maskColor | 背景色 | Color | - | - |
| maskOpacity | 透明度 | double | - | - |
| bodyStyle | 主体样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| iconStyle | 图标大小 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| columnStyle | 内容排列布局样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| icon | 图标 | Widget | - | - |


