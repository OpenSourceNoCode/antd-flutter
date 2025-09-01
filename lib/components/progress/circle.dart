import 'dart:math';

import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

class CircularProgressPainter extends LineProgressPainter {
  const CircularProgressPainter(
      {required super.progress,
      required super.color,
      required super.progressColor,
      required super.strokeWidth,
      super.radius = 0});

  @override
  void paint(Canvas canvas, Size size) {
    // 计算有效绘制区域（扣除边距）
    final contentSize = Size(
      size.width,
      size.height,
    );

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (contentSize.shortestSide - strokeWidth) / 2;

    // 绘制背景圆环
    final bgPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, bgPaint);

    // 绘制进度圆弧
    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }
}

///进度圈样式
///@l [AntdProgressCircle]
class AntdProgressCircleStyle extends AntdProgressBaseStyle {
  const AntdProgressCircleStyle(
      {super.inherit, super.color, super.progressColor, super.textStyle});

  @override
  AntdProgressCircleStyle copyFrom(covariant AntdProgressCircleStyle? style) {
    return AntdProgressCircleStyle(
      color: style?.color ?? color,
      progressColor: style?.progressColor ?? progressColor,
      textStyle: textStyle.merge(style?.textStyle),
    );
  }
}

///@t 进度圈
///@g 反馈
///@o 79
///@d 用环形图形表示百分比进度。
///@u 适用于展示任务当前进度。
class AntdProgressCircle
    extends AntdProgressBase<AntdProgressCircleStyle, AntdProgressCircle> {
  const AntdProgressCircle(
      {super.key,
      super.style,
      super.styleBuilder,
      super.child,
      super.color,
      this.size = 47.0,
      super.percent = 0.0,
      super.stroke = 3.0,
      super.duration = const Duration(milliseconds: 1000),
      super.onChange,
      super.onFinish});

  ///大小
  final double size;

  @override
  State<StatefulWidget> createState() {
    return _AntdProgressCircleState();
  }

  @override
  AntdProgressCircleStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdProgressCircleStyle(
        color: token.colorFillContent,
        progressColor:
            color != null ? color!.getColor(token) : token.colorPrimary,
        textStyle: AntdBoxStyle(
            alignment: Alignment.center,
            size: size,
            padding: token.size.default_.all,
            textStyle: token.font.sm));
  }

  @override
  AntdProgressCircleStyle margeStyle(
      AntdProgressCircleStyle defaultStyle, AntdProgressCircleStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdProgressCircleStyle, AntdProgressCircle>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.progressCircleStyle;
  }

  @override
  AntdProgressCircle getWidget(BuildContext context) {
    return this;
  }
}

class _AntdProgressCircleState
    extends AntdProgressBaseState<AntdProgressCircleStyle, AntdProgressCircle> {
  @override
  Widget render(BuildContext context) {
    var child = AntdBox(
      style: style.textStyle,
      child: widget.child,
    );
    return AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return CustomPaint(
            painter: CircularProgressPainter(
              progress: animation.value,
              color: style.color!,
              progressColor: style.progressColor!,
              strokeWidth: widget.stroke,
            ),
            child: child,
          );
        });
  }
}
