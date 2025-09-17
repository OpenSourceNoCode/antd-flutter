import 'package:flutter/painting.dart';

extension NumExtensions on num {
  EdgeInsets get top => EdgeInsets.only(top: roundToDouble());
  EdgeInsets get bottom => EdgeInsets.only(bottom: roundToDouble());
  EdgeInsets get left => EdgeInsets.only(left: roundToDouble());
  EdgeInsets get right => EdgeInsets.only(right: roundToDouble());
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: roundToDouble());
  EdgeInsets get horizontal =>
      EdgeInsets.symmetric(horizontal: roundToDouble());
  EdgeInsets get all => EdgeInsets.all(roundToDouble());

  Radius get radius => Radius.circular(roundToDouble());

  Size get width => Size.fromWidth(roundToDouble());
  Size get height => Size.fromHeight(roundToDouble());
  Size get size => Size(roundToDouble(), roundToDouble());
}
