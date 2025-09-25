import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

class AntdDropdownAnimation
    extends AntdMaskBaseAnimation<AntdDropdown, AntdDropdownState> {
  const AntdDropdownAnimation(
      {super.disable,
      super.duration,
      super.maskAnimated = const AntdMaskDefaultAnimated(),
      super.contentAnimated = const AntdDropdownContentDefaultAnimated()});

  @override
  AntdDropdownAnimation copyFrom(covariant AntdDropdownAnimation? style) {
    return AntdDropdownAnimation(
      disable: style?.disable ?? disable,
      duration: style?.duration ?? duration,
      maskAnimated: style?.maskAnimated ?? maskAnimated,
      contentAnimated: style?.contentAnimated ?? contentAnimated,
    );
  }
}

class AntdDropdownContentDefaultAnimated
    extends AntdAnimated<AntdDropdown, AntdDropdownState> {
  const AntdDropdownContentDefaultAnimated();
  @override
  Widget build(AnimationController controller, Widget? child,
      AntdAnimatedContext<AntdDropdown, AntdDropdownState> context) {
    var state = context.state;
    var renderBox = state.contentRenderBox;
    if (renderBox == null) {
      return AntdBox(
        style: const AntdBoxStyle(visibility: AntdVisibility.visible),
        child: child,
      );
    }
    var offsetY = state.getOffsetY();
    var tween =
        Tween(begin: offsetY - renderBox.size.height, end: offsetY).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 1, curve: Curves.easeOutCubic),
      ),
    );
    var animatedChild = AnimatedBuilder(
        animation: tween,
        builder: (ctx, _) {
          return Stack(
            fit: StackFit.loose,
            children: [
              Positioned(
                  top: tween.value,
                  left: 0,
                  right: 0,
                  child: child ?? const AntdBox())
            ],
          );
        });
    return ClipPath(
      clipper: AntdMaskHoleClipper(hole: state.targetHole),
      child: animatedChild,
    );
  }
}

/// 下拉框内容
/// @l [AntdDropdown]
class AntdDropdownItem {
  /// 下拉菜单的触发元素
  /// [open] 表示当前下拉菜单的展开状态
  /// 返回一个Widget作为触发下拉的按钮或元素
  final Widget Function(bool open) child;

  /// 下拉菜单的内容元素
  /// [close] 用于关闭下拉层的回调函数
  /// [state] 当前遮罩层的状态信息
  /// 返回一个Widget作为下拉菜单的内容
  final AntdMaskBuilder<AntdDropdownState> item;

  const AntdDropdownItem({required this.child, required this.item});
}

///样式
///@l [AntdDropdown]
class AntdDropdownStyle extends AntdMaskBaseStyle {
  /// 下拉菜单主体容器的样式配置
  /// 用于设置下拉菜单整体的背景色、边框、圆角、阴影等样式
  final AntdBoxStyle? bodyStyle;

  /// 触发元素横向布局的样式配置
  /// 当触发元素需要横向排列时，用于设置Flex布局的样式
  final AntdFlexStyle? childRowStyle;

  /// 触发元素容器的样式配置
  /// 用于设置触发按钮或元素的包装容器样式
  final AntdBoxStyle? childStyle;

  /// 下拉菜单内容项的样式配置
  /// 用于设置下拉菜单内部选项列表的容器样式
  final AntdBoxStyle? itemStyle;

  /// 下拉菜单内容项下方的样式配置
  /// 用于设置下拉菜单内部选项列表的容器样式
  final AntdBoxStyle? extraStyle;

  ///图标样式
  final AntdIconStyle? iconStyle;

  ///默认的图标
  final Widget? icon;

  ///图标样式
  final AntdIconStyle? activeIconStyle;

  ///激活后的图标
  final Widget? activeIcon;

  ///动画
  final AntdDropdownAnimation? animation;

  const AntdDropdownStyle(
      {super.inherit,
      super.maskColor,
      super.maskOpacity,
      this.bodyStyle,
      this.childRowStyle,
      this.childStyle,
      this.itemStyle,
      this.extraStyle,
      this.iconStyle,
      this.icon,
      this.activeIconStyle,
      this.activeIcon,
      this.animation});

  @override
  AntdDropdownStyle copyFrom(covariant AntdDropdownStyle? style) {
    return AntdDropdownStyle(
        maskColor: style?.maskColor ?? maskColor,
        maskOpacity: style?.maskOpacity ?? maskOpacity,
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        childRowStyle: childRowStyle.merge(style?.childRowStyle),
        childStyle: childStyle.merge(style?.childStyle),
        itemStyle: itemStyle.merge(style?.itemStyle),
        extraStyle: extraStyle.merge(style?.extraStyle),
        iconStyle: iconStyle.merge(style?.iconStyle),
        icon: style?.icon ?? icon,
        activeIconStyle: activeIconStyle.mergeActive(
            iconStyle, style?.iconStyle, style?.activeIconStyle),
        activeIcon: style?.activeIcon ?? activeIcon,
        animation: animation.merge(style?.animation));
  }
}

