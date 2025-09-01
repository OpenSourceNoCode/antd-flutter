import 'package:flutter/painting.dart';

extension EdgeInsetsExtensions on EdgeInsets {
  EdgeInsets marge(EdgeInsets other) {
    return copyWith(
      left: other.left != 0 ? other.left : left,
      right: other.right != 0 ? other.right : right,
      bottom: other.bottom != 0 ? other.bottom : bottom,
      top: other.top != 0 ? other.top : top,
    );
  }

  EdgeInsets ignoreAlign(TextStyle? style) {
    return this - EdgeInsets.only(top: _getHeight(style));
  }

  EdgeInsets align(TextStyle? style) {
    return this + EdgeInsets.only(top: _getHeight(style));
  }

  double _getHeight(TextStyle? style) {
    if (style == null) {
      return 0;
    }

    if (style.height == null || style.height == 1 || style.height! < 1.0) {
      return 0;
    }
    return style.fontSize! * (style.height! - 1) / 2;
  }
}
