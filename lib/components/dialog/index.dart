import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/cupertino.dart';

///对话框样式
///@l [AntdDialog]
class AntdDialogBaseStyle extends AntdPopupBaseStyle {
  /// 对话框头部区域样式（包含标题和关闭按钮）
  final AntdBoxStyle? headerStyle;

  /// 对话框标题文字样式
  final AntdBoxStyle? titleStyle;

  /// 对话框内容区域样式
  final AntdBoxStyle? contentStyle;

  /// 对话框操作按钮区域样式
  final AntdActionStyle? actionStyle;

  const AntdDialogBaseStyle(
      {super.inherit,
      super.bodyStyle,
      super.closeIconStyle,
      super.closeIcon,
      super.maskColor,
      super.maskOpacity,
      this.headerStyle,
      this.titleStyle,
      this.contentStyle,
      this.actionStyle});
}

enum AntdDialogType { alert, confirm, normal }

///对话框定义
///@l [AntdDialog]
class AntdDialogAction
    extends AntdBaseAction<AntdActionStyle, AntdDialogAction> {
  /// 是否固定在底部（为true时会固定在对话框底部）
  final bool? bottom;

  /// 是否是确认按钮（通常会影响按钮样式）
  final bool? primary;

  const AntdDialogAction({
    super.key,
    super.style,
    super.styleBuilder,
    super.danger,
    super.description,
    super.disabled,
    super.onTap,
    super.title,
    super.bold,
    this.bottom,
    this.primary,
  });

  @override
  AntdActionStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var superStyle = AntdActionStyle.defaultStyle(token, this);
    return margeStyle(
        superStyle,
        AntdActionStyle(
            bodyStyle: AntdBoxStyle(
                border: bottom == true
                    ? token.border.horizontal
                    : token.border.bottom,
                padding:
                    token.size.md.vertical.marge(token.size.lg.horizontal)),
            titleStyle: AntdBoxStyle(
                textStyle: superStyle.titleStyle?.textStyle?.copyWith(
                    color: primary != false && danger != true
                        ? token.colorPrimary
                        : null))));
  }

  @override
  AntdActionStyle getFinalStyle(
      BuildContext context, AntdActionStyle style, AntdMapToken token) {
    var position = AntdScrollItemProvider.ofMaybe(context)?.position;
    return margeStyle(
        style,
        style.margeBorder(position == AntdScrollItemPosition.first,
            position == AntdScrollItemPosition.last));
  }

  @override
  AntdDialogAction getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdStyleBuilder<AntdActionStyle, AntdDialogAction>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.dialogActionStyle;
  }

  @override
  AntdActionStyle margeStyle(
      AntdActionStyle defaultStyle, AntdActionStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

abstract class AntdBaseDialog<
    T extends AntdBaseAction<AntdActionStyle, T>,
    WidgetType,
    Style extends AntdDialogBaseStyle,
    StateType> extends AntdBasePopup<Style, WidgetType, StateType> {
  const AntdBaseDialog(
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
      super.closeIcon,
      super.animation,
      this.actions,
      this.dismissOnAction = true,
      this.header,
      this.title})
      : super(avoidKeyboard: false);

  ///面板选项列表
  final List<T>? actions;

  ///点击选项后是否关闭
  final bool? dismissOnAction;

  ///	顶部区域
  final Widget? header;

  ///标题
  final Widget? title;
}

