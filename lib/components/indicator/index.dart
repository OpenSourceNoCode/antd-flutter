import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

/// 分页符样式
/// @l [AntdPageIndicator]
class AntdPageIndicatorStyle extends AntdStyle {
  ///默认的分页符样式
  final AntdBoxStyle? bodyStyle;

  ///被激活的样式
  final AntdBoxStyle? activeStyle;

  const AntdPageIndicatorStyle(
      {super.inherit, this.bodyStyle, this.activeStyle});

  @override
  AntdPageIndicatorStyle copyFrom(covariant AntdPageIndicatorStyle? style) {
    return AntdPageIndicatorStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      activeStyle: activeStyle.merge(style?.activeStyle),
    );
  }
}

///@t 分页符
///@g 信息展示
///@o 80
///@d 指示当前显示的是多页面视图的哪一页。
///@u 适用于表示当前内容区块可以横向滚动翻页。
class AntdPageIndicator
    extends AntdComponent<AntdPageIndicatorStyle, AntdPageIndicator> {
  const AntdPageIndicator({
    super.key,
    super.style,
    super.styleBuilder,
    this.color = AntdColor.primary,
    this.total = 0,
    this.current = 0,
    this.vertical = false,
  });

  ///	颜色
  final AntdColor color;

  ///总页数
  final int total;

  ///	当前页（从 0 开始计数）
  final int current;

  ///	方向，默认是水平方向
  final bool vertical;

  @override
  Widget render(BuildContext context, AntdPageIndicatorStyle style) {
    var childList = <Widget>[];

    for (int i = 0; i < total; i++) {
      if (current == i) {
        childList.add(AntdBox(
          style: style.activeStyle,
        ));
      } else {
        childList.add(AntdBox(
          style: style.bodyStyle,
        ));
      }
    }
    return !vertical
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: childList,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: childList,
          );
  }

  @override
  AntdPageIndicatorStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var activeSize = vertical ? const Size(3, 13) : const Size(13, 3);
    var margin = vertical ? token.size.xxs.bottom : token.size.xxs.left;
    return AntdPageIndicatorStyle(
        bodyStyle: AntdBoxStyle(
            height: 3, width: 3, margin: margin, color: token.colorFillContent),
        activeStyle: AntdBoxStyle(
            height: activeSize.height,
            width: activeSize.width,
            margin: margin,
            color: color.getColor(token)));
  }

  @override
  AntdPageIndicatorStyle margeStyle(
      AntdPageIndicatorStyle defaultStyle, AntdPageIndicatorStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdPageIndicatorStyle, AntdPageIndicator>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.pageIndicatorStyle;
  }

  @override
  AntdPageIndicator getWidget(BuildContext context) {
    return this;
  }
}
