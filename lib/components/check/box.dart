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
  final AntdIconStyle? defaultIconStyle;

  /// 默认未选中状态下显示的图标组件
  final Widget? defaultIcon;

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
      this.defaultIconStyle,
      this.defaultIcon,
      this.disableIconStyle,
      this.disableIcon,
      this.rowStyle});

  @override
  AntdCheckboxStyle copyFrom(covariant AntdCheckboxStyle? style) {
    return AntdCheckboxStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      indeterminateStyle: indeterminateStyle.merge(style?.indeterminateStyle),
      extraStyle: extraStyle.merge(style?.extraStyle),
      activeIconStyle: activeIconStyle.merge(style?.activeIconStyle),
      activeIcon: style?.activeIcon ?? activeIcon,
      defaultIconStyle: defaultIconStyle.merge(style?.defaultIconStyle),
      defaultIcon: style?.defaultIcon ?? defaultIcon,
      disableIconStyle: disableIconStyle.merge(style?.disableIconStyle),
      disableIcon: style?.disableIcon ?? disableIcon,
      rowStyle: rowStyle.merge(style?.rowStyle),
    );
  }

  factory AntdCheckboxStyle.defaultStyle(AntdAliasToken designToken) {
    final iconStyle = AntdIconStyle(
        size: 16,
        color: designToken.colorWhite,
        bodyStyle: AntdBoxStyle(
          size: 22,
          alignment: Alignment.center,
          border: designToken.borderSide.all,
          radius: BorderRadius.circular(22),
        ));

    return AntdCheckboxStyle(
        bodyStyle: const AntdBoxStyle(
            options: AntdTapOptions(accepter: AntdTapAccepter.listener)),
        indeterminateStyle: AntdBoxStyle(
          size: 11,
          color: designToken.colorPrimary,
          radius: BorderRadius.circular(11),
        ),
        extraStyle: AntdBoxStyle(
          padding: designToken.size.default_.left,
          textStyle: designToken.font.xl,
        ),
        defaultIconStyle: iconStyle,
        defaultIcon: const AntdBox(),
        disableIconStyle: iconStyle,
        disableIcon: const AntdBox(),
        activeIconStyle: iconStyle.copyFrom(AntdIconStyle(
            bodyStyle: AntdBoxStyle(color: designToken.colorPrimary))),
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
    extends AntdFormItemComponent<bool, Style, WidgetType> {
  ///半选
  final bool? indeterminate;

  ///内容
  final Widget? extra;

  ///开启反馈
  final AntdHapticFeedback? hapticFeedback;

  const AntdBaseCheckbox(
      {super.key,
      super.style,
      super.styleBuilder,
      super.disabled,
      super.readOnly,
      super.value,
      super.autoCollect,
      super.onChange,
      this.indeterminate,
      this.extra,
      this.hapticFeedback = AntdHapticFeedback.light});

  @override
  Widget get child => this;
}

abstract class AntdBaseCheckboxState<Style extends AntdCheckboxStyle,
        WidgetType extends AntdBaseCheckbox<Style, WidgetType>>
    extends AntdFormItemComponentState<bool, Style, WidgetType> {
  @override
  Widget render(BuildContext context) {
    var defaultIcon = AntdIconWrap(
      style: style.defaultIconStyle,
      child: style.defaultIcon,
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
      if (value == true) {
        if (widget.indeterminate == true) {
          return AntdIconWrap(
            style: style.defaultIconStyle,
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
        onTap: () {
          handleHapticFeedback(widget.hapticFeedback);
          changeValue(() => !(value == true));
        },
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
    super.value,
    super.autoCollect,
    super.onChange,
    super.indeterminate,
    super.extra,
  });

  @override
  AntdCheckboxStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
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
  AntdCheckboxStyle getFinalStyle(
      BuildContext context, AntdCheckboxStyle style, AntdAliasToken token) {
    return margeStyle(
        style,
        AntdCheckboxStyle(
            defaultIconStyle:
                style.defaultIconStyle.merge(style.disableIconStyle),
            activeIconStyle:
                style.defaultIconStyle.merge(style.activeIconStyle)));
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
