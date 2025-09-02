---
group:
  title: 信息录入
  order: 40
title: CheckList
subtitle: 可勾选列表
---
列表的勾选操作。
## 何时使用
在一组列表项中选择一个或多个。

## 代码展示

<div class='preview-container'>
<div>

### 基础使用


```dart
class AntdCheckListDemo extends StatelessWidget {
  const AntdCheckListDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdCheckList(
          onChange: (values, value, check) {
            AntdToast.show(
                "当前的值:${values.join(",")},变化的值:$value,状态：${check ? '选中' : '取消'}");
          },
          values: const {
            "A",
            "C"
          },
          items: const [
            AntdCheckItem(value: "A", child: Text("A")),
            AntdCheckItem(value: "B", child: Text("B")),
            AntdCheckItem(value: "C", child: Text("C")),
            AntdCheckItem(value: "D", child: Text("D"))
          ])
    ]);
  }
}

```

### 自定义选中图标


```dart
class AntdCheckListActiveContentDemo extends StatelessWidget {
  const AntdCheckListActiveContentDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var action = AntdIcon(
        icon: AntdIcons.smile,
        style: AntdIconStyle(size: 24, color: token.colorPrimary));
    return DemoWrapper(outline: true, child: [
      AntdCheckList(items: [
        AntdCheckItem(value: "A", activeIcon: action, child: const Text("A")),
        AntdCheckItem(value: "B", activeIcon: action, child: const Text("B"))
      ])
    ]);
  }
}

```

### 整组只读


```dart
class AntdCheckListReadOnlyDemo extends StatelessWidget {
  const AntdCheckListReadOnlyDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdCheckList(items: [
        AntdCheckItem(value: "A", child: Text("A"), readOnly: true),
        AntdCheckItem(value: "B", child: Text("B"), readOnly: true)
      ])
    ]);
  }
}

```

### 整组禁用


```dart
class AntdCheckListDisableDemo extends StatelessWidget {
  const AntdCheckListDisableDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdCheckList(items: [
        AntdCheckItem(value: "A", disable: true, child: Text("A")),
        AntdCheckItem(value: "B", disable: true, child: Text("B"))
      ])
    ]);
  }
}

```

### 受控模式


```dart
class _AntdCheckListValueDemoStateDemo extends State<AntdCheckListValueDemo> {
  var values = <String>{'A'};
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdCheckList(
          values: values,
          onChange: (value, _, check) {
            setState(() {
              values = value;
            });
          },
          items: const [
            AntdCheckItem(value: "A", child: Text("A")),
            AntdCheckItem(value: "B", child: Text("B")),
            AntdCheckItem(value: "C", child: Text("C"))
          ]),
      Row(children: [
        AntdButton(
            child: Text("选中B"),
            onTap: () {
              setState(() {
                values.add("B");
              });
            }),
        AntdButton(
            child: Text("取消B"),
            onTap: () {
              setState(() {
                values.remove("B");
              });
            })
      ])
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdCheckList'></iframe>
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
| style | 样式 | AntdCheckListStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdCheckListStyle, AntdCheckList&gt; | - | - |
| controller | 控制器 | AntdCheckListController | - | - |
| items | 滚动的数据 | List&lt;AntdCheckItem&gt; | - | - |
| itemBuilder | 数据构造器 | AntdScrollItemBuilder&lt;AntdCheckItem, AntdCheckListController&gt; | - | - |
| edgeThreshold | 触边阈值 (0-1表示百分比) | double | - | - |
| onEdgeReached | 当触碰到边界时的回调 | AntdOnScrollEdge | - | - |
| virtual | 启动虚拟滚动 | bool | false | - |
| fit | 自动适配策略:`fill` \| `split` \| `child` | AntdScrollItemFit | child | - |
| shrinkWrap | 自动扩展高度 | bool | true | - |
| disable | 禁用 | bool | - | - |
| onChange | 选项改变时触发 | AntdCheckListChange | - | - |
| values | 默认选中的值 | Set&lt;String&gt; | - | - |


## 可勾选列表样式(AntdCheckListStyle) <a id='AntdCheckListStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 整个复选框列表容器的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| checkItemStyle | 复选框项目中各个选项项的样式配置 | [AntdCheckItemStyle](../components/antd-check-item/#AntdCheckItemStyle) | - | - |

## 可选中的列表项(AntdCheckItem) <a id='AntdCheckItem'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| style | 样式 | AntdCheckItemStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdCheckItemStyle, AntdCheckItem&gt; | - | - |
| readOnly | 只读 | bool | - | - |
| disable | 是否禁用 | bool | - | - |
| child | 内容 | Widget | - | - |
| activeIcon | 样式 | Widget | - | - |
| unActiveIcon | 样式 | Widget | - | - |
| disableIcon | 禁用样式 | Widget | - | - |
| onTap | 触摸事件 | VoidCallback | - | - |
| value | - | String | - | - |
| check | 绑定值 | bool | - | - |
| onChange | 选中或者取消 | AntdCheckItemChange | - | - |


