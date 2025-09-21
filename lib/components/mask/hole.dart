import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

class AntdMaskHole {
  final Offset offset;
  final Size size;
  final EdgeInsets? padding;
  final double? radius;
  final bool? hitTest;

  const AntdMaskHole(
      {required this.offset,
      required this.size,
      this.padding,
      this.radius,
      this.hitTest});

  AntdPopoverTarget toPopoverTarget() {
    if (padding == null || _isPaddingEmpty(padding!)) {
      return AntdPopoverTarget(
        offset: offset,
        size: size,
      );
    }

    final targetOffset = Offset(
      offset.dx - padding!.left,
      offset.dy - padding!.top,
    );

    final targetSize = Size(
      size.width + padding!.left + padding!.right,
      size.height + padding!.top + padding!.bottom,
    );

    return AntdPopoverTarget(
      offset: targetOffset,
      size: targetSize,
    );
  }

  bool _isPaddingEmpty(EdgeInsets padding) {
    return padding.left == 0 &&
        padding.top == 0 &&
        padding.right == 0 &&
        padding.bottom == 0;
  }

  static const AntdMaskHole zero = AntdMaskHole(
      offset: Offset.zero,
      size: Size.zero,
      padding: EdgeInsets.zero,
      radius: 0);

  AntdMaskHole operator +(AntdMaskHole other) {
    return AntdMaskHole(
      offset: offset + other.offset,
      size:
          Size(size.width + other.size.width, size.height + other.size.height),
      padding: _addEdgeInsets(padding, other.padding),
      radius: _addDouble(radius, other.radius),
    );
  }

  AntdMaskHole operator -(AntdMaskHole other) {
    return AntdMaskHole(
      offset: offset - other.offset,
      size:
          Size(size.width - other.size.width, size.height - other.size.height),
      padding: _subtractEdgeInsets(padding, other.padding),
      radius: _subtractDouble(radius, other.radius),
    );
  }

  AntdMaskHole operator *(double factor) {
    return AntdMaskHole(
      offset: offset * factor,
      size: size * factor,
      padding: _multiplyEdgeInsets(padding, factor),
      radius: _multiplyDouble(radius, factor),
    );
  }

  AntdMaskHole operator /(double divisor) {
    return AntdMaskHole(
      offset: offset / divisor,
      size: size / divisor,
      padding: _divideEdgeInsets(padding, divisor),
      radius: _divideDouble(radius, divisor),
    );
  }

  static AntdMaskHole? lerp(AntdMaskHole? a, AntdMaskHole? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b! * t;
    if (b == null) return a * (1 - t);

    return AntdMaskHole(
      offset: Offset.lerp(a.offset, b.offset, t)!,
      size: Size.lerp(a.size, b.size, t)!,
      padding: _lerpEdgeInsets(a.padding, b.padding, t),
      radius: _lerpDouble(a.radius, b.radius, t),
    );
  }

  static EdgeInsets? _addEdgeInsets(EdgeInsets? a, EdgeInsets? b) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    return EdgeInsets.fromLTRB(
      a.left + b.left,
      a.top + b.top,
      a.right + b.right,
      a.bottom + b.bottom,
    );
  }

  static EdgeInsets? _subtractEdgeInsets(EdgeInsets? a, EdgeInsets? b) {
    if (a == null && b == null) return null;
    if (a == null) {
      return EdgeInsets.fromLTRB(-b!.left, -b.top, -b.right, -b.bottom);
    }
    if (b == null) return a;
    return EdgeInsets.fromLTRB(
      a.left - b.left,
      a.top - b.top,
      a.right - b.right,
      a.bottom - b.bottom,
    );
  }

  static EdgeInsets? _multiplyEdgeInsets(EdgeInsets? a, double factor) {
    if (a == null) return null;
    return EdgeInsets.fromLTRB(
      a.left * factor,
      a.top * factor,
      a.right * factor,
      a.bottom * factor,
    );
  }

  static EdgeInsets? _divideEdgeInsets(EdgeInsets? a, double divisor) {
    if (a == null) return null;
    return EdgeInsets.fromLTRB(
      a.left / divisor,
      a.top / divisor,
      a.right / divisor,
      a.bottom / divisor,
    );
  }

  static EdgeInsets? _lerpEdgeInsets(EdgeInsets? a, EdgeInsets? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return _multiplyEdgeInsets(b, t);
    if (b == null) return _multiplyEdgeInsets(a, 1 - t);

    return EdgeInsets.fromLTRB(
      a.left + (b.left - a.left) * t,
      a.top + (b.top - a.top) * t,
      a.right + (b.right - a.right) * t,
      a.bottom + (b.bottom - a.bottom) * t,
    );
  }

  static double? _addDouble(double? a, double? b) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    return a + b;
  }

  static double? _subtractDouble(double? a, double? b) {
    if (a == null && b == null) return null;
    if (a == null) return -b!;
    if (b == null) return a;
    return a - b;
  }

  static double? _multiplyDouble(double? a, double factor) {
    if (a == null) return null;
    return a * factor;
  }

  static double? _divideDouble(double? a, double divisor) {
    if (a == null) return null;
    return a / divisor;
  }

  static double? _lerpDouble(double? a, double? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b! * t;
    if (b == null) return a * (1 - t);
    return a + (b - a) * t;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AntdMaskHole &&
        other.offset == offset &&
        other.size == size &&
        other.padding == padding &&
        other.radius == radius;
  }

  @override
  int get hashCode => Object.hash(offset, size, padding, radius);

  @override
  String toString() {
    return 'AntdMaskHole(offset: $offset, size: $size, padding: $padding, radius: $radius)';
  }

  Rect rect(Size canvasSize) {
    final effectiveHoleOffset = Offset(
      offset.dx.clamp(0, canvasSize.width),
      offset.dy.clamp(0, canvasSize.height),
    );

    final effectiveHoleSize = Size(
      size.width.clamp(0, canvasSize.width - effectiveHoleOffset.dx),
      size.height.clamp(0, canvasSize.height - effectiveHoleOffset.dy),
    );

    bool isEmpty(EdgeInsets? padding) {
      if (padding == null) {
        return true;
      }
      return padding.left == 0 &&
          padding.top == 0 &&
          padding.right == 0 &&
          padding.bottom == 0;
    }

    if (padding == null || isEmpty(padding)) {
      return Rect.fromLTWH(
        effectiveHoleOffset.dx,
        effectiveHoleOffset.dy,
        effectiveHoleSize.width,
        effectiveHoleSize.height,
      );
    }

    final paddedLeft = effectiveHoleOffset.dx - padding!.left;
    final paddedTop = effectiveHoleOffset.dy - padding!.top;
    final paddedRight =
        effectiveHoleOffset.dx + effectiveHoleSize.width + padding!.right;
    final paddedBottom =
        effectiveHoleOffset.dy + effectiveHoleSize.height + padding!.bottom;

    final finalLeft = paddedLeft.clamp(0.0, canvasSize.width);
    final finalTop = paddedTop.clamp(0.0, canvasSize.height);
    final finalRight = paddedRight.clamp(0.0, canvasSize.width);
    final finalBottom = paddedBottom.clamp(0.0, canvasSize.height);

    return Rect.fromLTRB(
      finalLeft,
      finalTop,
      finalRight,
      finalBottom,
    );
  }
}
