import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

enum AntdScrollItemPosition {
  first,
  middle,
  last,
  only;

  factory AntdScrollItemPosition.fromIndex(int index, int total) {
    if (total == 1) return AntdScrollItemPosition.only;
    if (index == 0) return AntdScrollItemPosition.first;
    if (index == total - 1) return AntdScrollItemPosition.last;
    return AntdScrollItemPosition.middle;
  }
}

class AntdScrollItemContext<T,
    Controller extends AntdScrollPositionController<T>> {
  final T data;
  final int index;
  final AntdScrollItemPosition position;
  final bool reversed;
  final Controller controller;

  const AntdScrollItemContext(
      {required this.data,
      required this.index,
      required this.position,
      required this.reversed,
      required this.controller});

  AntdScrollItemPosition resolvePosition() {
    if (reversed) {
      return switch (position) {
        AntdScrollItemPosition.first => AntdScrollItemPosition.last,
        AntdScrollItemPosition.middle => AntdScrollItemPosition.middle,
        AntdScrollItemPosition.last => AntdScrollItemPosition.first,
        AntdScrollItemPosition.only => AntdScrollItemPosition.only,
      };
    }

    return position;
  }

  bool get isLast =>
      position == AntdScrollItemPosition.only ||
      position == AntdScrollItemPosition.last;

  bool get isFirst =>
      position == AntdScrollItemPosition.only ||
      position == AntdScrollItemPosition.first;
}

typedef AntdScrollItemBuilder<T,
        Controller extends AntdScrollPositionController<T>>
    = Widget? Function(AntdScrollItemContext<T, Controller> ctx);

enum AntdScrollItemFit { fill, split, child }

abstract class AntdScrollPositionedBase<T, Style extends AntdStyle, WidgetType,
        Controller extends AntdScrollPositionController<T>>
    extends AntdScrollView<Style, WidgetType, Controller> {
  ///头部的sliver
  final List<Widget>? headers;

  ///尾部的sliver
  final List<Widget>? footers;

  /// 滚动的数据
  final List<T> items;

  /// 数据构造器
  final AntdScrollItemBuilder<T, Controller>? itemBuilder;

  ///启动虚拟滚动
  final bool virtual;

  ///自动适配策略
  final AntdScrollItemFit fit;

  ///根据方向自动优化视图边界
  final AntdEdge? alignment;

  ///item变更事件
  final AntdItemPositionListener<T>? onItemPosition;

  ///宫格排列
  final SliverGridDelegate? gridDelegate;

  ///偏移位置
  final double? viewportOffset;

  const AntdScrollPositionedBase(
      {super.key,
      super.style,
      super.styleBuilder,
      super.controller,
      super.vertical = true,
      super.reversed,
      super.physics = const BouncingScrollPhysics(),
      super.dragStartBehavior = DragStartBehavior.start,
      super.scrollBehavior,
      super.cacheExtent = 1.5,
      super.cacheExtentStyle = CacheExtentStyle.viewport,
      super.throttle,
      super.shrinkWrap,
      super.edgeThreshold,
      super.onEdgeReached,
      this.headers,
      this.footers,
      this.items = const [],
      this.itemBuilder,
      this.virtual = false,
      this.fit = AntdScrollItemFit.child,
      this.alignment,
      this.onItemPosition,
      this.gridDelegate,
      this.viewportOffset});
}

class AntdScrollItemProvider extends InheritedWidget {
  final int index;
  final AntdScrollItemPosition position;

  const AntdScrollItemProvider({
    super.key,
    required super.child,
    required this.index,
    required this.position,
  });

  @override
  bool updateShouldNotify(covariant AntdScrollItemProvider oldWidget) {
    return oldWidget.index != index || oldWidget.position != position;
  }

  static AntdScrollItemProvider? ofMaybe<T>(BuildContext context) {
    var provider =
        context.dependOnInheritedWidgetOfExactType<AntdScrollItemProvider>();
    return provider;
  }
}

