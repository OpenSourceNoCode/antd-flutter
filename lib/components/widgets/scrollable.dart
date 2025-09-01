import 'dart:async';

import 'package:antd_flutter/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'controller.dart';

typedef AntdOnScrollEdge = Future<void> Function(double offset, bool isUp);

abstract class AntdScrollView<Style extends AntdStyle, WidgetType,
        Controller extends AntdScrollController>
    extends AntdStateComponent<Style, WidgetType> {
  /// 滚动方向
  final bool vertical;

  /// 是否反向滚动
  final bool reversed;

  /// 控制器
  final Controller? controller;

  /// 滚动物理效果
  final ScrollPhysics? physics;

  /// 拖动开始行为
  final DragStartBehavior dragStartBehavior;

  /// 滚动行为
  final ScrollBehavior? scrollBehavior;

  /// 预渲染区域大小
  final double cacheExtent;

  /// 预渲染区域计算方式
  final CacheExtentStyle cacheExtentStyle;

  /// 子组件
  final List<Widget>? slivers;

  /// 滚动事件节流时长
  final Duration? throttle;

  /// 触边阈值 (0-1表示百分比)
  final double? edgeThreshold;

  /// 当触碰到边界时的回调
  final AntdOnScrollEdge? onEdgeReached;

  /// 自动扩展高度
  final bool? shrinkWrap;

  const AntdScrollView({
    super.key,
    super.style,
    super.styleBuilder,
    this.vertical = true,
    this.reversed = false,
    this.controller,
    this.physics = const BouncingScrollPhysics(),
    this.dragStartBehavior = DragStartBehavior.start,
    this.scrollBehavior,
    this.cacheExtent = 1,
    this.cacheExtentStyle = CacheExtentStyle.viewport,
    this.slivers,
    this.throttle,
    this.edgeThreshold,
    this.onEdgeReached,
    this.shrinkWrap,
  });
}

abstract class AntdScrollViewState<
        Style extends AntdStyle,
        Controller extends AntdScrollController,
        S extends AntdScrollView<Style, S, Controller>>
    extends AntdState<Style, S> {
  DateTime? _lastTime;
  bool _isEdgeCallbackProcessing = false;
  Key? centerKey;

  late final Controller scrollController =
      widget.controller ?? createController();

  Controller createController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(handleScroll);
  }

  @override
  void updateDependentValues(covariant S? oldWidget) {
    super.updateDependentValues(oldWidget);
    scrollController.isHorizontal = !widget.vertical;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      scrollController.dispose();
    }

    super.dispose();
  }

  void _checkReachEdge() {
    final threshold = widget.edgeThreshold;
    if (threshold == null ||
        threshold <= 0 ||
        widget.onEdgeReached == null ||
        _isEdgeCallbackProcessing) {
      return;
    }

    final position = scrollController.position;
    final maxScrollExtent = position.maxScrollExtent;
    final offset = scrollController.offset;
    final isAtTop =
        offset <= (threshold < 1 ? threshold * maxScrollExtent : threshold);
    final isAtBottom = threshold < 1
        ? offset >= (1 - threshold) * maxScrollExtent
        : offset >= maxScrollExtent - threshold;

    if (scrollController.isScrollingUp && isAtBottom) {
      _triggerEdgeCallback(offset, false);
    } else if (!scrollController.isScrollingUp && isAtTop) {
      _triggerEdgeCallback(offset, true);
    }
  }

  void _triggerEdgeCallback(double offset, bool top) {
    _isEdgeCallbackProcessing = true;
    widget.onEdgeReached?.call(offset, top).whenComplete(() {
      _isEdgeCallbackProcessing = false;
    });
  }

  void handleScroll() {
    if (!mounted) {
      return;
    }

    if (widget.throttle != null) {
      final now = DateTime.now();
      final elapsed = _lastTime?.difference(now).inMilliseconds.abs();

      if (elapsed != null && elapsed < widget.throttle!.inMilliseconds) {
        return;
      }
      _lastTime = now;
    }

    _checkReachEdge();
    scrollController.onMetricsUpdate();
  }

  List<Widget> buildSlivers() {
    return widget.slivers ?? [];
  }

  bool buildReversed() {
    return widget.reversed;
  }

  Widget buildScrollable(AxisDirection axisDirection) {
    return Scrollable(
      controller: scrollController,
      physics: widget.physics,
      axisDirection: axisDirection,
      dragStartBehavior: widget.dragStartBehavior,
      scrollBehavior: widget.scrollBehavior,
      viewportBuilder: (context, offset) {
        var slivers = buildSlivers();
        if (widget.shrinkWrap == true) {
          return ShrinkWrappingViewport(
              axisDirection: axisDirection, offset: offset, slivers: slivers);
        }

        return Viewport(
          axisDirection: axisDirection,
          offset: offset,
          cacheExtent: widget.cacheExtent,
          cacheExtentStyle: widget.cacheExtentStyle,
          slivers: slivers,
          center: centerKey,
        );
      },
    );
  }

  @override
  Widget render(BuildContext context) {
    var reversed = buildReversed();
    var axisDirection = widget.vertical
        ? (reversed ? AxisDirection.up : AxisDirection.down)
        : (reversed ? AxisDirection.left : AxisDirection.right);
    var scrollable = buildScrollable(axisDirection);
    return LayoutBuilder(builder: (outContext, bodyConstraints) {
      scrollController.contentWidth =
          bodyConstraints.hasBoundedWidth ? bodyConstraints.maxWidth : null;

      Widget child;
      if (widget.shrinkWrap == true) {
        child = scrollable;
      } else if (bodyConstraints.hasBoundedHeight) {
        child = SizedBox(
          height: bodyConstraints.maxHeight,
          width:
              bodyConstraints.hasBoundedWidth ? bodyConstraints.maxWidth : null,
          child: scrollable,
        );
      } else if (!widget.vertical) {
        child = SizedBox(
          height: scrollController.firstChildSize?.height ?? 0,
          width:
              bodyConstraints.hasBoundedWidth ? bodyConstraints.maxWidth : null,
          child: scrollable,
        );
      } else {
        child = scrollable;
      }
      return child;
    });
  }
}

class AntdScrollable
    extends AntdScrollView<AntdStyle, AntdScrollable, AntdScrollController> {
  const AntdScrollable(
      {super.key,
      super.vertical = true,
      super.reversed,
      super.controller,
      super.physics = const BouncingScrollPhysics(),
      super.dragStartBehavior = DragStartBehavior.start,
      super.scrollBehavior,
      super.cacheExtent = 1.5,
      super.cacheExtentStyle = CacheExtentStyle.viewport,
      super.slivers,
      super.throttle,
      super.edgeThreshold,
      super.onEdgeReached});

  @override
  State<StatefulWidget> createState() {
    return _AntdScrollableState();
  }

  @override
  AntdScrollable getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdEmptyStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return const AntdEmptyStyle();
  }

  @override
  AntdStyle margeStyle(AntdStyle defaultStyle, AntdStyle? style) {
    return defaultStyle;
  }
}

class _AntdScrollableState extends AntdScrollViewState<AntdStyle,
    AntdScrollController, AntdScrollable> {
  @override
  AntdScrollController createController() {
    return AntdScrollController();
  }
}
