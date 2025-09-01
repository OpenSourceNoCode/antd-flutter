import 'dart:async';

import 'package:antd_flutter_mobile/components/box/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AntdTapOptions {
  /// 点击测试行为（决定组件如何响应命中测试，如透明区域是否可点击）
  final HitTestBehavior behavior;

  /// 触摸滑动阈值（单位：逻辑像素，触摸移动超过该距离则不再视为点击）
  final double touchSlop;

  /// 双击事件的时间窗口（单位：毫秒，两次点击间隔小于该值视为双击）
  final int doubleTapTimeout;

  /// 长按触发时间（单位：毫秒，按压持续时间超过该值触发长按事件）
  final int longPressTimeout;

  /// 是否总是触发 tap 事件（即使同时存在拖动/缩放等手势）
  final bool alwaysTriggerTap;

  /// 是否允许事件坐标偏移（用于处理触摸点与渲染位置偏差的场景）
  final bool allowOffset;

  /// 是否禁用所有手势交互（true 时组件将不会响应任何手势）
  final bool disabled;

  /// 事件节流时长（避免高频事件触发，如限制滚动事件的触发频率）
  final Duration? throttle;

  /// 事件防抖时长（延迟触发事件，如搜索框输入停止后才触发搜索）
  final Duration? debounce;

  /// 触觉反馈类型（用户交互时设备的震动反馈强度，如 light/medium/heavy）
  final AntdHapticFeedback? hapticFeedback;

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
      this.hapticFeedback});

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
      hapticFeedback: options?.hapticFeedback ?? hapticFeedback,
    );
  }

  AntdTapOptions copyWith({
    HitTestBehavior? behavior,
    double? touchSlop,
    int? doubleTapTimeout,
    int? longPressTimeout,
    bool? alwaysTriggerTap,
    bool? allowOffset,
    bool? disabled,
    Duration? throttle,
    Duration? debounce,
    AntdHapticFeedback? hapticFeedback,
  }) {
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
      hapticFeedback: hapticFeedback ?? this.hapticFeedback,
    );
  }
}

class AntdTapHandler {
  AntdTapOptions options;

  VoidCallback? _tapHandler;
  VoidCallback? _doubleTapHandler;
  VoidCallback? _longPressHandler;

  Timer? _longPressTimer;
  Timer? _debounceTimer;
  Timer? _tapTimer;
  DateTime? _lastTapTime;
  int _consecutiveTaps = 0;
  DateTime? _lastThrottleTime;
  bool _longPressTriggered = false;
  Offset? _pointerDownPosition;

  ValueChanged<bool>? onTouchStateChange;
  bool _isTouching = false;
  bool _inProtectionPeriod = false;
  Timer? _protectionTimer;

  AntdTapHandler({required this.options, this.onTouchStateChange});

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

  void handlePointerDown(TapDownDetails details) {
    if (options.disabled) return;

    _longPressTriggered = false;
    _updateTouchState(true);
    _pointerDownPosition = details.localPosition;

    if (_longPressHandler != null) {
      _longPressTimer = Timer(
          Duration(milliseconds: options.longPressTimeout), _handleLongPress);
    }
  }

  void handlePointerUp(TapUpDetails details) {
    if (options.disabled) {
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

  bool _shouldAllowTap(TapUpDetails details) {
    return options.allowOffset ||
        options.alwaysTriggerTap ||
        _checkValidTap(details);
  }

  void handlePointerCancel() {
    _updateTouchState(false);
    _longPressTimer?.cancel();
    _resetTapState();
  }

  bool _checkValidTap(TapUpDetails details) {
    if (options.allowOffset) return true;

    if (options.alwaysTriggerTap) return true;

    if (_pointerDownPosition == null) return false;
    final offset = details.localPosition - _pointerDownPosition!;
    return offset.distance <= options.touchSlop;
  }

  void _handleTapSequence() {
    if (_doubleTapHandler == null) {
      _triggerTap();
      return;
    }
    if (options.alwaysTriggerTap) {
      _triggerTap();
    }
    final now = DateTime.now();

    final isDoubleTap = _lastTapTime != null &&
        now.difference(_lastTapTime!) <
            Duration(milliseconds: options.doubleTapTimeout);

    _consecutiveTaps = isDoubleTap ? _consecutiveTaps + 1 : 1;
    _lastTapTime = now;

    if (_consecutiveTaps == 2) {
      _tapTimer?.cancel();
      if (!_longPressTriggered) _triggerDoubleTap();
    } else if (_tapHandler == null) {
      _tapTimer?.cancel();
      _tapTimer = Timer(
        Duration(milliseconds: options.doubleTapTimeout),
        () {
          if (_consecutiveTaps == 1 &&
              (!_longPressTriggered || options.alwaysTriggerTap)) {
            _triggerTap();
          }
          _resetTapState();
        },
      );
    }
  }

  void _triggerTap() {
    if (options.disabled ||
        (_longPressTriggered && !options.alwaysTriggerTap)) {
      return;
    }
    _handleHapticFeedback();
    _debounce(() {
      _tapHandler?.call();
    });
  }

  void _triggerDoubleTap() {
    if (options.disabled || _longPressTriggered) return;
    _handleHapticFeedback();
    _throttle(() {
      _doubleTapHandler?.call();
    });
  }

  void _handleLongPress() {
    if (options.disabled) return;
    _longPressTriggered = true;
    _handleHapticFeedback();
    _debounce(() {
      _longPressHandler?.call();
    });
  }

  void _handleHapticFeedback() {
    switch (options.hapticFeedback) {
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

  void _debounce(VoidCallback callback) {
    if (options.debounce == null) {
      callback();
      return;
    }
    _debounceTimer?.cancel();
    _debounceTimer = Timer(options.debounce!, callback);
  }

  void _throttle(VoidCallback callback) {
    if (options.throttle == null) {
      callback();
      return;
    }
    final now = DateTime.now();
    if (_lastThrottleTime == null ||
        now.difference(_lastThrottleTime!) > options.throttle!) {
      _lastThrottleTime = now;
      callback();
    }
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

    _protectionTimer = Timer(const Duration(milliseconds: 200), () {
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
    _debounceTimer?.cancel();
    _tapTimer?.cancel();
  }
}