///@t 下拉菜单
///@g 信息展示
///@o 78
///@d 向下弹出的菜单面板。
///@u 适用于筛选、排序并更改当前页面内容展示范围或顺序。
class AntdDropdown
    extends AntdBaseMask<AntdDropdownStyle, AntdDropdown, AntdDropdownState> {
  const AntdDropdown(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.builder,
      super.opacity = AntdMaskOpacity.thin,
      super.dismissOnMaskTap = true,
      super.showMask = true,
      required this.items,
      this.icon,
      this.activeIcon,
      this.extra,
      this.animation});

  ///内容
  final List<AntdDropdownItem> items;

  ///默认的图标
  final Widget? icon;

  ///激活后的图标
  final Widget? activeIcon;

  ///额外区域,始终位于菜单下方
  final AntdMaskBuilder<AntdDropdownState>? extra;

  ///动画
  final AntdDropdownAnimation? animation;

  @override
  State<StatefulWidget> createState() {
    return AntdDropdownState();
  }

  @override
  AntdDropdownStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdDropdownStyle(
        bodyStyle: AntdBoxStyle(
            color: token.colorBgContainer, border: token.border.bottom),
        childStyle: AntdBoxStyle(
            padding: token.size.md.all,
            alignment: Alignment.center,
            options: const AntdTapOptions(alwaysReceiveTap: true)),
        itemStyle: AntdBoxStyle(
            width: double.infinity,
            padding: token.size.md.all,
            color: token.colorBgContainer),
        extraStyle: AntdBoxStyle(
            width: double.infinity,
            color: token.colorBgContainer,
            padding: token.size.md.horizontal.marge(token.size.xs.vertical)),
        icon: const AntdIcon(
          icon: AntdIcons.downFill,
        ),
        activeIcon: const AntdIcon(
          icon: AntdIcons.upFill,
        ),
        iconStyle: AntdIconStyle(size: 16, color: token.colorText.secondary),
        animation:
            const AntdDropdownAnimation(duration: Duration(milliseconds: 400)));
  }

  @override
  AntdDropdown getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdDropdownStyle margeStyle(
      AntdDropdownStyle defaultStyle, AntdDropdownStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

class AntdDropdownState extends AntdMaskProxyState<AntdDropdownStyle,
    AntdDropdown, AntdDropdownState> {
  RenderBox? renderBox;
  RenderBox? contentRenderBox;
  late int currentIndex = -1;

  double getOffsetY() {
    if (renderBox == null) {
      return 0.0;
    }

    var offset = renderBox!.localToGlobal(Offset.zero);
    return offset.dy + renderBox!.size.height;
  }

  @override
  void dispose() {
    renderBox = null;
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    super.render(context);
    return AntdBox(
      style: style.bodyStyle,
      onLayout: (ctx) {
        renderBox = ctx.renderBox;
      },
      child: AntdRow(
          style: style.childRowStyle,
          children: widget.items.map((item) {
            var index = widget.items.indexOf(item);

            return Expanded(
                child: AntdBox(
              style: style.childStyle,
              onTap: () {
                if (renderBox == null) {
                  return;
                }

                setState(() {
                  currentIndex = index;
                });
                if (!opened) {
                  open(
                      AntdMaskHole(
                          hitTest: true,
                          offset: Offset.zero,
                          size: Size(double.infinity, getOffsetY())),
                      false);
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  item.child(index == currentIndex),
                  AntdIconWrap(
                      style: style.iconStyle,
                      child: (index == currentIndex
                          ? (widget.activeIcon ?? style.activeIcon)
                          : (widget.icon ?? style.icon)))
                ],
              ),
            ));
          }).toList()),
    );
  }

  @override
  onClosed() {
    super.onClosed();
    contentRenderBox = null;
    setState(() {
      currentIndex = -1;
    });
  }

  @override
  Widget? buildBuilder() {
    if (currentIndex < 0) {
      return null;
    }

    var item = widget.items[currentIndex];

    return AntdBox(
      onLayout: (ctx) {
        bool isOpen = contentRenderBox != null;
        if (contentRenderBox == null || ctx.hasSizeChange) {
          contentRenderBox = ctx.renderBox;
          if (!isOpen) {
            openAnimation();
            setState(() {});
          }
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AntdBox(
            style: style.itemStyle,
            child: item.item(close, this),
          ),
          if (widget.extra != null)
            AntdBox(
              style: style.extraStyle,
              child: widget.extra?.call(close, this),
            )
        ],
      ),
    );
  }

  @override
  AntdDropdownState getState() {
    return this;
  }

  @override
  AntdMaskBaseAnimation<AntdDropdown, AntdDropdownState>?
      buildStyleAnimation() {
    return style.animation;
  }

  @override
  AntdMaskBaseAnimation<AntdDropdown, AntdDropdownState>?
      buildWidgetAnimation() {
    return widget.animation;
  }
}
