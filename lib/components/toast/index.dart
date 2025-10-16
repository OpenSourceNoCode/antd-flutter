import 'dart:async';

import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

class AntdToastAnimation
    extends AntdMaskBaseAnimation<AntdToast, AntdToastState> {
  const AntdToastAnimation(
      {super.disable,
      super.duration,
      super.maskAnimated = const AntdMaskDefaultAnimated(),
      super.contentAnimated = const AntdMaskContentDefaultAnimated<
          AntdToastStyle, AntdToast, AntdToastState>()});

  @override
  AntdToastAnimation copyFrom(covariant AntdToastAnimation? style) {
    return AntdToastAnimation(
      disable: style?.disable ?? disable,
      duration: style?.duration ?? duration,
      maskAnimated: style?.maskAnimated ?? maskAnimated,
      contentAnimated: style?.contentAnimated ?? contentAnimated,
    );
  }
}

///轻提示样式
///@l [AntdToast]
class AntdToastStyle extends AntdMaskBaseStyle {
  ///主体样式
  final AntdBoxStyle? bodyStyle;

  ///图标大小
  final AntdIconStyle? iconStyle;

  ///内容排列布局样式
  final AntdFlexStyle? columnStyle;

  ///图标
  final Widget? icon;

  ///动画
  final AntdToastAnimation? animation;

  const AntdToastStyle(
      {super.inherit,
      super.maskColor,
      super.maskOpacity,
      this.bodyStyle,
      this.iconStyle,
      this.columnStyle,
      this.icon,
      this.animation});

  @override
  AntdToastStyle copyFrom(covariant AntdToastStyle? style) {
    return AntdToastStyle(
        maskOpacity: style?.maskOpacity ?? maskOpacity,
        maskColor: style?.maskColor ?? maskColor,
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        iconStyle: iconStyle.merge(style?.iconStyle),
        columnStyle: columnStyle.merge(style?.columnStyle),
        icon: style?.icon ?? icon,
        animation: animation.merge(style?.animation));
  }
}

enum AntdToastPosition { top, bottom, center }

enum AntdToastType { success, fail, normal }

///@t 轻提示
///@g 反馈
///@o 66
///@d 对操作结果的轻量级反馈，无需用户操作即可自行消失。
///@u 适用于页面内容的变化不能直接反应操作结果时使用。
class AntdToast extends AntdBaseMask<AntdToastStyle, AntdToast, AntdToastState>
    with AntdLayerMixin {
  const AntdToast({
    super.key,
    super.style,
    super.styleBuilder,
    super.onClosed,
    super.onOpened,
    super.onMaskTap,
    super.builder,
    super.opacity = AntdMaskOpacity.transparent,
    super.dismissOnMaskTap = true,
    super.showMask = false,
    this.duration = const Duration(milliseconds: 2000),
    this.icon,
    this.position,
    this.dismissOnTap = true,
    this.type,
    this.animation,
  });

  ///提示持续时间，若为 0 则不会自动关闭
  final Duration? duration;

  ///Toast 图标
  final AntdIcon? icon;

  ///垂直方向显示位置
  final AntdToastPosition? position;

  ///当触摸的时候关闭
  final bool dismissOnTap;

  ///toast的类型
  final AntdToastType? type;

  ///自定义动画
  final AntdToastAnimation? animation;

  @override
  State<StatefulWidget> createState() {
    return AntdToastState();
  }

  @override
  AntdToastStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdToastStyle(
        bodyStyle: AntdBoxStyle(
            constraints: BoxConstraints(minWidth: icon?.icon != null ? 130 : 0),
            color: token.colorBgSpotlight,
            radius: token.radius.all,
            textStyle: token.font.md.copyWith(color: token.colorWhite),
            padding: icon != null
                ? 40.vertical.marge(token.size.lg.horizontal)
                : token.size.lg.all,
            margin: switch (position) {
              AntdToastPosition.top => token.size.xxl.top,
              AntdToastPosition.center => null,
              AntdToastPosition.bottom => token.size.xxl.bottom,
              null => null,
            },
            options: dismissOnTap == true
                ? const AntdTapOptions(alwaysReceiveTap: true)
                : null),
        icon: switch (type) {
          null => null,
          AntdToastType.success => const AntdIcon(
              icon: AntdIcons.check,
            ),
          AntdToastType.fail => const AntdIcon(
              icon: AntdIcons.close,
            ),
          AntdToastType.normal => null,
        },
        iconStyle: AntdIconStyle(
            size: 32,
            color: token.colorWhite,
            bodyStyle: AntdBoxStyle(margin: token.size.seed.bottom)),
        columnStyle: const AntdFlexStyle(mainAxisSize: MainAxisSize.min),
        animation:
            const AntdToastAnimation(duration: Duration(milliseconds: 200)));
  }

  @override
  AntdToastStyle margeStyle(
      AntdToastStyle defaultStyle, AntdToastStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdToastStyle, AntdToast>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.toastStyle;
  }

  @override
  AntdToast getWidget(BuildContext context) {
    return this;
  }

  @override
  String get layerType => "toast/$type";

  static Future<T?> show<T>(String text,
      {final Key? key,
      final Widget? body,
      final Duration? duration = const Duration(milliseconds: 2000),
      final AntdIcon? icon,
      final AntdToastPosition? position,
      final AntdToast? toast}) {
    return AntdToast(
      key: key ?? toast?.key,
      style: toast?.style,
      styleBuilder: toast?.styleBuilder,
      onClosed: toast?.onClosed,
      onOpened: toast?.onOpened,
      onMaskTap: toast?.onMaskTap,
      builder: toast?.builder ?? (_, ctx) => body ?? Text(text),
      opacity: toast?.opacity,
      dismissOnMaskTap: toast?.dismissOnMaskTap != false,
      showMask: toast?.showMask,
      duration: duration ?? toast?.duration,
      icon: icon ?? toast?.icon,
      position: position ?? toast?.position,
      dismissOnTap: toast?.dismissOnTap != false,
      type: toast?.type,
      animation: toast?.animation,
    ).open();
  }
}

