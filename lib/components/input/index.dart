import 'dart:ui';

import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 输入框光标样式配置
/// @l [AntdInput]
class AntInputCursorStyle extends AntdStyle {
  /// 光标颜色
  final Color? color;

  /// 光标宽度
  final double? width;

  /// 光标高度
  final double? height;

  /// 光标圆角半径
  final double? radius;

  /// 光标透明度是否启用动画效果
  final bool opacityAnimates;

  /// 光标位置偏移量
  final Offset? offset;

  /// 是否在文本上层绘制光标
  final bool above;

  const AntInputCursorStyle(
      {super.inherit,
      this.color,
      this.width = 2.0,
      this.height,
      this.radius,
      this.opacityAnimates = false,
      this.offset,
      this.above = false});

  @override
  AntInputCursorStyle copyFrom(AntInputCursorStyle? style) {
    return AntInputCursorStyle(
      color: style?.color ?? color,
      width: style?.width ?? width,
      height: style?.height ?? height,
      radius: style?.radius ?? radius,
      opacityAnimates: style?.opacityAnimates ?? opacityAnimates,
      offset: style?.offset ?? offset,
    );
  }
}

/// 文本选择样式配置
/// @l [AntdInput]
class AntdSelectionStyle extends AntdStyle {
  /// 选择区域高度计算方式
  final BoxHeightStyle? heightStyle;

  /// 选择区域宽度计算方式
  final BoxWidthStyle? widthStyle;

  /// 文本选中区域颜色
  final Color? color;

  /// 是否启用文本选择功能
  final bool? enable;

  const AntdSelectionStyle(
      {super.inherit,
      this.color,
      this.heightStyle,
      this.widthStyle,
      this.enable});

  @override
  AntdSelectionStyle copyFrom(AntdSelectionStyle? style) {
    return AntdSelectionStyle(
      heightStyle: style?.heightStyle ?? heightStyle,
      widthStyle: style?.widthStyle ?? widthStyle,
      color: style?.color ?? color,
      enable: style?.enable ?? enable,
    );
  }
}

/// 键盘样式配置
/// @l [AntdInput]
class AntdKeyboardStyle extends AntdStyle {
  /// 键盘外观主题（亮色/暗色）
  final Brightness? appearance;

  const AntdKeyboardStyle({super.inherit, this.appearance});

  @override
  AntdKeyboardStyle copyFrom(AntdKeyboardStyle? style) {
    return AntdKeyboardStyle(
      appearance: style?.appearance ?? appearance,
    );
  }
}

/// 输入框整体样式配置
/// @l [AntdInput],[AntdTextArea]
class AntdInputStyle extends AntdStyle {
  /// 占位符文本样式
  final AntdBoxStyle? placeholderStyle;

  /// 常规文本样式
  final TextStyle? textStyle;

  /// 密码模式文本样式
  final TextStyle? obscureTextStyle;

  /// 输入框容器样式
  final AntdBoxStyle? bodyStyle;

  /// 光标样式配置
  final AntInputCursorStyle? cursorStyle;

  /// 密码模式替代字符，默认"•"
  final String? obscuringCharacter;

  /// 图标样式配置
  final AntdIconStyle? clearIconStyle;

  /// 文本选择样式配置
  final AntdSelectionStyle? selectionStyle;

  /// 键盘样式配置
  final AntdKeyboardStyle? keyboardStyle;

  /// 清除按钮图标
  final Widget? clearIcon;

  /// 密码隐藏状态图标样式配置
  final AntdIconStyle? obscureIconStyle;

  /// 密码隐藏状态图标
  final Widget? obscureIcon;

  /// 密码显示状态图标样式配置
  final AntdIconStyle? activeObscureIconStyle;

  /// 密码显示状态图标
  final Widget? activeObscureIcon;

  /// 布局行样式配置
  final AntdFlexStyle? rowStyle;

  /// 自动修正文本区域颜色
  final Color? autocorrectionColor;

  const AntdInputStyle(
      {super.inherit,
      this.placeholderStyle,
      this.textStyle,
      this.obscureTextStyle,
      this.bodyStyle,
      this.cursorStyle,
      this.obscuringCharacter,
      this.clearIconStyle,
      this.selectionStyle,
      this.keyboardStyle,
      this.clearIcon,
      this.obscureIconStyle,
      this.obscureIcon = const AntdIcon(icon: AntdIcons.eyeInvisible),
      this.activeObscureIconStyle,
      this.activeObscureIcon = const AntdIcon(icon: AntdIcons.eye),
      this.rowStyle,
      this.autocorrectionColor});

