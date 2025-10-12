import 'dart:ui';

import 'package:antd_flutter_mobile/components/box/painter.dart';
import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AntdLayoutContext {
  final Key? key;
  final bool hasSizeChange;
  final RenderBox renderBox;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final RenderAbstractViewport? viewport;
  final bool update;
  const AntdLayoutContext({
    this.key,
    required this.hasSizeChange,
    required this.renderBox,
    this.viewport,
    required this.update,
    required this.padding,
    required this.margin,
  });

  RevealedOffset? get offsetToReveal =>
      viewport?.getOffsetToReveal(renderBox, 0);

  EdgeInsets get insets => padding + margin;

  Size get size => renderBox.size;
  Size get removePaddingSize =>
      Size(size.width - padding.horizontal, size.height - padding.vertical);
  Size get removeMarginSize =>
      Size(size.width - margin.horizontal, size.height - margin.vertical);
  Size get removeInsetsSize =>
      Size(size.width - insets.horizontal, size.height - insets.vertical);
}

typedef AntdOnLayout = void Function(AntdLayoutContext ctx);

enum AntdBoxLayoutMode {
  fixedHeight,
  fixedWidth,
  factorHeight,
  factorWidth,
  aspectRatio,
}

enum AntdVisibility { hidden, visible }

enum AntdHapticFeedback { light, medium, heavy, none }

///基础样式
///@l [AntdBox]
class AntdKitStyle extends AntdStyle {
  /// 内边距
  final EdgeInsets? padding;

  /// 外边距
  final EdgeInsets? margin;

  /// 透明度
  final double? opacity;

  /// 背景色
  final Color? color;

  /// 边框
  final Border? border;

  /// 圆角
  final BorderRadius? radius;

  /// 共享的Text样式
  final TextStyle? textStyle;

  ///高度
  final double? height;

  ///最小高度
  final double? minHeight;

  ///宽度
  final double? width;

  ///最小宽度
  final double? minWidth;

  /// 统一尺寸（同时影响 width/height，优先级最低）
  final double? size;

  ///布局行为模式
  final List<AntdBoxLayoutMode>? layoutModes;

  ///毛玻璃效果
  final double? backdropFilter;

  ///阴影
  final List<BoxShadow>? shadows;

  ///渐变
  final Gradient? gradient;

  ///子容器的对齐方式
  final Alignment? alignment;

  ///可见状态
  final AntdVisibility? visibility;

  ///震动反馈
  final AntdHapticFeedback? hapticFeedback;

  ///颜色过滤
  final ColorFilter? colorFilter;

  const AntdKitStyle(
      {super.inherit,
      this.padding,
      this.margin,
      this.opacity,
      this.color,
      this.border,
      this.radius,
      this.textStyle,
      this.height,
      this.minHeight,
      this.width,
      this.minWidth,
      this.size,
      this.layoutModes,
      this.backdropFilter,
      this.shadows,
      this.gradient,
      this.alignment,
      this.visibility,
      this.hapticFeedback,
      this.colorFilter});

  @override
  AntdKitStyle copyFrom(covariant AntdKitStyle? style) {
    if (style == null) {
      return this;
    }

    return copyWith(
        padding: style.padding,
        margin: style.margin,
        opacity: style.opacity,
        color: style.color,
        border: style.border,
        radius: style.radius,
        textStyle: style.textStyle,
        height: style.height,
        minHeight: style.minHeight,
        width: style.width,
        minWidth: style.minWidth,
        size: style.size,
        layoutModes: style.layoutModes,
        backdropFilter: style.backdropFilter,
        shadows: style.shadows,
        gradient: style.gradient,
        alignment: style.alignment,
        visibility: style.visibility,
        hapticFeedback: style.hapticFeedback,
        colorFilter: style.colorFilter);
  }

  AntdKitStyle copyWith(
      {final EdgeInsets? padding,
      final EdgeInsets? margin,
      final double? opacity,
      final Color? color,
      final Border? border,
      final BorderRadius? radius,
      final TextStyle? textStyle,
      final double? height,
      final double? minHeight,
      final double? width,
      final double? minWidth,
      final double? size,
      final bool expand = false,
      final bool shrink = false,
      final List<AntdBoxLayoutMode>? layoutModes,
      final double? backdropFilter,
      final List<BoxShadow>? shadows,
      final Gradient? gradient,
      final Alignment? alignment,
      final AntdVisibility? visibility,
      final AntdHapticFeedback? hapticFeedback,
      final ColorFilter? colorFilter}) {
    if (!inherit) {
      return this;
    }
    TextStyle? mergeTextStyle;
    if (this.textStyle == null) {
      mergeTextStyle = textStyle;
    } else {
      mergeTextStyle = this.textStyle!.merge(textStyle);
    }

    return AntdKitStyle(
        padding: padding ?? this.padding,
        margin: margin ?? this.margin,
        opacity: opacity ?? this.opacity,
        color: color ?? this.color,
        border: border ?? this.border,
        radius: radius ?? this.radius,
        textStyle: mergeTextStyle,
        height: height ?? this.height,
        minHeight: minHeight ?? this.minHeight,
        width: width ?? this.width,
        minWidth: minWidth ?? this.minWidth,
        size: size ?? this.size,
        layoutModes: layoutModes ?? this.layoutModes,
        backdropFilter: backdropFilter ?? this.backdropFilter,
        shadows: shadows ?? this.shadows,
        gradient: gradient ?? this.gradient,
        alignment: alignment ?? this.alignment,
        visibility: visibility ?? this.visibility,
        hapticFeedback: hapticFeedback ?? this.hapticFeedback,
        colorFilter: colorFilter ?? this.colorFilter);
  }