abstract class AntdBaseDialogState<
    Style extends AntdDialogBaseStyle,
    T extends AntdBaseAction<AntdActionStyle, T>,
    Dialog extends AntdBaseDialog<T, Dialog, Style, StateType>,
    StateType> extends AntdPopupBaseState<Style, Dialog, StateType> {
  @protected
  handlerTap(T? action) async {
    if (action?.onTap != null) {
      action?.onTap?.call(close);
    }

    if (widget.dismissOnAction == true) {
      await close();
    }
  }

  List<Widget> buildActions();

  @override
  @protected
  Widget buildPopup() {
    var childList = <Widget>[];

    var topChildList = <Widget>[];
    if (widget.header != null) {
      topChildList.add(AntdBox(
        style: style.headerStyle,
        child: widget.header,
      ));
    }
    if (widget.title != null) {
      topChildList.add(AntdBox(
        style: style.titleStyle,
        child: widget.title!,
      ));
    }
    if (widget.builder != null) {
      topChildList.add(AntdBox(
        style: style.contentStyle,
        child: widget.builder?.call(close, getState()),
      ));
    }
    if (topChildList.isNotEmpty) {
      childList.add(AntdBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: topChildList,
        ),
      ));
    }

    if (widget.actions != null) {
      var buildActionList = buildActions();
      if (buildActionList.isNotEmpty) {
        childList.addAll(buildActionList);
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: childList,
    );
  }
}

class AntdDialogAnimation
    extends AntdMaskAnimation<AntdDialog, AntdDialogState> {
  const AntdDialogAnimation(
      {required super.duration,
      super.maskAnimated =
          const AntdMaskDefaultAnimated<AntdDialog, AntdDialogState>(),
      super.contentAnimated = const AntdPopupScaleFadeAnimation<AntdDialogStyle,
          AntdDialog, AntdDialogState>()});
}

