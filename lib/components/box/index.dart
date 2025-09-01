import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

typedef AntdOnFocus = ValueChanged<bool>;

class AntdFocus {
  static FocusNode? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AntdBoxProvider>()
        ?.focusNode;
  }
}

class AntdBoxProvider extends InheritedWidget {
  final VoidCallback? handleSizeChange;
  final FocusNode? focusNode;

  const AntdBoxProvider(
      {super.key, required super.child, this.handleSizeChange, this.focusNode});

  @override
  bool updateShouldNotify(covariant AntdBoxProvider oldWidget) {
    return oldWidget.handleSizeChange != handleSizeChange;
  }

  static AntdBoxProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AntdBoxProvider>();
  }
}

///@t 布局盒子
///@g 通用
///@o 100
///@d 类似于Web中的div,小程序中的view,Android中的View,iOS中的UIView
class AntdBox extends AntdStateComponent<AntdBoxStyle, AntdBox> {
  /// 外部安全区域边距（通常用于避开系统UI如刘海屏）
  final AntdPosition? outerSafeArea;

  /// 内部安全区域边距（内容与边界的保留间距）
  final AntdPosition? innerSafeArea;

  /// 布局完成回调（当组件获取到最终尺寸和位置时触发）
  /// 参数包含视图的尺寸和全局位置信息
  final AntdOnLayout? onLayout;

  /// 焦点变化回调（当组件获得/失去焦点时触发）
  final AntdOnFocus? onFocus;

  /// 轻击事件回调
  final VoidCallback? onTap;

  /// 双击事件回调
  final VoidCallback? onDoubleTap;

  /// 长按事件回调
  final VoidCallback? onLongPress;

  ///禁用
  final bool? disabled;

  /// 高级点击行为配置（控制手势识别阈值和反馈行为）
  /// 包括：双击间隔、长按时长、触觉反馈等
  final AntdTapOptions? options;

  /// 子组件（通常为需要应用这些交互和布局约束的内容）
  final Widget? child;

  ///焦点
  final FocusNode? focusNode;

  const AntdBox(
      {super.key,
      super.style,
      super.styleBuilder,
      this.outerSafeArea,
      this.innerSafeArea,
      this.onLayout,
      this.onFocus,
      this.onTap,
      this.onDoubleTap,
      this.onLongPress,
      this.disabled,
      this.options,
      this.child,
      this.focusNode});

  AntdBox copyWith(
      {final AntdBoxStyle? style,
      final AntdPosition? outerSafeArea,
      final AntdPosition? innerSafeArea,
      final AntdOnLayout? onLayout,
      final ValueChanged<bool>? onFocus,
      final VoidCallback? onTap,
      final VoidCallback? onDoubleTap,
      final VoidCallback? onLongPress,
      final bool? disabled,
      final AntdTapOptions? options,
      final Widget? child}) {
    return AntdBox(
      style: style ?? this.style,
      outerSafeArea: outerSafeArea ?? this.outerSafeArea,
      innerSafeArea: innerSafeArea ?? this.innerSafeArea,
      onLayout: onLayout ?? this.onLayout,
      onFocus: onFocus ?? this.onFocus,
      onTap: onTap ?? this.onTap,
      onDoubleTap: onDoubleTap ?? this.onDoubleTap,
      onLongPress: onLongPress ?? this.onLongPress,
      disabled: disabled,
      options: this.options?.copyFrom(options),
      child: child ?? this.child,
    );
  }

  @override
  State<StatefulWidget> createState() {
    return AntdBoxState();
  }

  @override
  AntdBoxStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdBoxStyle(
        disabledStyle: AntdKitStyle(
      colorFilter: ColorFilter.mode(
        const Color(0xffffffff).withValues(alpha: 0.5),
        BlendMode.modulate,
      ),
    ));
  }

  @override
  AntdBoxStyle margeStyle(AntdBoxStyle defaultStyle, AntdBoxStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdBoxStyle, AntdBox>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.boxStyle;
  }

  @override
  AntdBox getWidget(BuildContext context) {
    return this;
  }
}

class AntdBoxState extends AntdState<AntdBoxStyle, AntdBox> {
  Size? _beforeSize;
  bool tapState = false;
  bool focusState = false;
  late var mediaQuery = MediaQuery.of(context);
  late AntdTapOptions _options = widget.options?.copyWith(
          disabled: widget.disabled, hapticFeedback: style.hapticFeedback) ??
      AntdTapOptions(disabled: widget.disabled == true);
  bool get _hasFocusNode => widget.onFocus != null || style.focusStyle != null;
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();

  late final AntdTapHandler _handler = AntdTapHandler(
    options: _options,
    onTouchStateChange: (state) {
      if (style.feedbackStyle != null && tapState != state && mounted) {
        setState(() {
          tapState = state;
        });
      }
    },
  );

  double getSafeArea(AntdPosition? position) {
    switch (position) {
      case AntdPosition.top:
        return mediaQuery.padding.top;
      case AntdPosition.bottom:
        return mediaQuery.padding.bottom;
      case AntdPosition.left:
        return mediaQuery.padding.left;
      case AntdPosition.right:
        return mediaQuery.padding.right;
      case AntdPosition.horizontal:
        return 0;
      case AntdPosition.vertical:
        return 0;
      case null:
        return 0;
      case AntdPosition.all:
        return 0;
    }
  }

