import 'package:antd_flutter/index.dart';
import 'package:flutter/widgets.dart';

class AntdCascaderStyle extends AntdPopupStyle {
  final AntdBoxStyle? headerStyle;
  final AntdBoxStyle? titleStyle;
  final AntdBoxStyle? cancelStyle;
  final AntdBoxStyle? confirmStyle;
  final AntdFlexStyle? headerFlexStyle;

  const AntdCascaderStyle(
      {super.inherit,
      super.maskColor,
      super.maskOpacity,
      super.bodyStyle,
      super.closeIconStyle,
      this.headerStyle,
      this.titleStyle,
      this.cancelStyle,
      this.confirmStyle,
      this.headerFlexStyle});

  @override
  AntdCascaderStyle copyFrom(covariant AntdCascaderStyle? style) {
    return AntdCascaderStyle(
      maskColor: style?.maskColor ?? maskColor,
      maskOpacity: style?.maskOpacity ?? maskOpacity,
      headerStyle: headerStyle.merge(style?.headerStyle),
      headerFlexStyle: headerFlexStyle.merge(style?.headerFlexStyle),
      titleStyle: titleStyle.merge(style?.titleStyle),
      cancelStyle: cancelStyle.merge(style?.cancelStyle),
      confirmStyle: confirmStyle.merge(style?.confirmStyle),
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      closeIconStyle: closeIconStyle.merge(style?.closeIconStyle),
    );
  }
}

///@t 级联选择
///@g 信息录入
///@o 62
///@d 多层级数据的选择。
///@u 需要从一组相关联的数据集合进行选择，例如省市区，公司层级，事物分类等。
class AntdCascader
    extends AntdBasePopup<AntdCascaderStyle, AntdCascader, AntdCascaderState> {
  const AntdCascader(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.dismissOnMaskTap = true,
      super.showMask = true,
      super.animationDuration = const Duration(milliseconds: 400),
      super.closeIcon,
      super.position = AntdPosition.bottom,
      super.avoidKeyboard = true,
      this.cancelWidget = const Text("取消"),
      this.confirmWidget = const Text("确定"),
      this.titleWidget,
      this.onConfirm,
      this.onCancel,
      required this.cascaderView});

  ///取消按钮
  final Widget? cancelWidget;

  ///确认按钮
  final Widget? confirmWidget;

  ///标题
  final Widget? titleWidget;

  ///取消事件
  final ValueChanged<List<String>>? onConfirm;

  ///确认事件
  final ValueChanged<List<String>>? onCancel;

  ///选择器
  final AntdCascaderView cascaderView;

  @override
  State<StatefulWidget> createState() {
    return AntdCascaderState();
  }

  @override
  AntdCascaderStyle margeStyle(
      AntdCascaderStyle defaultStyle, AntdCascaderStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdCascaderStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var popupStyle = AntdPopupStyle.defaultStyle(token, getOpacity(), position);
    return AntdCascaderStyle(
        bodyStyle: popupStyle.bodyStyle,
        closeIconStyle: popupStyle.closeIconStyle,
        maskColor: popupStyle.maskColor,
        maskOpacity: popupStyle.maskOpacity,
        headerFlexStyle: const AntdFlexStyle(
            mainAxisAlignment: MainAxisAlignment.spaceBetween),
        cancelStyle: const AntdBoxStyle(),
        confirmStyle: const AntdBoxStyle(),
        headerStyle: AntdBoxStyle(
            padding:
                token.size.sm.vertical.marge(token.size.default_.horizontal),
            textStyle: token.font.md.copyWith(color: token.colorPrimary)),
        titleStyle: AntdBoxStyle(textStyle: token.font.md));
  }

  @override
  getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdStyleBuilder<AntdCascaderStyle, AntdCascader>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.cascaderStyle;
  }
}

class AntdCascaderState extends AntdOffsetAnimationPopupState<AntdCascaderStyle,
    AntdCascader, AntdCascaderState> {
  var values = <String>[];
  @override
  Widget? buildPopup() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AntdBox(
          style: style.headerStyle,
          child: AntdRow(
            style: style.headerFlexStyle,
            children: [
              AntdBox(
                onTap: () {
                  close();
                  widget.onCancel?.call(values);
                },
                child: widget.cancelWidget,
              ),
              if (widget.titleWidget != null)
                AntdBox(
                  style: style.titleStyle,
                  child: widget.titleWidget!,
                ),
              AntdBox(
                onTap: () {
                  close();
                  widget.onConfirm?.call(values);
                },
                child: widget.confirmWidget,
              ),
            ],
          ),
        ),
        widget.cascaderView.copyFrom(AntdCascaderView(
          options: widget.cascaderView.options,
          onChange: (values) {
            this.values = values;
          },
        ))
      ],
    );
  }

  @override
  AntdCascaderState getState() {
    return this;
  }
}
