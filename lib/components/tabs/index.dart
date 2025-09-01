import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

class AntdTabController<T extends AntdTab>
    extends AntdScrollPositionController<T> {
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  final List<AntdScrollPositionController<Widget>> _panelScrollControllers = [];
  final AntdScrollToIndexConfig _scrollConfig = const AntdScrollToIndexConfig(
      viewportAlign: AntdEdge.center,
      itemAlign: AntdEdge.center,
      jump: false,
      set: true);
  AntdIndicatorController? indicatorController;

  set panelScrollController(AntdScrollPositionController<Widget> controller) {
    _panelScrollControllers.add(controller);
    controller.addPositionListener((context) {
      if (context.isFirstAppear && currentIndex.value != context.index) {
        _switchToTab(context.index);
      }
    });
  }

  void _switchToTab(int targetIndex) {
    currentIndex.value = targetIndex;
    indicatorController?.move(targetIndex);
    toIndex(targetIndex, config: _scrollConfig);
  }

  void _initDefaultTab(
      int targetIndex, AntdScrollPositionController controller) {
    if (controller == this) {
      _switchToTab(targetIndex);
      return;
    }

    for (var controller in _panelScrollControllers) {
      controller.toIndex(targetIndex,
          config: _scrollConfig.copyWith(jump: true));
    }
  }

  void switchTo(int targetIndex) {
    currentIndex.value = targetIndex;

    for (var value in _panelScrollControllers) {
      value.toIndex(targetIndex, config: _scrollConfig.copyWith(jump: true));
    }
    _switchToTab(targetIndex);
  }
}

/// @t 标签页样式
/// @l [AntdTabs], [AntdCapsuleTabs]
class AntdTabsStyle extends AntdStyle {
  /// 标签栏容器样式
  final AntdBoxStyle? tabStyle;

  /// 内容面板容器样式
  final AntdBoxStyle? panelStyle;

  /// 标签标题默认样式
  final AntdBoxStyle? titleStyle;

  /// 选中标签标题样式
  final AntdBoxStyle? activeTitleStyle;

  /// 底部指示条样式
  final AntdBoxStyle? indicatorStyle;

  const AntdTabsStyle({
    super.inherit,
    this.tabStyle,
    this.panelStyle,
    this.titleStyle,
    this.activeTitleStyle,
    this.indicatorStyle,
  });

  @override
  AntdTabsStyle copyFrom(covariant AntdTabsStyle? style) {
    return AntdTabsStyle(
        tabStyle: tabStyle.merge(style?.tabStyle),
        panelStyle: panelStyle.merge(style?.panelStyle),
        titleStyle: titleStyle.merge(style?.titleStyle),
        activeTitleStyle: activeTitleStyle.merge(style?.activeTitleStyle),
        indicatorStyle: indicatorStyle.merge(style?.indicatorStyle));
  }
}

/// @t 标签页项定义
/// @l [AntdTabs], [AntdCapsuleTabs]
class AntdTab {
  /// 标签标题内容组件
  final Widget title;

  /// 标签唯一标识（默认使用索引）
  final String value;

  /// 是否禁用当前标签
  final bool? disabled;

  /// 标签页对应的内容组件
  final Widget? child;

  const AntdTab({
    required this.title,
    required this.value,
    this.disabled,
    this.child,
  });
}

typedef AntdTabsOnChange<T extends AntdTab> = void Function(
    String key, int index);

enum AntdTabAlignment { left, center }

abstract class AntdBaseTabs<Style extends AntdTabsStyle, T extends AntdTab,
        WidgetType>
    extends AntdScrollPositionedBase<T, Style, WidgetType,
        AntdTabController<T>> {
  const AntdBaseTabs({
    super.key,
    super.style,
    super.styleBuilder,
    super.virtual = false,
    super.controller,
    this.activeValue,
    this.onChange,
    required this.tabs,
    this.indicatorPosition = AntdIndicatorPosition.bottom,
    this.indicatorMode = AntdIndicatorMode.fixed,
    this.leftExtra,
    this.rightExtra,
    this.tabAlignment = AntdTabAlignment.center,
  }) : super(vertical: false, fit: AntdScrollItemFit.split);

  /// 默认选中的标签key（为空时不激活任何一个）
  final String? activeValue;

  /// 标签切换时的回调（参数为当前选中key）
  final AntdTabsOnChange<T>? onChange;

  /// 标签页配置列表（至少包含一个标签）
  final List<T> tabs;

  /// 指示器位置（顶部/底部）
  final AntdIndicatorPosition indicatorPosition;

  /// 指示器宽度模式（固定/自适应标签宽度）
  final AntdIndicatorMode indicatorMode;

  /// 标签栏左侧扩展内容区域
  final Widget? leftExtra;

  /// 标签栏右侧扩展内容区域
  final Widget? rightExtra;

  /// 标签对齐方式（居中时会自动启用滚动或填充）
  final AntdTabAlignment tabAlignment;
}