  bool get hasSize =>
      height != null ||
      minHeight != null ||
      width != null ||
      minWidth != null ||
      size != null;

  Size get margeSize => Size(width ?? size ?? 0, height ?? size ?? 0);

  Widget? buildSize([Widget? child]) {
    if (!hasSize) {
      return child;
    }
    final width = this.width ?? size;
    final height = this.height ?? size;
    if (minHeight != null || minWidth != null) {
      return ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: width ?? double.infinity,
            minWidth: minWidth ?? 0,
            maxHeight: height ?? double.infinity,
            minHeight: minHeight ?? 0),
        child: child,
      );
    }

    List<AntdBoxLayoutMode> behaviorModes = layoutModes ?? [];

    if (behaviorModes.contains(AntdBoxLayoutMode.aspectRatio) &&
        width != null &&
        height != null) {
      return AspectRatio(
        aspectRatio: width / height,
        child: child,
      );
    }

    if ((height != null || width != null) && behaviorModes.isEmpty) {
      return SizedBox(
        height: height,
        width: width,
        child: child,
      );
    }
    if (behaviorModes.contains(AntdBoxLayoutMode.factorWidth) &&
        width != null) {
      child = FractionallySizedBox(
        widthFactor: width,
        child: child,
      );
    }
    if (behaviorModes.contains(AntdBoxLayoutMode.factorHeight) &&
        height != null) {
      child = FractionallySizedBox(
        heightFactor: height,
        child: child,
      );
    }

    if (behaviorModes.contains(AntdBoxLayoutMode.fixedHeight) &&
        height != null) {
      child = SizedBox(
        height: height,
        child: child,
      );
    }

    if (behaviorModes.contains(AntdBoxLayoutMode.fixedWidth) && width != null) {
      child = SizedBox(
        width: width,
        child: child,
      );
    }

    return child;
  }

  Widget render([Widget? child]) {
    var wrapChild = child ?? const SizedBox.shrink();

    if (alignment != null) {
      wrapChild = Align(
        alignment: alignment!,
        child: wrapChild,
      );
    }

    wrapChild = buildSize(wrapChild)!;

    if (padding != null) {
      wrapChild = Padding(
        padding: padding!,
        child: wrapChild,
      );
    }

    if (textStyle != null) {
      wrapChild = DefaultTextStyle(
        style: textStyle!,
        child: wrapChild,
      );
    }

    wrapChild = CustomPaint(
      painter: AntdBoxPainter(
          gradient: gradient,
          borderRadius: radius,
          border: border,
          backgroundColor: color,
          shadows: shadows),
      child: wrapChild,
    );

    if (backdropFilter != null && backdropFilter! > 0) {
      wrapChild = ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: backdropFilter!, sigmaY: backdropFilter!),
          child: wrapChild,
        ),
      );
    }

    if (margin != null) {
      wrapChild = Padding(
        padding: margin!,
        child: wrapChild,
      );
    }

    if (visibility != null) {
      var result = visibility == AntdVisibility.visible;
      wrapChild = Visibility(
        visible: false,
        maintainSize: result,
        maintainAnimation: result,
        maintainState: result,
        child: wrapChild,
      );
    }

    if (opacity != null) {
      wrapChild = Opacity(
        opacity: opacity!,
        child: wrapChild,
      );
    }

    if (colorFilter != null) {
      wrapChild = ColorFiltered(
        colorFilter: colorFilter!,
        child: wrapChild,
      );
    }
    return wrapChild;
  }
}

///盒子样式
///@l [AntdBox]
class AntdBoxStyle extends AntdKitStyle {
  ///获取焦点后的样式
  ///@l[AntdBox]
  final AntdKitStyle? focusStyle;

  ///禁用后的样式
  ///@l[AntdBox]
  final AntdKitStyle? disabledStyle;

  ///激活后的样式
  ///@l[AntdBox]
  final AntdKitStyle? feedbackStyle;