  @override
  AntdInputStyle copyFrom(AntdInputStyle? style) {
    return AntdInputStyle(
        placeholderStyle: placeholderStyle.merge(style?.placeholderStyle),
        textStyle: textStyle == null
            ? style?.textStyle
            : textStyle?.merge(style?.textStyle),
        obscureTextStyle: obscureTextStyle == null
            ? style?.obscureTextStyle
            : obscureTextStyle?.merge(style?.obscureTextStyle),
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        cursorStyle: cursorStyle.merge(style?.cursorStyle),
        clearIconStyle: clearIconStyle.merge(style?.clearIconStyle),
        obscuringCharacter: style?.obscuringCharacter ?? obscuringCharacter,
        selectionStyle: selectionStyle.merge(style?.selectionStyle),
        keyboardStyle: keyboardStyle.merge(style?.keyboardStyle),
        clearIcon: style?.clearIcon ?? clearIcon,
        obscureIconStyle: obscureIconStyle.merge(style?.obscureIconStyle),
        obscureIcon: style?.obscureIcon ?? obscureIcon,
        activeObscureIconStyle:
            activeObscureIconStyle.merge(style?.activeObscureIconStyle),
        activeObscureIcon: style?.activeObscureIcon ?? activeObscureIcon,
        autocorrectionColor: style?.autocorrectionColor ?? autocorrectionColor,
        rowStyle: rowStyle.merge(style?.rowStyle));
  }
}

class AntdInputController extends TextEditingController {
  VoidCallback? _onClear;
  ValueChanged<String?>? _onChange;
  FocusNode? _focusNode;

  void requestFocus() {
    _focusNode?.requestFocus();
  }

  void unfocus() {
    _focusNode?.unfocus();
  }

  @override
  void clear() {
    super.clear();
    _onClear?.call();
    _onChange?.call(null);
  }
}