class AntdToastState
    extends AntdMaskBaseState<AntdToastStyle, AntdToast, AntdToastState> {
  @protected
  Timer? timer;

  @protected
  bool isDuration() {
    return widget.duration != null && widget.duration!.inMilliseconds > 0;
  }

  @override
  @protected
  onOpened() {
    super.onOpened();
    if (!isDuration()) {
      return;
    }

    final totalMs = widget.duration!.inMilliseconds;
    final startTime = DateTime.now().millisecondsSinceEpoch;

    timer = Timer.periodic(const Duration(milliseconds: 16), (timer) async {
      if (!mounted) return;

      final elapsed = DateTime.now().millisecondsSinceEpoch - startTime;
      final remaining = totalMs - elapsed;

      if (remaining <= 0) {
        timer.cancel();
        await close();
      }
    });
  }

  @override
  @protected
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @protected
  Alignment getAlignment() {
    if (widget.position == AntdToastPosition.top) {
      return Alignment.topCenter;
    }
    if (widget.position == AntdToastPosition.bottom) {
      return Alignment.bottomCenter;
    }
    return Alignment.center;
  }

  @override
  @protected
  Widget? buildBuilder() {
    var child = super.buildBuilder();
    var icon = widget.icon ?? style.icon;
    var columns = <Widget>[
      if (icon != null) AntdIconWrap(style: style.iconStyle, child: icon),
      if (child != null) child
    ];

    return Align(
      alignment: getAlignment(),
      child: AntdBox(
        onTap: widget.dismissOnTap
            ? () async {
                if (!mounted) {
                  return;
                }
                await close();
              }
            : null,
        outerSafeArea: switch (widget.position) {
          AntdToastPosition.top => AntdPosition.top,
          AntdToastPosition.center => null,
          AntdToastPosition.bottom => AntdPosition.bottom,
          null => null,
        },
        style: style.bodyStyle,
        child: AntdColumn(
          style: style.columnStyle,
          children: columns,
        ),
      ),
    );
  }

  @override
  @protected
  AntdToastState getState() {
    return this;
  }

  @override
  AntdMaskBaseAnimation<AntdToast, AntdToastState>? buildStyleAnimation() {
    return style.animation;
  }

  @override
  AntdMaskBaseAnimation<AntdToast, AntdToastState>? buildWidgetAnimation() {
    return widget.animation;
  }
}
