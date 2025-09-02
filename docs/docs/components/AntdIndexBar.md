---
group:
  title: 导航
  order: 5
title: IndexBar
subtitle: 序列
---
根据字母 A ～ Z 排列内容。
## 何时使用
适用于列表的分类显示和快速定位。

## 代码展示

<div class='preview-container'>
<div>

### 事件，列表索引改变


```dart
class AntdIndexBarDemo extends StatelessWidget {
  const AntdIndexBarDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      SizedBox(
          height: 500,
          child: AntdIndexBar<AntdIndexBarDemoData>(
              items: getDemos(10),
              onIndexChange: (context, group, index) {
                AntdToast.show("当前索引:$group,$index");
              },
              headerBuilder: (context, group, index) {
                return Text("$group-$index");
              },
              indexBuilder: (context, group, index) {
                return Text(group);
              },
              itemBuilder: (entity) {
                return Text(entity.data.text);
              }))
    ]);
  }
}

```

### 超多数据

超大数据量，默认虚拟滚动

```dart
class AntdIndexBarBigDataDemo extends StatelessWidget {
  const AntdIndexBarBigDataDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      SizedBox(
          height: 500,
          child: AntdIndexBar<AntdIndexBarDemoData>(
              items: getDemos(1000000),
              virtual: true,
              headerBuilder: (context, group, index) {
                return Text("$group-$index");
              },
              indexBuilder: (context, group, index) {
                return Text(group);
              },
              itemBuilder: (entity) {
                return Text(entity.data.text);
              }))
    ]);
  }
}

```

</div>
<div class='phone-preview'>
<iframe src='http://localhost:49470/AntdIndexBar'></iframe>
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
| style | 样式 | AntdIndexBarStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdIndexBarStyle, AntdIndexBar&lt;T&gt;&gt; | - | - |
| controller | 控制器 | AntdIndexBarController&lt;T&gt; | - | - |
| headers | 头部的sliver | List&lt;Widget&gt; | - | - |
| footers | 尾部的sliver | List&lt;Widget&gt; | - | - |
| physics | 滚动物理效果 | ScrollPhysics | - | - |
| virtual | 启动虚拟滚动 | bool | true | - |
| shrinkWrap | 自动扩展高度 | bool | - | - |
| items | 滚动的数据 | List&lt;T&gt; | - | - |
| itemBuilder | 数据构造器 | AntdScrollItemBuilder&lt;T, AntdIndexBarController&lt;T&gt;&gt; | - | - |
| viewportOffset | 偏移位置 | double | - | - |
| onItemPosition | item变更事件 | AntdItemPositionListener&lt;T&gt; | - | - |
| headerBuilder | 列表内头部构建 | AntdIndexBarIndexBuilder | - | - |
| indexBuilder | 索引构建 | AntdIndexBarIndexBuilder | - | - |
| headerFloatBuilder | 列表内头部构建 | AntdIndexBarIndexBuilder | - | - |
| onIndexChange | 索引变更事件 | AntdIndexBarOnIndexChange | - | - |


## 样式(AntdIndexBarStyle) <a id='AntdIndexBarStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| bodyStyle | 浮动头的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| floatHeaderStyle | 浮动头的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| headerStyle | header的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| itemStyle | item的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| indexStyle | 索引的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| activeIndexStyle | 索引的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |
| indexMask | 索引的样式 | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |


