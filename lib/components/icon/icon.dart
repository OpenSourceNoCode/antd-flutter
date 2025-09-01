import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/cupertino.dart';

/// @t 图标样式
/// @d 定义图标的所有可定制样式属性
/// @l [AntdIcon]
class AntdIconStyle extends AntdStyle {
  /// 图标尺寸
  final double? size;

  /// 图标颜色
  final Color? color;

  /// 图标填充度（0.0-1.0）
  final double? fill;

  /// 图标粗细（100-700）
  final double? weight;

  /// 图标等级（影响细节表现）
  final double? grade;

  /// 视觉尺寸（影响整体比例）
  final double? opticalSize;

  /// 图标阴影效果
  final List<Shadow>? shadows;

  /// 无障碍语义标签
  final String? semanticLabel;

  /// 文本方向（LTR/RTL）
  final TextDirection? textDirection;

  /// 是否应用文本缩放
  final bool? applyTextScaling;

  /// 颜色混合模式
  final BlendMode? blendMode;

  /// 图标容器样式
  /// @l [AntdBox]
  final AntdBoxStyle? bodyStyle;

  const AntdIconStyle(
      {super.inherit,
      this.size,
      this.color,
      this.fill,
      this.weight,
      this.grade,
      this.opticalSize,
      this.shadows,
      this.semanticLabel,
      this.textDirection,
      this.applyTextScaling,
      this.blendMode,
      this.bodyStyle});

  @override
  AntdIconStyle copyFrom(AntdIconStyle? style) {
    return copyWith(
      size: style?.size,
      color: style?.color,
      fill: style?.fill,
      weight: style?.weight,
      grade: style?.grade,
      opticalSize: style?.opticalSize,
      shadows: style?.shadows,
      semanticLabel: style?.semanticLabel,
      textDirection: style?.textDirection,
      applyTextScaling: style?.applyTextScaling,
      blendMode: style?.blendMode,
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
    );
  }

  AntdIconStyle copyWith(
      {final double? size,
      final Color? color,
      final double? fill,
      final double? weight,
      final double? grade,
      final double? opticalSize,
      final List<Shadow>? shadows,
      final String? semanticLabel,
      final TextDirection? textDirection,
      final bool? applyTextScaling,
      final BlendMode? blendMode,
      final AntdBoxStyle? bodyStyle}) {
    return AntdIconStyle(
      size: size ?? this.size,
      color: color ?? this.color,
      fill: fill ?? this.fill,
      weight: weight ?? this.weight,
      grade: grade ?? this.grade,
      opticalSize: opticalSize ?? this.opticalSize,
      shadows: shadows ?? this.shadows,
      semanticLabel: semanticLabel ?? this.semanticLabel,
      textDirection: textDirection ?? this.textDirection,
      applyTextScaling: applyTextScaling ?? this.applyTextScaling,
      blendMode: blendMode ?? this.blendMode,
      bodyStyle: bodyStyle ?? this.bodyStyle,
    );
  }
}

///@t 图标
///@g 通用
///@o 98
///@d 基于[AntdBox]实现,是对于原生[Icon]的封装,多了一个[AntdIconStyle]方便复用
///@u 简洁清晰的表达你的意图
class AntdIcon extends AntdComponent<AntdIconStyle, AntdIcon> {
  ///图标
  final IconData? icon;

  ///触摸后的回调
  final VoidCallback? onTap;

  const AntdIcon(
      {super.key, super.style, super.styleBuilder, this.icon, this.onTap});

  @override
  Widget render(BuildContext context, AntdIconStyle style) {
    return AntdBox(
      style: style.bodyStyle,
      onTap: onTap,
      child: Icon(
        icon,
        size: style.size,
        color: style.color,
        fill: style.fill,
        weight: style.weight,
        grade: style.grade,
        opticalSize: style.opticalSize,
        shadows: style.shadows,
        semanticLabel: style.semanticLabel,
        textDirection: style.textDirection,
        applyTextScaling: style.applyTextScaling,
        blendMode: style.blendMode,
      ),
    );
  }

  @override
  AntdIconStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return theme.iconStyle?.call(context, this, const AntdIconStyle(), token) ??
        const AntdIconStyle();
  }

  @override
  AntdIconStyle margeStyle(AntdIconStyle defaultStyle, AntdIconStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdIcon getWidget(BuildContext context) {
    return this;
  }
}
