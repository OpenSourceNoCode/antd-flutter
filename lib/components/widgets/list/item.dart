import 'dart:collection';

import 'package:flutter/widgets.dart';

import 'controller.dart';

class AntdItemEntry<T> {
  ///首次出现
  final bool isFirstVisible;

  ///首次出现
  final bool hasSizeChanged;

  ///数据
  final T data;

  ///数据的索引
  final int index;

  ///大小
  final Size size;

  ///距离顶部的位移
  final double topOffset;

  const AntdItemEntry(
      {required this.isFirstVisible,
      required this.hasSizeChanged,
      required this.data,
      required this.index,
      required this.size,
      required this.topOffset});
}

typedef AntdItemEntryListener<T> = void Function(AntdItemEntry<T> context);

class AntdItemRegistry<T> {
  ///最顶部距离边界的位移
  final Map<int, double> _offsetMap = SplayTreeMap();

  ///每个item的大小
  final Map<int, Size> _sizeMap = SplayTreeMap();

  ///切换事件
  final List<AntdItemEntryListener<T>> _listeners = [];

  void addListener(AntdItemEntryListener<T> listener) =>
      _listeners.add(listener);
  void removeListener(AntdItemEntryListener<T> listener) =>
      _listeners.remove(listener);

  bool addItem(
      int index, RenderBox box, double topOffset, bool sizeChanged, T data) {
    final existed = _sizeMap.containsKey(index);
    final size = box.size;
    _sizeMap[index] = size;
    _offsetMap[index] = topOffset;

    _notifyListeners(
      index: index,
      size: size,
      topOffset: topOffset,
      isFirst: !existed,
      sizeChanged: sizeChanged,
      data: data,
    );

    return !existed;
  }

  void _notifyListeners({
    required int index,
    required Size size,
    required double topOffset,
    required bool isFirst,
    required bool sizeChanged,
    required T data,
  }) {
    final event = AntdItemEntry(
      isFirstVisible: isFirst,
      hasSizeChanged: sizeChanged,
      data: data,
      index: index,
      size: size,
      topOffset: topOffset,
    );

    for (final listener in _listeners) {
      listener(event);
    }
  }

  void removeItem(int index) {
    _sizeMap.remove(index);
    _offsetMap.remove(index);
  }

  Size? getSize(int index) => _sizeMap[index];
  bool contains(int index) => _sizeMap.containsKey(index);

  double? getLength(int index, bool isHorizontal) {
    return isHorizontal ? _sizeMap[index]?.width : _sizeMap[index]?.height;
  }

  double? calculateAlignment({
    required int index,
    required AntdEdge viewportAlign,
    required AntdEdge itemAlign,
    required bool isHorizontal,
    required double viewportSize,
  }) {
    final itemLength = getLength(index, isHorizontal);
    if (itemLength == null) return null;

    switch (viewportAlign) {
      case AntdEdge.start:
        return itemAlign == AntdEdge.start
            ? 0
            : (itemAlign == AntdEdge.center ? itemLength / 2 : itemLength);
      case AntdEdge.center:
        return itemAlign == AntdEdge.start
            ? -viewportSize / 2
            : (itemAlign == AntdEdge.center
                ? -(viewportSize - itemLength) / 2
                : -viewportSize / 2 + itemLength);
      case AntdEdge.end:
        return itemAlign == AntdEdge.start
            ? -viewportSize
            : (itemAlign == AntdEdge.center
                ? -viewportSize + itemLength / 2
                : -viewportSize + itemLength);
    }
  }

  double? calculateAlignedOffset({
    required int index,
    required AntdEdge viewportAlign,
    required AntdEdge itemAlign,
    required bool isHorizontal,
    required double viewportSize,
  }) {
    final topOffset = _offsetMap[index];
    if (topOffset == null) return null;

    final alignOffset = calculateAlignment(
      index: index,
      viewportAlign: viewportAlign,
      itemAlign: itemAlign,
      isHorizontal: isHorizontal,
      viewportSize: viewportSize,
    );

    return alignOffset != null ? topOffset + alignOffset : null;
  }

  double? calculateTopOffset({
    required int index,
    required AntdEdge viewportAlign,
    required bool isHorizontal,
    required double viewportSize,
  }) {
    return calculateAlignedOffset(
      index: index,
      viewportAlign: viewportAlign,
      itemAlign: AntdEdge.start,
      isHorizontal: isHorizontal,
      viewportSize: viewportSize,
    );
  }

  void clear() {
    _sizeMap.clear();
    _offsetMap.clear();
  }
}