  ///触摸配置 优先级低于[AntdBox]上的options
  final AntdTapOptions? options;

  const AntdBoxStyle(
      {super.inherit,
      super.padding,
      super.margin,
      super.opacity,
      super.color,
      super.border,
      super.radius,
      super.textStyle,
      super.height,
      super.minHeight,
      super.width,
      super.minWidth,
      super.size,
      super.layoutModes,
      super.backdropFilter,
      super.shadows,
      super.gradient,
      super.alignment,
      super.visibility,
      super.hapticFeedback,
      super.colorFilter,
      this.focusStyle,
      this.disabledStyle,
      this.feedbackStyle,
      this.options});

  @override
  AntdBoxStyle copyFrom(covariant AntdBoxStyle? style) {
    if (style == null) {
      return this;
    }

    return copyWith(
        padding: style.padding,
        margin: style.margin,
        opacity: style.opacity,
        color: style.color,
        border: style.border,
        radius: style.radius,
        textStyle: style.textStyle,
        height: style.height,
        minHeight: style.minHeight,
        width: style.width,
        minWidth: style.minWidth,
        size: style.size,
        layoutModes: style.layoutModes,
        backdropFilter: style.backdropFilter,
        shadows: style.shadows,
        gradient: style.gradient,
        alignment: style.alignment,
        visibility: style.visibility,
        hapticFeedback: style.hapticFeedback,
        colorFilter: style.colorFilter,
        focusStyle: focusStyle.merge(style.focusStyle),
        disabledStyle: disabledStyle.merge(style.disabledStyle),
        feedbackStyle: feedbackStyle.merge(style.feedbackStyle),
        options:
            options == null ? style.options : options?.copyFrom(style.options));
  }

  AntdBoxStyle overFrom(covariant AntdKitStyle? style) {
    if (style == null || !inherit) {
      return this;
    }

    return copyWith(
      padding: style.padding,
      margin: style.margin,
      opacity: style.opacity,
      color: style.color,
      border: style.border,
      radius: style.radius,
      textStyle: style.textStyle,
      height: style.height,
      minHeight: style.minHeight,
      width: style.width,
      minWidth: style.minWidth,
      size: style.size,
      layoutModes: style.layoutModes,
      backdropFilter: style.backdropFilter,
      shadows: style.shadows,
      gradient: style.gradient,
      alignment: style.alignment,
      visibility: style.visibility,
      hapticFeedback: style.hapticFeedback,
      colorFilter: style.colorFilter,
    );
  }

  @override
  AntdBoxStyle copyWith(
      {final EdgeInsets? padding,
      final EdgeInsets? margin,
      final double? opacity,
      final Color? color,
      final Border? border,
      final BorderRadius? radius,
      final TextStyle? textStyle,
      final double? height,
      final double? minHeight,
      final double? width,
      final double? minWidth,
      final double? size,
      final bool expand = false,
      final bool shrink = false,
      final List<AntdBoxLayoutMode>? layoutModes,
      final double? backdropFilter,
      final List<BoxShadow>? shadows,
      final Gradient? gradient,
      final Alignment? alignment,
      final AntdVisibility? visibility,
      final AntdHapticFeedback? hapticFeedback,
      final AntdKitStyle? focusStyle,
      final AntdKitStyle? disabledStyle,
      final AntdKitStyle? feedbackStyle,
      final ColorFilter? colorFilter,
      final AntdTapOptions? options}) {
    if (!inherit) {
      return this;
    }
    TextStyle? mergeTextStyle;
    if (this.textStyle == null) {
      mergeTextStyle = textStyle;
    } else {
      mergeTextStyle = this.textStyle!.merge(textStyle);
    }

    return AntdBoxStyle(
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      opacity: opacity ?? this.opacity,
      color: color ?? this.color,
      border: border ?? this.border,
      radius: radius ?? this.radius,
      textStyle: mergeTextStyle,
      height: height ?? this.height,
      minHeight: minHeight ?? this.minHeight,
      width: width ?? this.width,
      minWidth: minWidth ?? this.minWidth,
      size: size ?? this.size,
      layoutModes: layoutModes ?? this.layoutModes,
      backdropFilter: backdropFilter ?? this.backdropFilter,
      shadows: shadows ?? this.shadows,
      gradient: gradient ?? this.gradient,
      alignment: alignment ?? this.alignment,
      visibility: visibility ?? this.visibility,
      hapticFeedback: hapticFeedback ?? this.hapticFeedback,
      colorFilter: colorFilter ?? this.colorFilter,
      focusStyle: this.focusStyle.merge(focusStyle),
      feedbackStyle: this.feedbackStyle.merge(feedbackStyle),
      disabledStyle: this.disabledStyle.merge(disabledStyle),
      options: this.options == null ? options : this.options?.copyFrom(options),
    );
  }
}
