import 'dart:math';

import 'package:antd_flutter/index.dart';
import 'package:flutter/widgets.dart';

/// 样式
/// @l [AntdPopover]
class AntdPopoverActionStyle extends AntdStyle {
  /// 操作项整体容器的样式配置
  final AntdBoxStyle? bodyStyle;

  /// 操作项内容构建区域的样式配置
  final AntdBoxStyle? builderStyle;

  /// 对齐样式
  final AntdFlexStyle? builderRowStyle;

  /// 操作项图标的样式配置
  final AntdIconStyle? iconStyle;

  const AntdPopoverActionStyle(
      {super.inherit,
      this.bodyStyle,
      this.builderStyle,
      this.builderRowStyle,
      this.iconStyle});

  @override
  AntdPopoverActionStyle copyFrom(covariant AntdPopoverActionStyle? style) {
    return AntdPopoverActionStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      builderStyle: builderStyle.merge(style?.builderStyle),
      builderRowStyle: builderRowStyle.merge(style?.builderRowStyle),
      iconStyle: iconStyle.merge(style?.iconStyle),
    );
  }
}

/// action
/// @l [AntdPopover]
class AntdPopoverAction
    extends AntdComponent<AntdPopoverActionStyle, AntdPopoverAction> {
  /// 是否禁用该操作项，禁用时不可点击且样式变灰
  final bool? disabled;

  /// 操作项前显示的图标组件
  final Widget? icon;

  /// 点击操作项时的回调函数，接收一个关闭弹层的方法
  final void Function(AntdLayerClose close)? onTap;

  /// 构建操作项内容的构建器，用于自定义操作项的显示内容
  final AntdMaskBuilder? builder;

  ///是不是最后的选项
  final bool? last;

  const AntdPopoverAction(
      {super.key,
      super.style,
      super.styleBuilder,
      this.disabled,
      this.icon,
      this.onTap,
      this.builder,
      this.last});

  AntdPopoverAction copyFrom(AntdPopoverAction? action) {
    return AntdPopoverAction(
      style: action?.style ?? style,
      styleBuilder: action?.styleBuilder ?? styleBuilder,
      icon: action?.icon ?? icon,
      disabled: action?.disabled ?? disabled,
      onTap: action?.onTap ?? onTap,
      builder: action?.builder ?? builder,
      last: action?.last ?? last,
    );
  }

  @override
  AntdPopoverActionStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return const AntdPopoverActionStyle(
        builderRowStyle: AntdFlexStyle(
      mainAxisSize: MainAxisSize.min,
    ));
  }

  @override
  AntdPopoverAction getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdPopoverActionStyle margeStyle(
      AntdPopoverActionStyle defaultStyle, AntdPopoverActionStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  Widget render(BuildContext context, AntdPopoverActionStyle style) {
    layerClose([dynamic data]) async {}
    return AntdBox(
      style: style.bodyStyle
          ?.copyWith(border: last == true ? BorderSide.none.bottom : null),
      disabled: disabled,
      onTap: onTap != null
          ? () {
              onTap?.call(layerClose);
            }
          : null,
      child: AntdRow(
        style: style.builderRowStyle,
        children: [
          if (icon != null)
            AntdStyleProvider<AntdIconStyle>(
                style: style.iconStyle, child: icon!),
          Expanded(
              child: AntdBox(
            style: style.builderStyle,
            child: builder?.call(layerClose, AntdMaskState()),
          ))
        ],
      ),
    );
  }
}

/// 弹出框整体样式配置类（继承自遮罩样式）
/// @l [AntdPopover]
class AntdPopoverStyle extends AntdMaskStyle {
  /// child的样式
  final AntdBoxStyle? childStyle;

  /// 弹出框内容区域的样式
  final AntdBoxStyle? builderStyle;

  /// Action的样式
  final AntdPopoverActionStyle? actionStyle;

  /// Action的对齐样式
  final AntdFlexStyle? actionColumnStyle;

  ///弹出层样式
  final AntdPopoverBoxStyle? popoverBoxStyle;

  /// 创建弹出框样式配置
  const AntdPopoverStyle({
    /// 是否通过控制器控制显示/隐藏（继承自父类）
    super.inherit,

    ///child
    this.childStyle,

    /// 内容区域样式
    this.builderStyle,

    /// 操作区域样式
    this.actionStyle,
    this.actionColumnStyle,

    /// 外层容器样式
    this.popoverBoxStyle,

    /// 遮罩层颜色（继承自父类）
    super.maskColor,

    /// 遮罩层透明度（继承自父类）
    super.maskOpacity,
  });

