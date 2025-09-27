import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

/// 蒙层样式
class AntdMaskBaseStyle extends AntdStyle {
  ///背景色
  final Color maskColor;

  ///透明度
  final double maskOpacity;

  const AntdMaskBaseStyle(
      {super.inherit,
      this.maskColor = const Color(0xff000000),
      this.maskOpacity = 0.5});
}

typedef AntdMaskBuilder<StateType> = Widget? Function(
    AntdLayerClose close, StateType state);

enum AntdMaskOpacity {
  transparent(0.0),
  thin(0.35),
  thick(0.75);

  final double opacity;

  const AntdMaskOpacity(this.opacity);
}

abstract class AntdBaseMask<Style extends AntdMaskBaseStyle, WidgetType,
        StateType> extends AntdStateComponent<Style, WidgetType>
    with AntdLayerMixin {
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

  ///镂空的区域
  final AntdMaskHole? hole;

  @override
  String get layerType => "mask";

  Future<T?> open<T>() async {
    return AntdLayer.open(this);
  }
}

abstract class AntdMaskBaseState<
    Style extends AntdMaskBaseStyle,
    WidgetType extends AntdBaseMask<Style, WidgetType, StateType>,
    StateType> extends AntdLayerState<Style, StateType, WidgetType> {
  late Color maskColor;
  AntdMaskHole hole = AntdMaskHole.zero;
  AntdMaskHole? targetHole;

  @protected
  late AntdMaskBaseAnimation<WidgetType, StateType>? animation;

  @protected
  AntdMaskBaseAnimation<WidgetType, StateType>? buildStyleAnimation();

  @protected
  AntdMaskBaseAnimation<WidgetType, StateType>? buildWidgetAnimation();

  @protected
  AntdMaskBaseAnimation<WidgetType, StateType>? buildAnimation() {
    return buildStyleAnimation().merge(buildWidgetAnimation());
  }

  @protected
  AnimationController? controller;

  @protected
  initHole(AntdMaskHole? targetHole, [AntdMaskHole? initHole]) {
    hole = initHole ?? AntdMaskHole.zero;
    this.targetHole = targetHole ?? AntdMaskHole.zero;
  }

  setHole(AntdMaskHole? targetHole, [AntdMaskHole? initHole]) {
    if (targetHole == null && initHole == null) {
      return;
    }
    if (initHole != null) {
      hole = initHole;
    }

    this.targetHole = targetHole ?? AntdMaskHole.zero;
    controller?.reset();
    controller?.forward();
    setState(() {});
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
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

  Future<void> close([dynamic data]) async {
    if (!mounted) {
      return;
    }
    await controller?.reverse();
    await AntdLayer.closeSingle(widget, data);
    onClosed();
  }

  @override
  @protected
  AntdLayerClose buildAntdLayerClose() {
    return close;
  }

  @protected
  @mustCallSuper
  onOpened() {
    widget.onOpened?.call();
  }

  @protected
  @mustCallSuper
  onClosed() {
    widget.onClosed?.call();
  }

  @protected
  bool buildAutoAnimation() {
    return true;
  }

  @protected
  initAnimation() {
    if (controller != null) {
      return;
    }
    animation = buildAnimation();

    controller = createAnimationController(animation);
    controller?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onOpened();
        hole = targetHole ?? AntdMaskHole.zero;
      }
    });
    if (buildAutoAnimation()) {
      openAnimation();
    }
  }

  openAnimation() {
    controller?.reset();
    controller?.forward();
  }

  @override
  @protected
  void updateDependentValues(covariant WidgetType? oldWidget) {
    super.updateDependentValues(oldWidget);
    maskColor = style.maskColor
        .withValues(alpha: widget.opacity?.opacity ?? style.maskOpacity);
    initAnimation();
    if (widget.hole != null) {
      initHole(widget.hole, widget.hole);
    }
  }

  @override
  @protected
  void dispose() {
    super.dispose();
  }

  Widget? buildBuilder() {
    return widget.builder?.call(close, getState());
  }

  @override
  @protected
  Widget render(BuildContext context) {
    var childList = <Widget>[];

    Widget getMask() {
      if (animation == null || animation?.holeAnimated == null) {
        return CustomPaint(
          painter: AntdMaskPainter(color: maskColor, hole: targetHole),
          size: Size.infinite,
        );
      }

      return buildAnimated(
          controller, const AntdBox(), animation?.holeAnimated);
    }

    if (widget.showMask == true) {
      childList.add(Positioned.fill(
          child: buildAnimated(
              controller,
              GestureDetector(
                onTap: () async {
                  widget.onMaskTap?.call();
                  if (widget.dismissOnMaskTap == true) {
                    await close();
                  }
                },
                child: getMask(),
              ),
              animation?.maskAnimated)));
    }

    var content = buildBuilder();
    if (content != null) {
      childList
          .add(buildAnimated(controller, content, animation?.contentAnimated));
    }

    return Stack(
      children: childList,
    );
  }
}

class AntdMaskStyle extends AntdMaskBaseStyle {
  const AntdMaskStyle({
    super.inherit,
    super.maskColor,
    super.maskOpacity,
    this.animation,
  });

