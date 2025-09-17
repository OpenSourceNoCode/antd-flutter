import 'package:flutter/widgets.dart';

/// theme
class AntdShadowDefine {
  ///一级阴影样式
  final List<BoxShadow> primary;

  ///二级阴影样式
  final List<BoxShadow> secondary;

  ///三级阴影样式
  final List<BoxShadow> tertiary;

  const AntdShadowDefine(
      {required this.primary, required this.secondary, required this.tertiary});

  factory AntdShadowDefine.generate() {
    return const AntdShadowDefine(primary: [
      BoxShadow(
        offset: Offset(0, 6),
        blurRadius: 16,
        spreadRadius: 0,
        color: Color(0x14000000),
      ),
      BoxShadow(
        offset: Offset(0, 3),
        blurRadius: 6,
        spreadRadius: -4,
        color: Color(0x1E000000),
      ),
      BoxShadow(
        offset: Offset(0, 9),
        blurRadius: 28,
        spreadRadius: 8,
        color: Color(0x0E000000),
      ),
    ], secondary: [
      BoxShadow(
        offset: Offset(0, 6),
        blurRadius: 16,
        spreadRadius: 0,
        blurStyle: BlurStyle.outer,
        color: Color(0x14000000),
      ),
      BoxShadow(
        offset: Offset(0, 3),
        blurRadius: 6,
        spreadRadius: -4,
        blurStyle: BlurStyle.outer,
        color: Color(0x1E000000),
      ),
      BoxShadow(
        offset: Offset(0, 9),
        blurRadius: 28,
        spreadRadius: 8,
        blurStyle: BlurStyle.outer,
        color: Color(0x0E000000),
      ),
    ], tertiary: [
      BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 2,
        spreadRadius: 0,
        color: Color(0x08000000),
      ),
      BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 6,
        spreadRadius: -1,
        color: Color(0x05000000),
      ),
      BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        spreadRadius: 0,
        color: Color(0x05000000),
      ),
    ]);
  }

  AntdShadowDefine copyFrom(AntdShadowDefine? other) {
    if (other == null) return this;

    return AntdShadowDefine(
      primary: other.primary,
      secondary: other.secondary,
      tertiary: other.tertiary,
    );
  }
}
