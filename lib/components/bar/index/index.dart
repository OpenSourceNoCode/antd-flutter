import 'package:antd_flutter_mobile/components/bar/index/float.dart';
import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

/// 样式
/// @l [AntdIndexBar]
class AntdIndexBarStyle extends AntdStyle {
  ///主体的样式
  final AntdBoxStyle? bodyStyle;

  ///浮动头的样式
  final AntdBoxStyle? floatHeaderStyle;

  ///header的样式
  final AntdBoxStyle? headerStyle;

  ///item的样式
  final AntdBoxStyle? itemStyle;

  ///索引的样式
  final AntdBoxStyle? indexStyle;

  ///索引的样式
  final AntdBoxStyle? activeIndexStyle;

  ///索引的样式
  final AntdBoxStyle? indexMask;

  const AntdIndexBarStyle(
      {super.inherit,
      this.bodyStyle,
      this.floatHeaderStyle,
      this.headerStyle,
      this.itemStyle,
      this.indexStyle,
      this.activeIndexStyle,
      this.indexMask});

  @override
  AntdIndexBarStyle copyFrom(covariant AntdIndexBarStyle? style) {
    return AntdIndexBarStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      floatHeaderStyle: floatHeaderStyle.merge(style?.floatHeaderStyle),
      headerStyle: headerStyle.merge(style?.headerStyle),
      itemStyle: itemStyle.merge(style?.itemStyle),
      indexStyle: indexStyle.merge(style?.indexStyle),
      activeIndexStyle: activeIndexStyle.merge(style?.activeIndexStyle),
      indexMask: indexMask.merge(style?.indexMask),
    );
  }
}

/// 分组数据定义
/// @l [AntdIndexBar]
abstract mixin class AntdSectionProvider {
  const AntdSectionProvider();

  String get section;
}

typedef AntdIndexBarIndexBuilder = Widget Function(
    BuildContext context, String group, int index);

typedef AntdIndexBarOnIndexChange = void Function(
    BuildContext context, String group, int index);

///@t 序列
///@g 导航
///@o 95
///@d 根据字母 A ～ Z 排列内容。
///@u 适用于列表的分类显示和快速定位。
class AntdIndexBar<T extends AntdSectionProvider>
    extends AntdScrollPositionedBase<T, AntdIndexBarStyle, AntdIndexBar<T>,
        AntdIndexBarController<T>> {
  const AntdIndexBar(
      {super.key,
      super.style,
      super.styleBuilder,
      super.controller,
      super.headers,
      super.footers,
      super.physics,
      super.virtual = true,
      super.shrinkWrap,
      required super.items,
      required super.itemBuilder,
      super.viewportOffset,
      super.onItemPosition,
      this.headerBuilder,
      this.indexBuilder,
      this.headerFloatBuilder,
      this.onIndexChange})
      : super(fit: AntdScrollItemFit.child);

  ///列表内头部构建
  final AntdIndexBarIndexBuilder? headerBuilder;

  ///索引构建
  final AntdIndexBarIndexBuilder? indexBuilder;

  ///列表内头部构建
  final AntdIndexBarIndexBuilder? headerFloatBuilder;

  ///索引变更事件
  final AntdIndexBarOnIndexChange? onIndexChange;

  AntdBoxStyle getHeaderStyle(AntdMapToken token) {
    var border = token.border.copyWith(width: 0.5);
    return AntdBoxStyle(
        padding: EdgeInsets.symmetric(
            vertical: token.size.xs.roundToDouble(),
            horizontal: token.size.sm.roundToDouble()),
        color: token.colorBgLayout,
        textStyle: token.font.sm.copyWith(color: token.colorText.secondary),
        border: Border(top: border, bottom: border));
  }

  AntdBoxStyle getItemStyle(AntdMapToken token) {
    var border = token.border.copyWith(width: 0.5);
    return AntdBoxStyle(
        margin: EdgeInsets.only(left: token.size.sm.roundToDouble()),
        padding: EdgeInsets.symmetric(vertical: token.size.sm.roundToDouble()),
        color: token.colorBgContainer,
        textStyle: token.font.ms,
        border: Border(bottom: border));
  }

  @override
  AntdIndexBarStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var headerStyle = AntdBoxStyle(
        width: double.infinity,
        padding: token.size.lg.horizontal.marge(token.size.seed.vertical),
        color: token.colorBgLayout,
        textStyle: token.font.sm.copyWith(color: token.colorText.tertiary),
        border: token.border.vertical);
    var indexStyle = AntdBoxStyle(
      size: token.size.xl.roundToDouble(),
      radius: BorderRadius.circular(token.size.xl.roundToDouble()),
      margin: token.size.lg.horizontal,
      textStyle: token.font.xs.copyWith(color: token.colorText.tertiary),
      alignment: Alignment.center,
    );
    return AntdIndexBarStyle(
        bodyStyle: const AntdBoxStyle(),
        floatHeaderStyle: headerStyle,
        headerStyle: headerStyle,
        itemStyle: AntdBoxStyle(
            color: token.colorBgContainer,
            width: double.infinity,
            border: token.border.bottom,
            textStyle: token.font.xl,
            padding: token.size.lg.right.marge(token.size.lg.vertical)),
        indexStyle: indexStyle,
        activeIndexStyle: indexStyle.copyWith(
            textStyle: token.font.xs.copyWith(color: token.colorWhite),
            color: token.colorPrimary));
  }

  @override
  AntdIndexBarStyle getFinalStyle(
      BuildContext context, AntdIndexBarStyle style, AntdMapToken token) {
    return margeStyle(
        style,
        AntdIndexBarStyle(
            floatHeaderStyle: style.headerStyle.merge(style.floatHeaderStyle),
            activeIndexStyle: style.indexStyle.merge(style.activeIndexStyle)));
  }

  @override
  State<StatefulWidget> createState() {
    return AntdIndexBarState<T>();
  }

  @override
  AntdIndexBarStyle margeStyle(
      AntdIndexBarStyle defaultStyle, AntdIndexBarStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdIndexBarStyle, AntdIndexBar<T>>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.indexBarStyle;
  }

  @override
  AntdIndexBar<T> getWidget(BuildContext context) {
    return this;
  }
}