  @override
  AntdPopoverStyle copyFrom(covariant AntdPopoverStyle? style) {
    return AntdPopoverStyle(
      childStyle: childStyle.merge(style?.childStyle),
      builderStyle: builderStyle.merge(style?.builderStyle),
      actionStyle: actionStyle.merge(style?.actionStyle),
      actionColumnStyle: actionColumnStyle.merge(style?.actionColumnStyle),
      popoverBoxStyle: popoverBoxStyle.merge(style?.popoverBoxStyle),
      maskColor: style?.maskColor ?? maskColor,
      maskOpacity: style?.maskOpacity ?? maskOpacity,
    );
  }
}

enum AntdPopoverTrigger { tap, longPress, show }

enum AntdPopoverMode { light, dark }

class AntdPopoverController {
  _AntdPopoverState? _state;

  Future<T?> open<T>() async {
    return await _state?.open();
  }

  dispose() {
    _state = null;
  }
}

///@t 气泡弹出框
///@g 反馈
///@o 88
///@d 点击元素，弹出气泡式的菜单。
///@u 适用于功能的导航，只可由导航栏上图标唤起，通常用于收纳低频使用的功能。
class AntdPopover extends AntdMaskProxy<AntdPopoverStyle, AntdPopover> {
  const AntdPopover(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.builder,
      super.opacity = AntdMaskOpacity.transparent,
      super.dismissOnMaskTap = true,
      super.showMask = true,
      super.animationDuration = const Duration(milliseconds: 200),
      required this.child,
      this.actions,
      this.placement = AntdPlacement.top,
      this.mode = AntdPopoverMode.light,
      this.closeOnAction = true,
      this.controller,
      this.trigger = AntdPopoverTrigger.tap});

  ///弹出内容，比actions优先级更高
  final Widget child;

  ///当执行action后关闭
  final bool closeOnAction;

  ///菜单
  final List<AntdPopoverAction>? actions;

  ///弹出的位置
  final AntdPlacement placement;

  ///设置亮色模式或者黑色模式
  final AntdPopoverMode mode;

  ///控制器,如果使用了控制器必须要手动打开，内部的点击会失效
  final AntdPopoverController? controller;

  ///如何处罚气泡
  final AntdPopoverTrigger trigger;

  @override
  State<StatefulWidget> createState() {
    return _AntdPopoverState();
  }

  @override
  AntdPopoverStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var color = mode == AntdPopoverMode.light
        ? token.colorWhite
        : token.colorBlack.withValues(alpha: 0.75);
    var textStyle = token.font.md.copyWith(
        color:
            mode == AntdPopoverMode.light ? token.colorText : token.colorWhite);
    var action = actions != null && builder == null;
    var builderStyle = AntdBoxStyle(
        color: color,
        textStyle: textStyle,
        radius: token.radius.default_.radius.all,
        padding: action
            ? token.size.lg.left
            : token.size.default_.vertical.marge(token.size.lg.horizontal));
    var style = AntdPopoverStyle(
        childStyle: const AntdBoxStyle(),
        builderStyle: builderStyle,
        actionStyle: AntdPopoverActionStyle(
          bodyStyle: AntdBoxStyle(
              textStyle: token.font.md.copyWith(
                  color:
                      mode == AntdPopoverMode.dark ? token.colorWhite : null),
              border: token.borderSide
                  .copyWith(
                      color: mode == AntdPopoverMode.dark
                          ? token.colorWhite
                          : token.colorBorder)
                  .bottom,
              padding: token.size.lg.vertical.marge(token.size.lg.right)),
          builderStyle: const AntdBoxStyle(),
          builderRowStyle: const AntdFlexStyle(),
          iconStyle: AntdIconStyle(
              color: mode == AntdPopoverMode.dark
                  ? token.colorWhite
                  : token.colorText,
              size: 20,
              bodyStyle: AntdBoxStyle(margin: token.size.default_.right)),
        ),
        actionColumnStyle: const AntdFlexStyle(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
        popoverBoxStyle: AntdPopoverBoxStyle(
          bodyStyle: AntdBoxStyle(shadows: token.boxShadow),
          arrowStyle: AntdArrowStyle(
              size: const Size(15, 8), color: color, bluntness: 1),
        ),
        maskOpacity: getOpacity());
    return margeStyle(
        style, theme.popoverStyle?.call(context, this, style, token));
  }

  @override
  AntdStyleBuilder<AntdPopoverStyle, AntdPopover>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.popoverStyle;
  }

  @override
  AntdPopoverStyle margeStyle(
      AntdPopoverStyle defaultStyle, AntdPopoverStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdPopover getWidget(BuildContext context) {
    return this;
  }
}

