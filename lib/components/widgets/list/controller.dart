import 'dart:math';

import 'package:antd_flutter/components/widgets/controller.dart';
import 'package:antd_flutter/components/widgets/list/item.dart';
import 'package:flutter/widgets.dart';

enum AntdEdge { start, center, end }

enum AntdScrollSources { userScroll, apiScroll, stopScroll, set }

class AntdScrollToIndexConfig {
  final bool jump;
  final Duration duration;
  final Curve curve;
  final AntdEdge viewportAlign;
  final AntdEdge itemAlign;
  final bool set;

  const AntdScrollToIndexConfig({
    this.jump = true,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOut,
    this.viewportAlign = AntdEdge.start,
    this.itemAlign = AntdEdge.start,
    this.set = false,
  });

  AntdScrollToIndexConfig copyWith({
    bool? jump,
    Duration? duration,
    Curve? curve,
    AntdEdge? viewportAlign,
    AntdEdge? itemAlign,
    bool? set,
  }) {
    return AntdScrollToIndexConfig(
      jump: jump ?? this.jump,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      viewportAlign: viewportAlign ?? this.viewportAlign,
      itemAlign: itemAlign ?? this.itemAlign,
      set: set ?? this.set,
    );
  }
}

class AntdItemPositionContext<T> {
  ///数据
  final T data;

  ///数据的索引
  final int index;

  ///首次进入
  final bool isFirstAppear;

  ///大小
  final Size? size;

  ///当前的滚动距离
  final double scrollOffset;

  /// 当前项在屏幕内的可见高度
  final double visibleHeight;

  ///当前项被遮挡的高度
  final double hiddenHeight;

  const AntdItemPositionContext(
      {required this.data,
      required this.index,
      required this.isFirstAppear,
      this.size,
      required this.scrollOffset,
      required this.visibleHeight,
      required this.hiddenHeight});

  double get visibleRatio => visibleHeight / (visibleHeight + hiddenHeight);
}

typedef AntdItemPositionListener<T> = void Function(
    AntdItemPositionContext<T> context);

class AntdScrollPositionController<T> extends AntdScrollController {
  ///重新build
  void Function() reBuild = () {};

  ///数据
  List<T> items = [];

  ///目标的索引
  int _targetIndex = -1;
  int get targetIndex => _targetIndex;
  bool get hasTarget => _targetIndex > -1;

  ///位于上边界的那个item索引
  int _activeIndex = -1;
  int get activeIndex => _activeIndex;

  ///视图的offset会基于这个offset提前计算
  double viewportOffset = 0;

  ///自动切分
  bool autoFill = false;

  ///item管理
  final AntdItemRegistry _itemRegistry = AntdItemRegistry();
  AntdItemRegistry get itemRegistry => _itemRegistry;

  ///跳转的参数
  AntdScrollToIndexConfig _scrollConfig = const AntdScrollToIndexConfig();

  ///切换事件
  final List<AntdItemPositionListener<T>> _positionListeners = [];

  void reset() {
    _activeIndex = -1;
    _itemRegistry.clear();
  }

  void _setTargetIndex(int index, {AntdScrollToIndexConfig? config}) {
    reset();
    if (config != null) {
      _scrollConfig = config;
    }

    _itemRegistry.addListener((context) {
      if (_targetIndex == context.index && context.isFirstVisible) {
        _scrollToIndex(_targetIndex, config: _scrollConfig);
      }
    });
    _targetIndex = index;
  }

  void addPositionListener(AntdItemPositionListener<T>? callback) {
    if (callback == null) {
      return;
    }

    _positionListeners.add(callback);
  }

  void removePositionListener(AntdItemPositionListener<T> callback) {
    _positionListeners.remove(callback);
  }

  double? getWindowOffset(
      {required int index,
      required AntdEdge viewportAlign,
      double offset = 0}) {
    if (effectiveViewportSize == null) {
      return null;
    }

    double? baseOffset = _itemRegistry.calculateTopOffset(
      index: index,
      viewportAlign: viewportAlign,
      isHorizontal: isHorizontal,
      viewportSize: effectiveViewportSize!,
    );

    if (baseOffset == null) {
      return null;
    }

    var scrollDirection = position.axisDirection;
    if (scrollDirection == AxisDirection.left) {
      if (offset <= 0) {
        return baseOffset;
      }
      if (offset >= position.maxScrollExtent) {
        return baseOffset + position.maxScrollExtent;
      }
      return baseOffset + offset;
    }

    if (offset <= 0) {
      return baseOffset;
    }
    if (offset >= position.maxScrollExtent) {
      return baseOffset - position.maxScrollExtent;
    }
    return baseOffset - offset;
  }

  double getViewOffset(AntdEdge viewportAlignLine) {
    var fSetViewOffset = -viewportOffset;
    if (viewportAlignLine == AntdEdge.start) {
      return fSetViewOffset;
    }

    var viewportDimension = position.viewportDimension;
    if (viewportAlignLine == AntdEdge.center) {
      return -viewportDimension / 2 + fSetViewOffset;
    }
    if (viewportAlignLine == AntdEdge.end) {
      return -viewportDimension + fSetViewOffset;
    }
    return fSetViewOffset;
  }

