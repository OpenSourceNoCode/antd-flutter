import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

///弹窗定义
///@l [AntdModal]
class AntdModalAction extends AntdBaseAction<AntdActionStyle, AntdModalAction> {
  const AntdModalAction(
      {super.key,
      super.style,
      super.styleBuilder,
      super.description,
      super.disabled,
      super.onTap,
      super.title,
      super.bold,
      super.danger,
      this.primary});

  ///主要按钮
  final bool? primary;

  @override
  AntdActionStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var textColor = danger == true
        ? token.colorError
        : (primary == true ? token.colorWhite : token.colorPrimary);
    return AntdActionStyle(
      bodyStyle: AntdBoxStyle(
          feedbackStyle: primary == true
              ? AntdBoxStyle(color: token.colorPrimary.bgActive)
              : null,
          color: primary == true ? token.colorPrimary : token.colorTransparent,
          width: double.infinity,
          radius: token.radius.all,
          margin: primary == true
              ? token.size.ms.vertical.marge(token.size.lg.horizontal)
              : null,
          padding: token.size.lg.all),
      titleStyle: AntdBoxStyle(
          alignment: Alignment.center,
          textStyle: token.font.xxl.copyWith(
              color: textColor,
              fontWeight: bold == true ? FontWeight.w600 : null),
          feedbackStyle: primary == true
              ? null
              : AntdKitStyle(
                  textStyle:
                      TextStyle(color: textColor.withValues(alpha: 0.3)))),
      descriptionStyle: AntdBoxStyle(
        textStyle: token.font.md.copyWith(color: token.colorText.tertiary),
        margin: token.size.xs.top,
      ),
    );
  }

  @override
  AntdModalAction getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdStyleBuilder<AntdActionStyle, AntdModalAction>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.modalActionStyle;
  }

  @override
  AntdActionStyle margeStyle(
      AntdActionStyle defaultStyle, AntdActionStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

enum AntdModalType { alert, confirm, normal }

class AntdModalAnimation extends AntdMaskAnimation<AntdModal, AntdModalState> {
  const AntdModalAnimation(
      {required super.duration,
      super.maskAnimated =
          const AntdMaskDefaultAnimated<AntdModal, AntdModalState>(),
      super.contentAnimated = const AntdPopupScaleFadeAnimation<AntdModalStyle,
          AntdModal, AntdModalState>()});
}

class AntdModalStyle extends AntdDialogBaseStyle {
  const AntdModalStyle({
    super.inherit,
    super.bodyStyle,
    super.closeIconStyle,
    super.closeIcon,
    super.maskColor,
    super.maskOpacity,
    super.headerStyle,
    super.titleStyle,
    super.contentStyle,
    super.actionStyle,
    this.animation,
  });

  ///弹出层动画
  final AntdModalAnimation? animation;

  @override
  AntdModalStyle copyFrom(covariant AntdModalStyle? style) {
    return AntdModalStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      closeIconStyle: closeIconStyle.merge(style?.closeIconStyle),
      maskColor: style?.maskColor ?? maskColor,
      maskOpacity: style?.maskOpacity ?? maskOpacity,
      headerStyle: headerStyle.merge(style?.headerStyle),
      titleStyle: titleStyle.merge(style?.titleStyle),
      contentStyle: contentStyle.merge(style?.contentStyle),
      actionStyle: actionStyle.merge(style?.actionStyle),
      animation: animation.merge(style?.animation),
    );
  }
}