class _AntdPopoverState
    extends AntdMaskProxyState<AntdPopoverStyle, AntdPopover> {
  RenderBox? renderBox;

  @override
  void updateDependentValues(covariant AntdPopover? oldWidget) {
    super.updateDependentValues(oldWidget);
    if (widget.controller != oldWidget?.controller) {
      widget.controller?._state = this;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.trigger == AntdPopoverTrigger.show) {
        open();
      }
    });
  }

  @override
  Widget render(BuildContext context) {
    return AntdBox(
      style: style.childStyle,
      onTap:
          widget.controller != null || widget.trigger != AntdPopoverTrigger.tap
              ? null
              : () async {
                  await open();
                },
      onLongPress: widget.controller != null ||
              widget.trigger != AntdPopoverTrigger.longPress
          ? null
          : () async {
              await open();
            },
      onLayout: (context) {
        renderBox = context.renderBox;
      },
      child: widget.child,
    );
  }

  @override
  Widget buildBuilder(
      Widget? child, AntdLayerClose close, AntdMaskState state) {
    if (renderBox == null) {
      return const AntdBox();
    }
    var target = AntdPopoverTarget(
        offset: renderBox!.localToGlobal(Offset.zero), size: renderBox!.size);

    if (widget.actions != null) {
      child = AntdStyleProvider<AntdPopoverActionStyle>(
          style: style.actionStyle,
          child: IntrinsicWidth(
            child: AntdColumn(
              style: style.actionColumnStyle,
              children: widget.actions!.map((value) {
                return value.copyFrom(AntdPopoverAction(
                  last: widget.actions?.last == value,
                  onTap: value.onTap != null
                      ? (_) {
                          value.onTap!.call(close);
                          if (widget.closeOnAction) {
                            close();
                          }
                        }
                      : null,
                  builder: value.builder != null
                      ? (close, ctx) {
                          return value.builder!.call(close, ctx);
                        }
                      : null,
                ));
              }).toList(),
            ),
          ));
    }
    return AntdStyleProvider<AntdPopoverBoxStyle>(
        style: style.popoverBoxStyle,
        child: AntdPopoverBox(
          target: target,
          placement: widget.placement,
          child: AntdBox(
            style: style.builderStyle,
            child: child,
          ),
        ));
  }
}

class AntdPopoverTarget {
  final Offset offset;
  final Size size;

  const AntdPopoverTarget({required this.offset, required this.size});

  static const AntdPopoverTarget zero =
      AntdPopoverTarget(offset: Offset.zero, size: Size.zero);
}

class AntdPopoverBoxStyle extends AntdStyle {
  /// 弹出层内容区域的样式设置
  final AntdBoxStyle? bodyStyle;

  /// 弹出层相对于目标元素的偏移量
  final Offset offset;

  /// 箭头相对于弹出层的偏移量
  final Offset arrowOffset;

  /// 箭头的样式配置
  final AntdArrowStyle? arrowStyle;

  const AntdPopoverBoxStyle(
      {super.inherit,
      this.bodyStyle,
      this.offset = Offset.zero,
      this.arrowOffset = Offset.zero,
      this.arrowStyle});

  @override
  AntdPopoverBoxStyle copyFrom(covariant AntdPopoverBoxStyle? style) {
    return AntdPopoverBoxStyle(
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        offset: style?.offset ?? offset,
        arrowOffset: style?.arrowOffset ?? arrowOffset,
        arrowStyle: arrowStyle.merge(style?.arrowStyle));
  }
}

