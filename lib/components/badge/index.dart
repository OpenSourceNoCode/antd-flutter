import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

/// 角标样式
/// @l [AntdBadge]
class AntdBadgeStyle extends AntdStyle {
  /// 徽标小圆点的样式
  final AntdBoxStyle? dotStyle;

  /// 徽标容器的样式
  final AntdBoxStyle? badgeStyle;

  /// 徽标包裹内容的样式
  final AntdBoxStyle? bodyStyle;

  /// 徽标的位置偏移量
  final Offset? offset;

  const AntdBadgeStyle({
    super.inherit,
    this.dotStyle,
    this.badgeStyle,
    this.bodyStyle,
    this.offset,
  });

  @override
  AntdBadgeStyle copyFrom(covariant AntdBadgeStyle? style) {
    return AntdBadgeStyle(
        dotStyle: dotStyle.merge(style?.dotStyle),
        badgeStyle: badgeStyle.merge(style?.badgeStyle),
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        offset: style?.offset ?? offset);
  }
}

enum AntdBadgePosition { topLeft, topRight, bottomLeft, bottomRight }

///@t 徽标
///@g 引导提示
///@o 12
///@d 在右上角展示数字、文字、小红点。
///@u 适用于产品化的新消息、新功能、新服务等内容的提醒，通过醒目视觉形式吸引用户处理。
class AntdBadge extends AntdStateComponent<AntdBadgeStyle, AntdBadge> {
  const AntdBadge(
      {super.key,
      super.style,
      super.styleBuilder,
      this.bordered,
      this.color = AntdColor.danger,
      this.badge,
      this.dot,
      this.position = AntdBadgePosition.topRight,
      this.child,
      this.offset});

  /// 是否显示边框（默认false）
  final bool? bordered;

  /// 徽标背景色/小圆点颜色
  final AntdColor? color;

  /// 徽标显示内容（数字/文字等）
  final Widget? badge;

  /// 是否显示为小红点而非内容（默认false）
  final bool? dot;

  /// 徽标相对于子组件的位置
  final AntdBadgePosition position;

  /// 徽标包裹的子组件
  final Widget? child;

  /// 徽标自定义偏移量（相对默认位置调整）
  final Offset? offset;

  @override
  AntdBadgeStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var setColor = color?.getColor(token);
    var fontSize = (token.size.default_ + 1).roundToDouble();
    var textStyle =
        TextStyle(fontSize: fontSize, color: token.colorWhite, height: 1.4);
    var badgeStyle = AntdBoxStyle(
        color: setColor,
        border: bordered == true
            ? Border.all(color: textStyle.color!, width: 1)
            : null,
        radius: fontSize.radius.all,
        textStyle: textStyle,
        padding: EdgeInsets.symmetric(
            vertical: 0, horizontal: token.size.xs.roundToDouble()));
    return AntdBadgeStyle(
        dotStyle: AntdBoxStyle(
          size: 10,
          radius: 10.radius.all,
          color: setColor,
        ),
        badgeStyle: badgeStyle,
        bodyStyle: const AntdBoxStyle());
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdBadgeState();
  }

  @override
  AntdBadgeStyle margeStyle(
      AntdBadgeStyle defaultStyle, AntdBadgeStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdBadgeStyle, AntdBadge>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.badgeStyle;
  }

  @override
  AntdBadge getWidget(BuildContext context) {
    return this;
  }
}

class _AntdBadgeState extends State<AntdBadge> {
  ValueNotifier<Size> size = ValueNotifier(Size.zero);

  @override
  Widget build(BuildContext context) {
    final style = widget.getStyle(context);
    final offset = (widget.offset ?? style.offset) ?? Offset.zero;
    final isDot = widget.dot == true;

    double? getTop(Size size) {
      if (size == Size.zero) {
        return null;
      }

      if (widget.position == AntdBadgePosition.topLeft ||
          widget.position == AntdBadgePosition.topRight) {
        return -size.height / 2 + offset.dy;
      }
      return null;
    }

    double? getBottom(Size size) {
      if (size == Size.zero) {
        return null;
      }

      if (widget.position == AntdBadgePosition.bottomLeft ||
          widget.position == AntdBadgePosition.bottomRight) {
        return -size.height / 2 + offset.dy;
      }
      return null;
    }

    double? getRight(Size size) {
      if (size == Size.zero) {
        return null;
      }

      if (widget.position == AntdBadgePosition.topRight ||
          widget.position == AntdBadgePosition.bottomRight) {
        return -size.width / 2 + offset.dx;
      }
      return null;
    }

    double? getLeft(Size size) {
      if (size == Size.zero) {
        return null;
      }

      if (widget.position == AntdBadgePosition.topLeft ||
          widget.position == AntdBadgePosition.bottomLeft) {
        return -size.width / 2 + offset.dx;
      }
      return null;
    }

    var badge = AntdBox(
      style: style.bodyStyle,
      child: !isDot && widget.badge == null
          ? null
          : AntdBox(
              onLayout: (layoutContext) {
                if (!layoutContext.hasSizeChange) {
                  return;
                }
                setState(() {
                  size.value = layoutContext.renderBox.size;
                });
              },
              style: isDot ? style.dotStyle : style.badgeStyle,
              child: isDot ? null : widget.badge,
            ),
    );
    if (widget.child == null) {
      return badge;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        widget.child!,
        Positioned.fill(
            top: getTop(size.value),
            left: getLeft(size.value),
            bottom: getBottom(size.value),
            right: getRight(size.value),
            child: badge)
      ],
    );
  }
}
