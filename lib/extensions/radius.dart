import 'package:flutter/painting.dart';

extension RadiusExtensions on Radius {
  BorderRadius get topLeft => BorderRadius.only(topLeft: this);
  BorderRadius get topRight => BorderRadius.only(topRight: this);
  BorderRadius get bottomLeft => BorderRadius.only(bottomLeft: this);
  BorderRadius get bottomRight => BorderRadius.only(bottomRight: this);
  BorderRadius get left => BorderRadius.horizontal(left: this);
  BorderRadius get right => BorderRadius.horizontal(right: this);
  BorderRadius get top => BorderRadius.vertical(top: this);
  BorderRadius get bottom => BorderRadius.vertical(bottom: this);
  BorderRadius get all => BorderRadius.all(this);
}
