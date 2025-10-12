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

  /// 最外层样式
  final AntdBoxStyle? bodyStyle;

  ///布局样式
  final AntdFlexStyle? flexStyle;

  ///childStyle
  final AntdBoxStyle? childStyle;

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
      this.bodyStyle,
      this.flexStyle,
      this.childStyle});

  @override
  AntdIconStyle copyFrom(AntdIconStyle? style) {
    return AntdIconStyle(
      size: style?.size ?? size,
      color: style?.color ?? color,
      fill: style?.fill ?? fill,
      weight: style?.weight ?? weight,
      grade: style?.grade ?? grade,
      opticalSize: style?.opticalSize ?? opticalSize,
      shadows: style?.shadows ?? shadows,
      semanticLabel: style?.semanticLabel ?? semanticLabel,
      textDirection: style?.textDirection ?? textDirection,
      applyTextScaling: style?.applyTextScaling ?? applyTextScaling,
      blendMode: style?.blendMode ?? blendMode,
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      flexStyle: flexStyle.merge(style?.flexStyle),
      childStyle: childStyle.merge(style?.childStyle),
    );
  }
}

/// iconWrap
/// @d child能自动判断是不是[AntdIcon],不是[AntdIcon]的会自动使用[AntdIcon]包裹
/// @l [AntdIcon]
class AntdIconWrap extends StatelessWidget {
  const AntdIconWrap({super.key, this.child, this.style});

  final AntdIconStyle? style;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (child == null) {
      return const AntdBox();
    }

    return AntdStyleProvider<AntdIconStyle>(
        style: style.merge(AntdStyleProvider.maybeOf<AntdIconStyle>(context)),
        child: child is AntdIcon
            ? child!
            : AntdIcon(
                child: child,
              ));
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

  /// 和图标在一起的内容
  final Widget? child;

  ///child和icon按行还是按列布局
  final bool row;

  ///反转图标和child的位置
  final bool reversed;

  ///触摸后的回调
  final VoidCallback? onTap;

  const AntdIcon(
      {super.key,
      super.style,
      super.styleBuilder,
      this.icon,
      this.child,
      this.row = true,
      this.reversed = false,
      this.onTap});

  @override
  Widget render(BuildContext context, AntdIconStyle style) {
    var list = [
      if (icon != null)
        Icon(
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
      if (child != null)
        AntdBox(
          style: style.childStyle,
          child: child,
        ),
    ];
    return AntdBox(
      style: style.bodyStyle,
      onTap: onTap,
      child: AntdFlex(
          direction: row ? Axis.horizontal : Axis.vertical,
          style: style.flexStyle,
          children: reversed ? list.reversed.toList() : list),
    );
  }

  @override
  AntdIconStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdIconStyle(
        size: 24,
        color: token.colorText,
        flexStyle: const AntdFlexStyle(mainAxisSize: MainAxisSize.min));
  }

  @override
  AntdIconStyle margeStyle(AntdIconStyle defaultStyle, AntdIconStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdIconStyle, AntdIcon>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.iconStyle;
  }

  @override
  AntdIcon getWidget(BuildContext context) {
    return this;
  }
}
