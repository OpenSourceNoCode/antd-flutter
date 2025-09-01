import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

///骨架屏样式
///@l [AntdSkeleton]
class AntdSkeletonStyle extends AntdStyle {
  ///主体样式
  final AntdBoxStyle? bodyStyle;

  ///内容样式
  final AntdBoxStyle? titleStyle;

  ///内容样式
  final AntdBoxStyle? rowStyle;

  ///内容样式
  final AntdBoxStyle? lastRowStyle;

  ///动画的颜色
  final Color color;

  const AntdSkeletonStyle(
      {super.inherit,
      this.bodyStyle,
      this.titleStyle,
      this.rowStyle,
      this.lastRowStyle,
      this.color = const Color(0xffe1e1e1)});

  @override
  AntdSkeletonStyle copyFrom(covariant AntdSkeletonStyle? style) {
    return AntdSkeletonStyle(
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        titleStyle: titleStyle.merge(style?.titleStyle),
        rowStyle: rowStyle.merge(style?.rowStyle),
        lastRowStyle: lastRowStyle.merge(style?.lastRowStyle),
        color: style?.color ?? color);
  }
}

///@t 骨架屏
///@g 反馈
///@o 69
///@d 用图形表示内容占位。
///@u 在需要等待加载内容的位置提供一个占位图形组合。
class AntdSkeleton extends AntdStateComponent<AntdSkeletonStyle, AntdSkeleton> {
  ///是否开启动画
  final bool animated;

  ///展示标题
  final bool title;

  ///行数
  final int rows;

  ///动画周期
  final Duration duration;

  const AntdSkeleton({
    super.key,
    super.style,
    super.styleBuilder,
    this.animated = true,
    this.title = true,
    this.rows = 3,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  AntdSkeletonStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var rowStyle = AntdBoxStyle(
        radius: token.radius.ms.radius.all,
        color: token.colorFillSecondary,
        margin: token.size.md.top,
        padding: token.size.default_.vertical,
        width: 1,
        layoutModes: [AntdBoxLayoutMode.factorWidth]);
    return AntdSkeletonStyle(
        bodyStyle: AntdBoxStyle(
            padding: token.size.xl.top.marge(token.size.md.bottom)),
        titleStyle: rowStyle.copyFrom(
            AntdBoxStyle(padding: token.size.xl.vertical, width: 0.7)),
        rowStyle: rowStyle,
        lastRowStyle: rowStyle.copyWith(width: 0.6));
  }

  @override
  AntdSkeletonStyle margeStyle(
      AntdSkeletonStyle defaultStyle, AntdSkeletonStyle? style) {
    return AntdSkeletonStyle(
        bodyStyle: defaultStyle.bodyStyle?.copyFrom(style?.bodyStyle),
        rowStyle: defaultStyle.rowStyle?.copyFrom(style?.rowStyle),
        titleStyle: defaultStyle.titleStyle?.copyFrom(style?.titleStyle),
        lastRowStyle: defaultStyle.lastRowStyle?.copyFrom(style?.lastRowStyle),
        color: style?.color ?? defaultStyle.color);
  }

  @override
  AntdStyleBuilder<AntdSkeletonStyle, AntdSkeleton>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.skeletonStyle;
  }

  @override
  AntdSkeleton getWidget(BuildContext context) {
    return this;
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdSkeletonState();
  }
}

class _AntdSkeletonState extends AntdState<AntdSkeletonStyle, AntdSkeleton>
    with SingleTickerProviderStateMixin {
  final Map<String, double> _width = {};

  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: widget.duration);
  late final Animation<double> _animation =
      Tween<double>(begin: -1.5, end: 1.5).animate(_animationController);

  @override
  void updateDependentValues(covariant AntdSkeleton? oldWidget) {
    super.updateDependentValues(oldWidget);
    if (widget.animated) {
      _animationController.reset();
      _animationController.repeat();
    }
  }

  @override
  void dispose() {
    _width.clear();
    _animationController.dispose();
    super.dispose();
  }

  Widget wrapAnimated(String id, AntdBoxStyle? style) {
    var wrapChild = AntdBox(
      style: AntdBoxStyle(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.1, 0.5, 0.9],
          colors: [
            style?.color ?? token.colorFillQuaternary,
            this.style.color,
            style?.color ?? token.colorFillQuaternary,
          ],
        ),
      ).copyFrom(style),
    );
    return ClipRRect(
      child: Stack(
        children: [
          AntdBox(
            style: style,
            onLayout: (layContext) {
              _width[id] = layContext.renderBox.size.width;
            },
          ),
          if (widget.animated)
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, _) {
                  return Transform.translate(
                    offset: Offset(
                      _animation.value * (_width[id] ?? 0),
                      0,
                    ),
                    child: Center(
                      child: wrapChild,
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget render(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title) wrapAnimated("title", style.titleStyle),
        if (widget.rows > 0)
          ...List.generate(widget.rows, (i) {
            return wrapAnimated("row$i",
                (i == widget.rows - 1) ? style.lastRowStyle : style.rowStyle);
          })
      ],
    );
  }
}