abstract class AntdInputBase<WidgetType>
    extends AntdStateComponent<AntdInputStyle, WidgetType>
    with AntdFormItemMixin {
  /// 控制输入框的焦点状态
  final FocusNode? focusNode;

  /// 是否显示清除按钮（点击会清空输入内容）
  final bool clearable;

  /// 输入框的初始值
  final String? value;

  /// 是否禁用输入框
  final bool disabled;

  /// 点击清除按钮时的回调函数
  final VoidCallback? onClear;

  /// 输入框为空时显示的提示文本
  final Widget? placeholder;

  /// 是否为只读模式（可选中文本但不可编辑）
  final bool readOnly;

  /// 输入框的控制器，用于程序化控制文本内容
  final AntdInputController? controller;

  /// 文本对齐方式（左/中/右）
  final TextAlign textAlign;

  /// 是否显示密码可见性切换图标（仅当obscureText=true时有效）
  final bool obscureIcon;

  /// 是否以密码形式隐藏输入内容（显示为圆点），默认为false
  final bool obscureText;

  /// 是否自动校正拼写错误（如iOS键盘的自动修正），默认为true
  final bool autocorrect;

  /// 输入框的最大行数（多行文本时生效）
  final int? maxLines;

  /// 输入框的最小行数（多行文本时生效）
  final int? minLines;

  /// 允许输入的最大字符数
  final int? maxLength;

  /// 键盘类型（如数字键盘、邮箱键盘等）
  final TextInputType? keyboardType;

  /// 键盘动作按钮类型（如搜索、发送等）
  final TextInputAction? inputAction;

  /// 输入内容变化时的回调函数
  final ValueChanged<String?>? onChange;

  /// 编辑完成时的回调（通常点击键盘完成/下一步时触发）
  final VoidCallback? onEditingComplete;

  /// 文本提交时的回调（通常点击键盘发送/搜索时触发）
  final ValueChanged<String>? onSubmitted;

  /// 文本选中范围变化时的回调
  final SelectionChangedCallback? onSelectionChanged;

  /// 输入内容格式过滤器（如限制数字、正则匹配等）
  final List<TextInputFormatter>? formatters;

  /// 输入框前缀部件（如图标、标签等）
  final Widget? prefix;

  /// 输入框后缀部件（如图标、按钮等）
  final Widget? suffix;

  /// 输入框点击事件回调
  final VoidCallback? onTap;

  /// 自定义上下文菜单构建器（长按文本时弹出的菜单）
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// 撤销/重做历史控制器
  final UndoHistoryController? undoController;

  /// 拼写检查配置（如启用/禁用、错误文本样式等）
  final SpellCheckConfiguration? spellCheckConfiguration;

  /// 文本放大镜配置（长按选中文本时的放大效果）
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// 处理来自键盘的私有命令（如第三方键盘扩展功能）
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// 拖动行为的起始方式（如立即响应或延迟响应）
  final DragStartBehavior dragStartBehavior;

  /// 滚动控制器（用于控制多行文本的滚动位置）
  final ScrollController? scrollController;

  /// 滚动物理效果（如滚动边界行为）
  final ScrollPhysics? scrollPhysics;

  /// 内容裁剪方式（如抗锯齿裁剪）
  final Clip clipBehavior;

  ///焦点事件
  final AntdOnFocus? onFocus;

  const AntdInputBase({
    super.key,
    super.style,
    super.styleBuilder,
    this.focusNode,
    this.clearable = true,
    this.value,
    this.disabled = false,
    this.onChange,
    this.onEditingComplete,
    this.onSubmitted,
    this.onClear,
    this.placeholder,
    this.readOnly = false,
    this.controller,
    this.textAlign = TextAlign.start,
    this.obscureIcon = true,
    this.obscureText = false,
    this.autocorrect = false,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.inputAction,
    this.onSelectionChanged,
    this.formatters,
    this.prefix,
    this.suffix,
    this.onTap,
    this.contextMenuBuilder,
    this.undoController,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.onAppPrivateCommand,
    this.dragStartBehavior = DragStartBehavior.start,
    this.scrollController,
    this.scrollPhysics = const ClampingScrollPhysics(),
    this.clipBehavior = Clip.hardEdge,
    this.onFocus,
  });

  @override
  AntdInputStyle margeStyle(
      AntdInputStyle defaultStyle, AntdInputStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdInputStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdInputStyle(
        clearIconStyle: AntdIconStyle(
            size: 20,
            color: token.colorText,
            bodyStyle: AntdBoxStyle(margin: token.size.sm.left)),
        bodyStyle: AntdBoxStyle(color: token.colorTransparent),
        placeholderStyle: AntdBoxStyle(
            textStyle: token.font.lg.copyWith(
          color: token.colorText.tertiary,
          overflow: TextOverflow.clip,
        )),
        textStyle: token.font.lg,
        obscureTextStyle: token.font.lg,
        keyboardStyle: const AntdKeyboardStyle(appearance: Brightness.light),
        cursorStyle: AntInputCursorStyle(
            color: token.colorPrimary,
            radius: 2,
            height: token.font.lg.fontSize,
            offset: defaultTargetPlatform == TargetPlatform.iOS
                ? Offset(
                    iOSHorizontalOffset /
                        MediaQuery.devicePixelRatioOf(context),
                    0)
                : null,
            above: defaultTargetPlatform == TargetPlatform.iOS,
            opacityAnimates: defaultTargetPlatform == TargetPlatform.iOS),
        obscuringCharacter: "•",
        clearIcon: const AntdIcon(
          icon: AntdIcons.closeCircleFill,
        ),
        selectionStyle:
            AntdSelectionStyle(color: token.colorPrimary.bg, enable: true),
        obscureIconStyle: AntdIconStyle(
          size: 20,
          color: token.colorText,
        ),
        rowStyle: AntdFlexStyle(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: (maxLines != 1
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center),
        ));
  }

  @override
  AntdInputStyle getFinalStyle(
      BuildContext context, AntdInputStyle style, AntdMapToken token) {
    return margeStyle(
        style,
        AntdInputStyle(
            activeObscureIconStyle:
                style.activeObscureIconStyle.merge(style.obscureIconStyle)));
  }
}

