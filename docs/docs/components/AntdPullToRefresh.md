---
group:
  title: 反馈
  order: 22
title: PullToRefresh
subtitle: 下拉刷新
---
在列表中通过手指下拉刷新加载新内容的交互操作。
## 何时使用
适用于对当前页面进行内容更新。

## 代码展示

<div class='preview-container'>
<div>

### 基础用法


```dart
class _AntdPullToRefreshDemoStateDemo extends State<AntdPullToRefreshDemo> {
  List<int> data = List.generate(10, (i) => i);
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: AntdPullToRefresh(
              onRefresh: () async {
                await Future.delayed(const Duration(milliseconds: 200));
                setState(() {
                  data = [...data, ...List.generate(10, (i) => i)];
                });
              },
              onChange: (status) {
                AntdToast.show("$status");
              },
              initialDelay: const Duration(seconds: 2),
              initialPrompt: AntdBox(
                  style: style.copyWith(height: getHeight().toDouble()),
                  child: const Text("我是初始展示的内容")),
              releasePrompt: AntdBox(
                  style: style.copyWith(height: getHeight().toDouble()),
                  child: const Text("现在释放立即刷新")),
              completionPrompt: AntdBox(
                  style: style.copyWith(height: getHeight().toDouble()),
                  child: const Text("刷新完成了")),
              pullingPrompt: AntdBox(
                  style: style.copyWith(height: getHeight().toDouble()),
                  child: const Text("用力下拉刷新")),
              refreshingPrompt: AntdBox(
                  style: style.copyWith(height: getHeight().toDouble()),
                  child: const AntdLoading(
                      spinning: true,
                      circular: true,
                      style: AntdLoadingStyle(size: 24),
                      text: Text("正在刷新中"))),
              child: SizedBox(
                  height: 300,
                  child: AntdList(
                      physics: const ClampingScrollPhysics(),
                      items: data.map((value) {
                        return Text(
                            style: const TextStyle(color: Colors.black),
                            generateRandomString(5));
                      }).toList()))))
    ]);
  }
}

```

### 混合内容


```dart
class _AntdPullToRefreshMixDemoStateDemo
    extends State<AntdPullToRefreshMixDemo> {
  List<int> data = List.generate(10, (i) => i);
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdPullToRefresh(
          releasePrompt: AntdBox(
              style: style.copyWith(height: 40), child: const Text("松开刷新")),
          refreshingPrompt: AntdBox(
              style: style.copyWith(height: 60), child: const Text("玩命加载中...")),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              data = [...data, ...List.generate(10, (i) => i)];
            });
          },
          child: Column(children: [
            AntdBox(
                style: AntdBoxStyle(
                    alignment: Alignment.center,
                    color: token.colorWhite,
                    padding: token.size.md.all,
                    border: token.borderSide.bottom),
                child: const Text("我是内容1")),
            AntdBox(
                style: AntdBoxStyle(
                    alignment: Alignment.center,
                    color: token.colorWhite,
                    padding: token.size.md.all,
                    border: token.borderSide.bottom),
                child: const Text("我是内容2")),
            AntdTabs(tabs: [
              AntdTab(
                  title: const Text("面板A"),
                  value: "A",
                  child: SizedBox(
                      height: 300,
                      child: AntdList(
                          physics: const ClampingScrollPhysics(),
                          items: data.map((value) {
                            return Text(generateRandomString(5));
                          }).toList()))),
              AntdTab(
                  title: const Text("面板B"),
                  value: "B",
                  child: SizedBox(
                      height: 300,
                      child: AntdList(
                          physics: const ClampingScrollPhysics(),
                          items: data.map((value) {
                            return Text(generateRandomString(5));
                          }).toList())))
            ])
          ]))
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdPullToRefresh'></iframe>
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
| style | 样式 | AntdBoxStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdBoxStyle, AntdPullToRefresh&gt; | - | - |
| initialPrompt | 初始状态下显示的提示内容 | Widget | const Text("用力下拉触发刷新") | - |
| initialDelay | 初始提示内容的展示持续时间 | Duration | - | - |
| child | 主要内容区域 | Widget | - | - |
| releasePrompt | 可释放刷新时显示的提示内容 | Widget | const Text("释放立即刷新") | - |
| completionDelay | 刷新完成后提示内容的展示持续时间 | Duration | const Duration(milliseconds: 1000) | - |
| completionPrompt | 刷新完成时显示的提示内容 | Widget | const Text("刷新成功") | - |
| onRefresh | 刷新触发时的异步回调函数 | FutureVoidCallback | - | - |
| pullingPrompt | 下拉过程中显示的提示内容 | Widget | const Text("用力下拉触发刷新") | - |
| refreshingPrompt | 正在刷新时显示的提示内容 | Widget | const Text("加载中...") | - |
| duration | 动画周期 | Duration | const Duration(milliseconds: 200) | - |
| onChange | 事件 | AntdPullToRefreshOnChange | - | - |



