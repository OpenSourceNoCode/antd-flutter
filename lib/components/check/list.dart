import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

///可选中的列表项样式
///@l [AntdCheckItem]
class AntdCheckItemStyle extends AntdStyle {
  /// 整个复选框项目容器的样式
  final AntdBoxStyle? bodyStyle;

  /// 单个选项对齐样式
  final AntdFlexStyle? itemRowStyle;

  /// 单个选项的样式
  final AntdBoxStyle? itemStyle;

  /// 图标样式配置
  final AntdIconStyle? iconStyle;

  /// 选中状态下显示的图标
  final Widget? activeIcon;

  /// 未选中状态下显示的图标
  final Widget? unActiveIcon;

  /// 禁用状态下显示的图标
  final Widget? disableIcon;

  const AntdCheckItemStyle(
      {super.inherit,
      this.bodyStyle,
      this.itemRowStyle,
      this.itemStyle,
      this.iconStyle,
      this.activeIcon,
      this.unActiveIcon,
      this.disableIcon});

  @override
  AntdCheckItemStyle copyFrom(AntdCheckItemStyle? style) {
    return AntdCheckItemStyle(
        iconStyle: iconStyle.merge(style?.iconStyle),
        itemRowStyle: itemRowStyle.merge(style?.itemRowStyle),
        itemStyle: itemStyle.merge(style?.itemStyle),
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        activeIcon: style?.activeIcon ?? activeIcon,
        unActiveIcon: style?.unActiveIcon ?? unActiveIcon,
        disableIcon: style?.disableIcon ?? disableIcon);
  }
}

///可选中的列表项
///@l [AntdCheckList]
class AntdCheckItem
    extends AntdFormItemComponent<dynamic, AntdCheckItemStyle, AntdCheckItem> {
  ///内容
  final Widget? child;

  ///样式
  final Widget? activeIcon;

  ///样式
  final Widget? unActiveIcon;

  ///禁用样式
  final Widget? disableIcon;

  ///触摸事件
  final VoidCallback? onTap;

  const AntdCheckItem(
      {super.key,
      super.style,
      super.styleBuilder,
      super.disabled,
      super.readOnly,
      super.defaultValue,
      super.value,
      super.autoCollect,
      super.onChange,
      super.shouldTriggerChange,
      super.hapticFeedback,
      this.child,
      this.onTap,
      this.activeIcon,
      this.unActiveIcon,
      this.disableIcon});

  @override
  State<StatefulWidget> createState() {
    return _AntdCheckItemState();
  }

  @override
  AntdCheckItemStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdCheckItemStyle(
        itemRowStyle: const AntdFlexStyle(
            mainAxisAlignment: MainAxisAlignment.spaceBetween),
        iconStyle: AntdIconStyle(
            size: token.size.xxl.roundToDouble(),
            color: token.colorPrimary,
            bodyStyle: AntdBoxStyle(padding: token.size.lg.left)),
        activeIcon: const AntdIcon(
          icon: AntdIcons.check,
        ),
        unActiveIcon: const AntdBox(
          style: AntdBoxStyle(visibility: AntdVisibility.visible),
          child: AntdIcon(
            icon: AntdIcons.check,
          ),
        ));
  }

  @override
  AntdCheckItem getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdCheckItemStyle margeStyle(
      AntdCheckItemStyle defaultStyle, AntdCheckItemStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

class _AntdCheckItemState extends AntdFormItemSelectComponentState<dynamic,
    AntdCheckItemStyle, AntdCheckItem> {
  Widget? _getIcon() {
    if (widget.disabled == true) {
      return widget.disableIcon ?? style.disableIcon;
    }

    return select
        ? (widget.activeIcon ?? style.activeIcon)
        : (widget.unActiveIcon ?? style.unActiveIcon);
  }

  @override
  Widget render(BuildContext context) {
    return AntdBox(
      style: style.bodyStyle,
      disabled: widget.disabled,
      onTap: switchValue,
      child: AntdBox(
        style: style.itemStyle,
        child: AntdRow(style: style.itemRowStyle, children: [
          if (widget.child != null) widget.child!,
          AntdIconWrap(style: style.iconStyle, child: _getIcon())
        ]),
      ),
    );
  }
}

///@t 可勾选列表
///@g 信息录入
///@o 60
///@d 列表的勾选操作。
///@u 在一组列表项中选择一个或多个。
class AntdCheckList<T> extends AntdFormItemGroup<AntdCheckItem, AntdBoxStyle,
    List<T>, AntdCheckList<T>> {
  const AntdCheckList(
      {super.key,
      super.disabled,
      super.readOnly,
      super.defaultValue,
      super.value,
      super.autoCollect,
      super.onChange,
      super.shouldTriggerChange,
      super.hapticFeedback,
      super.items,
      super.builder});

  @override
  State<StatefulWidget> createState() {
    return _AntdCheckListState<T>();
  }

  @override
  AntdCheckList<T> getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdBoxStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return const AntdBoxStyle();
  }

  @override
  AntdBoxStyle margeStyle(AntdBoxStyle defaultStyle, AntdBoxStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

class _AntdCheckListState<T> extends AntdFormItemGroupMultipleState<
    AntdCheckItem, AntdBoxStyle, T, AntdCheckList<T>> {}
