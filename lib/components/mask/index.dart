import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

/// 蒙层样式
/// @l [AntdMask]
class AntdMaskStyle extends AntdStyle {
  ///背景色
  final Color maskColor;

  ///透明度
  final double maskOpacity;

  const AntdMaskStyle(
      {super.inherit,
      this.maskColor = const Color(0xff000000),
      this.maskOpacity = 0.5});

  @override
  AntdMaskStyle copyFrom(covariant AntdMaskStyle? style) {
    return AntdMaskStyle(
        maskColor: style?.maskColor ?? maskColor,
        maskOpacity: style?.maskOpacity ?? maskOpacity);
  }
}

typedef AntdMaskBuilder<S> = Widget Function(AntdLayerClose close, S state);

enum AntdMaskOpacity { transparent, thin, thick }

abstract class AntdBaseMask<Style extends AntdMaskStyle, WidgetType, StateType>
    extends AntdStateComponent<Style, WidgetType> with AntdLayerMixin {
  const AntdBaseMask(
      {super.key,
      super.style,
      super.styleBuilder,
      this.onClosed,
      this.onOpened,
      this.onMaskTap,
      this.builder,
      this.opacity,
      this.dismissOnMaskTap = true,
      this.showMask = true,
      this.animationDuration = const Duration(milliseconds: 400),
      this.holeAnimationDuration = const Duration(milliseconds: 400),
      this.hole});

  ///完全关闭后触发
  final VoidCallback? onClosed;

  ///完全展示后触发
  final VoidCallback? onOpened;

  ///内容
  final AntdMaskBuilder<StateType>? builder;

  ///是否显示背景蒙版
  final bool? showMask;

  ///透明度,mask为true才有效
  final AntdMaskOpacity? opacity;

  ///点击蒙层自身触发,mask为true才有效
  final VoidCallback? onMaskTap;

  ///点击背景板是否关闭,mask为true才有效
  final bool? dismissOnMaskTap;

  ///内容动画时长
  final Duration? animationDuration;

  ///内容动画时长
  final Duration? holeAnimationDuration;

  ///镂空的区域
  final AntdMaskHole? hole;

  double getOpacity() {
    if (opacity == AntdMaskOpacity.transparent) {
      return 0;
    }
    if (opacity == AntdMaskOpacity.thin) {
      return 0.35;
    }
    if (opacity == AntdMaskOpacity.thick) {
      return 0.75;
    }
    return 0.55;
  }

  @override
  String get layerType => "mask";

  Future<T?> open<T>() async {
    return AntdLayer.open(this);
  }
}

class AntdMaskHole {
  final Offset offset;
  final Size size;
  final EdgeInsets? padding;
  final double? radius;

  const AntdMaskHole({
    required this.offset,
    required this.size,
    this.padding,
    this.radius,
  });

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
    if (a == null)
      return EdgeInsets.fromLTRB(-b!.left, -b.top, -b.right, -b.bottom);
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
}