class AntdPopoverBox
    extends AntdStateComponent<AntdPopoverBoxStyle, AntdPopoverBox> {
  /// 触发弹出层的子组件，通常是按钮、文本等可点击元素
  final Widget child;

  /// 弹出层的显示位置
  final AntdPlacement placement;

  /// 弹出层的目标元素配置
  final AntdPopoverTarget target;

  const AntdPopoverBox(
      {super.key,
      super.style,
      super.styleBuilder,
      required this.child,
      required this.target,
      required this.placement});

  @override
  State<StatefulWidget> createState() {
    return _AntdPopoverBoxState();
  }

  @override
  AntdPopoverBoxStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return const AntdPopoverBoxStyle();
  }

  @override
  AntdPopoverBox getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdPopoverBoxStyle margeStyle(
      AntdPopoverBoxStyle defaultStyle, AntdPopoverBoxStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

class _AntdPopoverBoxState
    extends AntdState<AntdPopoverBoxStyle, AntdPopoverBox> {
  Size? popoverSize;

  @override
  Widget render(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    var childList = <Widget>[];

    var offset = getOffset() + (style.offset);
    var arrowOffset = getArrowOffset() - (style.arrowOffset);
    var arrow = Transform.translate(
      offset: arrowOffset,
      child: AntdStyleProvider<AntdArrowStyle>(
          style: style.arrowStyle,
          child: AntdArrow(
            placement: widget.placement,
          )),
    );
    if (widget.placement.before) {
      childList.add(arrow);
    }

    childList.add(widget.child);

    if (!widget.placement.before) {
      childList.add(arrow);
    }

    return Stack(
      fit: StackFit.loose,
      children: [
        Positioned(
            top: max(offset.dy, padding.top + 20),
            left: offset.dx,
            child: AntdBox(
              style: style.bodyStyle,
              onLayout: (ctx) {
                if (popoverSize == null || ctx.hasSizeChange) {
                  setState(() {
                    popoverSize = ctx.size;
                  });
                }
              },
              child: widget.placement.horizontal
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: childList,
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: childList,
                    ),
            ))
      ],
    );
  }

  Offset getArrowOffset() {
    final targetSize = widget.target.size;
    final popoverSize = this.popoverSize ?? Size.zero;

    if ((widget.placement.horizontal &&
            popoverSize.height < targetSize.height) ||
        (!widget.placement.horizontal &&
            popoverSize.width < targetSize.width)) {
      return Offset.zero;
    }

    // 计算目标中心点相对于弹出层的位置
    double centerOffset = (widget.placement.horizontal
            ? popoverSize.height - targetSize.height
            : popoverSize.width - targetSize.width) /
        2;

    switch (widget.placement) {
      case AntdPlacement.top:
        return Offset.zero;
      case AntdPlacement.topLeft:
        return Offset(-centerOffset, 0);
      case AntdPlacement.topRight:
        return Offset(centerOffset, 0);

      case AntdPlacement.bottom:
        return Offset.zero;
      case AntdPlacement.bottomLeft:
        return Offset(-centerOffset, 0);
      case AntdPlacement.bottomRight:
        return Offset(centerOffset, 0);

      case AntdPlacement.left:
        return Offset.zero;
      case AntdPlacement.leftTop:
        return Offset(0, -centerOffset);
      case AntdPlacement.leftBottom:
        return Offset(0, centerOffset);

      case AntdPlacement.right:
        return Offset.zero;
      case AntdPlacement.rightTop:
        return Offset(0, -centerOffset);
      case AntdPlacement.rightBottom:
        return Offset(0, centerOffset);
    }
  }

  Offset getOffset() {
    final targetSize = widget.target.size;
    final targetOffset = widget.target.offset;
    final popoverSize = this.popoverSize ?? Size.zero;

    switch (widget.placement) {
      case AntdPlacement.top:
        return Offset(
          targetOffset.dx + targetSize.width / 2 - popoverSize.width / 2,
          targetOffset.dy - popoverSize.height,
        );
      case AntdPlacement.topLeft:
        return Offset(
          targetOffset.dx,
          targetOffset.dy - popoverSize.height,
        );
      case AntdPlacement.topRight:
        return Offset(
          targetOffset.dx + targetSize.width - popoverSize.width,
          targetOffset.dy - popoverSize.height,
        );
      case AntdPlacement.bottom:
        return Offset(
          targetOffset.dx + targetSize.width / 2 - popoverSize.width / 2,
          targetOffset.dy + targetSize.height,
        );
      case AntdPlacement.bottomLeft:
        return Offset(
          targetOffset.dx,
          targetOffset.dy + targetSize.height,
        );
      case AntdPlacement.bottomRight:
        return Offset(
          targetOffset.dx + targetSize.width - popoverSize.width,
          targetOffset.dy + targetSize.height,
        );
      case AntdPlacement.left:
        return Offset(
          targetOffset.dx - popoverSize.width,
          targetOffset.dy + targetSize.height / 2 - popoverSize.height / 2,
        );
      case AntdPlacement.leftTop:
        return Offset(
          targetOffset.dx - popoverSize.width,
          targetOffset.dy,
        );
      case AntdPlacement.leftBottom:
        return Offset(
          targetOffset.dx - popoverSize.width,
          targetOffset.dy + targetSize.height - popoverSize.height,
        );
      case AntdPlacement.right:
        return Offset(
          targetOffset.dx + targetSize.width,
          targetOffset.dy + targetSize.height / 2 - popoverSize.height / 2,
        );
      case AntdPlacement.rightTop:
        return Offset(
          targetOffset.dx + targetSize.width,
          targetOffset.dy,
        );
      case AntdPlacement.rightBottom:
        return Offset(
          targetOffset.dx + targetSize.width,
          targetOffset.dy + targetSize.height - popoverSize.height,
        );
    }
  }
}
