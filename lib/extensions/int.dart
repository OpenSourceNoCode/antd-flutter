import 'package:flutter/painting.dart';

extension IntExtensions on int {
  EdgeInsets get top => EdgeInsets.only(top: roundToDouble());
  EdgeInsets get bottom => EdgeInsets.only(bottom: roundToDouble());
  EdgeInsets get left => EdgeInsets.only(left: roundToDouble());
  EdgeInsets get right => EdgeInsets.only(right: roundToDouble());
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: roundToDouble());
  EdgeInsets get horizontal =>
      EdgeInsets.symmetric(horizontal: roundToDouble());
  EdgeInsets get all => EdgeInsets.all(roundToDouble());

  double get iconSize => this * 1.1;

  Radius get radius => Radius.circular(roundToDouble());

  Size get width => Size.fromWidth(roundToDouble());
  Size get height => Size.fromHeight(roundToDouble());
  Size get size => Size(roundToDouble(), roundToDouble());
}

extension DoubleExtensions on double {
  EdgeInsets get top => EdgeInsets.only(top: this);
  EdgeInsets get bottom => EdgeInsets.only(bottom: this);
  EdgeInsets get left => EdgeInsets.only(left: this);
  EdgeInsets get right => EdgeInsets.only(right: this);
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this);
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get all => EdgeInsets.all(this);

  double get iconSize => this * 1.1;

  Radius get radius => Radius.circular(this);

  Size get width => Size.fromWidth(this);
  Size get height => Size.fromHeight(this);
  Size get size => Size(this, this);
}
