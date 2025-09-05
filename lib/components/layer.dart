import 'dart:async';
import 'dart:collection';

import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

typedef AntdLayerClose = Future<void> Function([dynamic data]);

class AntdLayer {
  static final AntdLayerObserver observer = AntdLayerObserver();
  static final _layerQueue = Queue<_LayerInfo>();

  static String _getWidgetKey(Widget widget) {
    return widget.key?.toString() ?? widget.hashCode.toString();
  }

  static Future<T?> open<T>(Widget widget, {String? layerType}) async {
    final overlay = observer.navigator?.overlay;
    if (overlay == null) {
      AntdLogs.i(
          msg:
              "Navigator context is null, cannot proceed with layer operation. "
              "Please add AntdLayer.observer to your MaterialApp/Navigator observers",
          docUrl: "guide",
          biz: "AntdLayer");
      return null;
    }

    final key = _getWidgetKey(widget);
    final completer = Completer<T?>();
    final entry = OverlayEntry(builder: (context) => widget);

    final layerInfo = _LayerInfo<T?>(
      key: key,
      completer: completer,
      entry: entry,
      type: layerType ?? (widget is AntdLayerMixin ? widget.layerType : null),
      widget: widget,
    );

    _layerQueue.addLast(layerInfo);
    overlay.insert(entry);

    return completer.future.whenComplete(() {
      entry.remove();
    });
  }

  static void _updateCloseMethod(Widget widget, AntdLayerClose closeFn) {
    final key = _getWidgetKey(widget);
    final layerInfo = _layerQueue.cast<_LayerInfo?>().firstWhere(
          (info) => info?.key == key,
          orElse: () => null,
        );
    if (layerInfo != null) {
      layerInfo.closeFn = closeFn;
    }
  }

  static Future<void> closeAll<T>([T? result]) async {
    final queueCopy = List<_LayerInfo>.from(_layerQueue);

    for (var i = queueCopy.length - 1; i >= 0; i--) {
      final info = queueCopy[i];
      await _closeLayer(info, result, true);
    }
  }

  static Future<void> closeByType<T>(String type, [T? result]) async {
    final matchingTypes = _layerQueue.where((e) => e.type == type).toList();
    for (var info in matchingTypes) {
      await _closeLayer(info, result, true);
    }
  }

  static Future<void> closeSingle<T>(Widget widget, [T? result]) async {
    final key = _getWidgetKey(widget);
    final info = _layerQueue.cast<_LayerInfo?>().firstWhere(
          (info) => info?.key == key,
          orElse: () => null,
        );
    if (info != null) {
      await _closeLayer(info, result, false);
    }
  }

  static Future<void> closeByKey<T>(Key key, [T? result]) async {
    final info = _layerQueue.cast<_LayerInfo?>().firstWhere(
          (info) => info?.widget.key == key,
          orElse: () => null,
        );
    if (info != null) {
      await _closeLayer(info, result, true);
    }
  }

  static Future<void> _closeLayer(
      _LayerInfo info, dynamic result, bool closeFu) async {
    if (info.closeFn != null && closeFu) {
      await info.closeFn!(result);
    }
    info.complete(result);
    _layerQueue.remove(info);
  }
}

class _LayerInfo<T> {
  final String key;
  final Completer<T> completer;
  final OverlayEntry entry;
  final String? type;
  final Widget widget;
  AntdLayerClose? closeFn;

  _LayerInfo({
    required this.key,
    required this.completer,
    required this.entry,
    this.type,
    required this.widget,
  });

  void complete(T? result) {
    if (!completer.isCompleted) completer.complete(result);
  }
}

class AntdLayerObserver extends RouteObserver<PageRoute> {}

mixin AntdLayerMixin on Widget {
  String get layerType;
}

abstract class AntdLayerState<Style extends AntdStyle,
    S extends AntdStateComponent<Style, S>> extends AntdState<Style, S> {
  @override
  @protected
  BuildContext get context => super.context;

  @override
  @protected
  S get widget => super.widget;

  @override
  @protected
  void initState() {
    super.initState();
    AntdLayer._updateCloseMethod(widget, buildAntdLayerClose());
  }

  AntdLayerClose buildAntdLayerClose();
}
