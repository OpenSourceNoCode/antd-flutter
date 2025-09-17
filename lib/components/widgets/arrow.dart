import 'package:antd_flutter_mobile/components/define.dart';
import 'package:antd_flutter_mobile/components/style.dart';
import 'package:antd_flutter_mobile/theme/theme.dart';
import 'package:antd_flutter_mobile/theme/token.dart';
import 'package:flutter/widgets.dart';

class AntdArrowStyle extends AntdStyle {
  /// 箭头的尺寸
  final Size size;

  /// 箭头的颜色
  final Color color;

  /// 箭头尖角的圆角半径
  final double bluntness;

  /// 创建箭头样式配置
  const AntdArrowStyle(
      {this.size = const Size(15, 8),
      this.color = const Color(0xff000000),
      this.bluntness = 1});

  @override
  AntdArrowStyle copyFrom(AntdArrowStyle? style) {
    return AntdArrowStyle(
      size: style?.size ?? size,
      color: style?.color ?? color,
      bluntness: style?.bluntness ?? bluntness,
    );
  }
}

class AntdArrow extends AntdComponent<AntdArrowStyle, AntdArrow> {
  ///对着的方向
  final AntdPlacement placement;

  const AntdArrow(
      {super.key, super.style, super.styleBuilder, required this.placement});

  @override
  AntdArrowStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return const AntdArrowStyle();
  }

  @override
  AntdArrow getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdArrowStyle margeStyle(
      AntdArrowStyle defaultStyle, AntdArrowStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  Widget render(BuildContext context, AntdArrowStyle style) {
    final isHorizontal = placement.horizontal;
    final actualWidth = isHorizontal ? style.size.height : style.size.width;
    final actualHeight = isHorizontal ? style.size.width : style.size.height;

    return CustomPaint(
      size: Size(actualWidth, actualHeight),
      painter: _ArrowPainter(style.color, style.bluntness, placement),
    );
  }
}

class _ArrowPainter extends CustomPainter {
  final Color color;
  final double bluntness;
  final AntdPlacement placement;

  _ArrowPainter(this.color, this.bluntness, this.placement);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    switch (placement) {
      case AntdPlacement.bottomLeft ||
            AntdPlacement.bottom ||
            AntdPlacement.bottomRight:
        _drawRoundedTopTriangle(path, size);
        break;
      case AntdPlacement.topLeft || AntdPlacement.top || AntdPlacement.topRight:
        _drawRoundedBottomTriangle(path, size);
        break;
      case AntdPlacement.rightTop ||
            AntdPlacement.right ||
            AntdPlacement.rightBottom:
        _drawRoundedLeftTriangle(path, size);
        break;
      case AntdPlacement.leftTop ||
            AntdPlacement.left ||
            AntdPlacement.leftBottom:
        _drawRoundedRightTriangle(path, size);
        break;
    }

    canvas.drawPath(path..close(), paint);
  }

  void _drawRoundedTopTriangle(Path path, Size size) {
    final halfWidth = size.width / 2;

    path.moveTo(0, size.height);
    path.lineTo(halfWidth - bluntness, bluntness);
    path.quadraticBezierTo(halfWidth, 0, halfWidth + bluntness, bluntness);
    path.lineTo(size.width, size.height);
  }

  void _drawRoundedBottomTriangle(Path path, Size size) {
    final halfWidth = size.width / 2;

    path.moveTo(0, 0);
    path.lineTo(halfWidth - bluntness, size.height - bluntness);
    path.quadraticBezierTo(
        halfWidth, size.height, halfWidth + bluntness, size.height - bluntness);
    path.lineTo(size.width, 0);
  }

  void _drawRoundedLeftTriangle(Path path, Size size) {
    final halfHeight = size.height / 2;

    path.moveTo(size.width, 0);
    path.lineTo(bluntness, halfHeight - bluntness);
    path.quadraticBezierTo(0, halfHeight, bluntness, halfHeight + bluntness);
    path.lineTo(size.width, size.height);
  }

  void _drawRoundedRightTriangle(Path path, Size size) {
    final halfHeight = size.height / 2;

    path.moveTo(0, 0);
    path.lineTo(size.width - bluntness, halfHeight - bluntness);
    path.quadraticBezierTo(
        size.width, halfHeight, size.width - bluntness, halfHeight + bluntness);
    path.lineTo(0, size.height);
  }

  @override
  bool shouldRepaint(_ArrowPainter old) =>
      color != old.color ||
      bluntness != old.bluntness ||
      placement != old.placement;
}
