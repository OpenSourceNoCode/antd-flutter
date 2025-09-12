import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

///弹出层样式
///@l [AntdPopup]
class AntdPopupStyle extends AntdMaskStyle {
  ///内容样式
  final AntdBoxStyle? bodyStyle;

  ///关闭按钮大小
  final AntdIconStyle? closeIconStyle;

  ///关闭图标
  final Widget? closeIcon;

  const AntdPopupStyle(
      {super.inherit,
      this.bodyStyle,
      this.closeIconStyle,
      this.closeIcon,
      super.maskColor,
      super.maskOpacity});

  factory AntdPopupStyle.defaultStyle(
      AntdAliasToken token, double maskOpacity, AntdPosition position) {
    return AntdPopupStyle(
      maskColor: token.colorBlack,
      maskOpacity: maskOpacity,
      bodyStyle: AntdBoxStyle(
        color: token.colorWhite,
      ),
      closeIcon: const AntdIcon(
        icon: AntdIcons.close,
      ),
      closeIconStyle: AntdIconStyle(
          bodyStyle: const AntdBoxStyle(
            padding: EdgeInsets.all(8),
          ),
          size: token.size.xl.roundToDouble(),
          color: token.colorTextTertiary),
    );
  }

  @override
  AntdPopupStyle copyFrom(covariant AntdPopupStyle? style) {
    return AntdPopupStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      closeIconStyle: closeIconStyle.merge(style?.closeIconStyle),
      closeIcon: style?.closeIcon ?? closeIcon,
      maskColor: style?.maskColor ?? maskColor,
      maskOpacity: style?.maskOpacity ?? maskOpacity,
    );
  }
}

abstract class AntdBasePopup<Style extends AntdPopupStyle, WidgetType,
    StateType> extends AntdBaseMask<Style, WidgetType, StateType> {
  const AntdBasePopup(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.opacity,
      super.dismissOnMaskTap,
      super.showMask,
      super.builder,
      super.animationDuration,
      this.closeIcon,
      this.position = AntdPosition.bottom,
      this.avoidKeyboard = true});

  ///自定义关闭按钮图标
  final Widget? closeIcon;

  ///弹出位置
  final AntdPosition position;

  ///当底部弹出式 避免键盘遮挡
  final bool avoidKeyboard;

  @override
  String get layerType => "popup";
}

abstract class AntdPopupBaseState<
    Style extends AntdPopupStyle,
    Popup extends AntdBasePopup<Style, Popup, StateType>,
    T,
    StateType> extends AntdMaskBaseState<Style, Popup, T, StateType> {
  @protected
  Positioned getCloseIcon(Widget child) {
    var mediaQueryData = MediaQuery.of(context);
    switch (widget.position) {
      case AntdPosition.top:
        return Positioned(bottom: 8, right: 8, child: child);
      case AntdPosition.bottom:
        return Positioned(top: 8, right: 8, child: child);
      case AntdPosition.left:
        return Positioned(
            top: (mediaQueryData.padding.top), right: 8, child: child);
      case AntdPosition.right:
        return Positioned(
            top: (mediaQueryData.padding.top), left: 8, child: child);

      default:
        return Positioned(top: 8, bottom: 8, child: child);
    }
  }

  @protected
  Widget? buildPopup() {
    return widget.builder?.call(close, getState());
  }

  @override
  @protected
  Widget buildBuilder() {
    var childList = <Widget>[];

    var popup = buildPopup();
    if (popup != null) {
      childList.add(AntdBox(
        style: style.bodyStyle,
        child: popup,
      ));
    }
    if (widget.closeIcon != null) {
      childList.add(getCloseIcon(AntdBox(
        options: const AntdTapOptions(accepter: AntdTapAccepter.listener),
        onTap: () async {
          await close();
        },
        child:
            AntdIconWrap(style: style.closeIconStyle, child: widget.closeIcon),
      )));
    }

    return AntdBox(
      onLayout: (layoutContext) {
        if (layoutContext.hasSizeChange) {
          onLayout(layoutContext.renderBox);
        }
      },
      child: Stack(
        fit: StackFit.loose,
        children: childList,
      ),
    );
  }

  @override
  @protected
  Animation<T> buildContentAnimation() {
    return buildTween().animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 1, curve: Curves.easeOutCubic),
      ),
    );
  }

  @protected
  void onLayout(RenderBox renderBox) {}
}

