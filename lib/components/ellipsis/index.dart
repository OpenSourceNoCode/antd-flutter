import 'dart:math' as math;

import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 文本省略（Ellipsis）组件的样式配置
/// @l [AntdEllipsis]
class AntdEllipsisStyle extends AntdStyle {
  /// 主文本的样式配置（字体、颜色等）
  final TextStyle? textStyle;

  /// 展开的文本样式
  final TextStyle? expandStyle;

  /// 收起的文本样式
  final TextStyle? collapseStyle;

  const AntdEllipsisStyle({
    this.textStyle,
    this.expandStyle,
    this.collapseStyle,
  });

  @override
  AntdEllipsisStyle copyFrom(covariant AntdEllipsisStyle? style) {
    return AntdEllipsisStyle(
        textStyle:
            textStyle == null ? textStyle : textStyle?.merge(style?.textStyle),
        expandStyle: expandStyle == null
            ? expandStyle
            : expandStyle?.merge(style?.expandStyle),
        collapseStyle: collapseStyle == null
            ? collapseStyle
            : collapseStyle?.merge(style?.collapseStyle));
  }
}

///@t 文本省略
///@g 信息展示
///@o 89
///@d 展示空间不足时，隐去部分内容并用“...”替代。
///@u 文本内容长度或高度超过列宽或行高。图表中空间有限，文本内容无法完全显示。
class AntdEllipsis extends AntdStateComponent<AntdEllipsisStyle, AntdEllipsis> {
  const AntdEllipsis({
    super.key,
    super.style,
    super.styleBuilder,
    required this.content,
    this.collapseText = "收起",
    this.expandText = "展开",
    this.onTextTap,
    this.onExpandTap,
    this.onCollapseTap,
    this.defaultExpanded = false,
    this.rows = 1,
  });

  ///	文本内容
  final String content;

  ///收起操作的文案
  final String collapseText;

  ///展开操作的文案
  final String expandText;

  ///	点击文本内容时触发
  final VoidCallback? onTextTap;

  ///	点击展开文本内容时触发
  final VoidCallback? onExpandTap;

  ///	点击收起文本内容时触发
  final VoidCallback? onCollapseTap;

  ///是否默认展开
  final bool defaultExpanded;

  ///展示几行
  final int rows;

  @override
  State<StatefulWidget> createState() => _AntdEllipsisState();

  @override
  AntdEllipsisStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var textStyle = token.font.ms;
    return AntdEllipsisStyle(
        textStyle: textStyle,
        expandStyle: textStyle.copyWith(color: token.colorPrimary),
        collapseStyle: textStyle.copyWith(color: token.colorPrimary));
  }

  @override
  AntdEllipsisStyle margeStyle(
    AntdEllipsisStyle defaultStyle,
    AntdEllipsisStyle? style,
  ) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdEllipsisStyle getFinalStyle(
      BuildContext context, AntdEllipsisStyle style, AntdMapToken token) {
    return AntdEllipsisStyle(
        textStyle: style.textStyle,
        expandStyle: style.expandStyle != null && style.textStyle != null
            ? style.textStyle?.merge(style.expandStyle)
            : style.expandStyle,
        collapseStyle: style.collapseStyle != null && style.textStyle != null
            ? style.textStyle?.merge(style.collapseStyle)
            : style.collapseStyle);
  }

  @override
  AntdStyleBuilder<AntdEllipsisStyle, AntdEllipsis>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.ellipsisStyle;
  }

  @override
  AntdEllipsis getWidget(BuildContext context) {
    return this;
  }
}

class _AntdEllipsisState extends AntdState<AntdEllipsisStyle, AntdEllipsis> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);
  double? _buttonWidth;
  TextPainter? _cachedTextPainter;
  late TextDirection _textDirection;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateButtonWidth();
    });
  }

  @override
  void updateDependentValues(covariant AntdEllipsis? oldWidget) {
    super.updateDependentValues(oldWidget);
    _isExpanded.value = widget.defaultExpanded;
    _textDirection = Directionality.of(context);
    if (oldWidget?.expandText != widget.expandText ||
        oldWidget?.collapseText != widget.collapseText) {
      _calculateButtonWidth();
    }
  }

  void _calculateButtonWidth() {
    final style = widget.getStyle(context);
    final expandButton = TextPainter(
      text: TextSpan(text: widget.expandText, style: style.expandStyle),
      textDirection: _textDirection,
      maxLines: 1,
    )..layout();

    final collapseButton = TextPainter(
      text:
          TextSpan(text: "...${widget.collapseText}", style: style.expandStyle),
      textDirection: _textDirection,
      maxLines: 1,
    )..layout();

    if (mounted) {
      setState(() {
        _buttonWidth = math.max(expandButton.width, collapseButton.width);
      });
    }
  }

  String _getTruncatedText(TextSpan span, double maxWidth) {
    if (_buttonWidth == null) return widget.content;

    final painter = TextPainter(
      text: span,
      maxLines: widget.rows,
      textDirection: _textDirection,
    )..layout(maxWidth: maxWidth);

    if (!painter.didExceedMaxLines) {
      return widget.content;
    }

    final lineMetrics = painter.computeLineMetrics();
    if (lineMetrics.isEmpty) return widget.content;

    final lastLine = lineMetrics[widget.rows - 1];

    final availableWidth = maxWidth - _buttonWidth!;
    if (availableWidth <= 0) return '';

    final offset = painter
        .getPositionForOffset(Offset(
          availableWidth,
          lastLine.baseline,
        ))
        .offset;

    final truncatedLength = _findTruncatePosition(widget.content, offset);
    return '${widget.content.substring(0, truncatedLength)}...';
  }

  int _findTruncatePosition(String text, int start) {
    for (int i = start; i > 0; i--) {
      if (text[i].trim().isEmpty || _isPunctuation(text[i])) {
        return i;
      }
    }
    return start;
  }

  bool _isPunctuation(String char) {
    return ['.', ',', ';', '!', '?'].contains(char);
  }

  @override
  Widget render(BuildContext context) {
    final style = widget.getStyle(context);
    if (_buttonWidth == null) {
      return const AntdBox();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        _cachedTextPainter ??= TextPainter(
          text: TextSpan(text: widget.content, style: style.textStyle),
          maxLines: widget.rows,
          textDirection: _textDirection,
        )..layout(maxWidth: constraints.maxWidth);

        final canExpand = _cachedTextPainter!.didExceedMaxLines;

        return ValueListenableBuilder(
          valueListenable: _isExpanded,
          builder: (context, value, _) {
            return RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = widget.onTextTap,
                children: [
                  TextSpan(
                    style: style.textStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        widget.onTextTap?.call();
                      },
                    text: value
                        ? widget.content
                        : _getTruncatedText(
                            TextSpan(
                                text: widget.content, style: style.textStyle),
                            constraints.maxWidth,
                          ),
                  ),
                  if (canExpand)
                    TextSpan(
                      style: value ? style.collapseStyle : style.expandStyle,
                      text: value ? widget.collapseText : widget.expandText,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          if (!_isExpanded.value) {
                            widget.onExpandTap?.call();
                          } else {
                            widget.onCollapseTap?.call();
                          }
                          _isExpanded.value = !_isExpanded.value;
                        },
                    ),
                ],
              ),
              maxLines: value ? null : widget.rows,
              overflow: TextOverflow.clip,
              textDirection: _textDirection,
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _isExpanded.dispose();
    _cachedTextPainter?.dispose();
    super.dispose();
  }
}
