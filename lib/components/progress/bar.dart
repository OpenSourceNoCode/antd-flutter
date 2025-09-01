import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

class AntdProgressBaseStyle extends AntdStyle {
  ///背景色
  final Color? color;

  ///前景色
  final Color? progressColor;

  ///默认的文本样式
  final AntdBoxStyle? textStyle;

  const AntdProgressBaseStyle(
      {super.inherit, this.color, this.progressColor, this.textStyle});
}

abstract class AntdProgressBase<Style extends AntdProgressBaseStyle, W>
    extends AntdStateComponent<Style, W> {
  const AntdProgressBase(
      {super.key,
      super.style,
      super.styleBuilder,
      this.color,
      this.percent = 0,
      this.child,
      this.stroke = 3,
      this.onChange,
      this.onFinish,
      this.duration = const Duration(milliseconds: 1000)})
      : assert(percent >= 0 && percent <= 100, 'Percent must be between 1-100');

  ///颜色
  final AntdColor? color;

  ///百分比
  final double percent;

  ///线的宽度
  final double stroke;

  ///子组件
  final Widget? child;

  ///周期
  final Duration duration;

  ///当每次变更时调用
  final void Function(double percent)? onChange;

  ///当完成时调用
  final VoidCallback? onFinish;
}

abstract class AntdProgressBaseState<Style extends AntdProgressBaseStyle,
        T extends AntdProgressBase<Style, T>> extends AntdState<Style, T>
    with TickerProviderStateMixin {
  Size parentSize = Size.zero;
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    _setupAnimation(0, widget.percent);
  }

  void _setupAnimation(double fromPercent, double toPercent) {
    animation = Tween<double>(
      begin: fromPercent / 100,
      end: toPercent / 100,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    controller.reset();
    controller.forward();
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.percent != widget.percent) {
      final currentDisplayValue = animation.value * 100;
      _setupAnimation(currentDisplayValue, widget.percent);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChange?.call(widget.percent);

        if (widget.percent == 100) {
          widget.onFinish?.call();
        }
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class LineProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color progressColor;
  final double strokeWidth;
  final double radius;

  const LineProgressPainter(
      {required this.progress,
      required this.color,
      required this.progressColor,
      required this.strokeWidth,
      required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    // 计算有效绘制区域
    final contentWidth = size.width;
    final contentHeight = strokeWidth;
    final yPos = (size.height - contentHeight) / 2; // 垂直居中

    // 绘制背景
    final bgRect = RRect.fromLTRBR(
      0,
      yPos,
      size.width,
      yPos + contentHeight,
      Radius.circular(radius),
    );
    paint.color = color;
    canvas.drawRRect(bgRect, paint);

    // 绘制进度
    final progressWidth = contentWidth * progress.clamp(0.0, 1.0);
    if (progressWidth > 0) {
      final progressRect = RRect.fromLTRBR(
        0,
        yPos,
        progressWidth,
        yPos + contentHeight,
        Radius.circular(radius),
      );
      paint.color = progressColor;
      canvas.drawRRect(progressRect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant LineProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

///进度条样式
///@l [AntdProgressBar]
class AntdProgressBarStyle extends AntdProgressBaseStyle {
  ///圆角
  final double? radius;

  const AntdProgressBarStyle(
      {super.inherit,
      super.color,
      super.progressColor,
      super.textStyle,
      this.radius});

  @override
  AntdProgressBarStyle copyFrom(covariant AntdProgressBarStyle? style) {
    return AntdProgressBarStyle(
      color: style?.color ?? color,
      progressColor: style?.progressColor ?? progressColor,
      textStyle: textStyle.merge(style?.textStyle),
      radius: style?.radius ?? radius,
    );
  }
}

///@t 进度条
///@g 反馈
///@o 79
///@d 用条状图形表示百分比进度。
///@u 适用于展示任务当前进度。
class AntdProgressBar
    extends AntdProgressBase<AntdProgressBarStyle, AntdProgressBar> {
  const AntdProgressBar(
      {super.key,
      super.style,
      super.styleBuilder,
      super.child,
      super.color,
      super.percent = 0.0,
      super.stroke = 8.0,
      super.duration = const Duration(milliseconds: 1000),
      super.onChange,
      super.onFinish});

  @override
  State<StatefulWidget> createState() {
    return _AntdProgressBarState();
  }

  @override
  AntdProgressBarStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdProgressBarStyle(
        color: token.colorFillContent,
        progressColor:
            color != null ? color!.getColor(token) : token.colorPrimary,
        textStyle: AntdBoxStyle(
            margin: token.size.default_.left,
            textStyle: token.font.sm.copyWith(color: token.colorTextTertiary)),
        radius: token.radius.default_.roundToDouble());
  }

  @override
  AntdProgressBarStyle margeStyle(
      AntdProgressBarStyle defaultStyle, AntdProgressBarStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdProgressBarStyle, AntdProgressBar>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.progressBarStyle;
  }

  @override
  AntdProgressBar getWidget(BuildContext context) {
    return this;
  }
}

class _AntdProgressBarState
    extends AntdProgressBaseState<AntdProgressBarStyle, AntdProgressBar> {
  @override
  Widget render(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              return CustomPaint(
                painter: LineProgressPainter(
                    progress: animation.value,
                    color: style.color!,
                    progressColor: style.progressColor!,
                    strokeWidth: widget.stroke,
                    radius: style.radius ?? 0),
              );
            },
          ),
        ),
        if (widget.child != null)
          AntdBox(
            style: style.textStyle,
            child: widget.child!,
          ),
      ],
    );
  }
}
