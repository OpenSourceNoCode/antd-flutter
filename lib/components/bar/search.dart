import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

/// 搜索栏样式配置
/// @l [AntdSearchBar]
class AntdSearchBarStyle extends AntdStyle {
  /// 搜索栏容器默认样式（非激活状态）
  final AntdBoxStyle? bodyStyle;

  ///对齐样式
  final AntdFlexStyle? bodyRowStyle;

  /// 输入框样式配置
  final AntdInputStyle? inputStyle;

  /// 搜索栏激活状态容器样式
  final AntdBoxStyle? activeBodyStyle;

  /// 占位符图标样式配置
  final AntdIconStyle? iconStyle;

  /// 右侧附加内容容器样式
  final AntdBoxStyle? extraStyle;

  /// 自定义占位符组件（替代默认文本占位符）
  final Widget? placeholder;

  ///对齐样式
  final AntdFlexStyle? placeholderRowStyle;

  const AntdSearchBarStyle(
      {super.inherit,
      this.bodyStyle,
      this.bodyRowStyle,
      this.inputStyle,
      this.activeBodyStyle,
      this.iconStyle,
      this.extraStyle,
      this.placeholder,
      this.placeholderRowStyle});

  @override
  AntdSearchBarStyle copyFrom(covariant AntdSearchBarStyle? style) {
    return AntdSearchBarStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      bodyRowStyle: bodyRowStyle.merge(style?.bodyRowStyle),
      activeBodyStyle: activeBodyStyle.mergeActive(
          bodyStyle, style?.bodyStyle, style?.activeBodyStyle),
      inputStyle: inputStyle.merge(style?.inputStyle),
      iconStyle: iconStyle.merge(style?.iconStyle),
      extraStyle: extraStyle.merge(style?.extraStyle),
      placeholder: style?.placeholder ?? placeholder,
      placeholderRowStyle:
          placeholderRowStyle.merge(style?.placeholderRowStyle),
    );
  }
}

class AntdSearchBarController extends AntdInputController {
  final ValueNotifier<bool> _active = ValueNotifier(false);

  void active() {
    _active.value = true;
  }

  void unActive() {
    _active.value = false;
    unfocus();
  }

  @override
  void dispose() {
    _active.dispose();
    super.dispose();
  }
}

///@t 搜索框
///@g 信息录入
///@o 53
///@d 搜索场景的输入框组件。。
///@u 在信息池中缩小范围，快速而轻松地获取目标信息。
class AntdSearchBar
    extends AntdStateComponent<AntdSearchBarStyle, AntdSearchBar> {
  const AntdSearchBar(
      {super.key,
      super.style,
      super.styleBuilder,
      this.extra,
      this.autoClear = true,
      this.autoFocus = true,
      this.showExtra = false,
      this.clearable = true,
      this.prefix,
      this.onClear,
      this.onChange,
      this.onExtraTap,
      this.placeholder,
      this.controller,
      this.readOnly = false,
      this.lazy = false,
      this.duration = const Duration(milliseconds: 200)});

  ///取消按钮的文案
  final Widget? extra;

  ///点击取消按钮后是否清空输入框
  final bool autoClear;

  ///自动获取焦点
  final bool autoFocus;

  ///点击取消按钮后是否清空输入框
  final bool showExtra;

  ///是否启用清除图标，点击清除图标后会清空输入框
  final bool clearable;

  ///前缀
  final Widget? prefix;

  ///点击清除按钮后触发
  final VoidCallback? onClear;

  ///值变更
  final ValueChanged<String?>? onChange;

  ///点击额外区域时触发
  final VoidCallback? onExtraTap;

  ///提示文本
  final Widget? placeholder;

  ///只读模式
  final bool readOnly;

  ///搜索控制器
  final AntdSearchBarController? controller;

  ///只有当激活后才出现输入框
  final bool lazy;

  ///动画时长
  final Duration duration;

  @override
  State<StatefulWidget> createState() {
    return _AntdSearchBarState();
  }

  @override
  AntdSearchBarStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var bodyStyle = AntdBoxStyle(
        border: token.border.all,
        padding: token.size.ms.horizontal.marge(token.size.xs.vertical),
        color: token.colorBgContainer,
        radius: token.radius.all,
        options: const AntdTapOptions(accepter: AntdTapAccepter.listener));
    return AntdSearchBarStyle(
        bodyStyle: bodyStyle,
        bodyRowStyle: const AntdFlexStyle(mainAxisSize: MainAxisSize.min),
        inputStyle: AntdInputStyle(
            textStyle: token.font.md,
            placeholderStyle: AntdBoxStyle(
                textStyle:
                    token.font.md.copyWith(color: token.colorText.tertiary))),
        activeBodyStyle: AntdBoxStyle(
            border: token.border.copyWith(color: token.colorPrimary).all),
        iconStyle: AntdIconStyle(
            size: 18,
            bodyStyle: AntdBoxStyle(
                margin:
                    EdgeInsets.only(right: token.size.xxs.roundToDouble()))),
        extraStyle: AntdBoxStyle(
          textStyle: token.font.lg,
          padding: token.size.lg.horizontal,
        ),
        placeholderRowStyle: const AntdFlexStyle(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
        ));
  }

  @override
  AntdSearchBarStyle margeStyle(
      AntdSearchBarStyle defaultStyle, AntdSearchBarStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdSearchBarStyle, AntdSearchBar>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.searchBarStyle;
  }

  @override
  AntdSearchBar getWidget(BuildContext context) {
    return this;
  }
}

