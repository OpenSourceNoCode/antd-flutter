import 'dart:math';

import 'package:antd_flutter/index.dart';
import 'package:flutter/widgets.dart';

enum AntdPullToRefreshStatus {
  init,
  normal,
  pulling,
  release,
  refreshing,
  completion,
  finish
}

typedef AntdPullToRefreshOnChange = void Function(
    AntdPullToRefreshStatus status);

///@t 下拉刷新
///@g 反馈
///@o 78
///@d 在列表中通过手指下拉刷新加载新内容的交互操作。
///@u 适用于对当前页面进行内容更新。
class AntdPullToRefresh
    extends AntdStateComponent<AntdBoxStyle, AntdPullToRefresh> {
  const AntdPullToRefresh(
      {super.key,
      super.style,
      super.styleBuilder,
      this.initialPrompt = const Text("用力下拉触发刷新"),
      this.initialDelay,
      required this.child,
      this.releasePrompt = const Text("释放立即刷新"),
      this.completionDelay = const Duration(milliseconds: 1000),
      this.completionPrompt = const Text("刷新成功"),
      this.onRefresh,
      this.pullingPrompt = const Text("用力下拉触发刷新"),
      this.refreshingPrompt = const Text("加载中..."),
      this.duration = const Duration(milliseconds: 200),
      this.onChange});

  /// 初始状态下显示的提示内容
  final Widget? initialPrompt;

  /// 初始提示内容的展示持续时间
  final Duration? initialDelay;

  /// 主要内容区域
  final Widget child;

  /// 可释放刷新时显示的提示内容
  final Widget? releasePrompt;

  /// 刷新完成后提示内容的展示持续时间
  final Duration completionDelay;

  /// 刷新完成时显示的提示内容
  final Widget? completionPrompt;

  /// 刷新触发时的异步回调函数
  final FutureVoidCallback? onRefresh;

  /// 下拉过程中显示的提示内容
  final Widget? pullingPrompt;

  /// 正在刷新时显示的提示内容
  final Widget? refreshingPrompt;

  /// 动画周期
  final Duration duration;

  ///事件
  final AntdPullToRefreshOnChange? onChange;

  @override
  AntdBoxStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var style = AntdBoxStyle(
        alignment: Alignment.bottomCenter,
        textStyle: TextStyle(
            fontSize: token.fontSize, color: token.colorTextSecondary),
        padding: token.size.default_.vertical);
    return margeStyle(
        style, theme.pullToRefreshStyle?.call(context, this, style, token));
  }

  @override
  AntdBoxStyle margeStyle(AntdBoxStyle defaultStyle, AntdBoxStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdBoxStyle, AntdPullToRefresh>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.pullToRefreshStyle;
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdPullToRefreshState();
  }

  @override
  AntdPullToRefresh getWidget(BuildContext context) {
    return this;
  }
}

