import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

class AntdActionStyle extends AntdStyle {
  ///内容样式
  final AntdBoxStyle? bodyStyle;

  ///标题的样式
  final AntdBoxStyle? titleStyle;

  ///描述的样式
  final AntdBoxStyle? descriptionStyle;

  ///对齐样式
  final AntdFlexStyle? columnStyle;

  ///安全区
  final AntdPosition? safeArea;

  const AntdActionStyle(
      {super.inherit,
      this.bodyStyle,
      this.titleStyle,
      this.descriptionStyle,
      this.columnStyle,
      this.safeArea});

  @override
  AntdActionStyle copyFrom(AntdActionStyle? style) {
    return AntdActionStyle(
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        titleStyle: titleStyle.merge(style?.titleStyle),
        descriptionStyle: descriptionStyle.merge(style?.descriptionStyle),
        columnStyle: columnStyle.merge(style?.columnStyle),
        safeArea: style?.safeArea ?? safeArea);
  }

  AntdActionStyle margeBorder(bool first, bool last) {
    var border = bodyStyle?.border;
    if (border == null) {
      return this;
    }

    border = Border(
        top: border.top,
        bottom: border.bottom,
        left: first
            ? BorderSide.none
            : BorderSide(
                color: border.left.color,
                width: border.left.width / 2,
              ),
        right: last
            ? BorderSide.none
            : BorderSide(
                color: border.right.color, width: border.right.width / 2));
    return copyFrom(AntdActionStyle(bodyStyle: AntdBoxStyle(border: border)));
  }

  factory AntdActionStyle.defaultStyle(
      AntdMapToken token, AntdBaseAction action) {
    return AntdActionStyle(
        bodyStyle: AntdBoxStyle(
            color: token.colorBgContainer,
            feedbackStyle: AntdBoxStyle(color: token.colorFill.tertiary),
            padding: token.size.xl.all,
            border: token.border.bottom,
            options: const AntdTapOptions(accepter: AntdTapAccepter.listener)),
        titleStyle: AntdBoxStyle(
          alignment: Alignment.center,
          textStyle: token.font.xxl.copyWith(
              color: action.danger == true ? token.colorError : null,
              fontWeight: action.bold == true ? FontWeight.w600 : null),
        ),
        descriptionStyle: AntdBoxStyle(
          textStyle: token.font.md.copyWith(color: token.colorText.tertiary),
          margin: token.size.xs.top,
        ),
        columnStyle: const AntdFlexStyle());
  }
}

typedef AntdActionOnTap = void Function(AntdLayerClose close);

abstract class AntdBaseAction<Style extends AntdActionStyle, WidgetType>
    extends AntdComponent<Style, WidgetType> {
  ///是否为危险状态
  final bool? danger;

  ///描述
  final Widget? description;

  ///是否为禁用状态
  final bool? disabled;

  ///点击时触发,单独使用无效
  final AntdActionOnTap? onTap;

  ///标题
  final Widget? title;

  ///标题是否加粗
  final bool? bold;

  ///安全区
  final AntdPosition? safeArea;

  const AntdBaseAction({
    super.key,
    super.style,
    super.styleBuilder,
    this.danger,
    this.description,
    this.disabled,
    this.title,
    this.onTap,
    this.bold,
    this.safeArea,
  });

  @override
  Widget render(BuildContext context, Style style) {
    return AntdBox(
      innerSafeArea: safeArea ?? style.safeArea,
      disabled: disabled,
      style: style.bodyStyle,
      child: AntdColumn(
        style: style.columnStyle,
        children: [
          if (title != null)
            AntdBox(
              style: style.titleStyle,
              child: title,
            ),
          if (description != null)
            AntdBox(
              style: style.descriptionStyle,
              child: description,
            ),
        ],
      ),
    );
  }
}

/// 定义
/// @l [AntdActionSheet]
class AntdSheetAction extends AntdBaseAction<AntdActionStyle, AntdSheetAction> {
  const AntdSheetAction({
    super.key,
    super.style,
    super.styleBuilder,
    super.danger,
    super.description,
    super.disabled,
    super.title,
    super.onTap,
    super.bold,
    super.safeArea,
  });

  @override
  AntdActionStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdActionStyle.defaultStyle(token, this);
  }

  @override
  AntdSheetAction getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdActionStyle margeStyle(
      AntdActionStyle defaultStyle, AntdActionStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdActionStyle, AntdSheetAction>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.sheetActionStyle;
  }
}

///动作面板样式
///@l [AntdActionSheet]
class AntdActionSheetStyle extends AntdPopupStyle {
  ///样式
  final AntdActionStyle? actionStyle;

  ///取消样式
  final AntdActionStyle? cancelActionStyle;

  ///标题样式
  final AntdBoxStyle? extraStyle;

  const AntdActionSheetStyle(
      {super.inherit,
      super.bodyStyle,
      super.maskColor,
      super.maskOpacity,
      this.actionStyle,
      this.cancelActionStyle,
      this.extraStyle});

  @override
  AntdActionSheetStyle copyFrom(covariant AntdActionSheetStyle? style) {
    return AntdActionSheetStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      maskColor: style?.maskColor ?? maskColor,
      maskOpacity: style?.maskOpacity ?? maskOpacity,
      actionStyle: actionStyle.merge(style?.actionStyle),
      cancelActionStyle: cancelActionStyle.merge(style?.cancelActionStyle),
      extraStyle: extraStyle.merge(style?.extraStyle),
    );
  }
}

