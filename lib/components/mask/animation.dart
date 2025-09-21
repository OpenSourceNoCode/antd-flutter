import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/cupertino.dart';

class AntdMaskAnimation<WidgetType, StateType> extends AntdAnimation {
  final AntdAnimated<WidgetType, StateType>? maskAnimated;

  final AntdAnimated<WidgetType, StateType>? holeAnimated;

  final AntdAnimated<WidgetType, StateType>? contentAnimated;

  const AntdMaskAnimation(
      {super.disable,
      super.duration,
      this.maskAnimated,
      this.holeAnimated,
      this.contentAnimated});

  @override
  AntdMaskAnimation<WidgetType, StateType> copyFrom(
      covariant AntdMaskAnimation<WidgetType, StateType>? style) {
    return AntdMaskAnimation<WidgetType, StateType>(
      disable: style?.disable ?? disable,
      duration: style?.duration ?? duration,
      maskAnimated: style?.maskAnimated ?? maskAnimated,
      holeAnimated: style?.holeAnimated ?? holeAnimated,
      contentAnimated: style?.contentAnimated ?? contentAnimated,
    );
  }
}

class AntdMaskDefaultAnimated<WidgetType, StateType>
    extends AntdAnimated<WidgetType, StateType> {
  const AntdMaskDefaultAnimated();

  @override
  Widget build(AnimationController controller, Widget? child,
      AntdAnimatedContext<WidgetType, StateType> context) {
    var tween = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 1, curve: Curves.easeOut),
      ),
    );
    return FadeTransition(
      opacity: tween,
      child: child,
    );
  }
}

class AntdHoleDefaultAnimated<
        Style extends AntdMaskBaseStyle,
        WidgetType extends AntdBaseMask<Style, WidgetType, StateType>,
        StateType extends AntdMaskBaseState<Style, WidgetType, StateType>>
    extends AntdAnimated<WidgetType, StateType> {
  const AntdHoleDefaultAnimated();

  @override
  Widget build(AnimationController controller, Widget? child,
      AntdAnimatedContext<WidgetType, StateType> context) {
    var state = context.state;
    var tween = createAnimation(controller, context);
    return AnimatedBuilder(
        animation: tween,
        builder: (_, child) {
          return CustomPaint(
            painter: AntdMaskPainter(
              hole: tween.value,
              color: state.maskColor,
            ),
            size: Size.infinite,
          );
        });
  }

  Animation<AntdMaskHole> createAnimation(AnimationController controller,
      AntdAnimatedContext<WidgetType, StateType> context) {
    var state = context.state;
    return Tween(begin: state.hole, end: state.targetHole).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.5, curve: Curves.easeOutCubic),
      ),
    );
  }
}

class AntdMaskContentDefaultAnimated<
        Style extends AntdMaskBaseStyle,
        WidgetType extends AntdBaseMask<Style, WidgetType, StateType>,
        StateType extends AntdMaskBaseState<Style, WidgetType, StateType>>
    extends AntdAnimated<WidgetType, StateType> {
  const AntdMaskContentDefaultAnimated();

  @override
  Widget build(AnimationController controller, Widget? child,
      AntdAnimatedContext<WidgetType, StateType> context) {
    var widget = context.widget;
    var state = context.state;
    var skip = (state.targetHole != null && state.targetHole == state.hole) ||
        widget.showMask != true;
    var tween = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(skip ? 0 : 0.5, 1, curve: Curves.easeOutCubic),
      ),
    );
    return FadeTransition(
      opacity: tween,
      child: child,
    );
  }
}

class AntdMaskDefaultAnimation
    extends AntdMaskAnimation<AntdMask, AntdMaskState> {
  const AntdMaskDefaultAnimation(
      {super.disable,
      super.duration,
      super.maskAnimated = const AntdMaskDefaultAnimated(),
      super.contentAnimated = const AntdMaskContentDefaultAnimated<
          AntdMaskStyle, AntdMask, AntdMaskState>()});
}
