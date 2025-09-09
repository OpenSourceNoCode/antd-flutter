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
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var trackStyle = AntdBoxStyle(
        border: token.borderSide.all,
        color: token.colorWhite,
        radius: 28.radius.all,
        padding: 4.all);
    var thumbStyle = AntdBoxStyle(
        color: token.colorWhite,
        size: 24,
        border: token.borderSide.all,
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
        textStyle: token.font.md.copyWith(color: token.colorBlack),
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
  Size trackPadding = Size.zero;

  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  );
  var tween = Tween<double>(
    begin: 0,
    end: 1,
  );
  late final Animation<double> _animation = tween.animate(_controller);

  @override
  void updateDependentValues(covariant AntdSwitch? oldWidget) {
    super.updateDependentValues(oldWidget);
    _startAnimation();
  }

  void _startAnimation() {
    if (value == true) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget? buildContent() {
    if (value == true) {
      return widget.activeContent ?? style.activeContent;
    }
    return widget.content ?? style.content;
  }

  @override
  Widget render(BuildContext context) {
    var open = value == true;
    var thumb = AntdBox(
      onLayout: (context) {
        if (context.hasSizeChange) {
          thumbWidth = context.size.width;
        }
      },
      style: open ? style.activeThumbStyle : style.thumbStyle,
    );

    var trackStyle = open ? style.activeTrackStyle : style.trackStyle;
    var contentStyle = open ? style.activeContentStyle : style.contentStyle;
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

          var endOffset = trackWidth - contentWidth;
          final contentOffset = endOffset -
              _animation.value * endOffset +
              (open ? trackPadding.width : -trackPadding.height);

          return AntdBox(
            style: trackStyle,
            onLayout: (context) {
              if (context.hasSizeChange) {
                trackWidth = context.removeInsetsSize.width;
                trackPadding =
                    Size(context.padding.left, context.padding.right);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.translate(
                  offset: Offset(contentOffset, 0),
                  child: AntdBox(
                    onLayout: (ctx) {
                      if (ctx.hasSizeChange) {
                        contentWidth = ctx.size.width;
                        _startAnimation();
                      }
                    },
                    style: contentStyle,
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
