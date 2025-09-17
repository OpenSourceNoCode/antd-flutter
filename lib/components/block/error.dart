import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

///异常样式
///@l [AntdErrorBlock]
class AntdErrorBlockStyle extends AntdStyle {
  ///样式
  final AntdBoxStyle? bodyStyle;

  ///样式
  final AntdFlexStyle? bodyColumnStyle;

  ///描述文字样式
  final AntdBoxStyle? descStyle;

  ///描述文字样式
  final AntdBoxStyle? extraStyle;

  ///描述文字样式
  final AntdBoxStyle? titleStyle;

  ///不同状态的展示内容
  final Widget? Function(AntdErrorBlockStatus? status)? builder;

  ///图片样式
  final AntdImageStyle? imageStyle;

  const AntdErrorBlockStyle(
      {super.inherit,
      this.bodyStyle,
      this.bodyColumnStyle,
      this.descStyle,
      this.extraStyle,
      this.titleStyle,
      this.builder,
      this.imageStyle});

  @override
  AntdErrorBlockStyle copyFrom(covariant AntdErrorBlockStyle? style) {
    return AntdErrorBlockStyle(
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        bodyColumnStyle: bodyColumnStyle.merge(style?.bodyColumnStyle),
        descStyle: descStyle.merge(style?.descStyle),
        extraStyle: extraStyle.merge(style?.extraStyle),
        titleStyle: titleStyle.merge(style?.titleStyle),
        builder: style?.builder ?? builder,
        imageStyle: imageStyle.merge(style?.imageStyle));
  }
}

enum AntdErrorBlockStatus {
  none(Text("页面遇到一些小问题"), Text("待会来试试")),
  disconnected(Text("网络有点忙"), Text("动动手指帮忙修复")),
  empty(Text("没有找到你需要的东西"), Text("找找其他的吧")),
  busy(Text("前方拥堵"), Text("轻触刷新试试"));

  final Widget? title;
  final Widget? desc;

  const AntdErrorBlockStatus(this.title, this.desc);
}

///@t 异常
///@g 反馈
///@o 95
///@d 使用场景插画表示内容为空。
///@u 适用于六种异常场景的反馈提示。
class AntdErrorBlock
    extends AntdComponent<AntdErrorBlockStyle, AntdErrorBlock> {
  const AntdErrorBlock(
      {super.key,
      super.style,
      super.styleBuilder,
      this.image,
      this.status,
      this.title,
      this.desc,
      this.fullPage,
      this.extra});

  ///占位内容
  final Widget? image;

  ///自定义图标
  final AntdErrorBlockStatus? status;

  ///描述
  final Widget? title;

  ///描述
  final Widget? desc;

  ///自动铺满
  final bool? fullPage;

  ///扩展操作
  final Widget? extra;

  @override
  AntdErrorBlockStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdErrorBlockStyle(
        bodyStyle: AntdBoxStyle(
            alignment: Alignment.center,
            textStyle: token.font.md.copyWith(color: token.colorText.tertiary)),
        bodyColumnStyle: const AntdFlexStyle(mainAxisSize: MainAxisSize.min),
        titleStyle: AntdBoxStyle(margin: token.size.ms.top),
        descStyle: AntdBoxStyle(
            textStyle: token.font.xs.copyWith(color: token.colorText.tertiary)),
        extraStyle: AntdBoxStyle(margin: token.size.ms.top),
        imageStyle: const AntdImageStyle(
            bodyStyle: AntdBoxStyle(height: 100, width: 100)));
  }

  @override
  Widget render(BuildContext context, AntdErrorBlockStyle style) {
    var childList = <Widget>[];
    var showImage = image ?? style.builder?.call(status);
    if (showImage != null) {
      childList.add(AntdStyleProvider<AntdImageStyle>(
          style: style.imageStyle, child: showImage));
    }

    var showTitle = title ?? status?.title;
    if (showTitle != null) {
      childList.add(AntdBox(
        style: style.titleStyle,
        child: showTitle,
      ));
    }
    var showDesc = desc ?? status?.desc;
    if (showDesc != null) {
      childList.add(AntdBox(
        style: style.titleStyle,
        child: showDesc,
      ));
    }
    if (extra != null) {
      childList.add(AntdBox(
        style: style.extraStyle,
        child: extra,
      ));
    }
    return AntdBox(
      style: style.bodyStyle,
      child: AntdColumn(
        style: style.bodyColumnStyle,
        children: childList,
      ),
    );
  }

  @override
  AntdErrorBlockStyle margeStyle(
      AntdErrorBlockStyle defaultStyle, AntdErrorBlockStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdErrorBlockStyle, AntdErrorBlock>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.errorBlockStyle;
  }

  @override
  AntdErrorBlock getWidget(BuildContext context) {
    return this;
  }
}