  EdgeInsets? margeSafeArea(AntdPosition? position, bool noEdge,
      EdgeInsets? padding, double? height, double? width) {
    padding ??= EdgeInsets.zero;
    var xp = noEdge == false || width == null;
    var yp = noEdge == false || height == null;
    if (position == null) {
      return EdgeInsets.only(
        top: yp ? padding.top : 0,
        bottom: yp ? padding.bottom : 0,
        left: xp ? padding.left : 0,
        right: xp ? padding.right : 0,
      );
    }
    var safeArea = getSafeArea(position);
    switch (position) {
      case AntdPosition.top:
        return padding.copyWith(top: yp ? padding.top + safeArea : 0);
      case AntdPosition.bottom:
        return padding.copyWith(bottom: yp ? padding.bottom + safeArea : 0);
      case AntdPosition.left:
        return padding.copyWith(left: xp ? padding.left + safeArea : 0);
      case AntdPosition.right:
        return padding.copyWith(right: xp ? padding.right + safeArea : 0);
      case AntdPosition.vertical:
        return padding.copyWith(
            top: yp ? padding.top + getSafeArea(AntdPosition.top) : 0,
            bottom: yp ? padding.bottom + getSafeArea(AntdPosition.bottom) : 0);
      case AntdPosition.horizontal:
        return padding.copyWith(
            left: xp ? padding.left + getSafeArea(AntdPosition.left) : 0,
            right: xp ? padding.right + getSafeArea(AntdPosition.right) : 0);
      case AntdPosition.all:
        return padding.copyWith(
            top: xp ? padding.top + getSafeArea(AntdPosition.top) : 0,
            bottom: xp ? padding.bottom + getSafeArea(AntdPosition.bottom) : 0,
            left: yp ? padding.left + getSafeArea(AntdPosition.left) : 0,
            right: yp ? padding.right + getSafeArea(AntdPosition.right) : 0);
    }
  }

  void execLayoutCallback(bool update) {
    if (mounted == false || widget.onLayout == null) {
      return;
    }

    final renderObject = context.findRenderObject();
    if (renderObject == null || renderObject is! RenderBox) {
      return;
    }

    final viewport = RenderAbstractViewport.maybeOf(renderObject);
    var ctx = AntdLayoutContext(
        key: widget.key,
        hasSizeChange: _beforeSize == null || _beforeSize != renderObject.size,
        renderBox: renderObject,
        viewport: viewport,
        padding: style.padding ?? EdgeInsets.zero,
        margin: style.margin ?? EdgeInsets.zero,
        update: update);
    widget.onLayout?.call(ctx);
    _beforeSize = ctx.renderBox.size;
    if (ctx.hasSizeChange) {
      AntdBoxProvider.maybeOf(context)?.handleSizeChange?.call();
    }
  }

  @override
  void updateDependentValues(covariant AntdBox? oldWidget) {
    super.updateDependentValues(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      execLayoutCallback(false);
    });

    _options = widget.options?.copyWith(disabled: widget.disabled) ??
        AntdTapOptions(disabled: widget.disabled == true);
    _focusNode.canRequestFocus = _options.disabled != true;

    _handler.options = _options;
    if (_hasFocusNode && widget.onTap == null && widget.disabled != true) {
      _handler.tapHandler = () {
        _focusNode.requestFocus();
        widget.onTap?.call();
      };
    } else {
      _handler.tapHandler = widget.onTap;
    }

    _handler.doubleTapHandler = widget.onDoubleTap;
    _handler.longPressHandler = widget.onLongPress;
  }

  @override
  void dispose() {
    _handler.dispose();
    if (_focusNode != widget.focusNode) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    var size = style.margeSize;
    var innerStyle = style.copyWith(
        padding: margeSafeArea(widget.innerSafeArea, false, style.padding,
            size.height, style.width),
        margin: margeSafeArea(widget.outerSafeArea, false, style.margin,
            size.height, style.width));
    if (_options.disabled == true) {
      innerStyle = innerStyle.overFrom(style.disabledStyle);
    } else if (tapState) {
      innerStyle = innerStyle.overFrom(style.feedbackStyle);
    } else if (focusState) {
      innerStyle = innerStyle.overFrom(style.focusStyle);
    }

    var child = innerStyle.render(widget.child);
    if (_handler.hasHandlers || style.feedbackStyle != null) {
      if (!_handler.hasHandlers) {
        child = Listener(
          behavior: _options.behavior,
          onPointerDown: (detail) {
            _handler.handlePointerDown(TapDownDetails(
                globalPosition: detail.position,
                localPosition: detail.localPosition,
                kind: detail.kind));
          },
          onPointerUp: (detail) {
            _handler.handlePointerUp(TapUpDetails(
                globalPosition: detail.position,
                localPosition: detail.localPosition,
                kind: detail.kind));
          },
          onPointerCancel: (detail) {
            _handler.handlePointerCancel();
          },
          child: child,
        );
      } else {
        child = GestureDetector(
          behavior: _options.behavior,
          onTapDown: _handler.handlePointerDown,
          onTapUp: _handler.handlePointerUp,
          onTapCancel: _handler.handlePointerCancel,
          child: child,
        );
      }
    }

    if (innerStyle.radius != null && innerStyle.shadows == null) {
      return ClipRRect(
        borderRadius: innerStyle.radius!,
        child: child,
      );
    }

    if (widget.onLayout != null || widget.focusNode != null) {
      return AntdBoxProvider(
        focusNode: widget.focusNode,
        handleSizeChange: widget.onLayout != null
            ? () {
                execLayoutCallback(false);
              }
            : null,
        child: child,
      );
    }
    if (_hasFocusNode) {
      child = Focus(
        onFocusChange: (value) {
          widget.onFocus?.call(value);
          if (style.focusStyle != null && focusState != value) {
            setState(() {
              focusState = value;
            });
          }
        },
        focusNode: _focusNode,
        child: child,
      );
    }
    return child;
  }
}