abstract class AntdMaskBaseState<
    Style extends AntdMaskStyle,
    T extends AntdBaseMask<Style, T, StateType>,
    A,
    StateType> extends AntdLayerState<Style, T> with TickerProviderStateMixin {
  @protected
  AntdMaskHole hole = AntdMaskHole.zero;

  @protected
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: widget.animationDuration,
  );
  @protected
  late Animation<double> maskAnimation = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: buildMaskInterval(),
    ),
  );
  @protected
  late AnimationController holeController = AnimationController(
    vsync: this,
    duration: widget.holeAnimationDuration,
  );
  @protected
  late Animation<AntdMaskHole> holeAnimation = _setHole(hole, hole, false);
  @protected
  late Animation<double> holeOpAnimation = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: holeController,
      curve: const Interval(0.5, 1, curve: Curves.easeOutCubic),
    ),
  );

  setHole(AntdMaskHole? targetHole) {
    _setHole(hole, targetHole, true);
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  Animation<AntdMaskHole> _setHole(
      AntdMaskHole? startHole, AntdMaskHole? targetHole, bool start) {
    holeAnimation =
        Tween(begin: startHole, end: targetHole ?? AntdMaskHole.zero).animate(
      CurvedAnimation(
        parent: holeController,
        curve: const Interval(0, 0.5, curve: Curves.easeOutCubic),
      ),
    );

    if (start) {
      holeController.reset();
      holeController.forward();
      hole = targetHole ?? AntdMaskHole.zero;
      setState(() {});
    }

    return holeAnimation;
  }

  @override
  @protected
  Ticker createTicker(TickerCallback onTick) {
    return super.createTicker(onTick);
  }

  @override
  @protected
  void activate() {
    super.activate();
  }

  @override
  @protected
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }

  @override
  @protected
  DiagnosticsNode toDiagnosticsNode(
      {String? name, DiagnosticsTreeStyle? style}) {
    return super.toDiagnosticsNode(name: name, style: style);
  }

  @protected
  Interval buildMaskInterval() {
    return const Interval(0, 0.5, curve: Curves.easeOutCubic);
  }

  @protected
  late Animation<A> contentAnimation = buildContentAnimation();

  Future<void> close([dynamic data]) async {
    await controller.reverse();
    await AntdLayer.closeSingle(widget, data);
  }

  @override
  @protected
  AntdLayerClose buildAntdLayerClose() {
    return close;
  }

  @protected
  Tween<A> buildTween();

  @protected
  Interval buildContentInterval() {
    return const Interval(0.5, 1, curve: Curves.easeOutCubic);
  }

  @protected
  Animation<A> buildContentAnimation() {
    return buildTween().animate(
      CurvedAnimation(
        parent: controller,
        curve: buildContentInterval(),
      ),
    );
  }

  @override
  @protected
  void initState() {
    super.initState();

    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onOpened?.call();
      }
      if (status == AnimationStatus.reverse) {
        widget.onClosed?.call();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderObject = context.findRenderObject();
      if (renderObject == null || renderObject is! RenderBox) {
        return;
      }
    });
  }

  @override
  @protected
  void updateDependentValues(covariant T? oldWidget) {
    super.updateDependentValues(oldWidget);
    if (widget.hole != null) {
      _setHole(
          hole == AntdMaskHole.zero ? widget.hole : hole, widget.hole, true);
    }
  }

  @override
  @protected
  void dispose() {
    controller.dispose();
    holeController.dispose();
    super.dispose();
  }

  Widget? buildBuilder() {
    return widget.builder?.call(close, getState());
  }

  @protected
  StateType getState();

  @override
  @protected
  Widget render(BuildContext context) {
    var childList = <Widget>[];

    if (widget.showMask == true) {
      var maskBg = FadeTransition(
        opacity: maskAnimation,
        child: GestureDetector(
          onTap: () async {
            if (widget.dismissOnMaskTap == true) {
              await close();
            }
            widget.onMaskTap?.call();
          },
          child: AnimatedBuilder(
              animation: holeAnimation,
              builder: (ctx, child) {
                return CustomPaint(
                  painter: _MaskPainter(
                    hole: holeAnimation.value,
                    color: style.maskColor.withValues(alpha: style.maskOpacity),
                  ),
                  size: Size.infinite,
                );
              }),
        ),
      );
      childList.add(Positioned.fill(
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return maskBg;
              })));
    }

    var builderChild = buildBuilder();
    if (builderChild != null) {
      childList.add(AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return AnimatedBuilder(
                animation: holeController,
                builder: (ctx, _) {
                  if (hole == AntdMaskHole.zero) {
                    return builderChild;
                  }
                  return FadeTransition(
                    opacity: holeOpAnimation,
                    child: builderChild,
                  );
                });
          }));
    }

    return Stack(
      children: childList,
    );
  }
}

class _MaskPainter extends CustomPainter {
  final Color color;
  final AntdMaskHole? hole;

