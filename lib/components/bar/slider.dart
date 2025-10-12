import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// 滑动选择器(SliderBar)的样式配置
/// @l [AntdSliderBar]
class AntdSliderBarStyle extends AntdStyle {
  /// 滑动条整体容器样式
  final AntdBoxStyle? bodyStyle;

  /// 未选中状态的标题样式
  final AntdBoxStyle? contentStyle;

  /// 未选中状态的标题样式
  final AntdBoxStyle? titleStyle;

  /// 选中状态的标题样式
  final AntdBoxStyle? activeTitleStyle;

  /// 未选中状态的指示器样式
  final AntdBoxStyle? indicatorStyle;

  /// 选中状态的指示器样式
  final AntdBoxStyle? activeIndicatorStyle;

  /// 选中项的圆角半径（单位：像素）
  final Radius? activeCornerRadius;

  const AntdSliderBarStyle({
    super.inherit,
    this.bodyStyle,
    this.contentStyle,
    this.titleStyle,
    this.activeTitleStyle,
    this.indicatorStyle,
    this.activeIndicatorStyle,
    this.activeCornerRadius,
  });

  @override
  AntdSliderBarStyle copyFrom(covariant AntdSliderBarStyle? style) {
    return AntdSliderBarStyle(
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        contentStyle: contentStyle.merge(style?.contentStyle),
        titleStyle: titleStyle.merge(style?.titleStyle),
        activeTitleStyle: activeTitleStyle.mergeActive(
            titleStyle, style?.titleStyle, style?.activeTitleStyle),
        indicatorStyle: indicatorStyle.merge(style?.indicatorStyle),
        activeIndicatorStyle: activeIndicatorStyle.mergeActive(
            indicatorStyle, style?.indicatorStyle, style?.activeIndicatorStyle),
        activeCornerRadius: style?.activeCornerRadius ?? activeCornerRadius);
  }
}

/// 滑动选择器(SliderBar)的单个选项定义
/// @l [AntdSliderBar]
class AntdSliderBarItem {
  /// 选项的唯一标识值
  final dynamic value;

  /// 自定义内容组件（优先级高于title）
  final Widget? content;

  /// 默认标题内容（当content为空时使用）
  final Widget? title;

  /// 是否禁用该选项
  final bool disabled;

  ///item被激活后
  final VoidCallback? onActive;

  const AntdSliderBarItem(
      {required this.value,
      this.content,
      this.title,
      this.disabled = false,
      this.onActive});
}

class AntdSliderBarController
    extends AntdScrollPositionController<AntdSliderBarItem> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  int get currentIndex => _currentIndex.value;
  AntdHapticFeedback? _hapticFeedback;

  AntdScrollPositionController<AntdSliderBarItem>? _panelController;

  @override
  Future<void> toIndex(int index,
      {AntdScrollToIndexConfig config =
          const AntdScrollToIndexConfig()}) async {
    if (_currentIndex.value == index) {
      return;
    }
    _currentIndex.value = index;
    handleHapticFeedback(_hapticFeedback);

    if (_panelController != null) {
      _panelController!.toIndex(index,
          config: config.copyWith(
              itemAlign: AntdEdge.start, viewportAlign: AntdEdge.start));
    }
    return super.toIndex(index, config: config);
  }
}

typedef AntdSliderBarOnChange = void Function(
    AntdSliderBarItem item, int index);