class AntdInputBaseState<T extends AntdInputBase<S>, S extends T>
    extends AntdState<AntdInputStyle, T>
    implements TextSelectionGestureDetectorBuilderDelegate {
  final GlobalKey<EditableTextState> _editableTextKey =
      GlobalKey<EditableTextState>();
  late final AntdInputController innerController =
      widget.controller ?? AntdInputController();
  late final FocusNode _createFocusNode = widget.focusNode ?? FocusNode();
  late final FocusNode? _inheritedFocusNode = AntdFocus.maybeOf(context);
  late final FocusNode _focusNode = _inheritedFocusNode ?? _createFocusNode;
  bool _obscureText = false;
  late TextSelectionGestureDetectorBuilder selectionGestureDetectorBuilder =
      TextSelectionGestureDetectorBuilder(delegate: this);
  bool _selectionEnable = true;

  @override
  void initState() {
    super.initState();
    innerController._onChange = _handlerOnChange;
  }

  @override
  void updateDependentValues(covariant T? oldWidget) {
    super.updateDependentValues(oldWidget);
    widget.useValue(context, (value) {
      innerController.text = value ?? "";
    });
    if (widget.value != oldWidget?.value) {
      innerController.text = widget.value!;
    }
    if (widget.obscureText != oldWidget?.obscureText) {
      _obscureText = widget.obscureText;
    }

    innerController._onClear = widget.onClear;
    innerController._focusNode = _focusNode;
    _selectionEnable =
        style.selectionStyle?.enable != false && !widget.disabled;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      innerController.dispose();
    }
    if (_createFocusNode != widget.focusNode) {
      _createFocusNode.dispose();
    }
    super.dispose();
  }

  void _handlerOnChange(String? value) {
    widget.onChange?.call(value);
    widget.setValue(context, value, AntdFormTrigger.onChange);
  }

  Widget buildInput(Widget input) {
    return input;
  }

  Alignment buildAlignment() {
    if (widget.textAlign == TextAlign.right ||
        widget.textAlign == TextAlign.end) {
      return Alignment.centerRight;
    }
    if (widget.textAlign == TextAlign.center) {
      return Alignment.center;
    }
    return Alignment.centerLeft;
  }

  @override
  Widget render(BuildContext context) {
    var cursorStyle = style.cursorStyle;
    var selectionStyle = style.selectionStyle;
    var editText = EditableText(
      key: _editableTextKey,
      controller: innerController,
      focusNode: _focusNode,
      readOnly: widget.readOnly || widget.disabled,
      obscureText: _obscureText,
      obscuringCharacter: style.obscuringCharacter!,
      style: _obscureText ? style.obscureTextStyle! : style.textStyle!,
      textAlign: widget.textAlign,
      maxLines: _obscureText ? 1 : widget.maxLines,
      minLines: widget.minLines,
      cursorColor: cursorStyle!.color!,
      cursorWidth: cursorStyle.width!,
      cursorHeight: cursorStyle.height,
      cursorRadius: cursorStyle.radius != null
          ? Radius.circular(cursorStyle.radius!)
          : null,
      cursorOpacityAnimates: cursorStyle.opacityAnimates,
      cursorOffset: cursorStyle.offset,
      backgroundCursorColor: cursorStyle.color!,
      paintCursorAboveText: style.cursorStyle?.above == true,
      keyboardType: widget.keyboardType,
      textInputAction: widget.inputAction,
      keyboardAppearance: style.keyboardStyle?.appearance ?? Brightness.light,
      inputFormatters: [
        if (widget.maxLength != null)
          LengthLimitingTextInputFormatter(widget.maxLength!),
        ...(widget.formatters ?? [])
      ],
      autocorrect: widget.autocorrect,
      enableSuggestions: !_obscureText,
      spellCheckConfiguration: widget.spellCheckConfiguration,
      enableInteractiveSelection: _selectionEnable,
      selectionColor: selectionStyle?.color,
      selectionControls: switch (defaultTargetPlatform) {
        TargetPlatform.iOS => cupertinoTextSelectionHandleControls,
        TargetPlatform.android => materialTextSelectionHandleControls,
        TargetPlatform.fuchsia => materialTextSelectionHandleControls,
        TargetPlatform.linux => desktopTextSelectionHandleControls,
        TargetPlatform.macOS => cupertinoTextSelectionHandleControls,
        TargetPlatform.windows => desktopTextSelectionHandleControls,
      },
      selectionHeightStyle: selectionStyle?.heightStyle ?? BoxHeightStyle.tight,
      selectionWidthStyle: selectionStyle?.widthStyle ?? BoxWidthStyle.tight,
      showSelectionHandles: _selectionEnable,
      onSelectionChanged: widget.onSelectionChanged,
      scrollController: widget.scrollController,
      scrollPhysics: widget.scrollPhysics,
      scrollPadding: EdgeInsets.zero,
      dragStartBehavior: widget.dragStartBehavior,
      onChanged: _handlerOnChange,
      contextMenuBuilder: widget.contextMenuBuilder,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      onAppPrivateCommand: widget.onAppPrivateCommand,
      undoController: widget.undoController,
      magnifierConfiguration: widget.magnifierConfiguration ??
          TextMagnifier.adaptiveMagnifierConfiguration,
      rendererIgnoresPointer: true,
      clipBehavior: widget.clipBehavior,
    );
    return AntdBox(
      disabled: widget.disabled,
      style: style.bodyStyle,
      onTap: widget.onTap,
      focusNode: _focusNode,
      onFocus: (value) {
        if (!value) {
          widget.setValue(
              context, innerController.text, AntdFormTrigger.onFocus);
        }
        widget.onFocus?.call(value);
      },
      child: buildInput(AntdRow(
        style: style.rowStyle,
        children: [
          if (widget.prefix != null) widget.prefix!,
          Expanded(
            child: Stack(
              alignment: buildAlignment(),
              children: [
                if (widget.placeholder != null)
                  ValueListenableBuilder(
                    valueListenable: innerController,
                    builder: (context, value, _) {
                      return AntdBox(
                        style: style.placeholderStyle,
                        child: value.text.isEmpty ? widget.placeholder! : null,
                      );
                    },
                  ),
                TextFieldTapRegion(
                    child: selectionGestureDetectorBuilder.buildGestureDetector(
                        behavior: HitTestBehavior.translucent, child: editText))
              ],
            ),
          ),
          ValueListenableBuilder(
              valueListenable: innerController,
              builder: (context, value, _) {
                if (widget.readOnly != true &&
                    widget.disabled != true &&
                    widget.clearable &&
                    !widget.obscureText) {
                  return Visibility(
                    visible: value.text.isNotEmpty,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: AntdIconWrap(
                      style: style.clearIconStyle,
                      child: AntdBox(
                        options: const AntdTapOptions(
                            accepter: AntdTapAccepter.listener),
                        onTap: () async {
                          innerController.clear();
                        },
                        child: style.clearIcon,
                      ),
                    ),
                  );
                }
                return const AntdBox();
              }),
          if (widget.obscureText && widget.obscureIcon)
            AntdIconWrap(
              style: _obscureText
                  ? style.activeObscureIconStyle
                  : style.obscureIconStyle,
              child: AntdBox(
                options:
                    const AntdTapOptions(accepter: AntdTapAccepter.listener),
                onTap: () async {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child:
                    _obscureText ? style.activeObscureIcon : style.obscureIcon,
              ),
            ),
          if (widget.suffix != null) widget.suffix!
        ],
      )),
    );
  }

  @override
  GlobalKey<EditableTextState> get editableTextKey => _editableTextKey;

  @override
  bool get forcePressEnabled => defaultTargetPlatform == TargetPlatform.iOS;

  @override
  bool get selectionEnabled => true;
}

