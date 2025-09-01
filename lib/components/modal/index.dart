import 'package:antd_flutter/index.dart';
import 'package:flutter/widgets.dart';

///弹窗定义
///@l [AntdModal]
class AntdModalAction extends AntdDialogAction {
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
      super.primary})
      : super(bottom: false);

  @override
  AntdActionStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var textColor = danger == true
        ? token.colorError
        : (primary == true ? token.colorWhite : token.colorPrimary);
    return AntdActionStyle(
      bodyStyle: AntdBoxStyle(
          feedbackStyle: primary == true
              ? AntdBoxStyle(color: token.colorPrimaryBgActive)
              : null,
          color: primary == true ? token.colorPrimary : token.colorTransparent,
          width: double.infinity,
          radius: token.radius.default_.radius.all,
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
        textStyle: token.font.md.copyWith(color: token.colorTextTertiary),
        margin: token.size.xs.top,
      ),
    );
  }

  @override
  AntdModalAction copyForm(AntdModalAction? action) {
    return AntdModalAction(
      key: action?.key ?? key,
      style: action?.style ?? style,
      styleBuilder: action?.styleBuilder ?? styleBuilder,
      description: action?.description ?? description,
      disabled: action?.disabled ?? disabled,
      title: action?.title ?? title,
      onTap: action?.onTap ?? onTap,
      bold: action?.bold ?? bold,
      danger: action?.danger ?? danger,
      primary: action?.primary ?? primary,
    );
  }
}

///@t 弹窗
///@g 反馈
///@o 89
///@d 用于重要信息的告知或操作的反馈，并附带少量的选项供用户进行操作。
///@u 需要用户处理事务，又不希望跳转页面以致打断工作流程时，可以使用 Modal 在当前页面正中打开一个浮层，承载相应的操作。
class AntdModal extends AntdDialog<AntdModalAction> {
  const AntdModal(
      {super.key,
      super.style,
      super.styleBuilder,
      super.onClosed,
      super.onOpened,
      super.onMaskTap,
      super.dismissOnMaskTap = true,
      super.showMask = true,
      super.animationDuration = const Duration(milliseconds: 400),
      super.actions,
      super.dismissOnAction,
      super.builder,
      super.closeIcon,
      super.header,
      super.title});

  static Future<T?> alert<T>(Widget content,
      [final Widget alert = const Text("我知道了"),
      final AntdActionOnTap? onConfirm]) {
    return AntdModal(
      builder: (_, ctx) {
        return content;
      },
      actions: [
        AntdModalAction(
          title: alert,
          primary: true,
          onTap: onConfirm,
        )
      ],
    ).open();
  }

  static Future<T?> confirm<T>(Widget content,
      [final Widget confirm = const Text("确认"),
      final AntdActionOnTap? onConfirm,
      final Widget cancel = const Text("取消"),
      final AntdActionOnTap? onCancel]) {
    return AntdModal(
      builder: (_, ctx) {
        return content;
      },
      actions: [
        AntdModalAction(
          title: confirm,
          primary: true,
          onTap: onConfirm,
        ),
        AntdModalAction(
          title: cancel,
          onTap: onCancel,
        )
      ],
    ).open();
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdModalState();
  }
}

class _AntdModalState extends AntdDialogState<AntdModalAction> {
  @override
  AntdModalAction copyForm(covariant AntdModalAction action) {
    return action.copyForm(AntdModalAction(
      onTap: (_) {
        handlerTap(action);
      },
    ));
  }
}
