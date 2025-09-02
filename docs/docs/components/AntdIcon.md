---
group:
  title: 通用
  order: 2
title: Icon
subtitle: 图标
---
基于[AntdBox](/antd-box)实现,是对于原生[Icon](/icon)的封装,多了一个[AntdIconStyle](/antd-icon-style)方便复用
## 何时使用
简洁清晰的表达你的意图

## 代码展示

<div class='preview-container'>
<div class='phone-preview'>
<iframe src='https://opensourcenocode.github.io/antd-flutter?target=AntdIcon'></iframe>
</div>
<div style='flex: 1;'>

### 自定样式

通过[AntdIconStyle](/antd-icon-style)自定义样式

```dart
class AntdIconStyleDemo extends StatelessWidget {
  const AntdIconStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdIcon(
          icon: AntdIcons.aa,
          style: AntdIconStyle(size: 32, color: token.colorPrimary)),
      AntdIcon(
          icon: AntdIcons.aa,
          style: AntdIconStyle(size: 32, color: token.colorWarning)),
      AntdIcon(
          icon: AntdIcons.aa,
          style: AntdIconStyle(size: 32, color: token.colorSuccess))
    ]);
  }
}

```

### 线框风格

线框风格的按钮

```dart
class AntdIconOutlineDemo extends StatelessWidget {
  const AntdIconOutlineDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdIcon(icon: AntdIcons.aa),
      AntdIcon(icon: AntdIcons.addCircle),
      AntdIcon(icon: AntdIcons.add),
      AntdIcon(icon: AntdIcons.addSquare),
      AntdIcon(icon: AntdIcons.ant),
      AntdIcon(icon: AntdIcons.app),
      AntdIcon(icon: AntdIcons.appstore),
      AntdIcon(icon: AntdIcons.arrowDownCircle),
      AntdIcon(icon: AntdIcons.arrowsAlt),
      AntdIcon(icon: AntdIcons.audioMuted),
      AntdIcon(icon: AntdIcons.audio),
      AntdIcon(icon: AntdIcons.bankcard),
      AntdIcon(icon: AntdIcons.bellMute),
      AntdIcon(icon: AntdIcons.bell),
      AntdIcon(icon: AntdIcons.bill),
      AntdIcon(icon: AntdIcons.calculator),
      AntdIcon(icon: AntdIcons.calendar),
      AntdIcon(icon: AntdIcons.camera),
      AntdIcon(icon: AntdIcons.chatAdd),
      AntdIcon(icon: AntdIcons.chatCheck),
      AntdIcon(icon: AntdIcons.chatWrong),
      AntdIcon(icon: AntdIcons.checkCircle),
      AntdIcon(icon: AntdIcons.check),
      AntdIcon(icon: AntdIcons.checkShield),
      AntdIcon(icon: AntdIcons.clockCircle),
      AntdIcon(icon: AntdIcons.closeCircle),
      AntdIcon(icon: AntdIcons.close),
      AntdIcon(icon: AntdIcons.closeShield),
      AntdIcon(icon: AntdIcons.collectMoney),
      AntdIcon(icon: AntdIcons.compass),
      AntdIcon(icon: AntdIcons.content),
      AntdIcon(icon: AntdIcons.coupon),
      AntdIcon(icon: AntdIcons.delete),
      AntdIcon(icon: AntdIcons.downCircle),
      AntdIcon(icon: AntdIcons.down),
      AntdIcon(icon: AntdIcons.downland),
      AntdIcon(icon: AntdIcons.editS),
      AntdIcon(icon: AntdIcons.environment),
      AntdIcon(icon: AntdIcons.exclamationCircle),
      AntdIcon(icon: AntdIcons.exclamation),
      AntdIcon(icon: AntdIcons.exclamationShield),
      AntdIcon(icon: AntdIcons.exclamationTriangle),
      AntdIcon(icon: AntdIcons.eyeInvisible),
      AntdIcon(icon: AntdIcons.eye),
      AntdIcon(icon: AntdIcons.faceRecognition),
      AntdIcon(icon: AntdIcons.file),
      AntdIcon(icon: AntdIcons.fileWrong),
      AntdIcon(icon: AntdIcons.filter),
      AntdIcon(icon: AntdIcons.flag),
      AntdIcon(icon: AntdIcons.folder),
      AntdIcon(icon: AntdIcons.frown),
      AntdIcon(icon: AntdIcons.gift),
      AntdIcon(icon: AntdIcons.global),
      AntdIcon(icon: AntdIcons.handPayCircle),
      AntdIcon(icon: AntdIcons.heart),
      AntdIcon(icon: AntdIcons.histogram),
      AntdIcon(icon: AntdIcons.informationCircle),
      AntdIcon(icon: AntdIcons.key),
      AntdIcon(icon: AntdIcons.koubei),
      AntdIcon(icon: AntdIcons.left),
      AntdIcon(icon: AntdIcons.like),
      AntdIcon(icon: AntdIcons.link),
      AntdIcon(icon: AntdIcons.location),
      AntdIcon(icon: AntdIcons.lock),
      AntdIcon(icon: AntdIcons.loop),
      AntdIcon(icon: AntdIcons.mailOpen),
      AntdIcon(icon: AntdIcons.mail),
      AntdIcon(icon: AntdIcons.message),
      AntdIcon(icon: AntdIcons.minusCircle),
      AntdIcon(icon: AntdIcons.minus),
      AntdIcon(icon: AntdIcons.more),
      AntdIcon(icon: AntdIcons.movie),
      AntdIcon(icon: AntdIcons.payCircle),
      AntdIcon(icon: AntdIcons.phonebook),
      AntdIcon(icon: AntdIcons.picture),
      AntdIcon(icon: AntdIcons.pictureWrong),
      AntdIcon(icon: AntdIcons.pictures),
      AntdIcon(icon: AntdIcons.pie),
      AntdIcon(icon: AntdIcons.play),
      AntdIcon(icon: AntdIcons.questionCircle),
      AntdIcon(icon: AntdIcons.receipt),
      AntdIcon(icon: AntdIcons.receivePayment),
      AntdIcon(icon: AntdIcons.redo),
      AntdIcon(icon: AntdIcons.rightright),
      AntdIcon(icon: AntdIcons.scanCode),
      AntdIcon(icon: AntdIcons.scanningFace),
      AntdIcon(icon: AntdIcons.scanning),
      AntdIcon(icon: AntdIcons.search),
      AntdIcon(icon: AntdIcons.send),
      AntdIcon(icon: AntdIcons.set),
      AntdIcon(icon: AntdIcons.shopbag),
      AntdIcon(icon: AntdIcons.shrink),
      AntdIcon(icon: AntdIcons.smile),
      AntdIcon(icon: AntdIcons.soundMute),
      AntdIcon(icon: AntdIcons.sound),
      AntdIcon(icon: AntdIcons.star),
      AntdIcon(icon: AntdIcons.stop),
      AntdIcon(icon: AntdIcons.systemQRcode),
      AntdIcon(icon: AntdIcons.tag),
      AntdIcon(icon: AntdIcons.team),
      AntdIcon(icon: AntdIcons.textDeletion),
      AntdIcon(icon: AntdIcons.text),
      AntdIcon(icon: AntdIcons.transportQRcode),
      AntdIcon(icon: AntdIcons.travel),
      AntdIcon(icon: AntdIcons.truck),
      AntdIcon(icon: AntdIcons.undo),
      AntdIcon(icon: AntdIcons.unlock),
      AntdIcon(icon: AntdIcons.unorderedList),
      AntdIcon(icon: AntdIcons.upCircle),
      AntdIcon(icon: AntdIcons.up),
      AntdIcon(icon: AntdIcons.upload),
      AntdIcon(icon: AntdIcons.userAdd),
      AntdIcon(icon: AntdIcons.userCircle),
      AntdIcon(icon: AntdIcons.userContact),
      AntdIcon(icon: AntdIcons.user),
      AntdIcon(icon: AntdIcons.userSet),
      AntdIcon(icon: AntdIcons.video)
    ]);
  }
}

```

