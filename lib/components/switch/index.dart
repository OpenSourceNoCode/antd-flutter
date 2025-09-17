import 'dart:math';

import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

/// 开关组件的基础样式（包含所有状态）
/// @l [AntdSwitch]
class AntdSwitchStyle extends AntdStyle {
  /// 主体样式，可以开启切换时震动反馈
  final AntdBoxStyle? bodyStyle;

  /// 开关轨道样式
  final AntdBoxStyle? trackStyle;

  /// 激活后开关轨道样式
  final AntdBoxStyle? activeTrackStyle;

  /// 开关手柄样式
  final AntdBoxStyle? thumbStyle;

  /// 激活后开关手柄样式
  final AntdBoxStyle? activeThumbStyle;

  /// 开关内部子内容样式（如文字/图标）
  final AntdBoxStyle? contentStyle;

  /// 开关内部子内容样式（如文字/图标）
  final AntdBoxStyle? activeContentStyle;

  ///选中时的内容
  final Widget? content;

  ///未选中时的内容
  final Widget? activeContent;

  const AntdSwitchStyle(
      {super.inherit,
      this.bodyStyle,
      this.trackStyle,
      this.activeTrackStyle,
      this.thumbStyle,
      this.activeThumbStyle,
      this.contentStyle,
      this.activeContentStyle,
      this.content,
      this.activeContent});

  @override
  AntdSwitchStyle copyFrom(covariant AntdSwitchStyle? style) {
    return AntdSwitchStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      trackStyle: trackStyle.merge(style?.trackStyle),
      activeTrackStyle: activeTrackStyle.merge(style?.activeTrackStyle),
      thumbStyle: thumbStyle.merge(style?.thumbStyle),
      activeThumbStyle: activeThumbStyle.merge(style?.activeThumbStyle),
      contentStyle: contentStyle.merge(style?.contentStyle),
      activeContentStyle: activeContentStyle.merge(style?.activeContentStyle),
      content: style?.content ?? content,
      activeContent: style?.activeContent ?? activeContent,
    );
  }
}

typedef AntdSwitchChange = void Function(bool value);

///@t 开关
///@g 信息录入
///@o 48
///@d 开关选择器。
///@u 需要表示开关状态/两种状态之间的切换时
class AntdSwitch
    extends AntdFormItemComponent<bool, AntdSwitchStyle, AntdSwitch> {
  ///选中时的内容
  final Widget? content;

  ///未选中时的内容
  final Widget? activeContent;

  ///动画周期
  final Duration duration;

  ///开启反馈
  final AntdHapticFeedback? hapticFeedback;

  const AntdSwitch(
      {super.key,
      super.style,
      super.styleBuilder,
      super.disabled,
      super.readOnly,
      super.value,
      super.autoCollect,
      super.onChange,
      this.content,
      this.activeContent,
      this.duration = const Duration(milliseconds: 200),
      this.hapticFeedback = AntdHapticFeedback.light});

  @override
  AntdSwitchStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var trackStyle = AntdBoxStyle(
        border: token.border.all,
        color: token.colorBgContainer,
        radius: 28.radius.all,
        padding: 4.all);
    var thumbStyle = AntdBoxStyle(
        color: token.colorBgContainer,
        size: 24,
        border: token.border.all,
        radius: 24.radius.all);

    var style = AntdSwitchStyle(
      bodyStyle: const AntdBoxStyle(
          minWidth: 56,
          width: 70,
          options: AntdTapOptions(accepter: AntdTapAccepter.listener)),
      trackStyle: trackStyle,
      activeTrackStyle: trackStyle.copyWith(color: token.colorPrimary),
      thumbStyle: thumbStyle,
      activeThumbStyle: thumbStyle,
      contentStyle: AntdBoxStyle(
        textStyle: token.font.md.copyWith(color: token.colorText.tertiary),
      ),
      activeContentStyle: AntdBoxStyle(
        textStyle: token.font.md.copyWith(
          color: token.colorWhite,
        ),
      ),
    );
    return style;
  }

  @override
  AntdSwitchStyle margeStyle(
      AntdSwitchStyle defaultStyle, AntdSwitchStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdSwitchStyle, AntdSwitch>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.switchStyle;
  }

  @override
  AntdSwitchStyle getFinalStyle(
      BuildContext context, AntdSwitchStyle style, AntdMapToken token) {
    return margeStyle(
        style,
        AntdSwitchStyle(
            activeContentStyle:
                style.contentStyle.merge(style.activeContentStyle),
            activeTrackStyle: style.trackStyle.merge(style.activeTrackStyle),
            activeThumbStyle: style.thumbStyle.merge(style.activeThumbStyle)));
  }

  @override
  AntdSwitch getWidget(BuildContext context) {
    return this;
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdSwitchState();
  }

  @override
  Widget get child => this;
}

