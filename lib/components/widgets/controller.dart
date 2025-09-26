import 'dart:math';

import 'package:flutter/widgets.dart';

class AntdScrollMetrics {
  /// Whether scrolling up/forward (true) or down/backward (false)
  final bool isScrollingUp;

  /// Current scroll position in pixels
  final double offset;

  /// Previous scroll position before this update
  final double previousOffset;

  /// Delta of this scroll update
  final double scrollDelta;

  /// Maximum allowed scroll offset
  final double maxScrollExtent;

  /// Viewport size along scroll axis
  final double viewportSize;

  const AntdScrollMetrics({
    required this.isScrollingUp,
    required this.offset,
    required this.previousOffset,
    required this.scrollDelta,
    required this.maxScrollExtent,
    required this.viewportSize,
  });
}

typedef AntdOnScrollMetrics = void Function(AntdScrollMetrics offset);

class AntdScrollControllerProvider extends InheritedWidget {
  final AntdScrollController controller;

  const AntdScrollControllerProvider({
    super.key,
    required super.child,
    required this.controller,
  });

  @override
  bool updateShouldNotify(covariant AntdScrollControllerProvider oldWidget) {
    return oldWidget.controller != controller;
  }

  static AntdScrollController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AntdScrollControllerProvider>()
        ?.controller;
  }
}

class AntdScrollController extends ScrollController {
  AntdScrollMetrics? _currentMetrics;
  AntdScrollMetrics? get metrics => _currentMetrics;

  double get previousOffset => _currentMetrics?.previousOffset ?? 0.0;
  double get scrollDelta => _currentMetrics?.scrollDelta ?? 0.0;

  bool isHorizontal = false;
  bool get isScrollingUp => _currentMetrics?.isScrollingUp ?? false;

  Size? firstChildSize;
  final List<AntdOnScrollMetrics> _listeners = [];
  double? contentWidth;

  double? get effectiveViewportSize =>
      position.haveDimensions ? position.viewportDimension : contentWidth;

  void addMetricsListener(AntdOnScrollMetrics? listener) {
    if (listener == null) {
      return;
    }

    if (!_listeners.contains(listener)) {
      _listeners.add(listener);
    }
  }

  void removeMetricsListener(AntdOnScrollMetrics? listener) {
    _listeners.remove(listener);
  }

  void _updateMetrics() {
    _currentMetrics = AntdScrollMetrics(
      isScrollingUp: offset - previousOffset > 0,
      offset: offset,
      previousOffset: _currentMetrics?.offset ?? position.maxScrollExtent,
      scrollDelta: offset - previousOffset,
      maxScrollExtent: position.maxScrollExtent,
      viewportSize: position.viewportDimension,
    );
  }

  bool updateChildSize(Size size) {
    bool changed = false;

    if (firstChildSize == null) {
      firstChildSize = size;
      changed = true;
    } else {
      final newWidth = max(firstChildSize!.width, size.width);
      final newHeight = max(firstChildSize!.height, size.height);

      if (newWidth != firstChildSize!.width ||
          newHeight != firstChildSize!.height) {
        firstChildSize = Size(newWidth, newHeight);
        changed = true;
      }
    }

    return changed;
  }

  void onMetricsUpdate() {
    _updateMetrics();
    for (final listener in _listeners) {
      listener(_currentMetrics!);
    }
  }

  @override
  void dispose() {
    _listeners.clear();
    _currentMetrics = null;
    super.dispose();
  }
}