### 实底风格

实底风格的按钮

```dart
class AntdIconFillDemo extends StatelessWidget {
  const AntdIconFillDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdIcon(icon: AntdIcons.addressBookFill),
      AntdIcon(icon: AntdIcons.alipayCircleFill),
      AntdIcon(icon: AntdIcons.alipaySquareFill),
      AntdIcon(icon: AntdIcons.audioFill),
      AntdIcon(icon: AntdIcons.checkCircleFill),
      AntdIcon(icon: AntdIcons.checkShieldFill),
      AntdIcon(icon: AntdIcons.clockCircleFill),
      AntdIcon(icon: AntdIcons.closeCircleFill),
      AntdIcon(icon: AntdIcons.downFill),
      AntdIcon(icon: AntdIcons.editFill),
      AntdIcon(icon: AntdIcons.editSFill),
      AntdIcon(icon: AntdIcons.exclamationCircleFill),
      AntdIcon(icon: AntdIcons.exclamationShieldFill),
      AntdIcon(icon: AntdIcons.eyeFill),
      AntdIcon(icon: AntdIcons.eyeInvisibleFill),
      AntdIcon(icon: AntdIcons.fireFill),
      AntdIcon(icon: AntdIcons.forbidFill),
      AntdIcon(icon: AntdIcons.frownFill),
      AntdIcon(icon: AntdIcons.heartFill),
      AntdIcon(icon: AntdIcons.informationCircleFill),
      AntdIcon(icon: AntdIcons.koubeiFill),
      AntdIcon(icon: AntdIcons.locationFill),
      AntdIcon(icon: AntdIcons.lockFill),
      AntdIcon(icon: AntdIcons.mailFill),
      AntdIcon(icon: AntdIcons.messageFill),
      AntdIcon(icon: AntdIcons.phoneFill),
      AntdIcon(icon: AntdIcons.phonebookFill),
      AntdIcon(icon: AntdIcons.questionCircleFill),
      AntdIcon(icon: AntdIcons.smileFill),
      AntdIcon(icon: AntdIcons.soundMuteFill),
      AntdIcon(icon: AntdIcons.starFill),
      AntdIcon(icon: AntdIcons.teamFill)
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
| style | 样式 | AntdIconStyle | - | - |
| styleBuilder | 动态样式 | AntdStyleBuilder&lt;AntdIconStyle, AntdIcon&gt; | - | - |
| icon | 图标 | IconData | - | - |
| onTap | 触摸后的回调 | VoidCallback | - | - |


## 图标样式(AntdIconStyle) <a id='AntdIconStyle'></a>
定义图标的所有可定制样式属性
| 属性名 | 说明 | 类型 | 默认值 | 版本 |
| --- | --- | --- | --- | --- |
| inherit | 是否继承样式,如果为false则不会向上合并其他的样式 | bool | - | - |
| size | 图标尺寸 | double | - | - |
| color | 图标颜色 | Color | - | - |
| fill | 图标填充度（0.0-1.0） | double | - | - |
| weight | 图标粗细（100-700） | double | - | - |
| grade | 图标等级（影响细节表现） | double | - | - |
| opticalSize | 视觉尺寸（影响整体比例） | double | - | - |
| shadows | 图标阴影效果 | List&lt;Shadow&gt; | - | - |
| semanticLabel | 无障碍语义标签 | String | - | - |
| textDirection | 文本方向（LTR/RTL） | TextDirection | - | - |
| applyTextScaling | 是否应用文本缩放 | bool | - | - |
| blendMode | 颜色混合模式 | BlendMode | - | - |
| bodyStyle |  | [AntdBoxStyle](../components/antd-box/#AntdBoxStyle) | - | - |