///@t 侧边导航
///@g 导航
///@o 92
///@d 垂直展示导航栏。
///@u 需要用户快速导航至某一项内容集合，并可以在多个内容之间来回切换。
class AntdSliderBar extends AntdScrollPositionedBase<AntdSliderBarItem,
    AntdSliderBarStyle, AntdSliderBar, AntdSliderBarController> {
  const AntdSliderBar(
      {super.key,
      super.style,
      super.styleBuilder,
      super.physics = const BouncingScrollPhysics(),
      super.shrinkWrap,
      super.controller,
      super.onItemPosition,
      super.throttle,
      super.edgeThreshold,
      super.onEdgeReached,
      super.virtual = false,
      super.alignment,
      super.fit = AntdScrollItemFit.child,
      super.scrollBehavior,
      super.cacheExtent = 1.5,
      super.cacheExtentStyle = CacheExtentStyle.viewport,
      required super.items,
      this.onChange,
      this.titlePlacement = AntdEdge.center,
      this.hapticFeedback = AntdHapticFeedback.light,
      this.contentFit})
      : super(vertical: true);

  ///内容如何填充
  final AntdScrollItemFit? contentFit;

  ///变更事件
  final AntdSliderBarOnChange? onChange;

  ///标题和视图的对齐方式
  final AntdEdge titlePlacement;

  ///开启反馈
  final AntdHapticFeedback? hapticFeedback;

  @override
  AntdSliderBarStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var titleStyle = AntdBoxStyle(
        padding: token.size.xl.vertical.marge(token.size.lg.right),
        color: token.colorFill.tertiary,
        textStyle: token.font.sm);
    var indicatorStyle = AntdBoxStyle(
        margin: token.size.lg.right,
        width: token.size.xxs.roundToDouble(),
        height: token.size.lg.roundToDouble(),
        color: token.colorTransparent);
    return AntdSliderBarStyle(
        activeCornerRadius: token.radius.lg,
        bodyStyle: AntdBoxStyle(color: token.colorFill.tertiary, width: 100),
        indicatorStyle: indicatorStyle,
        activeIndicatorStyle: AntdBoxStyle(color: token.colorPrimary),
        titleStyle: titleStyle,
        activeTitleStyle: AntdBoxStyle(
            radius: BorderRadius.circular(0),
            color: token.colorWhite,
            textStyle: token.font.sm.copyWith(color: token.colorPrimary)));
  }

  @override
  AntdSliderBarStyle margeStyle(
      AntdSliderBarStyle defaultStyle, AntdSliderBarStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdSliderBarStyle, AntdSliderBar>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.sliderBarStyle;
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdSliderBarState();
  }

  @override
  AntdSliderBar getWidget(BuildContext context) {
    return this;
  }
}

class _AntdSliderBarState extends AntdScrollPositionedBaseState<
    AntdSliderBarItem,
    AntdSliderBarStyle,
    AntdSliderBarController,
    AntdSliderBar> {
  AntdScrollPositionController<AntdSliderBarItem> panelController =
      AntdScrollPositionController();
  late AntdScrollToIndexConfig _config;

  handlerOnChange(AntdSliderBarItem? item) {
    if (item == null) {
      return;
    }
    widget.onChange?.call(item, widget.items.indexOf(item));
    item.onActive?.call();
  }

  @override
  void updateDependentValues(covariant AntdSliderBar? oldWidget) {
    super.updateDependentValues(oldWidget);
    scrollController._panelController = panelController;
    scrollController._hapticFeedback = widget.hapticFeedback;
    _config = AntdScrollToIndexConfig(
        jump: true,
        viewportAlign: widget.titlePlacement,
        itemAlign: widget.titlePlacement);
  }

  @override
  void dispose() {
    panelController.dispose();
    super.dispose();
  }

  @override
  Widget? buildItemBuilder(
      AntdScrollItemContext<AntdSliderBarItem, AntdSliderBarController>
          entity) {
    var index = entity.index;
    var item = entity.data;
    late Radius radius = style.activeCornerRadius ?? const Radius.circular(0);
    return ValueListenableBuilder(
        valueListenable: scrollController._currentIndex,
        builder: (context, value, _) {
          var before = value - 1 == index;
          var active = value == index;
          var after = value + 1 == index;

          var child = AntdBox(
            style: (active ? style.activeTitleStyle : style.titleStyle)
                ?.copyWith(
                    radius: BorderRadius.only(
                        bottomRight: before ? radius : Radius.zero,
                        topRight: after ? radius : Radius.zero)),
            disabled: item.disabled,
            onTap: () {
              handlerOnChange(entity.data);
              scrollController.toIndex(entity.index, config: _config);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AntdBox(
                  style: active
                      ? style.activeIndicatorStyle
                      : style.indicatorStyle,
                ),
                Expanded(
                    child: AntdBox(
                  child: item.title,
                ))
              ],
            ),
          );
          if (before || after) {
            return AntdBox(
              style: AntdBoxStyle(color: style.activeTitleStyle?.color),
              child: child,
            );
          }
          return child;
        });
  }

  @override
  Widget build(BuildContext context) {
    var left = super.build(context);

    return Row(
      children: [
        AntdBox(
          style: style.bodyStyle,
          child: left,
        ),
        Expanded(
            child: AntdPositionList<AntdSliderBarItem>(
          fit: widget.contentFit ?? AntdScrollItemFit.child,
          vertical: true,
          physics: widget.physics,
          controller: panelController,
          items: widget.items,
          onItemPosition: (context) {
            if (context.isFirstAppear) {
              handlerOnChange(context.data);
              scrollController.toIndex(context.index, config: _config);
            }
          },
          itemBuilder: (ctx) {
            return AntdBox(
              style: style.contentStyle,
              child: ctx.data.content,
            );
          },
        ))
      ],
    );
  }

  @override
  AntdSliderBarController createController() {
    return AntdSliderBarController();
  }
}
