import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

class AntdSwipeItemStyle extends AntdStyle {
  ///样式
  final AntdBoxStyle? style;

  ///样式
  final AntdBoxStyle? confirmStyle;

  const AntdSwipeItemStyle({super.inherit, this.style, this.confirmStyle});

  @override
  AntdSwipeItemStyle copyFrom(covariant AntdSwipeItemStyle? style) {
    return AntdSwipeItemStyle(
      style: this.style.merge(style?.style),
      confirmStyle: confirmStyle.merge(style?.confirmStyle),
    );
  }
}

class AntdSwipeItem extends AntdComponent<AntdSwipeItemStyle, AntdSwipeItem> {
  ///child
  final Widget? content;

  ///二次确认的secondChild
  final Widget? confirmContent;

  ///点击事件
  final Future<bool?> Function()? onTap;

  ///唯一标识
  final bool disable;

  ///在左侧还是右侧
  final bool left;

  final bool confirm;

  const AntdSwipeItem(
      {super.key,
      super.style,
      super.styleBuilder,
      this.content,
      this.confirmContent,
      this.onTap,
      this.disable = false,
      this.left = false,
      this.confirm = false});

  AntdSwipeItem copyFrom(AntdSwipeItem other) {
    return AntdSwipeItem(
      key: other.key ?? key,
      style: other.style ?? style,
      styleBuilder: other.styleBuilder ?? styleBuilder,
      content: other.content ?? content,
      confirmContent: other.confirmContent ?? confirmContent,
      onTap: other.onTap ?? onTap,
      disable: other.disable,
      left: other.left,
      confirm: other.confirm,
    );
  }

  @override
  Widget render(BuildContext context, AntdSwipeItemStyle style) {
    return AntdBox(
      onTap: onTap,
      style: confirm
          ? (style.confirmStyle ?? const AntdBoxStyle()).copyFrom(style.style)
          : style.style,
      child: confirm ? confirmContent : content,
    );
  }

  @override
  AntdSwipeItemStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return const AntdSwipeItemStyle();
  }

  @override
  AntdSwipeItem getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdSwipeItemStyle margeStyle(
      AntdSwipeItemStyle defaultStyle, AntdSwipeItemStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

class AntdSwipeItems extends StatefulWidget {
  const AntdSwipeItems(
      {super.key,
      required this.items,
      this.onTap,
      this.onTotalWidth,
      this.offsetController,
      this.builder,
      required this.applyOffset,
      this.reversed = false,
      this.duration = const Duration(milliseconds: 200)});

  final List<AntdSwipeItem> items;

  final void Function(AntdSwipeItem item, int index)? onTap;

  final void Function(double totalWidth)? onTotalWidth;

  final AnimationController? offsetController;

  final Widget Function(double position, Widget child)? builder;

  final double Function(double offset) applyOffset;

  final bool reversed;

  final Duration duration;

  @override
  State<StatefulWidget> createState() {
    return _AntdSwipeItemsState();
  }
}

class _AntdSwipeItemsState extends State<AntdSwipeItems>
    with SingleTickerProviderStateMixin {
  final List<double> _itemWidths = [];
  double get _totalItemWidth => _itemWidths.reduce((a, b) => a + b);
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: widget.duration);
  late final Animation<double> _animation =
      Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ),
  );
  AntdSwipeItem? _tapItem;

  @override
  void initState() {
    super.initState();
    for (var item in widget.items) {
      _itemWidths.add(0);
    }

    widget.offsetController?.addListener(() {
      if (widget.offsetController?.value == 0 && _tapItem != null) {
        _tapItem = null;
        _controller.reverse();
      }
    });
  }

  void _handleButtonTap(AntdSwipeItem item, int i) async {
    if (_tapItem == null && item.confirmContent != null) {
      _tapItem = item;
      _controller.forward();
    } else {
      var result = await item.onTap?.call();
      if (result == false) {
        return;
      }
      _tapItem = null;
      _controller.reverse();
      widget.onTap?.call(item, i);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double calculateWidthSum(int start, int end) {
      if (start >= end || _itemWidths.isEmpty) return 0.0;

      return _itemWidths
          .sublist(start, end)
          .fold(0.0, (sum, width) => sum + width);
    }

    return Stack(
      children: widget.items.map((item) {
        var index = widget.items.indexOf(item);
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            final isTapItem = _tapItem == item ||
                (item.key != null &&
                    _tapItem?.key != null &&
                    _tapItem?.key == item.key);
            final width = _itemWidths[index];
            final leftWidth = calculateWidthSum(0, index);
            final rightWidth = calculateWidthSum(index + 1, _itemWidths.length);
            final effectiveLeftWidth = widget.reversed ? rightWidth : leftWidth;
            final effectiveRightWidth =
                widget.reversed ? leftWidth : rightWidth;

            var child = AntdBox(
              style: AntdBoxStyle(
                  width: isTapItem
                      ? width +
                          (effectiveLeftWidth + effectiveRightWidth) *
                              _animation.value
                      : null),
              child: AntdBox(
                onLayout: (ctx) {
                  if (_itemWidths[index] != 0) {
                    return;
                  }

                  _itemWidths[index] = ctx.renderBox.size.width;
                  widget.onTotalWidth?.call(_totalItemWidth);
                  if (index == widget.items.length - 1) {
                    setState(() {});
                  }
                },
                child: item.copyFrom(AntdSwipeItem(
                  onTap: () async {
                    _handleButtonTap(item, index);
                    return null;
                  },
                  confirm: isTapItem,
                )),
              ),
            );
            if (widget.offsetController != null) {
              return AnimatedBuilder(
                  animation: widget.offsetController!,
                  builder: (_, child_) {
                    var offsetValue =
                        widget.applyOffset(widget.offsetController!.value);
                    double ratio = offsetValue.abs() > 0
                        ? (offsetValue.abs() / _totalItemWidth)
                        : 0;
                    double position = -_itemWidths[index] +
                        ratio *
                            ((offsetValue < 0
                                    ? effectiveRightWidth
                                    : effectiveLeftWidth) +
                                _itemWidths[index]);

                    if (_tapItem != null) {
                      var index = widget.items.indexOf(item);
                      var tapIndex = widget.items.indexOf(_tapItem!);

                      if (isTapItem) {
                        position = rightWidth * (1 - _animation.value);
                      } else if (index < tapIndex) {
                        position = leftWidth * _animation.value + rightWidth;
                      } else if (index > tapIndex) {
                        position = -(width + rightWidth) * _animation.value +
                            rightWidth;
                      }
                    }

                    if (widget.builder != null) {
                      return widget.builder!.call(position, child);
                    }
                    return child;
                  });
            }
            return child;
          },
        );
      }).toList(),
    );
  }
}
