---
group:
  title: 信息展示
  order: 23
title: Swiper
subtitle: 走马灯
---
一组轮播的区域。
## 何时使用
当有一组平级的内容。当内容空间不足时，可以用走马灯的形式进行收纳，进行轮播展现。

## 代码展示

<div class='preview-container'>
<div>

### 手动控制


```dart
class _AntdSwiperControllerDemoStateDemo
    extends State<AntdSwiperControllerDemo> {
  AntdSwiperController controller = AntdSwiperController();
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var colors = [
      token.colorPrimaryActive,
      token.colorWarningActive,
      token.colorSuccessActive,
      token.colorErrorActive
    ];
    var intdex = 1;
    return DemoWrapper(child: [
      Column(children: [
        SizedBox(
            height: 200,
            child: AntdSwiper(
                onChange: (index) {
                  AntdToast.show("当前是index:$index");
                },
                shrinkWrap: false,
                loop: true,
                controller: controller,
                items: colors.map((value) {
                  return AntdBox(
                      style: AntdBoxStyle(height: 200, color: value),
                      child: Text("${intdex++}"));
                }).toList())),
        Row(children: [
          AntdButton(
              onTap: () {
                controller.previous();
              },
              child: Text("上一张")),
          AntdButton(
              onTap: () {
                controller.next();
              },
              child: Text("下一张"))
        ])
      ])
    ]);
  }
}

```

### 自定义样式


```dart
class AntdSwiperStyleDemo extends StatelessWidget {
  const AntdSwiperStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var colors = [
      token.colorPrimaryActive,
      token.colorWarningActive,
      token.colorSuccessActive,
      token.colorErrorActive
    ];
    return DemoWrapper(child: [
      SizedBox(
          height: 200,
          child: AntdSwiper(
              loop: true,
              items: colors.map((value) {
                return AntdBox(style: AntdBoxStyle(height: 200, color: value));
              }).toList()))
    ]);
  }
}

```

### 自定义指示器


```dart
class AntdSwiperCustomIndicatorDemo extends StatelessWidget {
  const AntdSwiperCustomIndicatorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var colors = [
      token.colorPrimaryActive,
      token.colorWarningActive,
      token.colorSuccessActive,
      token.colorErrorActive
    ];
    return DemoWrapper(child: [
      SizedBox(
          height: 200,
          child: AntdSwiper(
              loop: true,
              indicatorBuilder: (index, total) {
                return Positioned(
                    top: 6,
                    right: 0,
                    child: Center(
                        child: AntdBox(
                            style: AntdBoxStyle(
                                padding: 2.all,
                                color: Colors.black.withValues(alpha: 0.4)),
                            child: Text("$index/$total",
                                style: TextStyle(color: Colors.white)))));
              },
              items: colors.map((value) {
                return AntdBox(style: AntdBoxStyle(height: 200, color: value));
              }).toList()))
    ]);
  }
}

```

### 无指示器


```dart
class AntdSwiperNoneIndicatorDemo extends StatelessWidget {
  const AntdSwiperNoneIndicatorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var colors = [
      token.colorPrimaryActive,
      token.colorWarningActive,
      token.colorSuccessActive,
      token.colorErrorActive
    ];
    return DemoWrapper(child: [
      SizedBox(
          height: 200,
          child: AntdSwiper(
              loop: true,
              indicatorBuilder: (index, total) {
                return const AntdBox();
              },
              items: colors.map((value) {
                return AntdBox(style: AntdBoxStyle(height: 200, color: value));
              }).toList()))
    ]);
  }
}

```

### 全屏引导


```dart
class AntdSwiperFullPageDemo extends StatelessWidget {
  const AntdSwiperFullPageDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var colors = [
      token.colorPrimaryActive,
      token.colorWarningActive,
      token.colorSuccessActive,
      token.colorErrorActive
    ];
    return DemoWrapper(child: [
      AntdButton(
          child: const Text("全屏展示"),
          onTap: () {
            AntdLayer.open(AntdPopup(
                style: const AntdPopupStyle(bodyStyle: AntdBoxStyle(height: 1)),
                builder: (controller, ctx) {
                  return AntdSwiper(
                      indicatorBuilder: (index, total) {
                        return const AntdBox();
                      },
                      items: colors.map((value) {
                        return AntdBox(style: AntdBoxStyle(color: value));
                      }).toList());
                }));
          })
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='http://localhost:49470/AntdSwiper'></iframe>
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
| style | 样式 | AntdSwiperStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdSwiperStyle, AntdSwiper&gt; | - | - |
| edgeThreshold | 触边阈值 (0-1表示百分比) | double | - | - |
| onEdgeReached | 当触碰到边界时的回调 | AntdOnScrollEdge | - | - |
| controller | 控制器 | AntdSwiperController | - | - |
| cacheExtent | 预渲染区域大小 | double | 1.5 | - |
| cacheExtentStyle | 预渲染区域计算方式 | [CacheExtentStyle](../components/cache-extent/#CacheExtentStyle) | viewport | - |
| dragStartBehavior | 拖动开始行为 | DragStartBehavior | start | - |
| scrollBehavior | 滚动行为 | ScrollBehavior | const CupertinoScrollBehavior() | - |
| vertical | 滚动方向 | bool | true | - |
| reversed | 是否反向滚动 | bool | false | - |
| shrinkWrap | 自动扩展高度 | bool | false | - |
| virtual | 启动虚拟滚动 | bool | false | - |
| items | 滚动的数据 | List&lt;Widget&gt; | - | - |
| itemBuilder | 数据构造器 | AntdScrollItemBuilder&lt;Widget, AntdSwiperController&gt; | - | - |
| headers | 头部的sliver | List&lt;Widget&gt; | - | - |
| footers | 尾部的sliver | List&lt;Widget&gt; | - | - |
| onItemPosition | item变更事件 | AntdItemPositionListener&lt;Widget&gt; | - | - |
| throttle | 滚动事件节流时长 | Duration | - | - |
| allowTouchMove | 是否允许手势滑动 | bool | true | - |
| autoplay | 是否自动切换 | bool | false | - |
| autoplayInterval | 自动切换的间隔，单位为 ms | Duration | const Duration(milliseconds: 3000) | - |
| activeIndex | 初始位置 | int | 0 | - |
| loop | 是否循环 | bool | false | - |
| indicatorBuilder | 自定义指示器 | AntdSwiperIndicatorBuilder | - | - |
| onChange | 事件 | AntdSwiperOnIndexChange | - | - |


## 走马灯样式(AntdSwiperStyle) <a id='AntdSwiperStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 列表容器样式（背景色/边框/圆角等） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| itemStyle | 列表项样式（背景/边框/点击效果等） | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |


