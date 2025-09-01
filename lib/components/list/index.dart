import 'package:antd_flutter/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

/// 列表组件样式配置
/// @l [AntdList]
class AntdListStyle extends AntdStyle {
  /// 列表容器样式（背景色/边框/圆角等）
  final AntdBoxStyle? bodyStyle;

  /// 列表头部样式（文本/对齐/间距等）
  final AntdBoxStyle? headerStyle;

  /// 列表底部样式（文本/对齐/间距等）
  final AntdBoxStyle? footerStyle;

  /// 列表项样式（背景/边框/点击效果等）
  final AntdBoxStyle? itemStyle;

  ///子类的样式,当没有使用itemBuilder的默认样式
  final AntdBoxStyle? childStyle;

  const AntdListStyle(
      {super.inherit,
      this.bodyStyle,
      this.headerStyle,
      this.footerStyle,
      this.itemStyle,
      this.childStyle});

  /// 获取默认列表样式 [token]设计令牌 [card]是否卡片模式
  factory AntdListStyle.defaultStyle(AntdAliasToken token, bool card) {
    var headerStyle = AntdBoxStyle(
        alignment: Alignment.centerLeft,
        padding: token.size.default_.vertical.marge(token.size.lg.horizontal));
    return AntdListStyle(
        bodyStyle: AntdBoxStyle(
            color: token.colorWhite,
            border: card ? null : token.borderSide.vertical,
            textStyle: token.font.md.copyWith(color: token.colorTextTertiary),
            radius: card ? token.radius.default_.radius.all : null),
        headerStyle: headerStyle,
        footerStyle: headerStyle,
        itemStyle: AntdBoxStyle(
          feedbackStyle: AntdBoxStyle(color: token.colorFillContent),
        ),
        childStyle: AntdBoxStyle(
          padding: 12.vertical.marge(12.right),
          margin: 12.left,
          border: token.borderSide.bottom,
        ));
  }

  @override
  AntdListStyle copyFrom(covariant AntdListStyle? style) {
    return AntdListStyle(
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        headerStyle: headerStyle.merge(style?.headerStyle),
        itemStyle: itemStyle.merge(style?.itemStyle),
        footerStyle: footerStyle.merge(style?.footerStyle),
        childStyle: childStyle.merge(style?.childStyle));
  }
}

class AntdListController<T> extends AntdScrollPositionController<T> {}

const listItemStyle = AntdBoxStyle();

///@t 列表
///@g 信息展示
///@o 80
/// @d 高性能通用列表解决方案，支持以下特性：
///     1. 精确索引跳转 - 支持根据索引值快速定位到指定位置
///     2. 虚拟滚动技术 - 优化大数据集性能，实现流畅滚动体验
///     3. 智能位置监听 - 实时监控列表项位置变化
///     4. 索引变更回调 - 提供索引变化事件监听机制
///@u 以列表的形式干净高效的承载文字、列表、图片、段落等。
class AntdList<T> extends AntdScrollPositionedBase<T, AntdListStyle,
    AntdList<T>, AntdListController<T>> {
  const AntdList({
    super.key,
    super.style,
    super.styleBuilder,
    super.edgeThreshold,
    super.onEdgeReached,
    super.controller,
    super.cacheExtent = 1.5,
    super.cacheExtentStyle = CacheExtentStyle.viewport,
    super.physics = const BouncingScrollPhysics(),
    super.dragStartBehavior = DragStartBehavior.start,
    super.scrollBehavior = const CupertinoScrollBehavior(),
    super.vertical = true,
    super.reversed = false,
    super.shrinkWrap = false,
    super.virtual = false,
    super.fit = AntdScrollItemFit.child,
    required super.items,
    super.itemBuilder,
    super.alignment,
    super.onItemPosition,
    super.throttle,
    this.header,
    this.footer,
    this.card,
  });

  ///标题内容
  final Widget? header;

  ///标题内容
  final Widget? footer;

  ///卡片式列表
  final bool? card;

  @override
  State<StatefulWidget> createState() {
    return _AntdListState<T>();
  }

  @override
  AntdListStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    if (!vertical) {
      return const AntdListStyle(
        bodyStyle: AntdBoxStyle(),
        headerStyle: AntdBoxStyle(),
        footerStyle: AntdBoxStyle(),
        itemStyle: AntdBoxStyle(),
        childStyle: AntdBoxStyle(),
      );
    }
    return AntdListStyle.defaultStyle(token, card == true);
  }

  @override
  AntdListStyle margeStyle(AntdListStyle defaultStyle, AntdListStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdListStyle, AntdList<T>>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.listStyle;
  }

  @override
  AntdList<T> getWidget(BuildContext context) {
    return this;
  }
}

class _AntdListState<T> extends AntdScrollPositionedBaseState<T, AntdListStyle,
    AntdListController<T>, AntdList<T>> {
  @override
  Widget build(BuildContext context) {
    var child = super.build(context);
    var bodyChild = AntdBox(
      style: style.bodyStyle,
      child: child,
    );
    return LayoutBuilder(builder: (context, cons) {
      var expanded =
          cons.hasBoundedHeight ? Expanded(child: bodyChild) : bodyChild;
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.header != null)
            AntdBox(
              style: style.headerStyle,
              child: widget.header,
            ),
          expanded,
          if (widget.footer != null)
            AntdBox(
              style: style.footerStyle,
              child: widget.footer,
            ),
        ],
      );
    });
  }

  @override
  Widget? buildItemBuilder(
      AntdScrollItemContext<T, AntdListController<T>> entity) {
    Widget? child = widget.itemBuilder?.call(entity);
    if (child == null) {
      if (entity.data is Widget) {
        child = AntdBox(
          style: style.childStyle,
          child: entity.data as Widget,
        );
      }
    }

    return AntdBox(
      style: style.itemStyle,
      child: child,
    );
  }

  @override
  AntdListController<T> createController() {
    return AntdListController<T>();
  }
}
