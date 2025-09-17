import 'package:flutter/widgets.dart';

/// theme
class AntdFontDefine {
  ///18
  final TextStyle xxl;

  ///17
  final TextStyle xl;

  ///16
  final TextStyle lg;

  ///15
  final TextStyle md;

  ///14
  final TextStyle ms;

  /// 默认字体 13
  final TextStyle sm;

  ///12
  final TextStyle xs;

  ///11
  final TextStyle xxs;

  const AntdFontDefine({
    required this.lg,
    required this.md,
    required this.ms,
    required this.sm,
    required this.xl,
    required this.xs,
    required this.xxl,
    required this.xxs,
  });

  factory AntdFontDefine.generate(
      double fontSize, Color textColor, TextStyle textStyle) {
    var fontSizes = List.generate(10, (index) {
      if (index < 5) {
        return fontSize - (5 - index);
      }
      if (index == 5) {
        return fontSize;
      }
      return fontSize + (index - 5);
    }).toList();

    var fontSizePairs = fontSizes
        .map((size) => textStyle.merge(TextStyle(
              fontSize: size,
              color: textColor,
            )))
        .toList();

    return AntdFontDefine(
      xxs: fontSizePairs[2],
      xs: fontSizePairs[3],
      sm: fontSizePairs[4],
      ms: fontSizePairs[5],
      md: fontSizePairs[6],
      lg: fontSizePairs[7],
      xl: fontSizePairs[8],
      xxl: fontSizePairs[9],
    );
  }

  AntdFontDefine copyFrom(AntdFontDefine? source) {
    return AntdFontDefine(
      lg: source?.lg ?? lg,
      md: source?.md ?? md,
      ms: source?.ms ?? ms,
      sm: source?.sm ?? sm,
      xl: source?.xl ?? xl,
      xs: source?.xs ?? xs,
      xxl: source?.xxl ?? xxl,
      xxs: source?.xxs ?? xxs,
    );
  }
}
