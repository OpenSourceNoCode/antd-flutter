---
group:
  title: 通用
  order: -1
title: Flex
subtitle: 弹性布局
---
只是对于Flex的Style包装
## 何时使用



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
| style | 样式 | AntdFlexStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdFlexStyle, AntdFlex&gt; | - | - |
| direction | - | Axis | - | - |
| children | - | List&lt;Widget&gt; | - | - |


## Flex布局样式配置类（用于Row/Column等弹性布局）(AntdFlexStyle) <a id='AntdFlexStyle'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| mainAxisAlignment | 主轴对齐方式（默认start） | MainAxisAlignment | start | - |
| mainAxisSize | 主轴尺寸占用方式（默认max占满可用空间） | MainAxisSize | max | - |
| crossAxisAlignment | 交叉轴对齐方式（默认center居中） | CrossAxisAlignment | center | - |
| textDirection | 文本方向（影响水平布局） | TextDirection | - | - |
| verticalDirection | 垂直方向布局顺序（默认down从上到下） | VerticalDirection | down | - |
| textBaseline | 文本基线对齐方式（用于文字对齐） | TextBaseline | - | - |
| clipBehavior | 内容裁剪行为（默认none不裁剪） | Clip | none | - |
| spacing | 子元素间距（单位：逻辑像素，默认0） | double | 0.0 | - |
| expanded | 是否强制子元素扩展（覆盖mainAxisSize） | bool | - | - |

## 行布局(AntdRow) <a id='AntdRow'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| style | 样式 | AntdFlexStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdFlexStyle, AntdRow&gt; | - | - |
| children | - | List&lt;Widget&gt; | - | - |

## 列布局(AntdColumn) <a id='AntdColumn'></a>

| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| style | 样式 | AntdFlexStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdFlexStyle, AntdColumn&gt; | - | - |
| children | - | List&lt;Widget&gt; | - | - |

## Wrap(AntdWrap) <a id='AntdWrap'></a>
| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| key | - | Key | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdWrapStyle, AntdWrap&gt; | - | - |
| style | 样式 | AntdWrapStyle | - | - |
| children | 子元素 | List&lt;Widget&gt; | - | - |


