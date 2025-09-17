import 'dart:ui';

import 'package:antd_flutter_mobile/extensions/color.dart';
import 'package:antd_flutter_mobile/theme/opacity.dart';

/// theme
class AntdColorDefine extends Color {
  ///颜色
  final Color color;

  ///color对应的深色激活态
  final Color active;

  ///color对应的浅色背景颜色
  final Color bg;

  ///color对应的浅色背景色激活态
  final Color bgActive;

  ///color对应的浅色填充背景色悬浮态
  final Color bgFilledActive;

  ///color对应的描边色
  final Color border;

  ///color对应的描边色悬浮态
  final Color borderActive;

  ///color对应的文本默认态
  final Color text;

  ///color对应的文本激活态
  final Color textActive;

  AntdColorDefine(
      {required this.color,
      required this.active,
      required this.bg,
      required this.bgActive,
      required this.bgFilledActive,
      required this.border,
      required this.borderActive,
      required this.text,
      required this.textActive})
      : super(color.toARGB32());

  factory AntdColorDefine.generate(Color color,
      [bool dark = false, Color backgroundColor = const Color(0xFF141414)]) {
    var colors = color.generate(dark, backgroundColor);

    return AntdColorDefine(
        color: color,
        active: colors[7]!,
        bg: colors[1]!,
        bgActive: colors[3]!,
        bgFilledActive: Color.lerp(colors[1]!, colors[3]!, 0.5)!,
        border: colors[3]!,
        borderActive: colors[4]!,
        text: colors[9]!,
        textActive: colors[10]!);
  }

  AntdColorDefine copyFrom(AntdColorDefine? other) {
    if (other == null) return this;

    return AntdColorDefine(
      color: other.color,
      active: other.active,
      bg: other.bg,
      bgActive: other.bgActive,
      bgFilledActive: other.bgFilledActive,
      border: other.border,
      borderActive: other.borderActive,
      text: other.text,
      textActive: other.textActive,
    );
  }
}

/// theme
class AntdTextColorDefine extends Color {
  ///最深的文本色。为了符合W3C标准，默认的文本颜色使用了该色，同时这个颜色也是最深的中性色。
  final Color color;

  ///作为第二梯度的文本色，一般用在不那么需要强化文本颜色的场景，例如 Label 文本、Menu 的文本选中态等场景。
  final Color secondary;

  ///	第三级文本色一般用于描述性文本，例如表单的中的补充说明文本、列表的描述性文本等场景。
  final Color tertiary;

  ///第四级文本色是最浅的文本色，例如表单的输入提示文本、禁用色文本等。
  final Color quaternary;

  ///文本禁用色
  final Color disabled;

  AntdTextColorDefine(
      {required this.color,
      required this.secondary,
      required this.tertiary,
      required this.quaternary,
      required this.disabled})
      : super(color.toARGB32());

  factory AntdTextColorDefine.generate(
      Color colorTextBase, AntdOpacityDefine opacity) {
    return AntdTextColorDefine(
        color: colorTextBase.withValues(alpha: opacity.colorText),
        secondary: colorTextBase.withValues(alpha: opacity.colorTextSecondary),
        tertiary: colorTextBase.withValues(alpha: opacity.colorTextTertiary),
        quaternary:
            colorTextBase.withValues(alpha: opacity.colorTextQuaternary),
        disabled: colorTextBase.withValues(alpha: opacity.colorTextQuaternary));
  }

  AntdTextColorDefine copyFrom(AntdTextColorDefine? other) {
    if (other == null) return this;

    return AntdTextColorDefine(
      color: other.color,
      secondary: other.secondary,
      tertiary: other.tertiary,
      quaternary: other.quaternary,
      disabled: other.disabled,
    );
  }
}

/// theme
class AntdFillColorDefine extends Color {
  ///最深的填充色，用于拉开与二、三级填充色的区分度，目前只用在 Slider 的 hover 效果。
  final Color color;

  ///二级填充色可以较为明显地勾勒出元素形体，
  ///如 Rate、Skeleton 等。也可以作为三级填充色的 Hover 状态，如 Table 等。
  final Color secondary;

  ///三级填充色用于勾勒出元素形体的场景，
  ///如 Slider、Segmented 等。如无强调需求的情况下，建议使用三级填色作为默认填色。
  final Color tertiary;

  ///最弱一级的填充色，适用于不易引起注意的色块，例如斑马纹、区分边界的色块等。
  final Color quaternary;

  AntdFillColorDefine({
    required this.color,
    required this.secondary,
    required this.tertiary,
    required this.quaternary,
  }) : super(color.toARGB32());

  factory AntdFillColorDefine.generate(
      Color colorTextBase, Color colorBgBase, AntdOpacityDefine opacity) {
    return AntdFillColorDefine(
        color: colorTextBase.withAlphas(opacity.colorFill, colorBgBase),
        secondary:
            colorTextBase.withAlphas(opacity.colorFillSecondary, colorBgBase),
        tertiary:
            colorTextBase.withAlphas(opacity.colorFillTertiary, colorBgBase),
        quaternary:
            colorTextBase.withAlphas(opacity.colorFillQuaternary, colorBgBase));
  }

  AntdFillColorDefine copyFrom(AntdFillColorDefine? other) {
    if (other == null) return this;

    return AntdFillColorDefine(
      color: other.color,
      secondary: other.secondary,
      tertiary: other.tertiary,
      quaternary: other.quaternary,
    );
  }
}
