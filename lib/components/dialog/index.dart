import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/cupertino.dart';

///对话框样式
///@l [AntdDialog]
class AntdDialogStyle extends AntdPopupStyle {
  /// 对话框头部区域样式（包含标题和关闭按钮）
  final AntdBoxStyle? headerStyle;

  /// 对话框标题文字样式
  final AntdBoxStyle? titleStyle;

  /// 对话框内容区域样式
  final AntdBoxStyle? contentStyle;

  /// 对话框操作按钮区域样式
  final AntdActionStyle? actionStyle;

  /// 对话框底部操作按钮区域样式
  final AntdActionStyle? bottomActionStyle;

  /// 对话框确认操作按钮区域样式
  final AntdActionStyle? primaryActionStyle;

  const AntdDialogStyle(
      {super.inherit,
      super.bodyStyle,
      super.closeIconStyle,
      super.maskColor,
      super.maskOpacity,
      this.headerStyle,
      this.titleStyle,
      this.contentStyle,
      this.actionStyle,
      this.bottomActionStyle,
      this.primaryActionStyle});

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
      bottomActionStyle: bottomActionStyle.merge(style?.bottomActionStyle),
      primaryActionStyle: primaryActionStyle.merge(style?.primaryActionStyle),
    );
  }
}

///对话框定义
///@l [AntdDialog]
class AntdDialogAction extends AntdAction {
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
  AntdDialogAction copyForm(AntdDialogAction? action) {
    return AntdDialogAction(
      key: action?.key ?? key,
      style: action?.style ?? style,
      styleBuilder: action?.styleBuilder ?? styleBuilder,
      danger: action?.danger ?? danger,
      description: action?.description ?? description,
      disabled: action?.disabled ?? disabled,
      title: action?.title ?? title,
      onTap: action?.onTap ?? onTap,
      bold: action?.bold ?? bold,
      bottom: action?.bottom ?? bottom,
      primary: action?.primary ?? primary,
    );
  }

  @override
  AntdActionStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var superStyle = super.getDefaultStyle(context, theme, token);
    return margeStyle(
        superStyle,
        AntdActionStyle(
            bodyStyle: AntdBoxStyle(
                padding:
                    token.size.md.vertical.marge(token.size.lg.horizontal)),
            titleStyle: AntdBoxStyle(
                textStyle: superStyle.titleStyle?.textStyle?.copyWith(
                    color: primary != false && danger != true
                        ? token.colorPrimary
                        : null))));
  }
}