abstract class AntdScrollPositionedBaseState<
        T,
        Style extends AntdStyle,
        Controller extends AntdScrollPositionController<T>,
        S extends AntdScrollPositionedBase<T, Style, S, Controller>>
    extends AntdScrollViewState<Style, Controller, S> {
  bool _autoSplit = false;
  double _splitTotal = 0.0;
  AntdScrollItemFit _fit = AntdScrollItemFit.child;
  List<T> _items = [];

  @override
  void initState() {
    super.initState();
    scrollController.reBuild = () => setState(() {});
    scrollController.addPositionListener(widget.onItemPosition);
  }

  AntdScrollItemFit buildFit() {
    return widget.fit;
  }

  @override
  void updateDependentValues(covariant S? oldWidget) {
    super.updateDependentValues(oldWidget);
    _fit = buildFit();
    _items = buildItems();
    scrollController.items = buildItems();
    scrollController.viewportOffset = widget.viewportOffset ?? 0;
  }

  @override
  void handleScroll() {
    super.handleScroll();
    if (_autoSplit) return;

    scrollController.updateActiveIndex(widget.alignment);
  }

  @override
  List<Widget> buildSlivers() {
    return [
      ...buildHeaders(),
      ..._buildItemSlivers(),
      ...buildFooters(),
    ];
  }

  List<T> buildItems() {
    return widget.items;
  }

  List<Widget> buildFooters() {
    return widget.footers ?? [];
  }

  List<Widget> buildHeaders() {
    return widget.headers ?? [];
  }

  Widget? buildItemBuilder(AntdScrollItemContext<T, Controller> ctx) {
    return widget.itemBuilder?.call(ctx);
  }

  List<Widget> _buildItemSlivers() {
    if (!widget.virtual) {
      if (widget.gridDelegate != null) {
        return [
          SliverGrid(
              delegate: SliverChildListDelegate(_items
                  .asMap()
                  .map((i, item) => MapEntry(i, _buildItem(i, item)))
                  .values
                  .whereType<Widget>()
                  .toList()),
              gridDelegate: widget.gridDelegate!)
        ];
      }
      return _items
          .asMap()
          .map((i, item) => MapEntry(i, _buildItem(i, item)))
          .values
          .whereType<Widget>()
          .map((child) => SliverToBoxAdapter(child: child))
          .toList();
    }

    var delegates = _createDelegates();
    return delegates
        .map((delegate) => widget.gridDelegate != null
            ? SliverGrid(
                key: (delegates.length == 3 && delegate == delegates[1])
                    ? centerKey
                    : null,
                delegate: delegate,
                gridDelegate: widget.gridDelegate!)
            : SliverList(
                key: (delegates.length == 3 && delegate == delegates[1])
                    ? centerKey
                    : null,
                delegate: delegate))
        .toList();
  }

  Widget? _buildItem(int index, T data) {
    return LayoutBuilder(builder: (context, constraints) {
      final viewSize = scrollController.effectiveViewportSize ?? 0.0;

      double? getFillSize() {
        if (_fit == AntdScrollItemFit.fill) return viewSize;
        if (_autoSplit) return viewSize / _items.length;
        return null;
      }

      AntdBoxStyle? getFillStyle() {
        if (_fit == AntdScrollItemFit.child) return null;
        final size = getFillSize();
        return scrollController.isHorizontal
            ? AntdBoxStyle(width: size)
            : AntdBoxStyle(height: size);
      }

      var position =
          AntdScrollItemPosition.fromIndex(index, widget.items.length);
      final itemEntity = AntdScrollItemContext(
          data: data,
          index: index,
          position: position,
          reversed: widget.reversed,
          controller: scrollController);

      final child = AntdBox(
        style: getFillStyle(),
        onLayout: (layout) {
          if (!layout.renderBox.attached || layout.viewport == null) return;

          final offset =
              layout.viewport!.getOffsetToReveal(layout.renderBox, 0);
          scrollController.itemRegistry.addItem(
            index,
            layout.renderBox,
            offset.offset,
            layout.hasSizeChange,
            data,
          );

          if (!_autoSplit) {
            _splitTotal += layout.renderBox.size.width;
            if (_fit == AntdScrollItemFit.split &&
                _splitTotal <= viewSize &&
                index == _items.length - 1) {
              setState(() {
                scrollController.autoFill = true;
                _autoSplit = true;
              });
            }
          }

          if (layout.hasSizeChange) {
            if (scrollController.updateChildSize(layout.renderBox.size) &&
                scrollController.isHorizontal) {
              setState(() {});
            }
          }
        },
        child: AntdScrollItemProvider(
            index: index,
            position: position,
            child: buildItemBuilder(itemEntity) ?? const AntdBox()),
      );

      return _needsUnconstrained(index, constraints)
          ? UnconstrainedBox(child: child)
          : child;
    });
  }

  bool _needsUnconstrained(int index, BoxConstraints constraints) {
    if (!scrollController.isHorizontal) return false;
    return !constraints.hasBoundedHeight ||
        constraints.maxHeight == 0 ||
        _fit == AntdScrollItemFit.child ||
        (_fit == AntdScrollItemFit.split && !_autoSplit);
  }

  List<SliverChildBuilderDelegate> _createDelegates() {
    final delegates = <SliverChildBuilderDelegate>[];
    final targetIndex = scrollController.targetIndex;
    final total = _items.length;

    if (scrollController.hasTarget) {
      centerKey = const ValueKey("value");
      if (targetIndex >= 0) {
        delegates.add(_createDelegate(targetIndex, (i) => targetIndex - i - 1));
      }

      delegates.add(_createDelegate(1, (_) => targetIndex));

      final remaining = total - targetIndex - 1;
      if (remaining > 0) {
        delegates.add(_createDelegate(remaining, (i) => i + targetIndex + 1));
      }
    } else {
      delegates.add(_createDelegate(total, (i) => i));
    }

    return delegates;
  }

  SliverChildBuilderDelegate _createDelegate(
    int count,
    int Function(int) indexMapper,
  ) {
    return SliverChildBuilderDelegate(
      (context, i) => _buildItem(indexMapper(i), _items[indexMapper(i)]),
      childCount: count,
    );
  }
}