  const _MaskPainter({
    required this.color,
    this.hole,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    if (hole?.offset == null || hole?.size == null || hole!.size.isEmpty) {
      canvas.drawRect(Offset.zero & size, backgroundPaint);
      return;
    }

    final holeRect = _calculateHoleRectWithPadding(size);

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

  Rect _calculateHoleRectWithPadding(Size canvasSize) {
    final effectiveHoleOffset = Offset(
      hole!.offset.dx.clamp(0, canvasSize.width),
      hole!.offset.dy.clamp(0, canvasSize.height),
    );

    final effectiveHoleSize = Size(
      hole!.size.width.clamp(0, canvasSize.width - effectiveHoleOffset.dx),
      hole!.size.height.clamp(0, canvasSize.height - effectiveHoleOffset.dy),
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

    if (hole?.padding == null || isEmpty(hole!.padding)) {
      return Rect.fromLTWH(
        effectiveHoleOffset.dx,
        effectiveHoleOffset.dy,
        effectiveHoleSize.width,
        effectiveHoleSize.height,
      );
    }

    final paddedLeft = effectiveHoleOffset.dx - hole!.padding!.left;
    final paddedTop = effectiveHoleOffset.dy - hole!.padding!.top;
    final paddedRight =
        effectiveHoleOffset.dx + effectiveHoleSize.width + hole!.padding!.right;
    final paddedBottom = effectiveHoleOffset.dy +
        effectiveHoleSize.height +
        hole!.padding!.bottom;

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

  @override
  bool shouldRepaint(_MaskPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.hole != hole;
  }
}

abstract class AntdMaskProxy<Style extends AntdMaskStyle, WidgetType>
    extends AntdBaseMask<Style, WidgetType, AntdMaskState> {
  const AntdMaskProxy(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.builder,
      super.onMaskTap,
      super.opacity,
      super.dismissOnMaskTap = true,
      super.showMask = true,
      super.animationDuration = const Duration(milliseconds: 200),
      super.holeAnimationDuration = const Duration(milliseconds: 400)});
}

abstract class AntdMaskProxyState<Style extends AntdMaskStyle,
    T extends AntdMaskProxy<Style, T>> extends AntdState<Style, T> {
  Future<V?> open<V>([AntdMaskHole? hole]) async {
    return await AntdLayer.open(AntdMask(
      style: style,
      onClosed: widget.onClosed,
      onOpened: widget.onOpened,
      onMaskTap: widget.onMaskTap,
      opacity: widget.opacity,
      dismissOnMaskTap: widget.dismissOnMaskTap,
      showMask: widget.showMask,
      animationDuration: widget.animationDuration,
      hole: hole,
      builder: (close, state) {
        return buildBuilder(widget.builder?.call(close, state), close, state);
      },
    ));
  }

  Widget buildBuilder(Widget? child, AntdLayerClose close, AntdMaskState state);
}

///@t 背景蒙层
///@g 反馈
///@o 88
///@d 深色背景层。
///@u 常用于模态窗口的背景层，使视觉焦点突出在模态窗口本身。
class AntdMask extends AntdBaseMask<AntdMaskStyle, AntdMask, AntdMaskState> {
  const AntdMask(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.builder,
      super.opacity,
      super.dismissOnMaskTap = true,
      super.showMask = true,
      super.animationDuration = const Duration(milliseconds: 200),
      super.hole});
  @override
  AntdMaskStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdMaskStyle(
        maskColor: token.colorBlack, maskOpacity: getOpacity());
  }

  @override
  AntdMaskStyle margeStyle(AntdMaskStyle defaultStyle, AntdMaskStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdMaskStyle, AntdMask>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.maskStyle;
  }

  @override
  State<StatefulWidget> createState() {
    return AntdMaskState();
  }

  @override
  AntdMask getWidget(BuildContext context) {
    return this;
  }
}

class AntdMaskState
    extends AntdMaskBaseState<AntdMaskStyle, AntdMask, double, AntdMaskState> {
  @override
  @protected
  Tween<double> buildTween() {
    return Tween(begin: 0.0, end: 1.0);
  }

  @override
  @protected
  Widget buildBuilder() {
    return FadeTransition(
      opacity: contentAnimation,
      child: widget.builder?.call(close, this),
    );
  }

  @override
  @protected
  AntdMaskState getState() {
    return this;
  }
}
