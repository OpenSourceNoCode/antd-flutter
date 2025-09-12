---
group:
  title: 信息展示
  order: 22
title: Dropdown
subtitle: 下拉菜单
---
向下弹出的菜单面板。
## 何时使用
适用于筛选、排序并更改当前页面内容展示范围或顺序。

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdDropdown'></iframe>
</div>
<div style='flex: 1;'>

### 基础


```dart
class AntdDropdownDemo extends StatelessWidget {
  const AntdDropdownDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdDropdown(items: [
        AntdDropdownItem(item: (close, state) {
          return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AntdRadio(extra: Text("综合排序")),
                AntdRadio(extra: Text("距离最近")),
                AntdRadio(extra: Text("排序最好"))
              ]);
        }, child: (open) {
          return const AntdBox(child: Text("排序"));
        })
      ])
    ]);
  }
}

```

### 多列


```dart
class AntdDropdownColumnDemo extends StatelessWidget {
  const AntdDropdownColumnDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdDropdown(items: [
        AntdDropdownItem(item: (close, state) {
          return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AntdRadio(extra: Text("综合排序")),
                AntdRadio(extra: Text("距离最近")),
                AntdRadio(extra: Text("排序最好"))
              ]);
        }, child: (open) {
          return const AntdBox(child: Text("排序"));
        }),
        AntdDropdownItem(item: (close, state) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  AntdBox(
                      child: Text("配送距离",
                          style: token.font.default_
                              .copyWith(color: token.colorTextSecondary))),
                  const AntdSlider(ticks: true, step: 10)
                ])
              ]);
        }, child: (open) {
          return const AntdBox(child: Text("筛选"));
        })
      ])
    ]);
  }
}

```

### 内部关闭


```dart
class AntdDropdownCloseDemo extends StatelessWidget {
  const AntdDropdownCloseDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 200),
        child: DemoWrapper(child: [
          AntdDropdown(
              dismissOnMaskTap: false,
              items: [
                AntdDropdownItem(item: (close, state) {
                  return const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AntdRadio(extra: Text("综合排序")),
                        AntdRadio(extra: Text("距离最近")),
                        AntdRadio(extra: Text("排序最好"))
                      ]);
                }, child: (open) {
                  return const AntdBox(child: Text("排序"));
                }),
                AntdDropdownItem(item: (close, state) {
                  return const AntdSlider(ticks: true, step: 10);
                }, child: (open) {
                  return const AntdBox(child: Text("筛选"));
                })
              ],
              extra: (close, _) {
                return AntdButton(
                    onTap: () {
                      close();
                    },
                    child: Text("确定"));
              })
        ]));
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
| style | 样式 | AntdDropdownStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdDropdownStyle, AntdDropdown&gt; | - | - |
| onClosed | 完全关闭后触发 | VoidCallback | - | - |
| onOpened | 完全展示后触发 | VoidCallback | - | - |
| onMaskTap | 点击蒙层自身触发,mask为true才有效 | VoidCallback | - | - |
| builder | 内容 | AntdMaskBuilder&lt;AntdMaskState&gt; | - | - |
| opacity | 透明度,mask为true才有效:`transparent` \| `thin` \| `thick` | AntdMaskOpacity | thin | - |
| dismissOnMaskTap | 点击背景板是否关闭,mask为true才有效 | bool | true | - |
| showMask | 是否显示背景蒙版 | bool | true | - |
| animationDuration | 内容动画时长 | Duration | const Duration(milliseconds: 200) | - |
| items | 内容 | List&lt;AntdDropdownItem&gt; | - | - |
| icon | 默认的图标 | Widget | - | - |
| activeIcon | 激活后的图标 | Widget | - | - |
| extra | 额外区域,始终位于菜单下方 | AntdMaskBuilder&lt;AntdMaskState&gt; | - | - |


## 下拉框内容(AntdDropdownItem) <a id='AntdDropdownItem'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| child | [open](/open) 表示当前下拉菜单的展开状态
返回一个Widget作为触发下拉的按钮或元素 | Widget Function(bool open) | - | - |
| item | [close](/close) 用于关闭下拉层的回调函数
[state](/state) 当前遮罩层的状态信息
返回一个Widget作为下拉菜单的内容 | AntdMaskBuilder&lt;AntdMaskState&gt; | - | - |

## 样式(AntdDropdownStyle) <a id='AntdDropdownStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| maskColor | 背景色 | Color | - | - |
| maskOpacity | 透明度 | double | - | - |
| bodyStyle | 用于设置下拉菜单整体的背景色、边框、圆角、阴影等样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| childRowStyle | 当触发元素需要横向排列时，用于设置Flex布局的样式 | [AntdFlexStyle](../components/antd-flex/#AntdFlexStyle) | - | - |
| childStyle | 用于设置触发按钮或元素的包装容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| itemStyle | 用于设置下拉菜单内部选项列表的容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| extraStyle | 用于设置下拉菜单内部选项列表的容器样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| iconStyle | 图标样式 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| icon | 默认的图标 | Widget | - | - |
| activeIconStyle | 图标样式 | [AntdIconStyle](../components/antd-icon/#AntdIconStyle) | - | - |
| activeIcon | 激活后的图标 | Widget | - | - |


