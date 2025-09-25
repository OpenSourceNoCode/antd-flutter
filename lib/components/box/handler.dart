import 'dart:async';

import 'package:antd_flutter_mobile/components/box/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void handleHapticFeedback(AntdHapticFeedback? hapticFeedback) {
  switch (hapticFeedback) {
    case AntdHapticFeedback.light:
      HapticFeedback.lightImpact();
    case AntdHapticFeedback.medium:
      HapticFeedback.mediumImpact();
    case AntdHapticFeedback.heavy:
      HapticFeedback.heavyImpact();
    default:
      break;
  }
}

class AntdTapOptions {
  /// 点击测试行为（决定组件如何响应命中测试，如透明区域是否可点击）
  final HitTestBehavior behavior;

  /// 触摸滑动阈值（单位：逻辑像素，触摸移动超过该距离则不再视为点击）
  final double touchSlop;

  /// 双击事件的时间窗口（单位：毫秒，两次点击间隔小于该值视为双击）
  final int doubleTapTimeout;

  /// 长按触发时间（单位：毫秒，按压持续时间超过该值触发长按事件）
  final int longPressTimeout;

  /// 当使用双击和长按以及穿透是否触发 tap
  final bool alwaysTriggerTap;

  /// 是否允许事件坐标偏移（用于处理触摸点与渲染位置偏差的场景）
  final bool allowOffset;

  /// 是否禁用所有手势交互（true 时组件将不会响应任何手势）
  final bool disabled;

  /// 事件节流时长（避免高频事件触发，如限制滚动事件的触发频率）
  final Duration? throttle;

  /// 事件防抖时长（延迟触发事件，如搜索框输入停止后才触发搜索）
  final Duration? debounce;

  /// 反馈的时长(反馈样式发生时保持的时间)
  final Duration feedbackDuration;

  /// 触觉反馈类型（用户交互时设备的震动反馈强度，如 light/medium/heavy）
  final AntdHapticFeedback? hapticFeedback;

  ///一直接收触摸
  final bool alwaysReceiveTap;

  const AntdTapOptions(
      {this.behavior = HitTestBehavior.deferToChild,
      this.touchSlop = 8.0,
      this.doubleTapTimeout = 300,
      this.longPressTimeout = 200,
      this.alwaysTriggerTap = false,
      this.allowOffset = false,
      this.disabled = false,
      this.throttle,
      this.debounce,
      this.hapticFeedback,
      this.feedbackDuration = const Duration(milliseconds: 200),
      this.alwaysReceiveTap = false});

  AntdTapOptions copyFrom(AntdTapOptions? options) {
    return copyWith(
      behavior: options?.behavior ?? behavior,
      touchSlop: options?.touchSlop ?? touchSlop,
      doubleTapTimeout: options?.doubleTapTimeout ?? doubleTapTimeout,
      longPressTimeout: options?.longPressTimeout ?? longPressTimeout,
      alwaysTriggerTap: options?.alwaysTriggerTap ?? alwaysTriggerTap,
      allowOffset: options?.allowOffset ?? allowOffset,
      disabled: options?.disabled ?? disabled,
      throttle: options?.throttle ?? throttle,
      debounce: options?.debounce ?? debounce,
      feedbackDuration: options?.feedbackDuration ?? feedbackDuration,
      hapticFeedback: options?.hapticFeedback ?? hapticFeedback,
      alwaysReceiveTap: options?.alwaysReceiveTap ?? alwaysReceiveTap,
    );
  }