class AntdIndexBarState<T extends AntdSectionProvider>
    extends AntdScrollPositionedBaseState<T, AntdIndexBarStyle,
        AntdIndexBarController<T>, AntdIndexBar<T>> {
  @override
  void initState() {
    super.initState();

    refreshData();

    scrollController.addMetricsListener((metrics) {
      if (metrics.offset <= scrollController.position.minScrollExtent &&
          scrollController.activeSectionIndex.value != -1) {
        scrollController.activeSectionIndex.value = -1;
        scrollController.activeIndexBarIndex.value = -1;
        setState(() {});
      }
    });

    scrollController.addPositionListener((context) {
      if (context.isFirstAppear) {
        var index = scrollController.sectionPositions[context.data.section];
        if (index != null &&
            scrollController.activeSectionIndex.value != index) {
          var offsetTop =
              scrollController.getItemTopOffset(index, AntdEdge.start);
          if (offsetTop != null &&
              context.scrollOffset + scrollController.viewportOffset <
                  offsetTop) {
            return;
          }
          var beforeIndex = scrollController.activeSectionIndex.value;
          scrollController.activeSectionIndex.value = index;
          scrollController.activeIndexBarIndex.value = index;
          widget.onIndexChange?.call(
            this.context,
            context.data.section,
            index,
          );
          if (beforeIndex == -1) {
            setState(() {});
          }
        }
      }
    });
  }

  void refreshData() {
    scrollController.init(widget.items);
  }

  @override
  void didUpdateWidget(covariant AntdIndexBar<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    refreshData();
  }

  @override
  Widget? buildItemBuilder(
      AntdScrollItemContext<T, AntdIndexBarController<T>> ctx) {
    var child = AntdBox(
      style: style.itemStyle,
      child: super.buildItemBuilder(ctx),
    );
    var sectionItem = ctx.controller.getSectionItem(ctx.index);
    if (sectionItem.isSectionHeader && widget.headerBuilder != null) {
      var header =
          widget.headerBuilder!(context, sectionItem.section, ctx.index);

      return AntdColumn(children: [
        AntdBox(
          style: style.headerStyle,
          child: header,
        ),
        child
      ]);
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    var scrollable = super.build(context);

    return AntdBox(
      style: style.bodyStyle,
      child: Stack(
        children: [
          scrollable,
          if (widget.headerFloatBuilder != null || widget.headerBuilder != null)
            Positioned(
                top: widget.viewportOffset ?? 0,
                left: 0,
                right: 0,
                child: ValueListenableBuilder(
                    valueListenable: scrollController.activeSectionIndex,
                    builder: (context, value, _) {
                      Widget data = const AntdBox();
                      if (value >= 0 &&
                          scrollController.activeSection != null) {
                        var floatChild =
                            (widget.headerFloatBuilder ?? widget.headerBuilder)
                                ?.call(context, scrollController.activeSection!,
                                    scrollController.activeIndex);
                        if (floatChild != null) {
                          return AntdBox(
                            style: style.floatHeaderStyle,
                            child: floatChild,
                          );
                        }
                      }
                      return data;
                    })),
          if (widget.indexBuilder != null)
            Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: AntdIndexBarFloatBar<T>(
                    onIndexChange: widget.onIndexChange,
                    controller: scrollController,
                    indexBuilder: widget.indexBuilder,
                    style: style))
        ],
      ),
    );
  }

  @override
  AntdIndexBarController<T> createController() {
    return AntdIndexBarController<T>();
  }
}
