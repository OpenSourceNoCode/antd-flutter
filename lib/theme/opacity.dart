class AntdOpacityDefine {
  final double colorFill;
  final double colorFillSecondary;
  final double colorFillTertiary;
  final double colorFillQuaternary;
  final double colorText;
  final double colorTextSecondary;
  final double colorTextTertiary;
  final double colorTextQuaternary;
  final double colorBorder;
  final double colorBorderSecondary;

  const AntdOpacityDefine(
      {this.colorFill = 0.15,
      this.colorFillSecondary = 0.06,
      this.colorFillTertiary = 0.043,
      this.colorFillQuaternary = 0.02,
      this.colorText = 0.88,
      this.colorTextSecondary = 0.66,
      this.colorTextTertiary = 0.44,
      this.colorTextQuaternary = 0.25,
      this.colorBorder = 6.7,
      this.colorBorderSecondary = 4.0});

  AntdOpacityDefine copyWith({
    double? colorFill,
    double? colorFillSecondary,
    double? colorFillTertiary,
    double? colorFillQuaternary,
    double? colorText,
    double? colorTextSecondary,
    double? colorTextTertiary,
    double? colorTextQuaternary,
    double? colorBorder,
  }) {
    return AntdOpacityDefine(
      colorFill: colorFill ?? this.colorFill,
      colorFillSecondary: colorFillSecondary ?? this.colorFillSecondary,
      colorFillTertiary: colorFillTertiary ?? this.colorFillTertiary,
      colorFillQuaternary: colorFillQuaternary ?? this.colorFillQuaternary,
      colorText: colorText ?? this.colorText,
      colorTextSecondary: colorTextSecondary ?? this.colorTextSecondary,
      colorTextTertiary: colorTextTertiary ?? this.colorTextTertiary,
      colorTextQuaternary: colorTextQuaternary ?? this.colorTextQuaternary,
      colorBorder: colorBorder ?? this.colorBorder,
    );
  }
}
