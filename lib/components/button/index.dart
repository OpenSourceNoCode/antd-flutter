import 'package:antd_flutter/index.dart';
import 'package:flutter/widgets.dart';

enum AntdButtonFill { solid, outline, none }

enum AntdButtonShape { rounded, rectangular }

/// @t 按钮样式
/// @d 定义按钮的所有可定制样式属性
/// @l [AntdButton]
class AntdButtonStyle extends AntdStyle {
  /// 按钮图标的样式配置
  ///
  /// 当按钮包含图标时生效
  final AntdIconStyle? iconStyle;

  /// 按钮容器的样式配置
  final AntdBoxStyle? buttonStyle;

  /// 加载状态下的自定义加载指示器
  ///
  /// 当按钮处于加载状态时显示的组件,如果为null，则使用[AntdLoading]
  final Widget? loadingWidget;

  const AntdButtonStyle({
    super.inherit,
    this.iconStyle,
    this.buttonStyle,
    this.loadingWidget,
  });

  @override
  AntdButtonStyle copyFrom(covariant AntdButtonStyle? style) {
    return AntdButtonStyle(
        iconStyle: iconStyle.merge(style?.iconStyle),
        buttonStyle: buttonStyle.merge(style?.buttonStyle),
        loadingWidget: style?.loadingWidget ?? loadingWidget);
  }
}

///@t 按钮
///@g 通用
///@o 99
///@d 用于开始一个即时操作。
///@u 标记了一个或封装一组操作命令，响应用户点击行为，触发相应的业务逻辑。
class AntdButton extends AntdStateComponent<AntdButtonStyle, AntdButton> {
  const AntdButton({
    super.key,
    super.style,
    super.styleBuilder,
    this.block,
    this.color = AntdColor.primary,
    this.disabled,
    this.fill = AntdButtonFill.solid,
    this.shape,
    this.size = AntdSize.default_,
    this.onLoadingTap,
    this.onTap,
    this.child,
    this.icon,
    this.loading,
    this.throttle,
    this.debounce,
    this.behavior,
  });

  /// 是否充满父容器宽度
  final bool? block;

  /// 按钮主题色
  final AntdColor? color;

  /// 是否禁用状态
  final bool? disabled;

  /// 按钮填充模式
  final AntdButtonFill? fill;

  /// 按钮形状样式
  final AntdButtonShape? shape;

  /// 按钮尺寸规格
  final AntdSize size;

  /// 点击事件回调
  final GestureTapCallback? onTap;

  /// 支持自动loading状态的异步点击事件
  final FutureVoidCallback? onLoadingTap;

  /// 前缀图标组件
  final Widget? icon;

  /// 按钮内容组件
  final Widget? child;

  /// 是否显示加载状态
  final bool? loading;

  /// 点击事件节流间隔（默认开启）
  final Duration? throttle;

  /// 点击事件防抖间隔（默认关闭）
  final Duration? debounce;

  /// 点击事件命中测试行为
  final HitTestBehavior? behavior;

  double _getVerticalPadding(AntdAliasToken token) {
    if (size == AntdSize.middle || size == AntdSize.default_) {
      return token.size.default_.roundToDouble();
    }
    if (size == AntdSize.small || size == AntdSize.mini) {
      return token.size.xs.roundToDouble();
    }
    return token.size.lg.roundToDouble();
  }

  double _getHorizontalPadding(AntdAliasToken token) {
    if (block == true) {
      return 0;
    }
    return token.size.lg.roundToDouble();
  }

  @override
  AntdButtonStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var setColor = color?.getColor(token);

    var style = AntdBoxStyle(
        width: block == true ? double.infinity : null,
        padding: EdgeInsets.symmetric(
            horizontal: _getHorizontalPadding(token),
            vertical: _getVerticalPadding(token)),
        feedbackStyle: AntdBoxStyle(
          color: token.colorFill,
        ),
        color: token.colorWhite,
        textStyle:
            size.text(token).copyWith(color: setColor ?? token.colorText),
        radius: BorderRadius.circular(shape == AntdButtonShape.rounded
            ? 9999
            : token.radiusSize.roundToDouble()),
        border: fill != AntdButtonFill.none
            ? Border.all(color: setColor ?? token.colorBorder, width: 1)
            : null);

    if (fill == AntdButtonFill.solid && setColor != null) {
      style = style.copyFrom(AntdBoxStyle(
          feedbackStyle: AntdBoxStyle(color: color?.getActiveColor(token)),
          color: setColor,
          textStyle: size.text(token).copyWith(color: token.colorWhite)));
    }
    return AntdButtonStyle(
        buttonStyle: style,
        loadingWidget: AntdLoading(
          spinning: true,
          text: const Text("加载中"),
          style: AntdLoadingStyle(
              color: style.textStyle?.color,
              textStyle: AntdBoxStyle(textStyle: style.textStyle)),
        ),
        iconStyle: AntdIconStyle(
            color: style.textStyle?.color,
            size: token.size.xl.roundToDouble(),
            bodyStyle: AntdBoxStyle(
                padding: child != null ? token.size.default_.right : 0.all)));
  }

  @override
  AntdButtonStyle margeStyle(
      AntdButtonStyle defaultStyle, AntdButtonStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdButtonStyle, AntdButton>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.buttonStyle;
  }

  @override
  AntdButton getWidget(BuildContext context) {
    return this;
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdButtonState();
  }
}

class _AntdButtonState extends AntdState<AntdButtonStyle, AntdButton> {
  bool innerLoading = false;

  handlerOnTap() async {
    if (widget.onTap != null) {
      widget.onTap?.call();
    }

    if (widget.onLoadingTap != null) {
      setState(() {
        innerLoading = true;
      });

      await widget.onLoadingTap!();

      setState(() {
        innerLoading = false;
      });
      return;
    }
  }

  @override
  Widget render(BuildContext context) {
    Widget innerChild;
    if (isLoading()) {
      innerChild = style.loadingWidget!;
    } else {
      var childList = <Widget>[];
      if (widget.icon != null) {
        childList.add(AntdStyleProvider<AntdIconStyle>(
          style: style.iconStyle,
          child: widget.icon!,
        ));
      }
      if (widget.child != null) {
        childList.add(widget.child!);
      }

      innerChild = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: childList,
      );
    }

    var button = AntdBox(
      onTap: widget.onTap != null || widget.onLoadingTap != null
          ? handlerOnTap
          : null,
      style: style.buttonStyle,
      disabled: innerLoading == true ||
          widget.loading == true ||
          widget.disabled == true,
      options: AntdTapOptions(
        behavior: widget.behavior ?? HitTestBehavior.deferToChild,
        throttle: widget.throttle,
        debounce: widget.debounce,
      ),
      child: innerChild,
    );
    return button;
  }

  bool isLoading() {
    return (widget.loading == true || innerLoading) && widget.disabled != true;
  }
}
