import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

///空状态样式
///@l [AntdEmpty]
class AntdEmptyStyle extends AntdStyle {
  /// 空状态容器样式（控制整体布局、边距等）
  final AntdBoxStyle? bodyStyle;

  /// 空状态容器样式（控制整体布局、边距等）
  final AntdFlexStyle? bodyColumnStyle;

  /// 描述文本样式（控制文字颜色、大小、间距等）
  final AntdBoxStyle? descriptionStyle;

  ///占位的图片(也可以是其他的Widget)
  final Widget? image;

  ///如果是图片这个样式会生效
  final AntdImageStyle? imageStyle;

  const AntdEmptyStyle(
      {super.inherit,
      this.bodyStyle,
      this.bodyColumnStyle,
      this.descriptionStyle,
      this.image,
      this.imageStyle});

  @override
  AntdEmptyStyle copyFrom(covariant AntdEmptyStyle? style) {
    return AntdEmptyStyle(
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        bodyColumnStyle: bodyColumnStyle.merge(style?.bodyColumnStyle),
        descriptionStyle: descriptionStyle.merge(style?.descriptionStyle),
        image: style?.image ?? image,
        imageStyle: imageStyle.merge(style?.imageStyle));
  }
}

///@t 空状态
///@g 反馈
///@o 96
///@d 使用场景插画表示内容为空。
///@u 适用于于信息为空时的占位提示。
class AntdEmpty extends AntdComponent<AntdEmptyStyle, AntdEmpty> {
  const AntdEmpty({
    super.key,
    super.style,
    super.styleBuilder,
    this.image,
    this.description,
  });

  ///自定义图标
  final Widget? image;

  ///描述
  final Widget? description;

  @override
  AntdEmptyStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdEmptyStyle(
        descriptionStyle: AntdBoxStyle(
            margin: token.size.default_.top,
            textStyle:
                token.font.default_.copyWith(color: token.colorTextSecondary)),
        bodyStyle: AntdBoxStyle(
          alignment: Alignment.center,
          color: token.colorWhite,
          padding: token.size.md.all,
          textStyle:
              TextStyle(fontSize: token.fontSize, color: token.colorText),
        ),
        bodyColumnStyle: const AntdFlexStyle(mainAxisSize: MainAxisSize.min),
        imageStyle: const AntdImageStyle(
            bodyStyle: AntdBoxStyle(height: 40, width: 60)));
  }

  @override
  Widget render(BuildContext context, AntdEmptyStyle style) {
    var childList = <Widget>[
      if ((image ?? style.image) != null)
        AntdStyleProvider<AntdImageStyle>(
            style: style.imageStyle, child: (image ?? style.image)!)
    ];
    if (description != null) {
      childList.add(AntdBox(
        style: style.descriptionStyle,
        child: description,
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
  AntdEmptyStyle margeStyle(
      AntdEmptyStyle defaultStyle, AntdEmptyStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdEmptyStyle, AntdEmpty>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.emptyStyle;
  }

  @override
  AntdEmpty getWidget(BuildContext context) {
    return this;
  }
}