typedef AntdActionCallback = void Function(Key? key, bool cancelTap);

///@t 动作面板
///@g 反馈
///@o 98
///@d 从底部弹出的动作菜单面板。
///@u 由用户操作触发，提供一组与当前场景操作相关的两个或多个选项，让用户在不离场的情况下完成操作。
class AntdActionSheet extends AntdBasePopup<AntdActionSheetStyle,
    AntdActionSheet, AntdActionSheetState> {
  const AntdActionSheet(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.dismissOnMaskTap = true,
      super.opacity,
      super.showMask = true,
      super.animationDuration = const Duration(milliseconds: 400),
      required this.actions,
      this.cancelText,
      this.dismissOnAction = true,
      this.extra,
      this.onAction,
      this.safeArea = true})
      : super(position: AntdPosition.bottom);

  ///面板选项列表
  final List<AntdSheetAction> actions;

  ///取消按钮文字，如果设置为空则不显示取消按钮
  final Widget? cancelText;

  ///点击选项后是否关闭
  final bool? dismissOnAction;

  ///顶部的额外区域
  final Widget? extra;

  ///点击选项时触发，禁用或加载状态下不会触发
  final AntdActionCallback? onAction;

  ///安全区
  final bool safeArea;

  static Future<T?> show<T>(List<AntdSheetAction> actions,
      {final Key? key,
      final Widget? cancelText,
      final bool? dismissOnAction = true,
      final Widget? extra,
      final AntdActionCallback? onAction,
      final AntdActionSheet? sheet}) {
    return AntdActionSheet(
      key: key ?? sheet?.key,
      style: sheet?.style,
      styleBuilder: sheet?.styleBuilder,
      onClosed: sheet?.onClosed,
      onOpened: sheet?.onOpened,
      onMaskTap: sheet?.onMaskTap,
      opacity: sheet?.opacity,
      dismissOnMaskTap: sheet?.dismissOnMaskTap != false,
      showMask: sheet?.showMask != false,
      animationDuration: sheet?.animationDuration,
      actions: actions,
      cancelText: cancelText ?? sheet?.cancelText,
      dismissOnAction: dismissOnAction ?? sheet?.dismissOnAction,
      extra: extra ?? sheet?.extra,
      onAction: onAction ?? sheet?.onAction,
      safeArea: sheet?.safeArea == true,
    ).open();
  }

  @override
  State<StatefulWidget> createState() {
    return AntdActionSheetState();
  }

  @override
  AntdActionSheetStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdActionSheetStyle(
        extraStyle: AntdBoxStyle(
          alignment: Alignment.center,
          padding: token.size.xl.vertical.marge(token.size.lg.horizontal),
          textStyle: token.font.md.copyWith(color: token.colorText.tertiary),
          border: token.border.bottom,
          color: token.colorBgContainer,
        ),
        maskColor: token.colorBlack,
        maskOpacity: getOpacity(),
        bodyStyle: AntdBoxStyle(
          color: token.colorFill.tertiary,
          radius: token.radius.top,
        ),
        actionStyle: const AntdActionStyle(),
        cancelActionStyle: AntdActionStyle(
            bodyStyle: AntdBoxStyle(margin: token.size.md.top)));
  }

  @override
  AntdActionSheetStyle margeStyle(
      AntdActionSheetStyle defaultStyle, AntdActionSheetStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdActionSheetStyle, AntdActionSheet>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.actionSheetStyle;
  }

  @override
  AntdActionSheet getWidget(BuildContext context) {
    return this;
  }

  @override
  String get layerType => "sheet";
}

class AntdActionSheetState extends AntdOffsetAnimationPopupState<
    AntdActionSheetStyle, AntdActionSheet, AntdActionSheetState> {
  _handlerTap(AntdSheetAction action, bool cancel) async {
    if (widget.onAction != null) {
      widget.onAction!(action.key, cancel);
    }

    if (cancel) {
      await close();
      return;
    }

    if (widget.dismissOnAction == true) {
      await close();
    }

    if (action.onTap != null) {
      action.onTap?.call(close);
    }
  }

  @override
  Widget? buildPopup() {
    var childList = <Widget>[];
    if (widget.extra != null) {
      childList.add(AntdBox(style: style.extraStyle, child: widget.extra!));
    }

    Widget wrap(AntdSheetAction action, bool cancel) {
      return AntdBox(
        options: const AntdTapOptions(accepter: AntdTapAccepter.listener),
        onTap: () {
          _handlerTap(action, cancel);
        },
        child: action,
      );
    }

    for (var action in widget.actions) {
      childList.add(AntdStyleProvider<AntdActionStyle>(
          style: AntdActionStyle(
                  safeArea: widget.safeArea &&
                          action == widget.actions.last &&
                          widget.cancelText == null
                      ? AntdPosition.bottom
                      : null)
              .copyFrom(style.actionStyle),
          child: wrap(action, false)));
    }

    if (widget.cancelText != null) {
      childList.add(AntdStyleProvider<AntdActionStyle>(
          style: style.cancelActionStyle,
          child: wrap(
              AntdSheetAction(
                  title: widget.cancelText,
                  safeArea: widget.safeArea ? AntdPosition.bottom : null),
              true)));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: childList,
    );
  }

  @override
  AntdActionSheetState getState() {
    return this;
  }
}
