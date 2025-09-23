import 'package:antd_flutter_mobile/index.dart';

extension StyleExtensions<T extends AntdStyle> on T? {
  T? merge(T? other) {
    if (this == null) {
      return other;
    }
    if (this!.inherit != true) {
      return this;
    }
    if (other == null) {
      return this;
    }
    if (other.inherit != true) {
      return other;
    }
    return this!.copyFrom(other) as T;
  }

  T? mergeActive(
    T? defaultStyle,
    T? tdStyle,
    T? tdaStyle,
  ) {
    var cm = defaultStyle.merge(this);
    var tam = tdStyle.merge(tdaStyle);
    return cm.merge(tam);
  }
}
