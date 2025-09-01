---
group:
  title: 反馈
  order: 32
title: SwipeAction
subtitle: 滑动操作
---
列表的功能扩展。
## 何时使用
通过滑动操作来展示隐藏的功能菜单。

## 代码展示

<div class='preview-container'>
<div>

### 基础用法

支持左侧选项右侧选项

```dart
class AntdSwipeActionDemo extends StatelessWidget {
  const AntdSwipeActionDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdSwipeAction(
          closeOnAction: true,
          items: [
            AntdSwipeItem(
                left: true,
                style: AntdSwipeItemStyle(
                    style: AntdBoxStyle(color: token.colorError)),
                content: const Text("取消关注"),
                confirmContent: const Text("确定取消关注")),
            AntdSwipeItem(
                left: true,
                style: AntdSwipeItemStyle(
                    style: AntdBoxStyle(color: token.colorPrimary)),
                content: const Text("置顶"),
                confirmContent: const Text("确定置顶")),
            AntdSwipeItem(
                style: AntdSwipeItemStyle(
                    style: AntdBoxStyle(color: token.colorPrimary)),
                content: const Text("取消关注"),
                confirmContent: const Text("确定取消关注")),
            AntdSwipeItem(
                style: AntdSwipeItemStyle(
                    style: AntdBoxStyle(color: token.colorError)),
                content: const Text("免打扰"),
                confirmContent: const Text("确定免打扰")),
            AntdSwipeItem(
                style: AntdSwipeItemStyle(
                    style: AntdBoxStyle(color: token.colorSuccess)),
                content: const Text("删除"),
                confirmContent: const Text("确定删除"))
          ],
          child: AntdBox(
              style: AntdBoxStyle(
                  padding: 16.all,
                  width: double.infinity,
                  color: token.colorTransparent),
              child: const Text("左右滑动,中间点击复位")))
    ]);
  }
}

```

### 搭配图片使用

双击时自动展开，再次双击自动关闭

```dart
class AntdSwipeActionImageDemo extends StatelessWidget {
  const AntdSwipeActionImageDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSwipeAction(items: [
        AntdSwipeItem(content: Text("删除"), confirmContent: Text("确定删除")),
        AntdSwipeItem(content: Text("收藏"), confirmContent: Text("确定收藏"))
      ], child: AntdImage(image: AntdResource(url: url)))
    ]);
  }
}

```

### 排他

通过controller手动控制

```dart
class AntdSwipeActionControllerDemo extends StatefulWidget {
  const AntdSwipeActionControllerDemo({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AntdSwipeActionControllerDemoStateDemo();
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='http://localhost:49470/AntdSwipeAction'></iframe>
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
| style | 样式 | AntdSwipeActionStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdSwipeActionStyle, AntdSwipeAction&gt; | - | - |
| items | 操作按钮列表 | List&lt;AntdSwipeItem&gt; | - | - |
| child | 内容 | Widget | - | - |
| openThreshold | 滑动到达阈值直接打开 | double | 0.01 | - |
| duration | 动画周期 | Duration | const Duration(milliseconds: 200) | - |
| closeOnAction | 是否在点击操作按钮时自动归位 | bool | true | - |
| onChange | 打开 | AntdSwipeActionOnChangeStatus | - | - |
| controller | 控制器 | AntdSwipeActionController | - | - |


## 样式(AntdSwipeActionStyle) <a id='AntdSwipeActionStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 主体样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| actionStyle | action的样式 | [AntdSwipeItemStyle](../components/antd-swipe-item/#AntdSwipeItemStyle) | - | - |


