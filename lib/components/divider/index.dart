import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

enum AntdDividerPosition { left, center, right }

/// @t 分割线样式
/// @l [AntdDivider]
class AntdDividerStyle extends AntdStyle {
  /// 水平分割线的宽度
  final double? width;

  /// 垂直分割线的高度
  final double? verticalHeight;

  /// 分割线的颜色值
  final Color? color;

  /// 分割线外边距
  final double? margin;

  /// 分割线中间内容的容器样式
  /// @l [AntdBox]
  final AntdBoxStyle? childStyle;

  const AntdDividerStyle({
    this.width,
    this.verticalHeight,
    this.color,
    this.margin,
    this.childStyle,
  });

  @override
  AntdDividerStyle copyFrom(covariant AntdDividerStyle? style) {
    return AntdDividerStyle(
        width: style?.width ?? width,
        verticalHeight: style?.verticalHeight ?? verticalHeight,
        color: style?.color ?? color,
        margin: style?.margin ?? margin,
        childStyle: childStyle.merge(style?.childStyle));
  }
}

///@t 分割线
///@g 布局
///@o 97
///@d 区隔内容的分割线。
///@u 对不同章节的文本段落进行分割,,对行内文字/链接进行分割，例如表格的操作列
class AntdDivider extends AntdComponent<AntdDividerStyle, AntdDivider> {
  const AntdDivider({
    super.key,
    this.color,
    this.child,
    this.vertical = false,
    this.position,
    super.style,
    super.styleBuilder,
  });

  /// 线的颜色
  final AntdColor? color;

  /// 内容
  final Widget? child;

  /// 垂直还是水平
  final bool vertical;

  /// 文字位置
  final AntdDividerPosition? position;

  @override
  AntdDividerStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdDividerStyle(
      width: token.lineWidth,
      verticalHeight: 16,
      color: color != null ? color!.getColor(token) : token.border.color,
      margin: token.size.seed.roundToDouble(),
      childStyle: AntdBoxStyle(
          textStyle: token.font.ms.copyWith(color: token.colorText.tertiary),
          margin: token.size.seed.horizontal),
    );
  }

  AntdBoxStyle getBodyStyle(AntdDividerStyle style, AntdMapToken token) {
    return AntdBoxStyle(
        height: vertical ? style.verticalHeight : style.width,
        width: vertical ? style.width : double.infinity,
        color: style.color,
        margin: vertical ? style.margin?.horizontal : style.margin?.vertical);
  }

  @override
  AntdDividerStyle margeStyle(
      AntdDividerStyle defaultStyle, AntdDividerStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdDividerStyle, AntdDivider>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.dividerStyle;
  }

  @override
  Widget render(BuildContext context, AntdDividerStyle style) {
    var token = AntdTheme.ofToken(context);
    var line = AntdBox(
      style: getBodyStyle(style, token),
    );
    if (vertical || child == null) {
      return line;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: position == AntdDividerPosition.left ? 1 : 6, child: line),
        AntdBox(style: style.childStyle, child: child),
        Expanded(
            flex: position == AntdDividerPosition.right ? 1 : 6, child: line)
      ],
    );
  }

  @override
  AntdDivider getWidget(BuildContext context) {
    return this;
  }
}
