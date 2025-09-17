import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/cupertino.dart';

/// 分段项
/// @l [AntdSegmented]
class AntdSegmentedItem extends AntdComponent<AntdBoxStyle, AntdSegmentedItem> {
  /// 是否禁用该分段项，禁用时不可点击且样式变灰
  final bool? disable;

  /// 分段项中显示的子组件，通常是文字或图标
  final Widget? child;

  /// 点击分段项时的回调函数，为 null 时表示不可点击
  final VoidCallback? onTap;

  const AntdSegmentedItem(
      {super.key,
      super.style,
      super.styleBuilder,
      this.disable,
      this.child,
      this.onTap});

  AntdSegmentedItem copyFrom(AntdSegmentedItem? other) {
    return AntdSegmentedItem(
      key: other?.key ?? key,
      style: other?.style ?? style,
      styleBuilder: other?.styleBuilder ?? styleBuilder,
      disable: other?.disable ?? disable,
      onTap: other?.onTap ?? onTap,
      child: other?.child ?? child,
    );
  }

  @override
  AntdBoxStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return const AntdBoxStyle(
        options: AntdTapOptions(accepter: AntdTapAccepter.listener));
  }

  @override
  AntdSegmentedItem getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdBoxStyle margeStyle(AntdBoxStyle defaultStyle, AntdBoxStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  Widget render(BuildContext context, AntdBoxStyle style) {
    return AntdBox(
      disabled: disable,
      onTap: onTap,
      style: style,
      child: child,
    );
  }
}

///样式
///@l [AntdSegmented]
class AntdSegmentedStyle extends AntdStyle {
  /// 分段控制器整体容器的样式配置
  final AntdBoxStyle? bodyStyle;

  /// 分段控制器内部横向排列的Flex布局样式配置
  final AntdFlexStyle? bodyRowStyle;

  /// 单个分段项的默认样式配置
  final AntdBoxStyle? itemStyle;

  /// 当前选中的分段项的活动状态样式配置
  final AntdBoxStyle? activeItemStyle;

  const AntdSegmentedStyle(
      {super.inherit,
      this.bodyStyle,
      this.bodyRowStyle,
      this.itemStyle,
      this.activeItemStyle});

  @override
  AntdSegmentedStyle copyFrom(covariant AntdSegmentedStyle? style) {
    return AntdSegmentedStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      bodyRowStyle: bodyRowStyle.merge(style?.bodyRowStyle),
      itemStyle: itemStyle.merge(style?.itemStyle),
      activeItemStyle: activeItemStyle.merge(style?.activeItemStyle),
    );
  }
}

