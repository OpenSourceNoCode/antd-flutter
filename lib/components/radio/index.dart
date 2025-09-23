import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

/// 单选框组件样式配置类
/// @l[AntdRadio]
class AntdRadioStyle extends AntdCheckboxStyle {
  const AntdRadioStyle(
      {super.inherit,
      super.bodyStyle,
      super.indeterminateStyle,
      super.extraStyle,
      super.activeIconStyle,
      super.activeIcon,
      super.iconStyle,
      super.icon,
      super.disableIconStyle,
      super.disableIcon,
      super.rowStyle});

  @override
  AntdRadioStyle copyFrom(covariant AntdRadioStyle? style) {
    return AntdRadioStyle(
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
}

///@t 单选框
///@g 信息录入
///@o 54
///@d 在一组可选项中进行单选。
///@u 单选框所有选项默认可见，方便用户在比较中选择，因此选项不宜过多。
class AntdRadio extends AntdBaseCheckbox<AntdRadioStyle, AntdRadio> {
  const AntdRadio(
      {super.key,
      super.style,
      super.styleBuilder,
      super.disabled,
      super.readOnly,
      super.value,
      super.autoCollect,
      super.onChange,
      super.indeterminate,
      super.extra,
      super.hapticFeedback});

  @override
  AntdRadioStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var checkBoxStyle = AntdCheckboxStyle.defaultStyle(token);
    return AntdRadioStyle(
      bodyStyle: checkBoxStyle.bodyStyle,
      indeterminateStyle: checkBoxStyle.indeterminateStyle,
      extraStyle: checkBoxStyle.extraStyle,
      activeIconStyle: checkBoxStyle.activeIconStyle,
      activeIcon: checkBoxStyle.activeIcon,
      iconStyle: checkBoxStyle.iconStyle,
      icon: checkBoxStyle.icon,
      disableIconStyle: checkBoxStyle.disableIconStyle,
      disableIcon: checkBoxStyle.disableIcon,
      rowStyle: checkBoxStyle.rowStyle,
    );
  }

  @override
  AntdStyleBuilder<AntdRadioStyle, AntdRadio>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.radioStyle;
  }

  @override
  AntdRadioStyle margeStyle(
      AntdRadioStyle defaultStyle, AntdRadioStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdRadio getWidget(BuildContext context) {
    return this;
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdRadioState();
  }
}

class _AntdRadioState
    extends AntdBaseCheckboxState<AntdRadioStyle, AntdRadio> {}