///@t 弹窗
///@g 反馈
///@o 89
///@d 用于重要信息的告知或操作的反馈，并附带少量的选项供用户进行操作。
///@u 需要用户处理事务，又不希望跳转页面以致打断工作流程时，可以使用 Modal 在当前页面正中打开一个浮层，承载相应的操作。
class AntdModal extends AntdBaseDialog<AntdModalAction, AntdModal,
    AntdModalStyle, AntdModalState> {
  const AntdModal(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.opacity,
      super.dismissOnMaskTap = true,
      super.showMask = true,
      super.animation,
      super.actions,
      super.dismissOnAction,
      super.builder,
      super.closeIcon,
      super.header,
      super.title,
      this.type = AntdModalType.normal});

  ///modal的类型，一般用作全局主题的动态样式
  final AntdModalType type;

  static Future<T?> show<T>(
      {final Key? key,
      final Widget? header,
      final Widget? title,
      required final Widget content,
      final List<AntdModalAction>? actions,
      AntdModal? modal}) {
    return AntdModal(
      key: key ?? modal?.key,
      style: modal?.style,
      styleBuilder: modal?.styleBuilder,
      onClosed: modal?.onClosed,
      onOpened: modal?.onOpened,
      onMaskTap: modal?.onMaskTap,
      opacity: modal?.opacity,
      dismissOnMaskTap: modal?.dismissOnMaskTap != false,
      showMask: modal?.showMask != false,
      animation: modal?.animation,
      actions: actions,
      dismissOnAction: modal?.dismissOnAction != false,
      builder: modal?.builder ??
          (_, ctx) {
            return content;
          },
      closeIcon: modal?.closeIcon,
      header: header ?? modal?.header,
      title: title ?? modal?.header,
      type: modal?.type ?? AntdModalType.normal,
    ).open<T>();
  }

  static Future<T?> alert<T>(Widget content,
      {final Key? key,
      final Widget? header,
      final Widget? title,
      final AntdActionStyle? style,
      final Widget alert = const Text("我知道了"),
      final AntdActionOnTap? onConfirm,
      final AntdModal? modal}) {
    return AntdModal(
      key: key ?? modal?.key,
      style: modal?.style,
      styleBuilder: modal?.styleBuilder,
      onClosed: modal?.onClosed,
      onOpened: modal?.onOpened,
      onMaskTap: modal?.onMaskTap,
      opacity: modal?.opacity,
      dismissOnMaskTap: modal?.dismissOnMaskTap != false,
      showMask: modal?.showMask != false,
      animation: modal?.animation,
      actions: [
        AntdModalAction(
          title: alert,
          primary: true,
          onTap: onConfirm,
          style: style,
        ),
        ...(modal?.actions ?? [])
      ],
      dismissOnAction: modal?.dismissOnAction != false,
      builder: modal?.builder ??
          (_, ctx) {
            return content;
          },
      closeIcon: modal?.closeIcon,
      header: header ?? modal?.header,
      title: title ?? modal?.header,
      type: AntdModalType.alert,
    ).open<T>();
  }

  static Future<T?> confirm<T>(Widget content,
      {final Key? key,
      final Widget? header,
      final Widget? title,
      final AntdActionStyle? confirmStyle,
      final Widget confirm = const Text("确认"),
      final AntdActionOnTap? onConfirm,
      final AntdActionStyle? cancelStyle,
      final Widget cancel = const Text("取消"),
      final AntdActionOnTap? onCancel,
      final AntdModal? modal}) {
    return AntdModal(
      key: key ?? modal?.key,
      style: modal?.style,
      styleBuilder: modal?.styleBuilder,
      onClosed: modal?.onClosed,
      onOpened: modal?.onOpened,
      onMaskTap: modal?.onMaskTap,
      opacity: modal?.opacity,
      dismissOnMaskTap: modal?.dismissOnMaskTap != false,
      showMask: modal?.showMask != false,
      animation: modal?.animation,
      actions: [
        AntdModalAction(
          title: cancel,
          primary: true,
          onTap: onCancel,
          style: cancelStyle,
        ),
        AntdModalAction(
          title: confirm,
          onTap: onConfirm,
          style: confirmStyle,
        ),
        ...(modal?.actions ?? [])
      ],
      dismissOnAction: modal?.dismissOnAction != false,
      builder: modal?.builder ??
          (_, ctx) {
            return content;
          },
      closeIcon: modal?.closeIcon,
      header: header ?? modal?.header,
      title: title ?? modal?.header,
      type: AntdModalType.confirm,
    ).open<T>();
  }

  @override
  State<StatefulWidget> createState() {
    return AntdModalState();
  }

  @override
  AntdModalStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdModalStyle(
        bodyStyle: AntdBoxStyle(
          padding: header != null || title != null ? token.size.xl.top : null,
          color: token.colorBgContainer,
          radius: token.radius.all,
          width: 0.7,
          layoutModes: [AntdBoxLayoutMode.factorWidth],
        ),
        headerStyle: AntdBoxStyle(
          padding: token.size.md.horizontal.marge(token.size.xl.bottom),
          textStyle: token.font.lg.copyWith(fontWeight: FontWeight.w600),
        ),
        maskColor: token.colorBlack,
        closeIconStyle: AntdIconStyle(
            size: 18,
            color: token.colorText.tertiary,
            bodyStyle: AntdBoxStyle(padding: token.size.seed.all)),
        titleStyle: AntdBoxStyle(
            padding: token.size.md.horizontal,
            textStyle: token.font.xxl.copyWith(fontWeight: FontWeight.w600)),
        contentStyle: AntdBoxStyle(
            alignment: Alignment.center,
            padding: token.size.xl.all,
            border: actions?.isNotEmpty == true
                ? token.borderSecondary.bottom
                : null,
            textStyle: token.font.md),
        animation:
            const AntdModalAnimation(duration: Duration(milliseconds: 400)));
  }

  @override
  AntdModalStyle margeStyle(
      AntdModalStyle defaultStyle, AntdModalStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdModalStyle, AntdModal>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.modalStyle;
  }

  @override
  AntdModal getWidget(BuildContext context) {
    return this;
  }

  @override
  String get layerType => "modal";
}

class AntdModalState extends AntdBaseDialogState<AntdModalStyle,
    AntdModalAction, AntdModal, AntdModalState> {
  @override
  AntdModalState getState() {
    return this;
  }

  @override
  List<Widget> buildActions() {
    if (widget.actions == null) {
      return [];
    }

    return [
      AntdStyleProvider<AntdActionStyle>(
          style: style.actionStyle,
          child: AntdColumn(
              style: const AntdFlexStyle(mainAxisSize: MainAxisSize.min),
              children: widget.actions!.map((value) {
                return AntdBox(
                  options:
                      const AntdTapOptions(accepter: AntdTapAccepter.listener),
                  onTap: () {
                    handlerTap(value);
                  },
                  child: value,
                );
              }).toList()))
    ];
  }

  @override
  AntdMaskAnimation<AntdModal, AntdModalState>? buildStyleAnimation() {
    return style.animation;
  }
}