  AntdTapOptions copyWith(
      {HitTestBehavior? behavior,
      double? touchSlop,
      int? doubleTapTimeout,
      int? longPressTimeout,
      bool? alwaysTriggerTap,
      bool? allowOffset,
      bool? disabled,
      Duration? throttle,
      Duration? debounce,
      Duration? feedbackDuration,
      AntdHapticFeedback? hapticFeedback,
      bool? alwaysReceiveTap}) {
    return AntdTapOptions(
        behavior: behavior ?? this.behavior,
        touchSlop: touchSlop ?? this.touchSlop,
        doubleTapTimeout: doubleTapTimeout ?? this.doubleTapTimeout,
        longPressTimeout: longPressTimeout ?? this.longPressTimeout,
        alwaysTriggerTap: alwaysTriggerTap ?? this.alwaysTriggerTap,
        allowOffset: allowOffset ?? this.allowOffset,
        disabled: disabled ?? this.disabled,
        throttle: throttle ?? this.throttle,
        debounce: debounce ?? this.debounce,
        feedbackDuration: feedbackDuration ?? this.feedbackDuration,
        hapticFeedback: hapticFeedback ?? this.hapticFeedback,
        alwaysReceiveTap: alwaysReceiveTap ?? this.alwaysReceiveTap);
  }
}

class AntdThrottleDebouncer {
  final Duration? throttle;
  final Duration? debounce;

  Timer? _timer;
  DateTime? _lastExecutionTime;
  bool _isDebouncing = false;

  AntdThrottleDebouncer({this.throttle, this.debounce});

  void run(VoidCallback callback) {
    if (throttle != null) {
      _runWithThrottle(callback);
    } else if (debounce != null) {
      _runWithDebounce(callback);
    } else {
      callback();
    }
  }

  void _runWithThrottle(VoidCallback callback) {
    final now = DateTime.now();
    if (_lastExecutionTime == null ||
        now.difference(_lastExecutionTime!) > throttle!) {
      _lastExecutionTime = now;
      callback();
    }
  }

  void _runWithDebounce(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(debounce!, () {
      _isDebouncing = false;
      callback();
    });
    _isDebouncing = true;
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
    _isDebouncing = false;
  }

  bool get isActive => _timer?.isActive == true || _isDebouncing;

  void dispose() {
    cancel();
    _lastExecutionTime = null;
  }
}

class AntdTapEventRegistry {
  final Set<int> _registeredDownPointers = {};
  final Set<int> _registeredUpPointers = {};

  bool register(PointerEvent event) {
    if (event.down) {
      return _registeredDownPointers.add(event.pointer);
    } else {
      return _registeredUpPointers.add(event.pointer);
    }
  }
}

class AntdTapEventRegistryProvider extends InheritedWidget {
  final AntdTapEventRegistry registry;

  const AntdTapEventRegistryProvider(
      {super.key, required super.child, required this.registry});

  @override
  bool updateShouldNotify(covariant AntdTapEventRegistryProvider oldWidget) {
    return registry != oldWidget.registry;
  }

  static AntdTapEventRegistryProvider? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AntdTapEventRegistryProvider>();
  }
}

class AntdTapHandler {
  BuildContext context;
  AntdTapOptions options;
  AntdTapEventRegistry registry;

  VoidCallback? _tapHandler;
  VoidCallback? _doubleTapHandler;
  VoidCallback? _longPressHandler;

  Timer? _longPressTimer;
  Timer? _tapTimer;
  DateTime? _lastTapTime;
  int _consecutiveTaps = 0;
  bool _longPressTriggered = false;
  Offset? _pointerDownPosition;

  ValueChanged<bool>? onTouchStateChange;
  bool _isTouching = false;
  bool _inProtectionPeriod = false;
  Timer? _protectionTimer;

  final AntdThrottleDebouncer _throttleDebouncer;

  AntdTapHandler(
      {required this.context,
      required this.registry,
      required this.options,
      this.onTouchStateChange})
      : _throttleDebouncer = AntdThrottleDebouncer(
          throttle: options.throttle,
          debounce: options.debounce,
        );

  set tapHandler(VoidCallback? value) {
    _tapHandler = value;
  }

  set doubleTapHandler(VoidCallback? value) {
    _doubleTapHandler = value;
  }

  set longPressHandler(VoidCallback? value) {
    _longPressHandler = value;
  }

  bool get hasHandlers =>
      _tapHandler != null ||
      _doubleTapHandler != null ||
      _longPressHandler != null;

  bool _checkPointerPremiss(PointerEvent event) {
    var registered = registry.register(event);
    return registered || options.alwaysReceiveTap;
  }

