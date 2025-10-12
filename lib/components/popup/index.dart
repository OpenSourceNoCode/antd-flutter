import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

///弹出层样式
///@l [AntdPopup]
class AntdPopupBaseStyle extends AntdMaskBaseStyle {
  ///内容样式
  final AntdBoxStyle? bodyStyle;

  ///关闭按钮大小
  final AntdIconStyle? closeIconStyle;

  ///关闭图标
  final Widget? closeIcon;

  const AntdPopupBaseStyle({
    super.inherit,
    super.maskColor,
    super.maskOpacity,
    this.bodyStyle,
    this.closeIconStyle,
    this.closeIcon,
  });
}

abstract class AntdBasePopup<Style extends AntdPopupBaseStyle, WidgetType,
    StateType> extends AntdBaseMask<Style, WidgetType, StateType> {
  const AntdBasePopup({
    super.key,
    super.style,
    super.styleBuilder,
    super.onClosed,
    super.onOpened,
    super.onMaskTap,
    super.opacity,
    super.dismissOnMaskTap,
    super.showMask,
    super.builder,
    this.closeIcon,
    this.position = AntdPosition.bottom,
    this.avoidKeyboard = true,
  });

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
    Style extends AntdPopupBaseStyle,
    Popup extends AntdBasePopup<Style, Popup, StateType>,
    StateType> extends AntdMaskBaseState<Style, Popup, StateType> {
  double popupWidth = 0;
  double popupHeight = 0;

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

  @override
  bool buildAutoAnimation() {
    return false;
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
        options: const AntdTapOptions(alwaysReceiveTap: true),
        onTap: () async {
          await close();
        },
        child:
            AntdIconWrap(style: style.closeIconStyle, child: widget.closeIcon),
      )));
    }

    return AntdBox(
      onLayout: (layoutContext) {
        var renderBox = layoutContext.renderBox;
        if (layoutContext.hasSizeChange) {
          popupWidth = renderBox.size.width;
          popupHeight = renderBox.size.height;

          openAnimation();
          setState(() {});
        }
      },
      child: Stack(
        fit: StackFit.loose,
        children: childList,
      ),
    );
  }
}

class AntdPopupAnimation
    extends AntdMaskBaseAnimation<AntdPopup, AntdPopupState> {
  const AntdPopupAnimation(
      {super.disable,
      super.duration,
      super.maskAnimated =
          const AntdMaskDefaultAnimated<AntdPopup, AntdPopupState>(),
      super.contentAnimated = const AntdPopupOffsetAnimation<AntdPopupStyle,
          AntdPopup, AntdPopupState>()});

  @override
  AntdPopupAnimation copyFrom(covariant AntdPopupAnimation? style) {
    return AntdPopupAnimation(
      disable: style?.disable ?? disable,
      duration: style?.duration ?? duration,
      maskAnimated: style?.maskAnimated ?? maskAnimated,
      contentAnimated: style?.contentAnimated ?? contentAnimated,
    );
  }
}

class AntdPopupStyle extends AntdPopupBaseStyle {
  const AntdPopupStyle(
      {super.inherit,
      super.maskColor,
      super.maskOpacity,
      super.bodyStyle,
      super.closeIconStyle,
      super.closeIcon,
      this.animation});

  ///弹出层动画
  final AntdPopupAnimation? animation;

  @override
  AntdPopupStyle copyFrom(covariant AntdPopupStyle? style) {
    return AntdPopupStyle(
        maskColor: style?.maskColor ?? maskColor,
        maskOpacity: style?.maskOpacity ?? maskOpacity,
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        closeIconStyle: closeIconStyle.merge(style?.closeIconStyle),
        closeIcon: style?.closeIcon ?? closeIcon,
        animation: animation.merge(style?.animation)!);
  }

  factory AntdPopupStyle.defaultStyle(AntdMapToken token) {
    return AntdPopupStyle(
        maskColor: token.colorBlack,
        bodyStyle: AntdBoxStyle(
          color: token.colorBgContainer,
        ),
        closeIcon: const AntdIcon(
          icon: AntdIcons.close,
        ),
        closeIconStyle: AntdIconStyle(
            bodyStyle: const AntdBoxStyle(
              padding: EdgeInsets.all(8),
            ),
            size: token.size.xl.roundToDouble(),
            color: token.colorText.tertiary),
        animation:
            const AntdPopupAnimation(duration: Duration(milliseconds: 400)));
  }
}

///@t 弹出层
///@g 反馈
///@o 80
///@d 从屏幕滑出或弹出一块自定义内容区。基于[AntdMask]支持他的所有属性
///@u 适用于展示弹窗、信息提示、选择输入、切换等内容，支持多个弹出层叠加展示。
class AntdPopup
    extends AntdBasePopup<AntdPopupStyle, AntdPopup, AntdPopupState> {
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
      super.closeIcon,
      super.position = AntdPosition.bottom,
      super.avoidKeyboard = true,
      this.animation});

  ///弹出层动画
  final AntdPopupAnimation? animation;

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
      builder: popup?.builder ?? (content != null ? (_, ctx) => content : null),
      opacity: popup?.opacity,
      dismissOnMaskTap: popup?.dismissOnMaskTap != false,
      showMask: popup?.showMask != false,
      closeIcon: popup?.closeIcon,
      position: position,
      avoidKeyboard: popup?.avoidKeyboard != false,
      animation: popup?.animation,
    ).open();
  }

  @override
  AntdPopup getWidget(BuildContext context) {
    return this;
  }

  @override
  State<StatefulWidget> createState() {
    return AntdPopupState();
  }

  @override
  AntdPopupStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdPopupStyle.defaultStyle(token);
  }

  @override
  AntdPopupStyle margeStyle(
      AntdPopupStyle defaultStyle, AntdPopupStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdPopupStyle, AntdPopup>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.popupStyle;
  }
}

class AntdPopupState
    extends AntdPopupBaseState<AntdPopupStyle, AntdPopup, AntdPopupState> {
  @override
  AntdPopupState getState() {
    return this;
  }

  @override
  AntdMaskBaseAnimation<AntdPopup, AntdPopupState>? buildStyleAnimation() {
    return style.animation;
  }

  @override
  AntdMaskBaseAnimation<AntdPopup, AntdPopupState>? buildWidgetAnimation() {
    return widget.animation;
  }
}
