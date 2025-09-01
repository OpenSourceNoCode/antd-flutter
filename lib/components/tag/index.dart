import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

enum AntdTagFill { solid, outline }

///标签样式
///@l [AntdTag]
class AntdTagStyle extends AntdStyle {
  ///主体样式
  final AntdBoxStyle? bodyStyle;

  ///关闭样式
  final AntdBoxStyle? closeStyle;

  ///关闭样式
  final AntdIconStyle? closeIconStyle;

  ///轴对齐
  final AntdFlexStyle? rowStyle;

  const AntdTagStyle(
      {super.inherit,
      this.bodyStyle,
      this.closeStyle,
      this.closeIconStyle,
      this.rowStyle});

  @override
  AntdTagStyle copyFrom(covariant AntdTagStyle? style) {
    return AntdTagStyle(
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        closeStyle: closeStyle.merge(style?.closeStyle),
        closeIconStyle: closeIconStyle.merge(style?.closeIconStyle),
        rowStyle: rowStyle.merge(style?.rowStyle));
  }
}

///@t 标签
///@g 信息展示
///@o 75
///@d 进行标记和分类的小标签。
///@u 适用于标记事物的属性和维度。
class AntdTag extends AntdComponent<AntdTagStyle, AntdTag> {
  const AntdTag(
      {super.key,
      super.style,
      super.styleBuilder,
      this.color = AntdColor.default_,
      this.fill = AntdTagFill.solid,
      this.round = false,
      this.close,
      this.onClose,
      this.onTap,
      this.child});

  ///标签色
  final AntdColor color;

  ///填充模式
  final AntdTagFill fill;

  ///是否圆角
  final bool round;

  ///关闭区域
  final Widget? close;

  ///关闭事件
  final VoidCallback? onClose;

  ///标签点击事件
  final VoidCallback? onTap;

  ///内容
  final Widget? child;

  @override
  Widget render(BuildContext context, AntdTagStyle style) {
    return AntdBox(
      style: style.bodyStyle,
      onTap: onTap,
      child: AntdRow(style: style.rowStyle, children: [
        if (child != null) child!,
        if (close != null)
          AntdBox(
            onTap: onClose,
            style: style.closeStyle,
            child: AntdStyleProvider<AntdIconStyle>(
                style: style.closeIconStyle, child: close!),
          )
      ]),
    );
  }

  Color getColor(AntdAliasToken token) {
    if (color == AntdColor.default_) {
      return token.colorTextSecondary;
    }
    return color.getColor(token);
  }

  @override
  AntdTagStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var color = getColor(token);
    AntdBoxStyle? bodyStyle;
    if (fill == AntdTagFill.solid) {
      bodyStyle = AntdBoxStyle(
          color: color,
          textStyle: token.font.xxs.copyWith(color: token.colorWhite));
    } else {
      bodyStyle = AntdBoxStyle(
          color: token.colorWhite,
          textStyle: token.font.xxs.copyWith(color: color));
    }

    if (round) {
      bodyStyle = bodyStyle.copyWith(radius: token.size.xxl.radius.all);
    } else {
      bodyStyle = bodyStyle.copyWith(radius: token.size.xxs.radius.all);
    }
    bodyStyle = bodyStyle.copyWith(
      padding: token.size.xxs.vertical.marge(token.size.xs.horizontal),
      border: Border.all(color: color, width: token.lineWidth.roundToDouble()),
    );

    return AntdTagStyle(
        bodyStyle: bodyStyle,
        closeStyle: AntdBoxStyle(margin: 2.left),
        closeIconStyle: AntdIconStyle(
          size: 12,
          color: token.colorWhite,
        ),
        rowStyle: const AntdFlexStyle(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center));
  }

  @override
  AntdTagStyle margeStyle(AntdTagStyle defaultStyle, AntdTagStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdTagStyle, AntdTag>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.tagStyle;
  }

  @override
  AntdTag getWidget(BuildContext context) {
    return this;
  }
}