class AntdDialogStyle extends AntdDialogBaseStyle {
  const AntdDialogStyle({
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
  final AntdDialogAnimation? animation;

  @override
  AntdDialogStyle copyFrom(covariant AntdDialogStyle? style) {
    return AntdDialogStyle(
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

///@t 对话框
///@g 反馈
///@o 97
///@d 用于重要信息的告知或操作的反馈，并附带少量的选项供用户进行操作。
///@u 需要用户处理事务，又不希望跳转页面以致打断工作流程时，可以使用 Dialog 在当前页面正中打开一个浮层，承载相应的操作。
class AntdDialog extends AntdBaseDialog<AntdDialogAction, AntdDialog,
    AntdDialogStyle, AntdDialogState> {
  const AntdDialog(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.opacity,
      super.dismissOnMaskTap = true,
      super.showMask = true,
      super.actions,
      super.dismissOnAction,
      super.builder,
      super.closeIcon,
      super.animation,
      super.header,
      super.title,
      this.type = AntdDialogType.normal});

  ///dialog的类型，一般用作全局主题的动态样式
  final AntdDialogType type;

  @override
  State<StatefulWidget> createState() {
    return AntdDialogState();
  }

  @override
  AntdDialogStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdDialogStyle(
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
            const AntdDialogAnimation(duration: Duration(milliseconds: 400)));
  }

  @override
  AntdDialogStyle margeStyle(
      AntdDialogStyle defaultStyle, AntdDialogStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdDialogStyle, AntdDialog>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.dialogStyle;
  }

  @override
  AntdDialog getWidget(BuildContext context) {
    return this;
  }

  @override
  String get layerType => "dialog";

  static Future<T?> show<T>(
      {final Key? key,
      final Widget? header,
      final Widget? title,
      required final Widget content,
      final List<AntdDialogAction>? actions,
      AntdDialog? dialog}) {
    return AntdDialog(
      key: key ?? dialog?.key,
      style: dialog?.style,
      styleBuilder: dialog?.styleBuilder,
      onClosed: dialog?.onClosed,
      onOpened: dialog?.onOpened,
      onMaskTap: dialog?.onMaskTap,
      opacity: dialog?.opacity,
      dismissOnMaskTap: dialog?.dismissOnMaskTap != false,
      showMask: dialog?.showMask != false,
      animation: dialog?.animation,
      actions: actions,
      dismissOnAction: dialog?.dismissOnAction != false,
      builder: dialog?.builder ??
          (_, ctx) {
            return content;
          },
      closeIcon: dialog?.closeIcon,
      header: header ?? dialog?.header,
      title: title ?? dialog?.header,
      type: dialog?.type ?? AntdDialogType.normal,
    ).open<T>();
  }

  static Future<T?> alert<T>(Widget content,
      {final Key? key,
      final Widget? header,
      final Widget? title,
      final AntdActionStyle? style,
      final Widget alert = const Text("我知道了"),
      final AntdActionOnTap? onConfirm,
      final AntdDialog? dialog}) {
    return AntdDialog(
      key: key ?? dialog?.key,
      style: dialog?.style,
      styleBuilder: dialog?.styleBuilder,
      onClosed: dialog?.onClosed,
      onOpened: dialog?.onOpened,
      onMaskTap: dialog?.onMaskTap,
      opacity: dialog?.opacity,
      dismissOnMaskTap: dialog?.dismissOnMaskTap != false,
      showMask: dialog?.showMask != false,
      animation: dialog?.animation,
      actions: [
        AntdDialogAction(
          title: alert,
          primary: true,
          style: style,
          onTap: onConfirm,
        ),
        ...(dialog?.actions ?? [])
      ],
      dismissOnAction: dialog?.dismissOnAction != false,
      builder: dialog?.builder ??
          (_, ctx) {
            return content;
          },
      closeIcon: dialog?.closeIcon,
      header: header ?? dialog?.header,
      title: title ?? dialog?.header,
      type: AntdDialogType.alert,
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
      final AntdDialog? dialog}) {
    return AntdDialog(
      key: key ?? dialog?.key,
      style: dialog?.style,
      styleBuilder: dialog?.styleBuilder,
      onClosed: dialog?.onClosed,
      onOpened: dialog?.onOpened,
      onMaskTap: dialog?.onMaskTap,
      opacity: dialog?.opacity,
      dismissOnMaskTap: dialog?.dismissOnMaskTap != false,
      showMask: dialog?.showMask != false,
      animation: dialog?.animation,
      actions: [
        AntdDialogAction(
          title: cancel,
          bottom: true,
          primary: false,
          style: cancelStyle,
          onTap: onCancel,
        ),
        AntdDialogAction(
          title: confirm,
          bottom: true,
          primary: true,
          onTap: onConfirm,
          style: confirmStyle,
        ),
        ...(dialog?.actions ?? [])
      ],
      dismissOnAction: dialog?.dismissOnAction != false,
      builder: dialog?.builder ??
          (_, ctx) {
            return content;
          },
      closeIcon: dialog?.closeIcon,
      header: header ?? dialog?.header,
      title: title ?? dialog?.header,
      type: AntdDialogType.confirm,
    ).open<T>();
  }
}

class AntdDialogState extends AntdBaseDialogState<AntdDialogStyle,
    AntdDialogAction, AntdDialog, AntdDialogState> {
  @protected
  Widget wrap(AntdDialogAction action) {
    return AntdBox(
      options: const AntdTapOptions(accepter: AntdTapAccepter.listener),
      onTap: () {
        handlerTap(action);
      },
      child: action,
    );
  }

  @override
  @protected
  List<Widget> buildActions() {
    if (widget.actions == null) {
      return [];
    }
    var actions = <Widget>[];
    var bottomActions = <Widget>[];

    for (var value in widget.actions!) {
      if (value.bottom == true) {
        bottomActions.add(Expanded(child: wrap(value)));
      } else {
        actions.add(wrap(value));
      }
    }
    var actionWidgets = <Widget>[];
    actionWidgets.add(AntdStyleProvider<AntdActionStyle>(
        style: style.actionStyle,
        child: AntdColumn(
            style: const AntdFlexStyle(mainAxisSize: MainAxisSize.min),
            children: actions)));
    if (bottomActions.isNotEmpty) {
      actionWidgets.add(AntdStyleProvider<AntdActionStyle>(
          style: style.actionStyle,
          child: AntdRow(
            children: bottomActions,
          )));
    }
    return actionWidgets;
  }

  @override
  @protected
  AntdDialogState getState() {
    return this;
  }

  @override
  @protected
  AntdMaskAnimation<AntdDialog, AntdDialogState>? buildStyleAnimation() {
    return style.animation;
  }
}