class _AntdSwitchState
    extends AntdFormItemComponentState<bool, AntdSwitchStyle, AntdSwitch>
    with SingleTickerProviderStateMixin {
  double trackWidth = 0;
  double thumbWidth = 0;
  double contentWidth = 0;
  double contentTrackWidth = 0;
  EdgeInsets trackPadding = EdgeInsets.zero;

  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  );
  var tween = Tween<double>(
    begin: 0,
    end: 1,
  );
  late final Animation<double> _animation = tween
      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

  @override
  void updateDependentValues(covariant AntdSwitch? oldWidget) {
    super.updateDependentValues(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimation();
    });
  }

  void _startAnimation() {
    if (value == true) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _handlerAnimation() {
    _controller.reset();
    _startAnimation();
  }

  void _handlerContentTrackWidth() {
    contentTrackWidth = trackWidth - trackPadding.right - contentWidth;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget? buildContent() {
    var activeContent = widget.activeContent ?? style.activeContent;
    var content = widget.content ?? style.content;
    return _get(value == true, activeContent, content);
  }

  T? _get<T>(bool open, T? activeStyle, T? style) {
    if (open) {
      if (_animation.value > 0.5) {
        return activeStyle;
      } else {
        return style;
      }
    }
    if (_animation.value < 0.5) {
      return style;
    } else {
      return activeStyle;
    }
  }

  @override
  Widget render(BuildContext context) {
    var open = value == true;
    var thumb = AntdBox(
      onLayout: (context) {
        if (context.hasSizeChange) {
          thumbWidth = context.size.width;
          _handlerAnimation();
        }
      },
      style: _get(open, style.activeThumbStyle, style.thumbStyle),
    );

    return AntdBox(
      style: style.bodyStyle,
      disabled: widget.disabled,
      onTap: () {
        changeValue(() {
          handleHapticFeedback(widget.hapticFeedback);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _startAnimation();
          });
          return !open;
        });
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final thumbOffset = _animation.value * (trackWidth - thumbWidth) -
              (trackWidth - thumbWidth);

          return AntdBox(
            style: _get(open, style.activeTrackStyle, style.trackStyle),
            onLayout: (context) {
              if (context.hasSizeChange) {
                trackWidth = context.removeInsetsSize.width;
                trackPadding = context.padding;
                _handlerContentTrackWidth();
                _handlerAnimation();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.translate(
                  offset: Offset(
                      max(trackPadding.left,
                          (1 - _animation.value) * contentTrackWidth),
                      0),
                  child: AntdBox(
                    onLayout: (ctx) {
                      if (ctx.hasSizeChange) {
                        contentWidth = ctx.size.width;
                        _handlerContentTrackWidth();
                      }
                    },
                    style: _get(
                        open, style.activeContentStyle, style.contentStyle),
                    child: buildContent(),
                  ),
                ),
                Transform.translate(
                  offset: Offset(thumbOffset, 0),
                  child: thumb,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