  void handlePointerDown(PointerDownEvent details) {
    if (options.disabled) return;
    if (!_checkPointerPremiss(details)) {
      return;
    }

    print("ref:${registry.hashCode}");
    _longPressTriggered = false;
    _updateTouchState(true);
    _pointerDownPosition = details.localPosition;

    if (_longPressHandler != null) {
      _longPressTimer = Timer(
          Duration(milliseconds: options.longPressTimeout), _handleLongPress);
    }
  }

  void handlePointerUp(PointerUpEvent details) {
    if (options.disabled) {
      return;
    }

    if (!_checkPointerPremiss(details)) {
      return;
    }
    _updateTouchState(false);
    _longPressTimer?.cancel();

    if (!_shouldAllowTap(details)) {
      _resetTapState();
      return;
    }

    _handleTapSequence();
  }

  bool _shouldAllowTap(PointerUpEvent details) {
    if (!options.allowOffset) {
      if (_pointerDownPosition == null) {
        return false;
      }
      final offset = details.localPosition - _pointerDownPosition!;
      return offset.distance <= options.touchSlop;
    }
    return true;
  }

  void handlePointerCancel() {
    _updateTouchState(false);
    _longPressTimer?.cancel();
    _resetTapState();
  }

  void _handleTapSequence() {
    if (_doubleTapHandler == null) {
      _triggerTap();
      return;
    }

    final now = DateTime.now();

    final isDoubleTap = _lastTapTime != null &&
        now.difference(_lastTapTime!) <
            Duration(milliseconds: options.doubleTapTimeout);

    _consecutiveTaps = isDoubleTap ? _consecutiveTaps + 1 : 1;
    _lastTapTime = now;

    if (_consecutiveTaps == 2) {
      _tapTimer?.cancel();
      if (!_longPressTriggered) {
        _triggerDoubleTap();
      }
    } else if (_tapHandler != null) {
      _tapTimer?.cancel();
      _tapTimer = Timer(
        Duration(milliseconds: options.doubleTapTimeout),
        () {
          if (_consecutiveTaps == 1 && !_longPressTriggered) {
            _triggerTap();
          }
          _resetTapState();
        },
      );
    }
  }

  void _triggerTap() {
    if (options.disabled || _longPressTriggered) {
      return;
    }
    _executeCallback(_tapHandler);
  }

  void _triggerDoubleTap() {
    if (options.disabled || _longPressTriggered) return;
    _executeCallback(_doubleTapHandler);
  }

  void _handleLongPress() {
    _longPressTriggered = true;
    _executeCallback(_longPressHandler);
  }

  void _executeCallback(VoidCallback? callback) {
    if (callback == null) return;

    _throttleDebouncer.run(() {
      handleHapticFeedback(options.hapticFeedback);
      if (callback != _tapHandler && options.alwaysTriggerTap) {
        _tapHandler?.call();
      }
      callback();
    });
  }

  void _updateTouchState(bool touching) {
    if (_isTouching == touching) {
      return;
    }

    _isTouching = touching;
    if (_inProtectionPeriod) {
      return;
    }
    if (touching) {
      _startProtectionPeriod();
    }

    onTouchStateChange?.call(_isTouching);
  }

  void _startProtectionPeriod() {
    _protectionTimer?.cancel();
    _inProtectionPeriod = true;

    _protectionTimer = Timer(options.feedbackDuration, () {
      _inProtectionPeriod = false;
      if (!_isTouching) {
        onTouchStateChange?.call(false);
      }
    });
  }

  void _resetTapState() {
    _consecutiveTaps = 0;
    _pointerDownPosition = null;
    _longPressTriggered = false;
  }

  void dispose() {
    _protectionTimer?.cancel();
    _longPressTimer?.cancel();
    _tapTimer?.cancel();
    _throttleDebouncer.dispose();

    _protectionTimer = null;
    _longPressTimer = null;
    _tapTimer = null;
  }

  Widget wrap(Widget child) {
    return Listener(
      behavior: options.behavior,
      onPointerDown: handlePointerDown,
      onPointerUp: handlePointerUp,
      onPointerCancel: (detail) {
        handlePointerCancel();
      },
      child: child,
    );
  }
}