abstract class AntdPopupInner<WidgetType, StateType>
    extends AntdBasePopup<AntdPopupStyle, WidgetType, StateType> {
  const AntdPopupInner(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.opacity,
      super.dismissOnMaskTap,
      super.showMask,
      super.builder,
      super.animationDuration,
      super.closeIcon,
      super.position = AntdPosition.bottom,
      super.avoidKeyboard});

  @override
  AntdPopupStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var style = AntdPopupStyle.defaultStyle(token, getOpacity(), position);
    return margeStyle(
        style, theme.popupStyle?.call(context, this, style, token));
  }

  @override
  AntdPopupStyle margeStyle(
      AntdPopupStyle defaultStyle, AntdPopupStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

abstract class AntdOffsetAnimationPopupState<
    Style extends AntdPopupStyle,
    Popup extends AntdBasePopup<Style, Popup, StateType>,
    StateType> extends AntdPopupBaseState<Style, Popup, Offset, StateType> {
  @protected
  double popupWidth = 0;
  @protected
  double popupHeight = 0;

  @override
  @protected
  Tween<Offset> buildTween() {
    var mediaQueryData = MediaQuery.of(context);

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
        endOffset = Offset(0, 1 - popupHeight / screenHeight);
      case AntdPosition.left:
        endOffset = Offset.zero;
      case AntdPosition.right:
        endOffset = Offset(1 - popupWidth / screenWidth, 0);
      default:
        endOffset = const Offset(0, 1.0);
    }

    return Tween<Offset>(
      begin: beginOffset,
      end: endOffset,
    );
  }

  @override
  @protected
  Widget buildBuilder() {
    var child = super.buildBuilder();
    return AnimatedBuilder(
      animation: contentAnimation,
      builder: (context, _) {
        var mediaQuery = MediaQuery.of(context);
        final offsetValue = contentAnimation.value;
        final dx = offsetValue.dx * mediaQuery.size.width;
        final dy = offsetValue.dy * mediaQuery.size.height;

        return Transform.translate(
          offset: Offset(dx,
              dy - (widget.avoidKeyboard ? mediaQuery.viewInsets.bottom : 0)),
          child: child,
        );
      },
    );
  }

  @override
  @protected
  void onLayout(RenderBox renderBox) {
    popupWidth = renderBox.size.width;
    popupHeight = renderBox.size.height;
    contentAnimation = buildContentAnimation();
    controller.reset();
    controller.forward();
  }
}

class AntdPopupState extends AntdOffsetAnimationPopupState<AntdPopupStyle,
    AntdPopup, AntdPopupState> {
  @override
  @protected
  AntdPopupState getState() {
    return this;
  }
}

///@t 弹出层
///@g 反馈
///@o 80
///@d 从屏幕滑出或弹出一块自定义内容区。基于[AntdMask]支持他的所有属性
///@u 适用于展示弹窗、信息提示、选择输入、切换等内容，支持多个弹出层叠加展示。
class AntdPopup extends AntdPopupInner<AntdPopup, AntdPopupState> {
  const AntdPopup(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.opacity,
      super.dismissOnMaskTap = true,
      super.showMask = true,
      super.builder,
      super.animationDuration = const Duration(milliseconds: 400),
      super.closeIcon,
      super.position = AntdPosition.bottom,
      super.avoidKeyboard = true});

  static Future<T?> show<T>(
      {final Key? key,
      final Widget? content,
      final AntdPosition position = AntdPosition.bottom,
      final AntdPopup? popup}) {
    return AntdPopup(
            key: key ?? popup?.key,
            style: popup?.style,
            styleBuilder: popup?.styleBuilder,
            onClosed: popup?.onClosed,
            onOpened: popup?.onOpened,
            onMaskTap: popup?.onMaskTap,
            builder: popup?.builder ??
                (content != null ? (_, ctx) => content : null),
            opacity: popup?.opacity,
            dismissOnMaskTap: popup?.dismissOnMaskTap != false,
            showMask: popup?.showMask != false,
            animationDuration: popup?.animationDuration,
            closeIcon: popup?.closeIcon,
            position: position,
            avoidKeyboard: popup?.avoidKeyboard != false)
        .open();
  }

  @override
  AntdPopup getWidget(BuildContext context) {
    return this;
  }

  @override
  State<StatefulWidget> createState() {
    return AntdPopupState();
  }
}

abstract class AntdCenterAnimationPopupState<
    Style extends AntdPopupStyle,
    Popup extends AntdBasePopup<Style, Popup, StateType>,
    StateType> extends AntdPopupBaseState<Style, Popup, double, StateType> {
  @protected
  late Animation<double> opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0.7, 1),
    ),
  );

  @override
  @protected
  Positioned getCloseIcon(Widget child) {
    return Positioned(
      top: 0,
      right: 0,
      child: child,
    );
  }

  @override
  @protected
  Interval buildMaskInterval() {
    return const Interval(0, 0.5);
  }

  @override
  @protected
  Interval buildContentInterval() {
    return const Interval(0.5, 0.7);
  }

  @override
  @protected
  Tween<double> buildTween() {
    return Tween(begin: 0.0, end: 1.0);
  }

  @override
  @protected
  Widget buildBuilder() {
    var child = super.buildBuilder();
    return ScaleTransition(
      scale: contentAnimation,
      child: FadeTransition(
        opacity: opacityAnimation,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

class AntdCenterPopupState extends AntdCenterAnimationPopupState<AntdPopupStyle,
    AntdCenterPopup, AntdCenterPopupState> {
  @override
  @protected
  AntdCenterPopupState getState() {
    return this;
  }
}

class AntdCenterPopup
    extends AntdPopupInner<AntdCenterPopup, AntdCenterPopupState> {
  const AntdCenterPopup({
    super.key,
    super.style,
    super.styleBuilder,
    super.onClosed,
    super.onOpened,
    super.onMaskTap,
    super.dismissOnMaskTap,
    super.showMask,
    super.builder,
    super.animationDuration,
    super.closeIcon,
  }) : super(avoidKeyboard: false);

  @override
  State<StatefulWidget> createState() {
    return AntdCenterPopupState();
  }

  @override
  AntdCenterPopup getWidget(BuildContext context) {
    return this;
  }
}
