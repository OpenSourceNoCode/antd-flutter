import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/cupertino.dart';

///通告栏样式
///@l [AntdNoticeBar]
class AntdNoticeBarStyle extends AntdStyle {
  ///左侧图标大小
  final AntdIconStyle? iconStyle;

  ///关闭图标大小
  final AntdIconStyle? closeIconStyle;

  ///内容的样式
  final AntdBoxStyle? bodyStyle;

  ///扩展区域样式
  final AntdBoxStyle? extraStyle;

  AntdNoticeBarStyle(
      {super.inherit,
      this.iconStyle,
      this.closeIconStyle,
      this.bodyStyle,
      this.extraStyle});

  @override
  AntdNoticeBarStyle copyFrom(covariant AntdNoticeBarStyle? style) {
    return AntdNoticeBarStyle(
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        iconStyle: iconStyle.merge(style?.iconStyle),
        closeIconStyle: closeIconStyle.merge(style?.closeIconStyle),
        extraStyle: extraStyle.merge(style?.extraStyle));
  }
}

///@t 通告栏
///@g 引导提示
///@o 12
///@d 展示一组消息通知。
///@u 适用于当前页面内信息的通知，是一种较醒目的页面内通知方式。
class AntdNoticeBar
    extends AntdStateComponent<AntdNoticeBarStyle, AntdNoticeBar> {
  ///是否可关闭
  final bool? closeable;

  ///自定义关闭按钮图标
  final Widget? closeIcon;

  ///通告栏的类型
  final AntdColor? color;

  ///公告内容
  final String? content;

  ///开始滚动的延迟，单位 ms
  final Duration? delay;

  ///滚动的速度
  final double speed;

  ///额外操作区域，显示在关闭按钮左侧
  final Widget? extra;

  ///额外操作区域，显示在关闭按钮左侧
  final Widget? icon;

  ///	关闭时的回调
  final VoidCallback? onClose;

  ///	点击事件
  final VoidCallback? onClick;

  ///是否多行展示
  final bool? wrap;

  const AntdNoticeBar(
      {super.key,
      super.style,
      super.styleBuilder,
      this.closeable,
      this.closeIcon = const AntdIcon(
        icon: AntdIcons.close,
      ),
      this.color,
      this.content,
      this.delay = const Duration(milliseconds: 1000),
      this.speed = 50.0,
      this.extra,
      this.icon = const AntdIcon(
        icon: AntdIcons.sound,
      ),
      this.onClose,
      this.onClick,
      this.wrap = true});

  @override
  State<StatefulWidget> createState() {
    return _AntdNoticeBarState();
  }

  Color _getColor(AntdAliasToken token) {
    if (color == AntdColor.warning) {
      return token.colorWarning;
    }
    if (color == AntdColor.primary) {
      return token.colorPrimary;
    }
    if (color == AntdColor.info) {
      return token.colorInfo;
    }
    if (color == AntdColor.link) {
      return token.colorLink;
    }
    return token.colorWhite;
  }

  Color _getBgColor(AntdAliasToken token) {
    if (color == AntdColor.danger) {
      return token.colorError;
    }

    return color?.getBgColor(token) ?? const Color(0xff999999);
  }

  @override
  AntdNoticeBarStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var bgColor = _getBgColor(token);
    var border =
        BorderSide(color: color?.getBorderColor(token) ?? token.colorBorder);
    var iconStyle = AntdIconStyle(
        size: token.size.xxl.roundToDouble(),
        color: _getColor(token),
        bodyStyle: AntdBoxStyle(margin: token.size.default_.right));
    return AntdNoticeBarStyle(
        bodyStyle: AntdBoxStyle(
            border: Border(top: border, bottom: border),
            color: bgColor,
            padding:
                token.size.default_.vertical.marge(token.size.lg.horizontal),
            textStyle: token.font.md.copyWith(color: _getColor(token))),
        iconStyle: iconStyle,
        closeIconStyle: iconStyle,
        extraStyle: AntdBoxStyle(margin: token.size.lg.left));
  }

  @override
  AntdNoticeBarStyle margeStyle(
      AntdNoticeBarStyle defaultStyle, AntdNoticeBarStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdNoticeBarStyle, AntdNoticeBar>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.noticeBarStyle;
  }

  @override
  AntdNoticeBar getWidget(BuildContext context) {
    return this;
  }
}

class _AntdNoticeBarState extends State<AntdNoticeBar> {
  @override
  Widget build(BuildContext context) {
    var style = widget.getStyle(context);

    return AntdBox(
      onTap: widget.onClick,
      style: style.bodyStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.icon != null)
            AntdStyleProvider<AntdIconStyle>(
                style: style.iconStyle, child: widget.icon!),
          if (widget.content != null)
            Expanded(
                child: widget.wrap == true
                    ? Text(
                        widget.content!,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      )
                    : _AnimatedText(
                        text: widget.content!,
                        style: style.bodyStyle!.textStyle!,
                        speed: widget.speed,
                        delay: widget.delay,
                      )),
          if (widget.extra != null)
            AntdBox(
              style: style.extraStyle,
              child: widget.extra!,
            ),
          if (widget.closeable == true && widget.closeIcon != null)
            AntdStyleProvider<AntdIconStyle>(
                style: style.closeIconStyle,
                child: AntdBox(
                  onTap: widget.onClose,
                  child: widget.closeIcon!,
                ))
        ],
      ),
    );
  }
}

class _AnimatedText extends StatefulWidget {
  final String text;

  final TextStyle style;

  ///开始滚动的延迟，单位 ms
  final Duration? delay;

  ///滚动的速度
  final double speed;

  const _AnimatedText(
      {required this.text,
      required this.style,
      this.delay,
      required this.speed});

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<_AnimatedText>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  final ScrollController _scrollController = ScrollController();
  bool _isPaused = false;
  bool _wasReversing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.delay,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 0).animate(_controller!);

    WidgetsBinding.instance.addPostFrameCallback((_) => _initAnimation());
  }

  void _initAnimation() {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      textDirection: TextDirection.ltr,
    )..layout();

    final textWidth = textPainter.width;
    final durationSeconds = textWidth / widget.speed;

    _controller!.duration = Duration(seconds: durationSeconds.round());
    _animation = Tween<double>(begin: 0, end: textWidth).animate(_controller!)
      ..addListener(() => _scrollController.jumpTo(_animation!.value))
      ..addStatusListener((status) {
        if (!_isPaused) {
          if (status == AnimationStatus.completed) {
            _controller!.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller!.forward();
          }
        }
      });

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        if (_controller?.isAnimating ?? false) {
          _wasReversing = _controller!.status == AnimationStatus.reverse;
          _controller!.stop();
          _isPaused = true;
        }
      },
      onTapUp: (_) {
        if (_isPaused) {
          _isPaused = false;
          if (_wasReversing) {
            _controller!.reverse();
          } else {
            _controller!.forward();
          }
        }
      },
      onTapCancel: () {
        if (_isPaused) {
          _isPaused = false;
          if (_wasReversing) {
            _controller!.reverse();
          } else {
            _controller!.forward();
          }
        }
      },
      child: SizedBox(
        height: widget.style.fontSize! * (widget.style.height ?? 1.1),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          physics: const NeverScrollableScrollPhysics(),
          child: Text(
            widget.text,
            style: widget.style,
            overflow: TextOverflow.visible,
          ),
        ),
      ),
    );
  }
}
