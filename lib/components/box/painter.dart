import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AntdBoxPainter extends CustomPainter {
  final Border? border;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Gradient? gradient;
  final List<BoxShadow>? shadows;

  const AntdBoxPainter({
    this.border,
    this.borderRadius,
    this.backgroundColor,
    this.gradient,
    this.shadows,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final RRect? rrect = borderRadius?.toRRect(rect);

    _paintShadows(canvas, rect, rrect);

    _paintBackground(canvas, rect, rrect);

    _paintGradient(canvas, rect, rrect);

    _paintBorder(canvas, rect, rrect);
  }

  void _paintShadows(Canvas canvas, Rect rect, RRect? rrect) {
    if (shadows == null || shadows!.isEmpty) return;

    final Paint paint = Paint();

    for (final shadow in shadows!) {
      final Offset shadowOffset = shadow.offset;
      final Rect shadowRect =
          rect.shift(shadowOffset).inflate(shadow.spreadRadius);
      final RRect? shadowRRect =
          rrect?.shift(shadowOffset).inflate(shadow.spreadRadius);

      paint
        ..color = shadow.color
        ..maskFilter = MaskFilter.blur(
          shadow.blurStyle,
          shadow.blurRadius,
        );

      if (shadowRRect != null) {
        canvas.drawRRect(shadowRRect, paint);
      } else {
        canvas.drawRect(shadowRect, paint);
      }
    }
  }

  void _paintBackground(Canvas canvas, Rect rect, RRect? rrect) {
    if (backgroundColor == null) return;

    final Paint paint = Paint()
      ..color = backgroundColor!
      ..style = PaintingStyle.fill;

    if (rrect != null) {
      canvas.drawRRect(rrect, paint);
    } else {
      canvas.drawRect(rect, paint);
    }
  }

  void _paintGradient(Canvas canvas, Rect rect, RRect? rrect) {
    if (gradient == null) return;

    final Paint paint = Paint()
      ..shader = gradient!.createShader(rect)
      ..style = PaintingStyle.fill;

    if (rrect != null) {
      canvas.drawRRect(rrect, paint);
    } else {
      canvas.drawRect(rect, paint);
    }
  }

  void _paintBorder(Canvas canvas, Rect rect, RRect? rrect) {
    if (border == null) return;

    border!.paint(
      canvas,
      rect,
      borderRadius: borderRadius,
    );
  }

  @override
  bool shouldRepaint(covariant AntdBoxPainter oldDelegate) {
    return oldDelegate.border != border ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.gradient != gradient ||
        oldDelegate.shadows != shadows;
  }

  @override
  bool? hitTest(Offset position) {
    return null;
  }
}
