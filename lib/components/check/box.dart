import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/cupertino.dart';

/// 复选框组件样式配置类
/// @l[AntdCheckbox]
class AntdCheckboxStyle extends AntdStyle {
  /// 主体样式，可以开启切换时震动反馈
  final AntdBoxStyle? bodyStyle;

  /// 复选框半选状态(indeterminate)的样式
  final AntdBoxStyle? indeterminateStyle;

  /// 复选框文本标签的样式
  final AntdBoxStyle? extraStyle;

  /// 选中框图标的样式配置
  final AntdIconStyle? activeIconStyle;

  /// 选中状态下显示的图标组件
  final Widget? activeIcon;

  /// 默认图标的样式配置
  final AntdIconStyle? iconStyle;

  /// 默认未选中状态下显示的图标组件
  final Widget? icon;

  /// 禁用图标的样式配置
  final AntdIconStyle? disableIconStyle;

  /// 禁用状态下显示的图标组件
  final Widget? disableIcon;

  ///对齐样式
  final AntdFlexStyle? rowStyle;

  /// 创建复选框样式配置
  const AntdCheckboxStyle(
      {super.inherit,
      this.bodyStyle,
      this.indeterminateStyle,
      this.extraStyle,
      this.activeIconStyle,
      this.activeIcon,
      this.iconStyle,
      this.icon,
      this.disableIconStyle,
      this.disableIcon,
      this.rowStyle});

  @override
  AntdCheckboxStyle copyFrom(covariant AntdCheckboxStyle? style) {
    return AntdCheckboxStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      indeterminateStyle: indeterminateStyle.merge(style?.indeterminateStyle),
      extraStyle: extraStyle.merge(style?.extraStyle),
      activeIconStyle: activeIconStyle.mergeActive(
          iconStyle, style?.iconStyle, style?.activeIconStyle),
      activeIcon: style?.activeIcon ?? activeIcon,
      iconStyle: iconStyle.merge(style?.iconStyle),
      icon: style?.icon ?? icon,
      disableIconStyle: disableIconStyle.mergeActive(
          iconStyle, style?.iconStyle, style?.disableIconStyle),
      disableIcon: style?.disableIcon ?? disableIcon,
      rowStyle: rowStyle.merge(style?.rowStyle),
    );
  }

  factory AntdCheckboxStyle.defaultStyle(AntdMapToken token) {
    return AntdCheckboxStyle(
        bodyStyle:
            const AntdBoxStyle(options: AntdTapOptions(alwaysReceiveTap: true)),
        indeterminateStyle: AntdBoxStyle(
          size: 11,
          color: token.colorPrimary,
          radius: BorderRadius.circular(11),
        ),
        extraStyle: AntdBoxStyle(
          padding: token.size.seed.left,
          textStyle: token.font.xl,
        ),
        iconStyle: AntdIconStyle(
            size: 16,
            color: token.colorWhite,
            bodyStyle: AntdBoxStyle(
              size: 22,
              alignment: Alignment.center,
              border: token.border.all,
              radius: BorderRadius.circular(22),
            )),
        icon: const AntdBox(),
        disableIcon: const AntdBox(),
        activeIconStyle:
            AntdIconStyle(bodyStyle: AntdBoxStyle(color: token.colorPrimary)),
        activeIcon: const AntdIcon(
          icon: AntdIcons.check,
        ),
        rowStyle: const AntdFlexStyle(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
        ));
  }
}

abstract class AntdBaseCheckbox<Style extends AntdCheckboxStyle, WidgetType>
    extends AntdFormItemComponent<dynamic, Style, WidgetType> {
  ///半选
  final bool? indeterminate;

  ///内容
  final Widget? extra;

  const AntdBaseCheckbox(
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
      this.indeterminate,
      this.extra});

  @override
  Widget get bindWidget => this;
}

abstract class AntdBaseCheckboxState<Style extends AntdCheckboxStyle,
        WidgetType extends AntdBaseCheckbox<Style, WidgetType>>
    extends AntdFormItemSelectComponentState<dynamic, Style, WidgetType> {
  @override
  Widget render(BuildContext context) {
    var defaultIcon = AntdIconWrap(
      style: style.iconStyle,
      child: style.icon,
    );
    var activeIcon = AntdIconWrap(
      style: style.activeIconStyle,
      child: style.activeIcon,
    );

    Widget getIcon() {
      if (widget.disabled == true && style.disableIcon != null) {
        return AntdIconWrap(
          style: style.disableIconStyle,
          child: style.disableIcon,
        );
      }
      if (select) {
        if (widget.indeterminate == true) {
          return AntdIconWrap(
            style: style.iconStyle,
            child: AntdBox(
              style: style.indeterminateStyle,
            ),
          );
        }
        return activeIcon;
      }
      return defaultIcon;
    }

    return AntdBox(
        style: style.bodyStyle,
        onTap: switchValue,
        disabled: widget.disabled,
        child: AntdRow(
          style: style.rowStyle,
          children: [
            getIcon(),
            if (widget.extra != null)
              AntdBox(
                style: style.extraStyle,
                child: widget.extra,
              )
          ],
        ));
  }
}

///@t 复选框
///@g 信息录入
///@o 58
///@d 在一组可选项中进行多选。
///@u 单独使用可以表示两种状态之间的切换，和 switch 类似。区别在于切换 switch 会直接触发状态改变，而 checkbox 一般用于状态标记，需要和提交操作配合。
class AntdCheckbox extends AntdBaseCheckbox<AntdCheckboxStyle, AntdCheckbox> {
  const AntdCheckbox({
    super.key,
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
    super.indeterminate,
    super.extra,
  });

  @override
  AntdCheckboxStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdCheckboxStyle.defaultStyle(token);
  }

  @override
  AntdCheckboxStyle margeStyle(
      AntdCheckboxStyle defaultStyle, AntdCheckboxStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdCheckbox getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdStyleBuilder<AntdCheckboxStyle, AntdCheckbox>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.checkboxStyle;
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdCheckboxState();
  }
}

class _AntdCheckboxState
    extends AntdBaseCheckboxState<AntdCheckboxStyle, AntdCheckbox> {}

///多选选择组
///@l [AntdCheckbox]
class AntdCheckboxGroup<T> extends AntdFormItemGroup<AntdCheckbox, AntdBoxStyle,
    List<T>, AntdCheckboxGroup<T>> {
  const AntdCheckboxGroup(
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
    return _AntdCheckboxGroupState<T>();
  }

  @override
  AntdCheckboxGroup<T> getWidget(BuildContext context) {
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

class _AntdCheckboxGroupState<T> extends AntdFormItemGroupMultipleState<
    AntdCheckbox, AntdBoxStyle, T, AntdCheckboxGroup<T>> {}
