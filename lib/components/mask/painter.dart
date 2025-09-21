import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

class AntdMaskPainter extends CustomPainter {
  final Color color;
  final AntdMaskHole? hole;

  const AntdMaskPainter({
    required this.color,
    this.hole,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    if (hole == null ||
        hole?.offset == null ||
        hole?.size == null ||
        hole!.size.isEmpty) {
      canvas.drawRect(Offset.zero & size, backgroundPaint);
      return;
    }

    final holeRect = hole!.rect(size);

    if (holeRect.isEmpty) {
      canvas.drawRect(Offset.zero & size, backgroundPaint);
      return;
    }

    final fullRectPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final holePath = Path();

    if (hole?.radius != null && hole!.radius! > 0) {
      holePath.addRRect(
        RRect.fromRectAndRadius(holeRect, Radius.circular(hole!.radius!)),
      );
    } else {
      holePath.addRect(holeRect);
    }

    final maskPath = Path.combine(
      PathOperation.difference,
      fullRectPath,
      holePath,
    );

    canvas.drawPath(maskPath, backgroundPaint);
  }

  @override
  bool shouldRepaint(AntdMaskPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.hole != hole;
  }

  @override
  bool? hitTest(Offset position) {
    if (hole == null || hole?.hitTest != true) {
      return null;
    }

    final offset = hole!.offset;
    final size = hole!.size;
    final padding = hole!.padding;
    final radius = hole!.radius;

    if (size.width.isInfinite || size.height.isInfinite) {
      final xHit = size.width.isInfinite
          ? true
          : (position.dx >= offset.dx - (padding?.left ?? 0) &&
              position.dx <= offset.dx + size.width + (padding?.right ?? 0));

      final yHit = size.height.isInfinite
          ? true
          : (position.dy >= offset.dy - (padding?.top ?? 0) &&
              position.dy <= offset.dy + size.height + (padding?.bottom ?? 0));

      if (xHit && yHit) {
        if (radius != null &&
            radius > 0 &&
            !size.width.isInfinite &&
            !size.height.isInfinite) {
          final roundedRect = RRect.fromRectAndRadius(
            Rect.fromLTWH(
              offset.dx,
              offset.dy,
              size.width,
              size.height,
            ),
            Radius.circular(radius),
          );
          return roundedRect.contains(position) ? false : null;
        }
        return false;
      }
      return null;
    }

    final effectiveRect = Rect.fromCenter(
      center: offset + Offset(size.width / 2, size.height / 2),
      width: size.width + (padding?.horizontal ?? 0),
      height: size.height + (padding?.vertical ?? 0),
    );

    if (effectiveRect.contains(position)) {
      if (radius != null && radius > 0) {
        final roundedRect = RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: offset + Offset(size.width / 2, size.height / 2),
            width: size.width,
            height: size.height,
          ),
          Radius.circular(radius),
        );
        return roundedRect.contains(position) ? false : null;
      }
      return false;
    }
    return null;
  }
}