abstract class AntdBaseTabsState<Style extends AntdTabsStyle, T extends AntdTab,
        S extends AntdBaseTabs<Style, T, S>>
    extends AntdScrollPositionedBaseState<T, Style, AntdTabController<T>, S> {
  var defaultIndex = 0;
  var initMove = false;

  void _setActiveIndex(String? defaultActiveKey) {
    if (defaultActiveKey == null) {
      defaultIndex = 0;
      return;
    }

    for (int i = 0; i < widget.tabs.length; i++) {
      var tab = widget.tabs[i];
      if (tab.value == widget.activeValue) {
        defaultIndex = i;
        initMove = false;
        break;
      }
    }
  }

  void _innerOnChange() {
    var targetIndex = scrollController.currentIndex.value;
    widget.onChange?.call(widget.tabs[targetIndex].value, targetIndex);
  }

  @override
  void initState() {
    scrollController.itemRegistry.addListener((context) {
      if (context.index == defaultIndex && !initMove) {
        initMove = true;
        scrollController._initDefaultTab(defaultIndex, scrollController);
      }
    });
    super.initState();
  }

  @override
  void updateDependentValues(covariant S? oldWidget) {
    super.updateDependentValues(oldWidget);
    if (oldWidget?.activeValue != widget.activeValue) {
      _setActiveIndex(widget.activeValue);
    }
    if (oldWidget?.onChange != widget.onChange) {
      scrollController.currentIndex.removeListener(_innerOnChange);
      if (widget.onChange != null) {
        scrollController.currentIndex.addListener(_innerOnChange);
      }
    }
  }

  bool isExistsChild() {
    var existsChild = false;
    for (int i = 0; i < widget.tabs.length; i++) {
      var tab = widget.tabs[i];
      if (tab.child != null) {
        existsChild = true;
      }
    }
    return existsChild;
  }

  @override
  AntdScrollItemFit buildFit() {
    return widget.tabAlignment == AntdTabAlignment.center
        ? AntdScrollItemFit.split
        : AntdScrollItemFit.child;
  }

  Widget buildHeader(T tab, int index, bool active) {
    return tab.title;
  }

  Widget buildExtra() {
    return const AntdBox();
  }

  @override
  List<T> buildItems() {
    return widget.tabs;
  }

  @override
  Widget? buildItemBuilder(
      AntdScrollItemContext<T, AntdScrollPositionController<T>> entity) {
    var tab = entity.data;
    var index = entity.index;
    return ValueListenableBuilder(
        valueListenable: scrollController.currentIndex,
        builder: (context, value, _) {
          var active = scrollController.currentIndex.value == index;
          return AntdBox(
            disabled: tab.disabled,
            onTap: () {
              scrollController.switchTo(index);
            },
            style:
                (active ? style.activeTitleStyle : style.titleStyle)?.copyWith(
              alignment: Alignment.center,
            ),
            child: buildHeader(tab, index, active),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var tab = super.build(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AntdBox(
            style: style.tabStyle,
            child: Row(
              children: [
                if (widget.leftExtra != null) widget.leftExtra!,
                Expanded(
                    child: AntdTabShaderMask(
                  child: Stack(
                    children: [tab, buildExtra()],
                  ),
                )),
                if (widget.rightExtra != null) widget.rightExtra!,
              ],
            )),
        if (isExistsChild())
          AntdTabPanel(
              vertical: widget.virtual,
              style: style.panelStyle,
              physics: const NeverScrollableScrollPhysics(),
              tabController: scrollController,
              items: widget.tabs.map((tab) {
                return tab.child ?? const AntdBox();
              }).toList())
      ],
    );
  }

  @override
  AntdTabController<T> createController() {
    return AntdTabController<T>();
  }
}

///@t 标签页
///@g 导航
///@o 90
///@d 内容组之间进行导航切换。
///@u 当前内容需要分成同层级结构的组，进行内容切换展示，常用在表单或者列表的顶部。
class AntdTabs extends AntdBaseTabs<AntdTabsStyle, AntdTab, AntdTabs> {
  const AntdTabs({
    super.key,
    super.style,
    super.styleBuilder,
    super.leftExtra,
    super.rightExtra,
    super.controller,
    super.activeValue,
    super.onChange,
    super.tabAlignment = AntdTabAlignment.center,
    required super.tabs,
    super.indicatorPosition = AntdIndicatorPosition.bottom,
    super.indicatorMode = AntdIndicatorMode.fixed,
  });

  @override
  AntdTabsStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var titleTextStyle = token.font.lg;
    var titleStyle = AntdBoxStyle(
      padding: token.size.default_.top
          .marge(token.size.md.bottom)
          .marge(token.size.lg.horizontal),
      textStyle: titleTextStyle,
    );
    var style = AntdTabsStyle(
        tabStyle: AntdBoxStyle(
          color: token.colorWhite,
          border: token.borderSide.bottom,
        ),
        panelStyle: AntdBoxStyle(
          color: token.colorWhite,
          padding: token.size.lg.all,
        ),
        activeTitleStyle: titleStyle.copyWith(
            textStyle: titleTextStyle.copyWith(color: token.colorPrimary)),
        titleStyle: titleStyle,
        indicatorStyle: AntdBoxStyle(
          color: token.colorPrimary,
          height: token.lineWidthBold.roundToDouble(),
        ));
    return style;
  }

  @override
  AntdTabsStyle margeStyle(AntdTabsStyle defaultStyle, AntdTabsStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  State<StatefulWidget> createState() {
    return AntdTabsState();
  }

  @override
  AntdStyleBuilder<AntdTabsStyle, AntdTabs>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.tabsStyle;
  }

  @override
  AntdTabs getWidget(BuildContext context) {
    return this;
  }
}

class AntdTabsState extends AntdBaseTabsState<AntdTabsStyle, AntdTab, AntdTabs>
    with TickerProviderStateMixin {
  late AntdIndicatorController innerIndicatorController =
      AntdIndicatorController(
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    scrollController.indicatorController = innerIndicatorController;
  }

  @override
  Widget buildExtra() {
    return AntdTabsIndicator<AntdTab>(
      defaultIndex: scrollController.currentIndex.value,
      indicatorPosition: widget.indicatorPosition,
      indicatorMode: widget.indicatorMode,
      sliverListController: scrollController,
      style: style.indicatorStyle,
      indicatorController: innerIndicatorController,
    );
  }
}

class AntdTabShaderMask extends StatelessWidget {
  final Widget child;
  final Curve fadeCurve;
  final double fadeWidth; // 模糊区域宽度比例 (0.05 ~ 0.3)

  const AntdTabShaderMask({
    super.key,
    required this.child,
    this.fadeCurve = Curves.easeOutCubic,
    this.fadeWidth = 0.05,
  }) : assert(fadeWidth >= 0.05 && fadeWidth <= 0.3);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) => _createGradient(bounds),
      blendMode: BlendMode.dstIn,
      child: child,
    );
  }

  Shader _createGradient(Rect bounds) {
    final stops = _calculateStops();
    final colors = stops.map((stop) {
      final opacity = _calculateOpacity(_adjustPosition(stop));
      return Colors.white.withValues(alpha: opacity);
    }).toList();

    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: stops,
      colors: colors,
    ).createShader(bounds);
  }

  List<double> _calculateStops() {
    // 对称的stops数组
    return [
      0.0,
      fadeWidth * 0.25,
      fadeWidth * 0.5,
      fadeWidth * 0.75,
      fadeWidth,
      1 - fadeWidth,
      1 - fadeWidth * 0.75,
      1 - fadeWidth * 0.5,
      1 - fadeWidth * 0.25,
      1.0
    ];
  }

  double _adjustPosition(double x) {
    final edge = fadeWidth.clamp(0.05, 0.3);

    if (x < edge) {
      // 左侧：线性映射到[0,0.5]
      return (x / edge) * 0.5;
    } else if (x > 1 - edge) {
      // 右侧：线性映射到[0.5,1]
      return 0.5 + ((x - (1 - edge)) / edge) * 0.5;
    } else {
      // 中间：直接映射到0.5
      return 0.5;
    }
  }

  double _calculateOpacity(double adjustedX) {
    // 对称的S曲线计算
    final s = (adjustedX - 0.5).abs() * 2; // 转换到0-1范围
    return 1 - s * s * s; // 三次方曲线
  }
}
