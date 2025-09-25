import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

class AntdPopupOffsetAnimation<
        Style extends AntdPopupBaseStyle,
        WidgetType extends AntdBasePopup<Style, WidgetType, StateType>,
        StateType extends AntdPopupBaseState<Style, WidgetType, StateType>>
    extends AntdAnimated<WidgetType, StateType> {
  const AntdPopupOffsetAnimation();

  @override
  Widget build(AnimationController controller, Widget? child,
      AntdAnimatedContext<WidgetType, StateType> context) {
    var animation = createAnimation(controller, context);
    var widget = context.widget;
    return AnimatedBuilder(
        animation: animation,
        builder: (_, c) {
          var mediaQuery = MediaQuery.of(context.context);
          final offsetValue = animation.value;
          final dx = offsetValue.dx * mediaQuery.size.width;
          final dy = offsetValue.dy * mediaQuery.size.height;

          return Transform.translate(
            offset: Offset(dx,
                dy - (widget.avoidKeyboard ? mediaQuery.viewInsets.bottom : 0)),
            child: child,
          );
        });
  }

  Animation<Offset> createAnimation(AnimationController controller,
      AntdAnimatedContext<WidgetType, StateType> context) {
    var widget = context.widget;
    var state = context.state;
    var mediaQueryData = MediaQuery.of(context.context);

    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    Offset beginOffset;
    Offset endOffset = Offset.zero;

    switch (widget.position) {
      case AntdPosition.top:
        beginOffset = const Offset(0, -1.0);
      case AntdPosition.bottom:
        beginOffset = const Offset(0, 1);
      case AntdPosition.left:
        beginOffset = const Offset(-1.0, 0);
      case AntdPosition.right:
        beginOffset = const Offset(1.0, 0);
      default:
        beginOffset = const Offset(0, 1.0);
    }

    switch (widget.position) {
      case AntdPosition.top:
        endOffset = Offset.zero;
      case AntdPosition.bottom:
        endOffset = Offset(0, 1 - state.popupHeight / screenHeight);
      case AntdPosition.left:
        endOffset = Offset.zero;
      case AntdPosition.right:
        endOffset = Offset(1 - state.popupWidth / screenWidth, 0);
      default:
        endOffset = const Offset(0, 1.0);
    }

    return Tween<Offset>(
      begin: beginOffset,
      end: endOffset,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 1, curve: Curves.easeOutCubic),
      ),
    );
  }
}

class AntdPopupScaleFadeAnimation<
        Style extends AntdPopupBaseStyle,
        WidgetType extends AntdBasePopup<Style, WidgetType, StateType>,
        StateType extends AntdPopupBaseState<Style, WidgetType, StateType>>
    extends AntdAnimated<WidgetType, StateType> {
  const AntdPopupScaleFadeAnimation();

  @override
  Widget build(AnimationController controller, Widget? child,
      AntdAnimatedContext<WidgetType, StateType> context) {
    var tween = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1, curve: Curves.easeOutCubic),
      ),
    );

    Animation<double> opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.7, 1),
      ),
    );

    return ScaleTransition(
      scale: tween,
      child: FadeTransition(
        opacity: opacityAnimation,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