abstract class AntdBaseDialog<
    T extends AntdDialogAction,
    WidgetType,
    Style extends AntdDialogStyle,
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
      super.animationDuration,
      super.builder,
      super.closeIcon,
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
    Style extends AntdDialogStyle,
    T extends AntdDialogAction,
    Dialog extends AntdBaseDialog<T, Dialog, Style, StateType>,
    StateType> extends AntdCenterAnimationPopupState<Style, Dialog, StateType> {
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

abstract class AntdInnerDialog<
    T extends AntdDialogAction,
    Dialog extends AntdInnerDialog<T, Dialog, StateType>,
    StateType> extends AntdBaseDialog<T, Dialog, AntdDialogStyle, StateType> {
  const AntdInnerDialog(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.opacity,
      super.dismissOnMaskTap = true,
      super.showMask = true,
      super.animationDuration = const Duration(milliseconds: 400),
      super.actions,
      super.dismissOnAction,
      super.builder,
      super.closeIcon,
      super.header,
      super.title});

  @override
  AntdDialogStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdDialogStyle(
      bodyStyle: AntdBoxStyle(
        padding: header != null || title != null ? token.size.xl.top : null,
        color: token.colorWhite,
        radius: token.radius.default_.radius.all,
        width: 0.7,
        layoutModes: [AntdBoxLayoutMode.factorWidth],
      ),
      headerStyle: AntdBoxStyle(
        padding: token.size.md.horizontal.marge(token.size.xl.bottom),
        textStyle: token.font.lg.copyWith(fontWeight: FontWeight.w600),
      ),
      maskColor: token.colorBlack,
      maskOpacity: getOpacity(),
      closeIconStyle: AntdIconStyle(size: 18, color: token.colorTextTertiary),
      titleStyle: AntdBoxStyle(
          padding: token.size.md.horizontal,
          textStyle: token.font.xxl.copyWith(fontWeight: FontWeight.w600)),
      contentStyle: AntdBoxStyle(
          alignment: Alignment.center,
          padding: token.size.xl.all,
          border: actions?.isNotEmpty == true
              ? token.borderSide
                  .copyWith(color: token.colorBorderSecondary)
                  .bottom
              : null,
          textStyle: token.font.md),
      actionStyle: const AntdActionStyle(),
      bottomActionStyle: AntdActionStyle(
          bodyStyle: AntdBoxStyle(border: token.borderSide.horizontal)),
      primaryActionStyle: const AntdActionStyle(),
    );
  }

  @override
  AntdDialogStyle margeStyle(
      AntdDialogStyle defaultStyle, AntdDialogStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

abstract class AntdInnerDialogState<T extends AntdDialogAction, StateType,
        Dialog extends AntdInnerDialog<T, Dialog, StateType>>
    extends AntdBaseDialogState<AntdDialogStyle, T, Dialog, StateType> {
  @protected
  handlerTap(AntdAction? action) async {
    if (action?.onTap != null) {
      action?.onTap?.call(close);
    }

    if (widget.dismissOnAction == true) {
      await close();
    }
  }

  @protected
  AntdDialogAction copyForm(covariant AntdDialogAction action) {
    return action.copyForm(AntdDialogAction(
      onTap: (_) {
        handlerTap(action);
      },
    ));
  }

  @override
  @protected
  List<Widget> buildActions() {
    if (widget.actions == null) {
      return [];
    }
    var actions = <AntdDialogAction>[];
    var bottomActions = <AntdDialogAction>[];

    for (var value in widget.actions!) {
      if (value.bottom == true) {
        bottomActions.add(copyForm(value));
      } else {
        actions.add(copyForm(value));
      }
    }
    var actionWidgets = <Widget>[];
    actionWidgets.addAll(actions
        .map((action) => AntdStyleProvider<AntdActionStyle>(
            style: action.primary == true
                ? style.primaryActionStyle
                : style.actionStyle,
            child: action))
        .toList());
    if (bottomActions.isNotEmpty) {
      actionWidgets.add(AntdRow(
        children: bottomActions
            .map((value) => AntdStyleProvider<AntdActionStyle>(
                style: style.bottomActionStyle?.margeBorder(
                    value == bottomActions.firstOrNull,
                    value == bottomActions.lastOrNull),
                child: Expanded(child: value)))
            .toList(),
      ));
    }
    return actionWidgets;
  }
}

///@t 对话框
///@g 反馈
///@o 97
///@d 用于重要信息的告知或操作的反馈，并附带少量的选项供用户进行操作。
///@u 需要用户处理事务，又不希望跳转页面以致打断工作流程时，可以使用 Dialog 在当前页面正中打开一个浮层，承载相应的操作。
class AntdDialog
    extends AntdInnerDialog<AntdDialogAction, AntdDialog, AntdDialogState> {
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
      super.animationDuration = const Duration(milliseconds: 400),
      super.actions,
      super.dismissOnAction,
      super.builder,
      super.closeIcon,
      super.header,
      super.title});

  @override
  State<StatefulWidget> createState() {
    return AntdDialogState();
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
      animationDuration: dialog?.animationDuration,
      actions: actions,
      dismissOnAction: dialog?.dismissOnAction != false,
      builder: dialog?.builder ??
          (_, ctx) {
            return content;
          },
      closeIcon: dialog?.closeIcon,
      header: header ?? dialog?.header,
      title: title ?? dialog?.header,
    ).open<T>();
  }

  static Future<T?> alert<T>(Widget content,
      {final Key? key,
      final Widget? header,
      final Widget? title,
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
      animationDuration: dialog?.animationDuration,
      actions: [
        AntdDialogAction(
          title: alert,
          primary: true,
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
    ).open<T>();
  }

  static Future<T?> confirm<T>(Widget content,
      {final Key? key,
      final Widget? header,
      final Widget? title,
      final Widget confirm = const Text("确认"),
      final AntdActionOnTap? onConfirm,
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
      animationDuration: dialog?.animationDuration,
      actions: [
        AntdDialogAction(
          title: cancel,
          bottom: true,
          primary: false,
          onTap: onCancel,
        ),
        AntdDialogAction(
          title: confirm,
          bottom: true,
          primary: true,
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
    ).open<T>();
  }
}

class AntdDialogState extends AntdInnerDialogState<AntdDialogAction,
    AntdDialogState, AntdDialog> {
  @override
  AntdDialogState getState() {
    return this;
  }
}