  ///mask内容动画
  final AntdMaskAnimation? animation;

  @override
  AntdMaskStyle copyFrom(covariant AntdMaskStyle? style) {
    return AntdMaskStyle(
      maskColor: style?.maskColor ?? maskColor,
      maskOpacity: style?.maskOpacity ?? maskOpacity,
      animation: animation.merge(style?.animation),
    );
  }
}

class AntdMaskAnimation extends AntdMaskBaseAnimation<AntdMask, AntdMaskState> {
  const AntdMaskAnimation(
      {super.disable,
      super.duration,
      super.maskAnimated = const AntdMaskDefaultAnimated(),
      super.contentAnimated = const AntdMaskContentDefaultAnimated<
          AntdMaskStyle, AntdMask, AntdMaskState>()});

  @override
  AntdMaskAnimation copyFrom(covariant AntdMaskAnimation? style) {
    return AntdMaskAnimation(
      disable: style?.disable ?? disable,
      duration: style?.duration ?? duration,
      maskAnimated: style?.maskAnimated ?? maskAnimated,
      contentAnimated: style?.contentAnimated ?? contentAnimated,
    );
  }
}

///@t 背景蒙层
///@g 反馈
///@o 88
///@d 深色背景层。
///@u 常用于模态窗口的背景层，使视觉焦点突出在模态窗口本身。
class AntdMask extends AntdBaseMask<AntdMaskStyle, AntdMask, AntdMaskState> {
  const AntdMask({
    super.key,
    super.style,
    super.styleBuilder,
    super.onClosed,
    super.onOpened,
    super.onMaskTap,
    super.builder,
    super.opacity,
    super.dismissOnMaskTap = true,
    super.showMask = true,
    super.hole,
    this.animation,
  });

  ///mask内容动画
  final AntdMaskAnimation? animation;

  static Future<T?> show<T>(
      {final Key? key, final Widget? content, final AntdMask? mask}) {
    return AntdMask(
      key: key ?? mask?.key,
      style: mask?.style,
      styleBuilder: mask?.styleBuilder,
      onClosed: mask?.onClosed,
      onOpened: mask?.onOpened,
      onMaskTap: mask?.onMaskTap,
      builder: mask?.builder ?? (content != null ? (_, ctx) => content : null),
      opacity: mask?.opacity ?? AntdMaskOpacity.thin,
      dismissOnMaskTap: mask?.dismissOnMaskTap != false,
      showMask: mask?.showMask != false,
      animation: mask?.animation,
      hole: mask?.hole,
    ).open();
  }

  @override
  AntdMaskStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdMaskStyle(
      maskColor: token.colorBlack,
      animation: const AntdMaskAnimation(duration: Duration(milliseconds: 200)),
    );
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
    extends AntdMaskBaseState<AntdMaskStyle, AntdMask, AntdMaskState> {
  @override
  @protected
  AntdMaskState getState() {
    return this;
  }

  @override
  AntdMaskBaseAnimation<AntdMask, AntdMaskState>? buildStyleAnimation() {
    return style.animation;
  }

  @override
  AntdMaskBaseAnimation<AntdMask, AntdMaskState>? buildWidgetAnimation() {
    return widget.animation;
  }
}

abstract class AntdMaskProxyState<
    Style extends AntdMaskBaseStyle,
    WidgetType extends AntdBaseMask<Style, WidgetType, StateType>,
    StateType> extends AntdMaskBaseState<Style, WidgetType, StateType> {
  bool opened = false;
  Widget? _openWidget;
  StateSetter? _setState;

  @override
  @protected
  bool buildAutoAnimation() {
    return false;
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    _setState?.call(() {});
  }

  @override
  @protected
  onClosed() {
    super.onClosed();
    opened = false;
  }

  @override
  @protected
  @mustCallSuper
  Widget render(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setState?.call(() => {});
    });
    return const AntdBox();
  }

  Future<T?> open<T>([AntdMaskHole? hole, bool animation = true]) async {
    initHole(hole, hole);
    if (animation) {
      openAnimation();
    }
    _openWidget = _StatefulBuilder(
      builder: (setState) {
        _setState = setState;
        return super.render(context);
      },
      dispose: () {
        _setState = null;
      },
    );
    if (_openWidget == null) {
      return null;
    }

    opened = true;
    var result =
        await AntdLayer.open(_openWidget!, layerType: widget.layerType);
    return result;
  }

  @override
  Future<void> close([data]) async {
    if (!mounted) {
      return;
    }
    setState(() {
      hole = targetHole ?? AntdMaskHole.zero;
    });
    await controller?.reverse();
    if (_openWidget == null) {
      return;
    }
    await AntdLayer.closeSingle(_openWidget!, data);
    onClosed();
    _openWidget = null;
  }
}

class _StatefulBuilder extends StatefulWidget {
  final Widget Function(StateSetter setState) builder;
  final VoidCallback dispose;

  const _StatefulBuilder({required this.builder, required this.dispose});

  @override
  State<StatefulWidget> createState() {
    return _StatefulBuilderState();
  }
}

class _StatefulBuilderState extends State<_StatefulBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(setState);
  }

  @override
  void dispose() {
    widget.dispose();
    super.dispose();
  }
}
