---
group:
  title: 反馈
  order: 12
title: Mask
subtitle: 背景蒙层
---
深色背景层。
## 何时使用
常用于模态窗口的背景层，使视觉焦点突出在模态窗口本身。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdMask'></iframe>
</div>
<div style='flex: 1;'>

### 基础用法

多种打开方式

```dart
class AntdMaskDemo extends StatelessWidget {
  const AntdMaskDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdMask.show(
                content: Center(
                    child: AntdBox(
                        style: AntdBoxStyle(
                            size: 50, color: token.colorPrimary))));
          },
          child: const Text("静态方法")),
      AntdButton(
          onTap: () {
            AntdMask(
                builder: (close, state) => Center(
                    child: AntdBox(
                        style: AntdBoxStyle(
                            size: 50, color: token.colorPrimary)))).open();
          },
          child: const Text("open 方法")),
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdMask(
                builder: (close, state) => Center(
                    child: AntdBox(
                        style: AntdBoxStyle(
                            size: 50, color: token.colorPrimary)))));
          },
          child: const Text("AntdLayer Open"))
    ]);
  }
}

```

### 事件


```dart
class AntdMaskEventDemo extends StatelessWidget {
  const AntdMaskEventDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdMask(onClosed: () {
              AntdToast.show("关闭了蒙层");
            }, onOpened: () {
              AntdToast.show("打开了蒙层");
            }, onMaskTap: () {
              AntdToast.show("点击了蒙层");
            }));
          },
          child: const Text("事件"))
    ]);
  }
}

```

### 不同的透明度

可以通过Style覆盖

```dart
class AntdMaskOpacityDemo extends StatelessWidget {
  const AntdMaskOpacityDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(const AntdMask(opacity: AntdMaskOpacity.thin));
          },
          child: const Text("显示浅一些的背景蒙层")),
      AntdButton(
          onTap: () {
            AntdLayer.open(const AntdMask(opacity: AntdMaskOpacity.thick));
          },
          child: const Text("显示深一些的背景蒙层")),
      AntdButton(
          onTap: () {
            AntdLayer.open(
                const AntdMask(style: AntdMaskStyle(maskOpacity: 1)));
          },
          child: const Text("显示自定义的背景蒙层"))
    ]);
  }
}

```

### 蒙层颜色

可以通过Style覆盖

```dart
class AntdMaskColorDemo extends StatelessWidget {
  const AntdMaskColorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(
                const AntdMask(style: AntdMaskStyle(maskColor: Colors.white)));
          },
          child: const Text("显示白色的背景蒙层")),
      AntdButton(
          onTap: () {
            AntdLayer.open(
                const AntdMask(style: AntdMaskStyle(maskColor: Colors.red)));
          },
          child: const Text("显示红色的背景蒙层"))
    ]);
  }
}

```

### 嵌套蒙层

支持多重嵌套

```dart
class AntdMaskNestedDemo extends StatelessWidget {
  const AntdMaskNestedDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdMask(builder: (controller, ctx) {
              return Center(
                  child: AntdButton(
                      child: const Text("点我打开第二个"),
                      onTap: () {
                        AntdLayer.open(AntdMask(builder: (controller, ctx) {
                          return Center(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                const Text("我是第二个的内容",
                                    style: TextStyle(color: Colors.white)),
                                AntdButton(
                                    child: const Text("点我关闭所有"),
                                    onTap: () {
                                      AntdLayer.closeAll();
                                    })
                              ]));
                        }));
                      }));
            }));
          },
          child: const Text("点我打开第一个"))
    ]);
  }
}

```

### 没有蒙层

没有蒙层，所有和蒙层相关的属性消息，并且点击能穿透下层

```dart
class AntdMaskHiddenDemo extends StatelessWidget {
  const AntdMaskHiddenDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdMask(
                showMask: false,
                style: const AntdMaskStyle(maskColor: Colors.white),
                builder: (close, ctx) {
                  return Center(
                      child: AntdButton(
                          child: const Text("点我关闭"),
                          onTap: () {
                            close();
                          }));
                }));
          },
          child: const Text("显示白色的背景蒙层")),
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdMask(
                key: ValueKey("out-close"),
                showMask: false,
                style: const AntdMaskStyle(maskColor: Colors.white),
                builder: (close, ctx) {
                  return Center(child: AntdButton(child: const Text("我打开了")));
                }));
          },
          child: const Text("外部关闭")),
      AntdButton(
          child: Text("我来关闭刚才打开的蒙层"),
          onTap: () {
            AntdLayer.closeByKey(ValueKey("out-close"));
          })
    ]);
  }
}

```

### 等待蒙层关闭


```dart
class AntdMaskWaitDemo extends StatelessWidget {
  const AntdMaskWaitDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () async {
            await AntdLayer.open(const AntdMask());
            AntdToast.show("蒙层关闭了");
          },
          child: const Text("打开后等待关闭"))
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
| style | 样式 | AntdMaskStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdMaskStyle, AntdMask&gt; | - | - |
| onClosed | 完全关闭后触发 | VoidCallback | - | - |
| onOpened | 完全展示后触发 | VoidCallback | - | - |
| onMaskTap | 点击蒙层自身触发,mask为true才有效 | VoidCallback | - | - |
| builder | 内容 | AntdMaskBuilder&lt;AntdMaskState&gt; | - | - |
| opacity | 透明度,mask为true才有效:`transparent` \| `thin` \| `thick` | AntdMaskOpacity | - | - |
| dismissOnMaskTap | 点击背景板是否关闭,mask为true才有效 | bool | true | - |
| showMask | 是否显示背景蒙版 | bool | true | - |
| animationDuration | 内容动画时长 | Duration | const Duration(milliseconds: 400) | - |
| hole | 镂空的区域 | AntdMaskHole | - | - |


## 蒙层样式(AntdMaskStyle) <a id='AntdMaskStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| maskColor | 背景色 | Color | const Color(0xff000000) | - |
| maskOpacity | 透明度 | double | 0.5 | - |


