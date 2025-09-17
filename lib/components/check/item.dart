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

typedef AntdCheckItemChange = void Function(String? value, bool check);

///可选中的列表项
///@l [AntdCheckList]
class AntdCheckItem
    extends AntdStateComponent<AntdCheckItemStyle, AntdCheckItem> {
  ///只读
  final bool? readOnly;

  ///是否禁用
  final bool? disable;

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

  final String? value;

  ///绑定值
  final bool? check;

  ///选中或者取消
  final AntdCheckItemChange? onChange;

  const AntdCheckItem(
      {super.key,
      super.style,
      super.styleBuilder,
      this.child,
      this.onTap,
      this.readOnly,
      this.disable,
      this.activeIcon,
      this.unActiveIcon,
      this.disableIcon,
      this.value,
      this.check,
      this.onChange});

  @override
  State<StatefulWidget> createState() {
    return _AntdCheckItemState();
  }

  AntdCheckItem copyFrom(AntdCheckItem? other) {
    if (other == null) return this;

    return AntdCheckItem(
      key: other.key ?? key,
      style: other.style ?? style,
      readOnly: other.readOnly ?? readOnly,
      disable: other.disable ?? disable,
      activeIcon: other.activeIcon ?? activeIcon,
      unActiveIcon: other.unActiveIcon ?? unActiveIcon,
      disableIcon: other.disableIcon ?? disableIcon,
      onTap: other.onTap ?? onTap,
      check: other.check,
      value: other.value ?? value,
      onChange: other.onChange ?? onChange,
      child: other.child ?? child,
    );
  }

  @override
  AntdCheckItemStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdCheckItemStyle(
        bodyStyle: AntdBoxStyle(
            color: token.colorBgContainer,
            options: const AntdTapOptions(accepter: AntdTapAccepter.listener)),
        itemStyle: AntdBoxStyle(
            padding: token.size.lg.vertical.marge(token.size.lg.right),
            margin: token.size.lg.left,
            border: AntdScrollItemProvider.ofMaybe(context)?.position ==
                    AntdScrollItemPosition.last
                ? null
                : token.border.bottom),
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

class _AntdCheckItemState extends AntdState<AntdCheckItemStyle, AntdCheckItem> {
  bool _check = false;

  @override
  void updateDependentValues(covariant AntdCheckItem? oldWidget) {
    super.updateDependentValues(oldWidget);
    _check = widget.check == true;
  }

  Widget? _getIcon() {
    if (widget.disable == true) {
      return widget.disableIcon ?? style.disableIcon;
    }

    return _check
        ? (widget.activeIcon ?? style.activeIcon)
        : (widget.unActiveIcon ?? style.unActiveIcon);
  }

  @override
  Widget render(BuildContext context) {
    return AntdBox(
      style: style.bodyStyle,
      disabled: widget.disable,
      onTap: () {
        widget.onTap?.call();
        widget.onChange?.call(widget.value, !_check);
        setState(() {
          _check = !_check;
        });
      },
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
