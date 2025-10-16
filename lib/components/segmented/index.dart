import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/cupertino.dart';

/// 分段项
/// @l [AntdSegmented]
class AntdSegmentedItem {
  ///绑定的value
  final dynamic value;

  /// 是否禁用该分段项，禁用时不可点击且样式变灰
  final bool? disabled;

  /// 分段项中显示的子组件，通常是文字或图标
  final Widget? child;

  const AntdSegmentedItem({this.value, this.disabled, this.child});
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
      activeItemStyle: activeItemStyle.mergeActive(
          itemStyle, style?.itemStyle, style?.activeItemStyle),
    );
  }
}

///@t 分段控制器
///@g 信息展示
///@o 78
///@u 用于展示多个选项并允许用户选择其中单个选项
class AntdSegmented
    extends AntdFormItemComponent<dynamic, AntdSegmentedStyle, AntdSegmented> {
  const AntdSegmented(
      {super.key,
      super.style,
      super.styleBuilder,
      super.disabled,
      super.readOnly,
      super.value,
      super.autoCollect,
      super.onChange,
      super.shouldTriggerChange,
      super.hapticFeedback,
      super.manual,
      required this.items,
      this.duration = const Duration(milliseconds: 200)});

  /// 分段选项列表，至少需要包含两个选项
  final List<AntdSegmentedItem> items;

  /// 选项切换时的动画过渡时长
  final Duration duration;

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
  AntdSegmentedStyle margeStyle(
      AntdSegmentedStyle defaultStyle, AntdSegmentedStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

class _AntdSegmentedState extends AntdFormItemComponentState<dynamic,
    AntdSegmentedStyle, AntdSegmented> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: widget.duration, vsync: this);
  late Animation<double> _animation = Tween(begin: 0.0, end: 0.0)
      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

  RenderBox? bodyBox;
  final Map<int, double> _offset = {};
  double halfOffset = 0;
  double offset = 0;
  AntdSegmentedItem? beforeItem;

  _updateAnimation(double? target) {
    if (target == null) {
      return;
    }
    halfOffset = offset + (target - offset) * 0.3;
    _animation = Tween(begin: offset, end: target)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.reset();
    _controller.forward();
    offset = target;
  }

  @override
  void updateDependentValues(covariant AntdSegmented? oldWidget) {
    super.updateDependentValues(oldWidget);
    if (value != null && isChanged(value, oldWidget?.value)) {
      var index = widget.items.indexWhere((item) => item.value == value);
      if (index >= -1) {
        _updateAnimation(_offset[index]);
      }
    }
  }

  @override
  void dispose() {
    bodyBox = null;
    _controller.dispose();
    _offset.clear();
    beforeItem = null;
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    var activeItem = value != null
        ? widget.items.where((v) => v.value == value).firstOrNull
        : null;
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
                    child: AntdBox(
                        style: style.activeItemStyle,
                        child: AntdBox(
                          disabled: activeItem.disabled ?? disabled,
                          style: const AntdBoxStyle(
                              visibility: AntdVisibility.visible),
                          child: AnimatedCrossFade(
                              firstChild: beforeItem?.child ?? const AntdBox(),
                              secondChild: activeItem.child ?? const AntdBox(),
                              crossFadeState: _animation.value >= halfOffset
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: widget.duration),
                        )));
              },
            ),
          AntdRow(
              style: style.bodyRowStyle,
              children: widget.items.map((item) {
                var disabled = this.disabled == true || item.disabled == true;
                var index = widget.items.indexOf(item);
                if (!disabled && item.value == null) {
                  AntdLogs.w(
                      msg:
                          "Clickable AntdSegmented items need values - please add a value property to each item.");
                }
                return AntdBox(
                    onLayout: (ctx) {
                      if (_offset[index] != null &&
                          _offset[index]! > 0 &&
                          !ctx.hasSizeChange) {
                        return;
                      }
                      var offset = ctx.renderBox
                          .localToGlobal(Offset.zero, ancestor: bodyBox)
                          .dx;
                      _offset[index] = offset;
                    },
                    style: style.itemStyle,
                    disabled: disabled,
                    child: item.child,
                    onTap: () {
                      if (setValue(item.value)) {
                        if (!manual) {
                          _updateAnimation(_offset[index]);
                        }
                      }
                    });
              }).toList()),
        ],
      ),
    );
  }
}