///@t 分段控制器
///@g 信息展示
///@o 78
///@u 用于展示多个选项并允许用户选择其中单个选项
class AntdSegmented
    extends AntdStateComponent<AntdSegmentedStyle, AntdSegmented> {
  const AntdSegmented(
      {super.key,
      this.disabled = false,
      this.activeIndex,
      required this.items,
      this.onChange,
      this.duration = const Duration(milliseconds: 200),
      this.hapticFeedback = AntdHapticFeedback.light});

  /// 是否禁用整个分段控制器，为 true 时所有选项都不可交互
  final bool disabled;

  /// 当前选中的分段项索引，null 表示没有选中项
  final int? activeIndex;

  /// 分段选项列表，至少需要包含两个选项
  final List<AntdSegmentedItem> items;

  /// 选项变化时的回调函数，返回选中项的索引
  final ValueChanged<int>? onChange;

  /// 选项切换时的动画过渡时长
  final Duration duration;

  ///开启反馈
  final AntdHapticFeedback? hapticFeedback;

  @override
  State<StatefulWidget> createState() {
    return _AntdSegmentedState();
  }

  @override
  AntdSegmentedStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdSegmentedStyle(
        bodyStyle: AntdBoxStyle(
            padding: token.size.xxs.all,
            color: token.colorFill.tertiary,
            radius: token.radius.all),
        bodyRowStyle: const AntdFlexStyle(mainAxisSize: MainAxisSize.min),
        itemStyle: AntdBoxStyle(
          padding: token.size.lg.horizontal.marge(token.size.xs.vertical),
        ),
        activeItemStyle: AntdBoxStyle(color: token.colorBgContainer));
  }

  @override
  AntdSegmented getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdStyleBuilder<AntdSegmentedStyle, AntdSegmented>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.segmentedStyle;
  }

  @override
  AntdSegmentedStyle getFinalStyle(
      BuildContext context, AntdSegmentedStyle style, AntdMapToken token) {
    return margeStyle(
        style,
        AntdSegmentedStyle(
            activeItemStyle: style.itemStyle.merge(style.activeItemStyle)));
  }

  @override
  AntdSegmentedStyle margeStyle(
      AntdSegmentedStyle defaultStyle, AntdSegmentedStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

class _AntdSegmentedState extends AntdState<AntdSegmentedStyle, AntdSegmented>
    with SingleTickerProviderStateMixin {
  int? activeIndex;
  late final AnimationController _controller =
      AnimationController(duration: widget.duration, vsync: this);
  late Animation<double> _animation = Tween(begin: 0.0, end: 0.0)
      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

  RenderBox? bodyBox;
  final _offset = <double>[];
  double halfOffset = 0;
  double offset = 0;
  AntdSegmentedItem? beforeItem;

  @override
  void updateDependentValues(covariant AntdSegmented? oldWidget) {
    super.updateDependentValues(oldWidget);
    activeIndex = widget.activeIndex;
    _offset.clear();
    for (var _ in widget.items) {
      _offset.add(0);
    }
  }

  _updateAnimation(double target) {
    halfOffset = offset + (target - offset) * 0.3;
    _animation = Tween(begin: offset, end: target)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.reset();
    _controller.forward();
    offset = target;
  }

  @override
  void dispose() {
    activeIndex = null;
    bodyBox = null;
    _controller.dispose();
    _offset.clear();
    beforeItem = null;
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    var activeItem = activeIndex != null ? widget.items[activeIndex!] : null;
    return AntdBox(
      onLayout: (ctx) {
        bodyBox = ctx.renderBox;
      },
      disabled: widget.disabled,
      style: style.bodyStyle,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          if (activeItem != null)
            AnimatedBuilder(
              animation: _controller,
              builder: (ctx, child) {
                if (_animation.value >= halfOffset) {
                  beforeItem = activeItem;
                }
                return Positioned(
                    left: _animation.value,
                    child: AntdStyleProvider<AntdBoxStyle>(
                        style: style.activeItemStyle,
                        child: activeItem.copyFrom(AntdSegmentedItem(
                          disable: widget.disabled,
                          child: AntdBox(
                            style: const AntdBoxStyle(
                                visibility: AntdVisibility.visible),
                            child: AnimatedCrossFade(
                                firstChild:
                                    beforeItem?.child ?? const AntdBox(),
                                secondChild:
                                    activeItem.child ?? const AntdBox(),
                                crossFadeState: _animation.value >= halfOffset
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: widget.duration),
                          ),
                        ))));
              },
            ),
          AntdStyleProvider<AntdBoxStyle>(
              style: style.itemStyle,
              child: AntdRow(
                  style: style.bodyRowStyle,
                  children: widget.items.map((item) {
                    var index = widget.items.indexOf(item);
                    return AntdBox(
                      onLayout: (ctx) {
                        if (_offset[index] > 0 && !ctx.hasSizeChange) {
                          return;
                        }
                        var offset = ctx.renderBox
                            .localToGlobal(Offset.zero, ancestor: bodyBox)
                            .dx;
                        _offset[index] = offset;
                        if (activeIndex == index) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (widget.activeIndex != null) {
                              _updateAnimation(offset);
                            }
                          });
                        }
                      },
                      child: item.copyFrom(AntdSegmentedItem(
                          disable: !widget.disabled && item.disable == true,
                          onTap: () {
                            if (widget.disabled || item.disable == true) {
                              return;
                            }
                            handleHapticFeedback(widget.hapticFeedback);
                            item.onTap?.call();
                            widget.onChange?.call(index);

                            setState(() {
                              activeIndex = index;
                              _updateAnimation(_offset[index]);
                            });
                          })),
                    );
                  }).toList())),
        ],
      ),
    );
  }
}