class _AntdPullToRefreshState extends AntdState<AntdBoxStyle, AntdPullToRefresh>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController.unbounded(vsync: this, duration: widget.duration);
  Size _initialSize = Size.zero;
  Size _releaseSize = Size.zero;
  Size _pullingSize = Size.zero;
  Size _refreshingSize = Size.zero;
  Size _completionSize = Size.zero;

  late AntdPullToRefreshStatus _status = widget.initialDelay != null
      ? AntdPullToRefreshStatus.init
      : AntdPullToRefreshStatus.normal;
  double _currentOffset = 0;

  @override
  void initState() {
    super.initState();
    _animationController.value = 0;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _setOffset(double offset) {
    _animationController.value = offset;
    _currentOffset = offset;
  }

  _setAnimation(double offset) {
    _animationController.animateTo(offset,
        duration: widget.duration, curve: Curves.easeOut);
    _currentOffset = offset;
  }

  _setStatus(AntdPullToRefreshStatus status) {
    if (_status == status) {
      return;
    }
    widget.onChange?.call(status);
    _status = status;
    setState(() {});
  }

  void _springAnimation(double velocity) {
    final simulation = BouncingScrollSimulation(
      position: _currentOffset,
      velocity: velocity,
      leadingExtent: 0,
      trailingExtent: 0,
      spring: const SpringDescription(mass: 0.5, stiffness: 500, damping: 20),
    );
    _animationController.reset();
    _animationController.animateWith(simulation);
    _currentOffset = 0;
  }

  void dragStop(double velocity) async {
    if (_status == AntdPullToRefreshStatus.refreshing ||
        _status == AntdPullToRefreshStatus.completion) {
      return;
    }

    if (_status != AntdPullToRefreshStatus.release) {
      _springAnimation(velocity);
      return;
    }

    _setStatus(AntdPullToRefreshStatus.refreshing);
    if (widget.onRefresh != null) {
      await widget.onRefresh!();
    }

    _setStatus(AntdPullToRefreshStatus.completion);
    Future.delayed(widget.completionDelay, () {
      _setStatus(AntdPullToRefreshStatus.finish);
      if (mounted) {
        _springAnimation(velocity);
      }
    });
  }

  void dragStart(double offset) {
    if (_status != AntdPullToRefreshStatus.normal &&
        _status != AntdPullToRefreshStatus.pulling &&
        _status != AntdPullToRefreshStatus.release &&
        _status != AntdPullToRefreshStatus.finish) {
      return;
    }
    double relaOffset = 0.0;

    relaOffset = _currentOffset + offset;

    if (offset < 0) {
      if (relaOffset <= _pullingSize.height) {
        _setStatus(AntdPullToRefreshStatus.pulling);
      }
      _setOffset(max(relaOffset, 0));
      return;
    }
    _setStatus(AntdPullToRefreshStatus.pulling);
    if (relaOffset > _pullingSize.height) {
      var scale =
          (1 - (relaOffset - _pullingSize.height) / 100).clamp(0.1, 1.0);
      offset = offset * scale;
      relaOffset = _currentOffset + offset;
      if (relaOffset > _pullingSize.height + 20) {
        _setStatus(AntdPullToRefreshStatus.release);
      }
    }

    _setOffset(relaOffset);
  }

  @override
  Widget render(BuildContext context) {
    return ClipPath(
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          dragStart(details.delta.dy);
        },
        onVerticalDragEnd: (details) {
          dragStop(details.velocity.pixelsPerSecond.dy);
        },
        child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is OverscrollNotification) {
                if (notification.overscroll > 0) {
                  return false;
                }
                dragStart(notification.overscroll.abs());
              }
              if (notification is ScrollUpdateNotification) {
                if (notification.metrics.pixels >=
                    notification.metrics.minScrollExtent) {
                  return false;
                }
                dragStart(notification.scrollDelta!.abs());
              }
              if (notification is ScrollEndNotification) {
                dragStop(
                    notification.dragDetails?.velocity.pixelsPerSecond.dy ?? 0);
              }
              return false;
            },
            child: Stack(
              children: [
                if (_status == AntdPullToRefreshStatus.init)
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: AntdBox(
                        onLayout: (ctx) {
                          _initialSize = ctx.renderBox.size;
                          if (widget.initialDelay != null) {
                            _setAnimation(_initialSize.height);
                            _setStatus(AntdPullToRefreshStatus.init);
                            Future.delayed(widget.initialDelay!, () {
                              _setAnimation(0);
                              _setStatus(AntdPullToRefreshStatus.normal);
                            });
                          }
                        },
                        child: widget.initialPrompt,
                      )),
                if (_status == AntdPullToRefreshStatus.pulling)
                  AntdBox(
                    onLayout: (ctx) {
                      _pullingSize = ctx.renderBox.size;
                    },
                    child: widget.pullingPrompt,
                  ),
                if (_status == AntdPullToRefreshStatus.release)
                  AntdBox(
                    onLayout: (ctx) {
                      _releaseSize = ctx.renderBox.size;
                      if (_releaseSize.height > _currentOffset) {
                        _setAnimation(_releaseSize.height);
                      }
                    },
                    child: widget.releasePrompt,
                  ),
                if (_status == AntdPullToRefreshStatus.refreshing)
                  AntdBox(
                    onLayout: (ctx) {
                      _refreshingSize = ctx.renderBox.size;
                      _setAnimation(_refreshingSize.height);
                    },
                    child: widget.refreshingPrompt,
                  ),
                if (_status == AntdPullToRefreshStatus.completion)
                  AntdBox(
                    onLayout: (ctx) {
                      _completionSize = ctx.renderBox.size;
                      _setAnimation(_completionSize.height);
                    },
                    child: widget.completionPrompt,
                  ),
                AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, _) {
                      return Transform.translate(
                        offset: Offset(0, _animationController.value),
                        child: widget.child,
                      );
                    }),
              ],
            )),
      ),
    );
  }
}
