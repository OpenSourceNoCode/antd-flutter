import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

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
  final AntdMaskBuilder<AntdMaskState> item;

  const AntdDropdownItem({required this.child, required this.item});
}

///样式
///@l [AntdDropdown]
class AntdDropdownStyle extends AntdMaskStyle {
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

  const AntdDropdownStyle({
    super.inherit,
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
  });

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
      activeIconStyle: activeIconStyle.merge(style?.activeIconStyle),
      activeIcon: style?.activeIcon ?? activeIcon,
    );
  }
}

///@t 下拉菜单
///@g 信息展示
///@o 78
///@d 向下弹出的菜单面板。
///@u 适用于筛选、排序并更改当前页面内容展示范围或顺序。
class AntdDropdown extends AntdMaskProxy<AntdDropdownStyle, AntdDropdown> {
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
      super.animationDuration = const Duration(milliseconds: 200),
      required this.items,
      this.icon,
      this.activeIcon,
      this.extra});

  ///内容
  final List<AntdDropdownItem> items;

  ///默认的图标
  final Widget? icon;

  ///激活后的图标
  final Widget? activeIcon;

  ///额外区域,始终位于菜单下方
  final AntdMaskBuilder<AntdMaskState>? extra;

  @override
  State<StatefulWidget> createState() {
    return _AntdDropdownState();
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
            options: const AntdTapOptions(accepter: AntdTapAccepter.listener)),
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
        iconStyle: AntdIconStyle(size: 16, color: token.colorText.secondary));
  }

  @override
  AntdDropdownStyle getFinalStyle(
      BuildContext context, AntdDropdownStyle style, AntdMapToken token) {
    return margeStyle(
        style,
        AntdDropdownStyle(
            activeIconStyle: style.iconStyle.merge(style.activeIconStyle)));
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

class _AntdDropdownState
    extends AntdMaskProxyState<AntdDropdownStyle, AntdDropdown> {
  RenderBox? renderBox;
  AntdMaskState? maskState;
  late int currentIndex = -1;

  double getOffsetY() {
    if (renderBox == null) {
      return 0.0;
    }

    var offset = renderBox!.localToGlobal(Offset.zero);
    return offset.dy + renderBox!.size.height;
  }

  @override
  buildOnClosed() {
    setState(() {
      currentIndex = -1;
    });
  }

  @override
  Widget buildBuilder(
      Widget? child, AntdLayerClose close, AntdMaskState state) {
    maskState = state;
    var item = widget.items[currentIndex];

    return Stack(
      children: [
        Positioned(
            top: getOffsetY(),
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AntdBox(
                  style: style.itemStyle,
                  child: item.item(close, state),
                ),
                if (widget.extra != null)
                  AntdBox(
                    style: style.extraStyle,
                    child: widget.extra?.call(close, state),
                  )
              ],
            )),
      ],
    );
  }

  @override
  void dispose() {
    renderBox = null;
    maskState = null;
    currentIndex = -1;
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
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
                if (maskState == null || maskState?.mounted != true) {
                  open(AntdMaskHole(
                      hitTest: true,
                      offset: Offset.zero,
                      size: Size(double.infinity, getOffsetY())));
                } else {
                  maskState?.setState(() => {});
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
}
