import 'package:flutter/widgets.dart';

import 'hole.dart';

class AntdMaskHoleClipper extends CustomClipper<Path> {
  final AntdMaskHole? hole;

  AntdMaskHoleClipper({this.hole});

  @override
  Path getClip(Size containerSize) {
    if (hole == null || hole!.size.isEmpty) {
      return Path()
        ..addRect(
            Rect.fromLTWH(0, 0, containerSize.width, containerSize.height));
    }

    final holeRect = Rect.fromLTWH(
      hole!.offset.dx - (hole!.padding?.left ?? 0),
      hole!.offset.dy - (hole!.padding?.top ?? 0),
      hole!.size.width + (hole!.padding?.horizontal ?? 0),
      hole!.size.height + (hole!.padding?.vertical ?? 0),
    );

    final clampedHoleRect = Rect.fromLTRB(
      holeRect.left.clamp(0, containerSize.width),
      holeRect.top.clamp(0, containerSize.height),
      holeRect.right.clamp(0, containerSize.width),
      holeRect.bottom.clamp(0, containerSize.height),
    );

    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, containerSize.width, containerSize.height));

    final holePath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          clampedHoleRect,
          Radius.circular(hole!.radius ?? 0),
        ),
      );

    return Path.combine(PathOperation.difference, path, holePath);
  }

  @override
  bool shouldReclip(covariant AntdMaskHoleClipper oldClipper) {
    return hole != oldClipper.hole;
  }
}
