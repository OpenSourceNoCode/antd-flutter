import 'dart:async';

import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

///轻提示样式
///@l [AntdToast]
class AntdToastStyle extends AntdMaskStyle {
  ///主体样式
  final AntdBoxStyle? bodyStyle;

  ///图标大小
  final AntdBoxStyle? iconStyle;

  ///内容排列布局样式
  final AntdFlexStyle? columnStyle;

  ///图标
  final Widget? icon;

  const AntdToastStyle(
      {super.inherit,
      this.bodyStyle,
      this.iconStyle,
      this.columnStyle,
      this.icon,
      super.maskColor,
      super.maskOpacity});

  @override
  AntdToastStyle copyFrom(covariant AntdToastStyle? style) {
    return AntdToastStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      iconStyle: iconStyle.merge(style?.iconStyle),
      columnStyle: columnStyle.merge(style?.columnStyle),
      icon: style?.icon ?? icon,
      maskOpacity: style?.maskOpacity ?? maskOpacity,
      maskColor: style?.maskColor ?? maskColor,
    );
  }
}

enum AntdToastPosition { top, bottom, center }

enum AntdToastType { success, fail, other }

///@t 轻提示
///@g 反馈
///@o 66
///@d 对操作结果的轻量级反馈，无需用户操作即可自行消失。
///@u 适用于页面内容的变化不能直接反应操作结果时使用。
class AntdToast extends AntdBaseMask<AntdToastStyle, AntdToast, AntdToastState>
    with AntdLayerMixin {
  const AntdToast(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.builder,
      super.opacity = AntdMaskOpacity.transparent,
      super.dismissOnMaskTap = true,
      super.showMask = false,
      super.animationDuration = const Duration(milliseconds: 200),
      this.duration = const Duration(milliseconds: 2000),
      this.icon,
      this.position,
      this.dismissOnTap = true,
      this.type});

  ///提示持续时间，若为 0 则不会自动关闭
  final Duration? duration;

  ///Toast 图标
  final Widget? icon;

  ///垂直方向显示位置
  final AntdToastPosition? position;

  ///当触摸的时候关闭
  final bool dismissOnTap;

  ///toast的类型
  final AntdToastType? type;

  @override
  State<StatefulWidget> createState() {
    return AntdToastState();
  }

  @override
  AntdToastStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdToastStyle(
        bodyStyle: AntdBoxStyle(
            color: token.colorBlack.withValues(alpha: 0.7),
            radius: token.radius.default_.radius.all,
            textStyle: token.font.md.copyWith(color: token.colorWhite),
            padding: icon != null ? 40.all : token.size.lg.all,
            margin: switch (position) {
              AntdToastPosition.top => token.size.xxl.top,
              AntdToastPosition.center => null,
              AntdToastPosition.bottom => token.size.xxl.bottom,
              null => null,
            }),
        icon: switch (type) {
          null => null,
          AntdToastType.success => const AntdIcon(
              icon: AntdIcons.check,
            ),
          AntdToastType.fail => const AntdIcon(
              icon: AntdIcons.close,
            ),
          AntdToastType.other => null,
        },
        iconStyle: AntdBoxStyle(margin: token.size.default_.bottom),
        columnStyle: const AntdFlexStyle(mainAxisSize: MainAxisSize.min),
        maskOpacity: getOpacity());
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
      final Widget? icon,
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
      animationDuration: toast?.animationDuration,
      duration: duration ?? toast?.duration,
      icon: icon ?? toast?.icon,
      position: position ?? toast?.position,
      dismissOnTap: toast?.dismissOnTap != false,
      type: toast?.type,
    ).open();
  }
}

class AntdToastState extends AntdMaskBaseState<AntdToastStyle, AntdToast,
    double, AntdToastState> {
  @protected
  Timer? timer;

  @protected
  bool isDuration() {
    return widget.duration != null && widget.duration!.inMilliseconds > 0;
  }

  @override
  @protected
  void initState() {
    super.initState();

    if (isDuration()) {
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

    var columns = <Widget>[
      if (widget.icon != null)
        AntdBox(style: style.iconStyle, child: widget.icon!),
      if (child != null) child
    ];

    return FadeTransition(
      opacity: contentAnimation,
      child: Align(
        alignment: getAlignment(),
        child: AntdBox(
          onTap: widget.dismissOnTap
              ? () async {
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
      ),
    );
  }

  @override
  @protected
  Tween<double> buildTween() {
    return Tween(begin: 0.0, end: 1.0);
  }

  @override
  @protected
  AntdToastState getState() {
    return this;
  }
}
