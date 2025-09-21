import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

class AntdTourAnimation extends AntdMaskAnimation<AntdTour, AntdTourState> {
  const AntdTourAnimation(
      {super.disable,
      super.duration,
      super.holeAnimated = const AntdHoleDefaultAnimated(),
      super.contentAnimated = const AntdMaskContentDefaultAnimated<
          AntdTourStyle, AntdTour, AntdTourState>()});
}

/// 提示样式
/// @l [AntdTour]
class AntdTourStyle extends AntdMaskBaseStyle {
  const AntdTourStyle(
      {super.inherit,
      super.maskColor,
      super.maskOpacity,
      this.stepStyle,
      this.animation});

  ///步骤条样式
  final AntdTourStepStyle? stepStyle;

  ///动画
  final AntdTourAnimation? animation;

  @override
  AntdTourStyle copyFrom(covariant AntdTourStyle? style) {
    return AntdTourStyle(
      maskColor: style?.maskColor ?? maskColor,
      maskOpacity: style?.maskOpacity ?? maskOpacity,
      stepStyle: stepStyle.merge(style?.stepStyle),
      animation: animation.merge(style?.animation),
    );
  }
}

class AntdTourController extends ChangeNotifier {
  final _steps = <int, AntdTourStepState>{};
  final _stepRenderBox = <int, RenderBox>{};
  List<int> get _stepIndexList => _steps.keys.toList()..sort();

  int _currentIndex = 0;
  int? get activeIndex => _stepIndexList[_currentIndex];
  bool get isLast => _currentIndex == _stepIndexList.length - 1;
  int? get totalStep => _stepIndexList.length;

  AntdTourState? _tourState;

  void registerStep(AntdTourStepState? step) {
    if (step == null) {
      return;
    }

    _steps[step.widget.index] = step;
  }

  void unregisterStep(AntdTourStepState? step) {
    if (step == null) {
      return;
    }

    var oldStep = _steps[step.widget.index];
    if (oldStep == null || oldStep == step) {
      _steps.remove(step.widget.index);
      _stepRenderBox.remove(step.widget.index);
    }
  }

  void updateStep(int index, RenderBox renderBox) {
    _stepRenderBox[index] = renderBox;
  }

  AntdTourStepState? _getStep() {
    return _steps[activeIndex];
  }

  AntdMaskHole? _getHole([int? index]) {
    var renderBox = _stepRenderBox[index ?? activeIndex];
    var step = _steps[activeIndex];
    if (renderBox == null || step == null) {
      return null;
    }

    var offset = renderBox.localToGlobal(Offset.zero);
    return AntdMaskHole(
        offset: offset,
        size: renderBox.size,
        padding: step.hole?.padding,
        radius: step.hole?.radius);
  }

  static AntdTourController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AntdTourProvider>()
        ?.controller;
  }

  void open(int index) {
    var hole = _getHole(index);
    if (hole != null) {
      _tourState?.open(hole);
      _currentIndex = _stepIndexList.indexOf(index);
    }
    notifyListeners();
  }

  void next() {
    _currentIndex = _currentIndex + 1;
    if (_currentIndex > _steps.length) {
      return;
    }
    var hole = _getHole();
    if (hole != null) {
      _tourState?.setHole(hole);
    }
    notifyListeners();
  }

  void prev() {
    _currentIndex = _currentIndex - 1;
    if (_currentIndex < 0) {
      return;
    }

    var hole = _getHole();
    if (hole != null) {
      _tourState?.setHole(hole);
    }
    notifyListeners();
  }

  void finish() {
    _tourState?.close();
  }

  @override
  void dispose() {
    _steps.clear();
    _stepRenderBox.clear();
    _tourState = null;
    super.dispose();
  }
}

class AntdTourProvider extends InheritedWidget {
  final AntdTourController controller;

  const AntdTourProvider(
      {super.key, required super.child, required this.controller});
  @override
  bool updateShouldNotify(covariant AntdTourProvider oldWidget) {
    return oldWidget.controller != oldWidget.controller;
  }
}

///@t 引导提示
///@g 信息展示
///@o 101
///@u 提示用户操作和交互
class AntdTour extends AntdBaseMask<AntdTourStyle, AntdTour, AntdTourState> {
  const AntdTour(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.builder,
      super.opacity = AntdMaskOpacity.thin,
      super.dismissOnMaskTap = true,
      super.showMask = true,
      super.animation,
      required this.child,
      this.controller});

  /// 需要被引导的高亮目标组件
  final Widget child;

  /// 引导流程的控制器，用于手动控制步骤切换
  final AntdTourController? controller;

  @override
  State<StatefulWidget> createState() {
    return AntdTourState();
  }

  @override
  AntdTourStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return const AntdTourStyle(
        animation: AntdTourAnimation(duration: Duration(milliseconds: 400)));
  }

  @override
  AntdTour getWidget(BuildContext content) {
    return this;
  }

  @override
  AntdTourStyle margeStyle(AntdTourStyle defaultStyle, AntdTourStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdTourStyle, AntdTour>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.tourStyle;
  }
}

class AntdTourState
    extends AntdMaskProxyState<AntdTourStyle, AntdTour, AntdTourState> {
  late final AntdTourController _controller =
      widget.controller ?? AntdTourController();

  @override
  void initState() {
    super.initState();
    _controller._tourState = this;
  }

  @override
  Widget render(BuildContext context) {
    return AntdTourProvider(
        controller: _controller,
        child: AntdStyleProvider<AntdTourStepStyle>(
            style: style.stepStyle, child: widget.child));
  }

  @override
  Widget? buildBuilder() {
    var target = _controller._getHole();
    AntdTourStepState? step = _controller._getStep();
    if (target == null || step == null) {
      return const AntdBox();
    }
    return AntdPopoverBox(
        target: target.toPopoverTarget(),
        style: step.style,
        placement: step.widget.placement,
        child: step.renderStep(context));
  }

  @override
  void dispose() {
    if (_controller != widget.controller) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  AntdTourState getState() {
    return this;
  }

  @override
  AntdMaskAnimation<AntdTour, AntdTourState>? buildStyleAnimation() {
    return style.animation;
  }
}