  Future<void> toIndex(int index,
      {AntdScrollToIndexConfig config =
          const AntdScrollToIndexConfig()}) async {
    if (items.isEmpty ||
        index < 0 ||
        index >= items.length ||
        _activeIndex == index) {
      return;
    }

    _scrollConfig = config;
    var topOffset = getItemTopOffset(index, config.viewportAlign);
    if (topOffset != null) {
      await _scrollToIndex(index, config: config);
      return;
    }

    _setTargetIndex(index, config: config);
    reBuild();
  }

  Future<void> _scrollToIndex(int index,
      {AntdScrollToIndexConfig config =
          const AntdScrollToIndexConfig()}) async {
    if (effectiveViewportSize == null) {
      return;
    }

    double? itemScrollOffset = _itemRegistry.calculateAlignedOffset(
        index: index,
        viewportAlign: config.viewportAlign,
        itemAlign: config.itemAlign,
        isHorizontal: isHorizontal,
        viewportSize: effectiveViewportSize!);
    if (itemScrollOffset == null) {
      return;
    }

    var itemLength = _itemRegistry.getLength(index, isHorizontal);
    if (itemLength == null) {
      return;
    }
    itemScrollOffset = itemScrollOffset - viewportOffset;
    double safeOffset = min(max(itemScrollOffset, position.minScrollExtent),
        position.maxScrollExtent);
    if ((safeOffset == 0 && offset == 0) ||
        (safeOffset == position.maxScrollExtent &&
            offset == position.maxScrollExtent)) {
      _notifyVisibility(index, itemLength, 0);
      return;
    }
    if (config.set) {
      _notifyVisibility(index, itemLength, 0);
    }
    if (config.jump) {
      jumpTo(safeOffset);
      return;
    }
    await animateTo(
      safeOffset,
      duration: config.duration,
      curve: config.curve,
    );
  }

  void _notifyVisibility(int index, double visibleHeight, double hiddenHeight) {
    final isFirstAppear = _activeIndex != index;
    _activeIndex = index;
    for (final callback in _positionListeners) {
      callback(AntdItemPositionContext(
        data: items[index],
        index: index,
        isFirstAppear: isFirstAppear,
        scrollOffset: offset,
        size: _itemRegistry.getSize(index),
        visibleHeight: visibleHeight,
        hiddenHeight: hiddenHeight,
      ));
    }
  }

  void updateActiveIndex([AntdEdge? viewportAlignLine]) {
    if (effectiveViewportSize == null) {
      return;
    }

    viewportAlignLine ??= _scrollConfig.viewportAlign;
    var offset_ = offset + viewportOffset;
    if (offset_ <= 0) {
      if (!hasTarget) {
        _activeIndex = -1;
        return;
      }
    }

    final alignOffset = offset_ + getViewOffset(viewportAlignLine);
    if (_activeIndex != -1) {
      final currentItemOffsetTop = getCurrentItemTopOffset(viewportAlignLine);
      if (currentItemOffsetTop == null) {
        _activeIndex = -1;
        return;
      }
      final itemLength = getCurrentItemLength()!;
      final currentItemOffsetBottom = currentItemOffsetTop + itemLength;

      if (currentItemOffsetBottom > 0 &&
          offset_ >= currentItemOffsetTop &&
          offset_ < currentItemOffsetBottom) {
        _notifyVisibility(
            _activeIndex,
            alignOffset - currentItemOffsetTop + viewportOffset,
            currentItemOffsetBottom - alignOffset - viewportOffset);
        return;
      }
    }

    _traverseItems(isScrollingUp, _activeIndex, (i) {
      final itemOffsetTop = getItemTopOffset(i, viewportAlignLine!);
      if (itemOffsetTop == null) {
        return true;
      }

      final itemBottom = itemOffsetTop + getItemLength(i)!;

      if (itemBottom == offset_) {
        return true;
      }
      if (itemOffsetTop < offset_ && itemBottom >= offset_) {
        final entryDistance = offset_ - itemOffsetTop;
        final remainingDistance = itemBottom - offset_;
        _notifyVisibility(i, entryDistance, remainingDistance);
        return false;
      }
      return true;
    });
  }

  void _traverseItems(bool before, int index, bool Function(int i) action) {
    var startIndex =
        isScrollingUp ? max(index, 0) : min(index, items.length - 1);
    var endIndex = before ? items.length : -1;
    var step = before ? 1 : -1;

    for (var i = startIndex; i != endIndex; i += step) {
      if (action(i)) {
        continue;
      }
      break;
    }
  }

  double? getItemOffset(
    int index,
    AntdEdge viewportAlign,
    AntdEdge itemAlign,
  ) {
    if (effectiveViewportSize == null) return null;

    return _itemRegistry.calculateAlignedOffset(
      index: index,
      viewportAlign: viewportAlign,
      itemAlign: itemAlign,
      isHorizontal: isHorizontal,
      viewportSize: effectiveViewportSize!,
    );
  }

  double? getCurrentItemTopOffset(AntdEdge viewportAlign) {
    return getItemTopOffset(_activeIndex, viewportAlign);
  }

  double? getItemTopOffset(int index, AntdEdge viewportAlign) {
    return getItemOffset(index, viewportAlign, AntdEdge.start);
  }

  double? getCurrentItemLength() => getItemLength(_activeIndex);
  double? getItemLength(int index) =>
      _itemRegistry.getLength(index, isHorizontal);
}
