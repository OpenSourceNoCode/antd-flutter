import 'dart:math' as math;
import 'dart:math';

import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

///加载中样式
///@l [AntdLoading]
class AntdLoadingStyle extends AntdStyle {
  /// 加载指示器颜色（默认主题色）
  final Color? color;

  /// 加载文字样式（字体、颜色等）
  final AntdBoxStyle? textStyle;

  /// 加载指示器尺寸
  final double? size;

  ///动画周期
  final Duration duration;

  const AntdLoadingStyle(
      {super.inherit,
      this.color,
      this.textStyle,
      this.size,
      this.duration = const Duration(milliseconds: 1000)});

  @override
  AntdLoadingStyle copyFrom(covariant AntdLoadingStyle? style) {
    return AntdLoadingStyle(
      color: style?.color ?? color,
      textStyle: textStyle.merge(style?.textStyle),
      size: style?.size ?? size,
      duration: style?.duration ?? duration,
    );
  }
}

///@t 加载中
///@g 反馈
///@o 94
///@d 用于页面和区块的加载中状态。
///@u 页面局部处于等待异步数据或正在渲染过程时，合适的加载动效会有效缓解用户的焦虑。
class AntdLoading extends AntdComponent<AntdLoadingStyle, AntdLoading> {
  const AntdLoading({
    super.key,
    super.style,
    super.styleBuilder,
    this.size,
    this.color,
    this.text,
    this.circular = false,
    this.child,
    this.spinning = true,
  });

  /// 加载指示器尺寸
  final double? size;

  ///加点的颜色
  final AntdColor? color;

  ///加载中文案
  final Widget? text;

  ///圆形加载中
  final bool circular;

  ///被包裹的widget
  final Widget? child;

  ///是否是加载中
  final bool? spinning;

  @override
  AntdLoadingStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var relaColor = color == null ? token.colorFill : color?.getColor(token);
    return AntdLoadingStyle(
        color: relaColor,
        size: size ?? (circular == true ? 24 : 4),
        duration: circular == true
            ? const Duration(milliseconds: 600)
            : const Duration(milliseconds: 1000),
        textStyle: AntdBoxStyle(
            padding: token.size.md.left,
            textStyle: token.font.ms.copyWith(color: relaColor)));
  }

  @override
  Widget render(BuildContext context, AntdLoadingStyle style) {
    if (spinning != true) {
      return child ?? const AntdBox();
    }

    var box = AntdBox(disabled: true, child: child);
    var style = getStyle(context);
    var loadingType = circular == true
        ? _CircularLoadingIndicator(
            size: style.size!, color: style.color!, duration: style.duration)
        : _WaveBouncingBalls(
            size: style.size!, color: style.color!, duration: style.duration);

    var loading = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        loadingType,
        if (text != null)
          AntdBox(
            style: style.textStyle,
            child: text,
          )
      ],
    );

    return Stack(
      alignment: Alignment.center,
      children: [box, loading],
    );
  }

  @override
  AntdLoadingStyle margeStyle(
      AntdLoadingStyle defaultStyle, AntdLoadingStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdLoadingStyle, AntdLoading>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.loadingStyle;
  }

  @override
  AntdLoading getWidget(BuildContext context) {
    return this;
  }
}

class _WaveBouncingBalls extends StatefulWidget {
  final double size;
  final Color color;

  ///动画周期
  final Duration duration;

  const _WaveBouncingBalls(
      {required this.size, required this.color, required this.duration});

  @override
  _WaveBouncingBallsState createState() => _WaveBouncingBallsState();
}

class _WaveBouncingBallsState extends State<_WaveBouncingBalls>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final List<Animation<double>> _animations = [];
  final amplitude = 4;
  late final Duration waveDuration = widget.duration;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: waveDuration,
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(milliseconds: 500), () {
            if (!mounted) {
              return;
            }
            _controller.reset();
            _controller.forward();
          });
        }
      });

    for (var i = 0; i < 3; i++) {
      _animations.add(
        Tween(begin: 0.0, end: 2 * math.pi).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              i * 0.3,
              1.0,
              curve: Curves.easeInOut,
            ),
          ),
        ),
      );
    }

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            final value = _animations[index].value;
            final translateY = -amplitude * math.sin(value);

            return Padding(
              padding: EdgeInsets.only(right: index != 2 ? 6 : 0),
              child: Transform.translate(
                offset: Offset(0, translateY),
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class _CircularLoadingIndicator extends StatefulWidget {
  final double size;
  final Color color;

  ///动画周期
  final Duration duration;

  const _CircularLoadingIndicator(
      {this.size = 40, this.color = Colors.blue, required this.duration});

  @override
  _CircularLoadingIndicatorState createState() =>
      _CircularLoadingIndicatorState();
}

class _CircularLoadingIndicatorState extends State<_CircularLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: _GradientCirclePainter(
          strokeWidth: 4,
          color: widget.color,
        ),
      ),
    );
  }
}

class _GradientCirclePainter extends CustomPainter {
  final double strokeWidth;
  final Color color;

  _GradientCirclePainter({
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: pi,
      colors: [
        color.withValues(alpha: 0),
        color,
      ],
      stops: const [0.0, 1],
      transform: const GradientRotation(pi),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -pi / 1.1,
      pi * 1.3,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