class _AntdSearchBarState extends AntdState<AntdSearchBarStyle, AntdSearchBar> {
  late final AntdSearchBarController innerController =
      widget.controller ?? AntdSearchBarController();

  @override
  void initState() {
    super.initState();

    innerController._active.addListener(() {
      if (innerController._active.value && widget.autoFocus) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          innerController.requestFocus();
        });
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      innerController.dispose();
    }

    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    var placeholder = widget.placeholder ?? style.placeholder;
    var prefix = AntdStyleProvider<AntdIconStyle>(
      style: style.iconStyle!,
      child: AntdBox(
        child: widget.prefix,
      ),
    );
    var input = AntdInput(
        readOnly: widget.readOnly,
        controller: innerController,
        style: style.inputStyle,
        clearable: widget.clearable,
        onClear: widget.onClear,
        maxLines: 1,
        minLines: 1,
        onChange: widget.onChange,
        onFocus: (value) {
          if (value) {
            innerController.active();
          }
        },
        prefix: prefix,
        placeholder: placeholder);
    var extra = widget.extra != null
        ? AntdBox(
            onTap: widget.onExtraTap != null || widget.autoClear == true
                ? () {
                    widget.onExtraTap?.call();
                    innerController.unActive();
                  }
                : null,
            style: style.extraStyle,
            child: widget.extra,
          )
        : const AntdBox();

    return ValueListenableBuilder(
        valueListenable: innerController._active,
        builder: (context, value, _) {
          var showInput = value == true;

          var child = AntdRow(
            style: style.bodyRowStyle,
            children: [
              Expanded(
                  child: AntdBox(
                onTap: () {
                  if (widget.readOnly) {
                    return;
                  }

                  innerController.active();
                },
                style: value ? style.activeBodyStyle : style.bodyStyle,
                child: AnimatedCrossFade(
                    firstChild: input,
                    secondChild: AntdRow(
                      style: style.placeholderRowStyle,
                      children: [
                        prefix,
                        AntdBox(
                          style: style.inputStyle?.placeholderStyle,
                          child: placeholder,
                        ),
                      ],
                    ),
                    crossFadeState: showInput
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: widget.duration),
              )),
              AnimatedSize(
                duration: widget.duration,
                curve: Curves.easeOut,
                child: widget.showExtra || value ? extra : const AntdBox(),
              )
            ],
          );

          return child;
        });
  }
}
