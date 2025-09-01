import 'package:flutter/painting.dart';

extension BorderSideExtensions on BorderSide {
  Border get top => Border(top: this);
  Border get bottom => Border(bottom: this);
  Border get left => Border(left: this);
  Border get right => Border(right: this);
  Border get vertical => Border(top: this, bottom: this);
  Border get horizontal => Border(left: this, right: this);
  Border get all => Border(top: this, bottom: this, left: this, right: this);
}