///@t 输入框
///@g 信息录入
///@o 57
///@d 通过键盘输入内容，是最基础的表单域包装。
///@u 一般用在表单页进行信息的收集，提供文本框、选择框两种类型。
class AntdInput extends AntdInputBase<AntdInput> {
  const AntdInput({
    super.key,
    super.style,
    super.styleBuilder,
    super.focusNode,
    super.clearable = true,
    super.value,
    super.disabled = false,
    super.onChange,
    super.onEditingComplete,
    super.onSubmitted,
    super.onClear,
    super.placeholder,
    super.readOnly = false,
    super.controller,
    super.textAlign = TextAlign.start,
    super.obscureIcon = true,
    super.obscureText = false,
    super.autocorrect = false,
    super.maxLines,
    super.minLines,
    super.maxLength,
    super.keyboardType = TextInputType.text,
    super.inputAction,
    super.onSelectionChanged,
    super.formatters,
    super.prefix,
    super.suffix,
    super.onTap,
    super.contextMenuBuilder,
    super.undoController,
    super.spellCheckConfiguration,
    super.magnifierConfiguration,
    super.onAppPrivateCommand,
    super.dragStartBehavior = DragStartBehavior.start,
    super.scrollController,
    super.scrollPhysics = const AlwaysScrollableScrollPhysics(),
    super.clipBehavior = Clip.hardEdge,
    super.onFocus,
  });

  @override
  Widget get child => this;

  @override
  AntdInput getWidget(BuildContext context) {
    return this;
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdInputState();
  }

  @override
  AntdStyleBuilder<AntdInputStyle, AntdInput>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.inputStyle;
  }
}

class _AntdInputState extends AntdInputBaseState<AntdInput, AntdInput> {}
