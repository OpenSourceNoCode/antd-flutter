import 'dart:async';

import 'package:antd_flutter/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

/// 走马灯样式
/// @l [AntdSwiper]
class AntdSwiperStyle extends AntdStyle {
  /// 列表容器样式（背景色/边框/圆角等）
  final AntdBoxStyle? bodyStyle;

  /// 列表项样式（背景/边框/点击效果等）
  final AntdBoxStyle? itemStyle;

  const AntdSwiperStyle({super.inherit, this.bodyStyle, this.itemStyle});

  @override
  AntdSwiperStyle copyFrom(covariant AntdSwiperStyle? style) {
    return AntdSwiperStyle(
        bodyStyle: bodyStyle?.copyFrom(style?.bodyStyle),
        itemStyle: itemStyle?.copyFrom(style?.itemStyle));
  }
}

typedef AntdSwiperIndicatorBuilder = Widget Function(int index, int total);

typedef AntdSwiperOnIndexChange = void Function(int index);

class AntdSwiperController extends AntdScrollPositionController<Widget> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  bool _loop = false;
  int get currentIndex => _currentIndex.value;

  void next() {
    if (items.length <= 1) {
      return;
    }

    if (currentIndex + 1 < items.length) {
      toIndex(currentIndex + 1);
      return;
    }
  }

  void previous() {
    if (items.length <= 1) {
      return;
    }

    if (currentIndex - 1 >= 0) {
      toIndex(currentIndex - 1);
      return;
    }
  }
}

///@t 走马灯
///@g 信息展示
///@o 77
///@d 一组轮播的区域。
///@u 当有一组平级的内容。当内容空间不足时，可以用走马灯的形式进行收纳，进行轮播展现。
class AntdSwiper extends AntdScrollPositionedBase<Widget, AntdSwiperStyle,
    AntdSwiper, AntdSwiperController> {
  const AntdSwiper(
      {super.key,
      super.style,
      super.styleBuilder,
      super.edgeThreshold,
      super.onEdgeReached,
      super.controller,
      super.cacheExtent = 1.5,
      super.cacheExtentStyle = CacheExtentStyle.viewport,
      super.dragStartBehavior = DragStartBehavior.start,
      super.scrollBehavior = const CupertinoScrollBehavior(),
      super.vertical = true,
      super.reversed = false,
      super.shrinkWrap = false,
      super.virtual = false,
      required super.items,
      super.itemBuilder,
      super.headers,
      super.footers,
      super.onItemPosition,
      super.throttle,
      this.allowTouchMove = true,
      this.autoplay = false,
      this.autoplayInterval = const Duration(milliseconds: 3000),
      this.activeIndex = 0,
      this.loop = false,
      this.indicatorBuilder,
      this.onChange})
      : super(
            fit: AntdScrollItemFit.fill,
            physics: allowTouchMove
                ? const PageScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            alignment: AntdEdge.center);

  ///是否允许手势滑动
  final bool allowTouchMove;

  ///是否自动切换
  final bool autoplay;

  ///自动切换的间隔，单位为 ms
  final Duration autoplayInterval;

  ///	初始位置
  final int activeIndex;

  ///是否循环
  final bool loop;

  ///	自定义指示器
  final AntdSwiperIndicatorBuilder? indicatorBuilder;

  /// 事件
  final AntdSwiperOnIndexChange? onChange;

  @override
  State<StatefulWidget> createState() {
    return _AntdSwiperState();
  }

  @override
  AntdSwiperStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return const AntdSwiperStyle();
  }

  @override
  AntdSwiperStyle margeStyle(
      AntdSwiperStyle defaultStyle, AntdSwiperStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdSwiperStyle, AntdSwiper>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.swiperStyle;
  }

  @override
  AntdSwiper getWidget(BuildContext context) {
    return this;
  }
}

class _AntdSwiperState extends AntdScrollPositionedBaseState<Widget,
    AntdSwiperStyle, AntdSwiperController, AntdSwiper> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    scrollController._loop = widget.loop;
    scrollController.addPositionListener((ctx) {
      if (ctx.isFirstAppear) {
        widget.onChange?.call(ctx.index);
        scrollController._currentIndex.value = ctx.index;
      }
    });
  }

  @override
  void updateDependentValues(covariant AntdSwiper? oldWidget) {
    super.updateDependentValues(oldWidget);
    if (widget.autoplayInterval != oldWidget?.autoplayInterval ||
        widget.autoplay != oldWidget?.autoplay) {
      timer?.cancel();
      if (widget.autoplay) {
        timer = Timer.periodic(widget.autoplayInterval, (timer) {
          scrollController.next();
        });
      }
    }
    if (widget.activeIndex != oldWidget?.activeIndex) {
      scrollController.toIndex(widget.activeIndex);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget? buildItemBuilder(
      AntdScrollItemContext<Widget, AntdSwiperController> ctx) {
    var child = super.buildItemBuilder(ctx);
    if (child != null) {
      return child;
    }
    return ctx.data;
  }

  @override
  Widget build(BuildContext context) {
    var scrollable = super.build(context);
    return Stack(
      children: [
        scrollable,
        ValueListenableBuilder(
            valueListenable: scrollController._currentIndex,
            builder: (context, value, _) {
              return widget.indicatorBuilder != null
                  ? widget.indicatorBuilder!.call(value, widget.items.length)
                  : Positioned(
                      top: widget.vertical ? 0 : null,
                      bottom: widget.vertical ? 0 : 6,
                      left: widget.vertical ? null : 0,
                      right: widget.vertical ? 6 : 0,
                      child: Center(
                        child: AntdPageIndicator(
                          vertical: widget.vertical,
                          current: value,
                          total: widget.items.length,
                        ),
                      ));
            })
      ],
    );
  }

  @override
  AntdSwiperController createController() {
    return AntdSwiperController();
  }
}
