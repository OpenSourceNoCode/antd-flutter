import 'package:antd_flutter/index.dart';
import 'package:flutter/material.dart';

/// 样式
/// @l [AntdSwipeAction]
class AntdSwipeActionStyle extends AntdStyle {
  /// 主体样式
  final AntdBoxStyle? bodyStyle;

  ///action的样式
  final AntdSwipeItemStyle? actionStyle;

  const AntdSwipeActionStyle({super.inherit, this.bodyStyle, this.actionStyle});

  @override
  AntdSwipeActionStyle copyFrom(covariant AntdSwipeActionStyle? style) {
    return AntdSwipeActionStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      actionStyle: actionStyle.merge(style?.actionStyle),
    );
  }
}

enum AntdSwipeStatus { left, right, close }

typedef AntdSwipeActionOnChangeStatus = void Function(AntdSwipeStatus status);

///@t 滑动操作
///@g 反馈
///@o 68
///@d 列表的功能扩展。
///@u 通过滑动操作来展示隐藏的功能菜单。
class AntdSwipeAction
    extends AntdStateComponent<AntdSwipeActionStyle, AntdSwipeAction> {
  ///操作按钮列表
  final List<AntdSwipeItem>? items;

  ///内容
  final Widget child;

  ///滑动到达阈值直接打开
  final double? openThreshold;

  ///动画周期
  final Duration duration;

  ///是否在点击操作按钮时自动归位
  final bool? closeOnAction;

  /// 打开
  final AntdSwipeActionOnChangeStatus? onChange;

  ///控制器
  final AntdSwipeActionController? controller;

  const AntdSwipeAction(
      {super.key,
      super.style,
      super.styleBuilder,
      this.items,
      required this.child,
      this.openThreshold = 0.01,
      this.duration = const Duration(milliseconds: 200),
      this.closeOnAction = true,
      this.onChange,
      this.controller});

  @override
  AntdSwipeActionStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdSwipeActionStyle(
        actionStyle: AntdSwipeItemStyle(
            style: AntdBoxStyle(
                alignment: Alignment.center,
                color: token.colorWhite,
                padding: token.size.default_.vertical
                    .marge(token.size.xl.horizontal),
                textStyle: token.font.xl)),
        bodyStyle: AntdBoxStyle(
          color: token.colorWhite,
        ));
  }

  @override
  AntdSwipeActionStyle margeStyle(
      AntdSwipeActionStyle defaultStyle, AntdSwipeActionStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdSwipeActionState();
  }

  @override
  AntdStyleBuilder<AntdSwipeActionStyle, AntdSwipeAction>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.swipeActionStyle;
  }

  @override
  AntdSwipeAction getWidget(BuildContext context) {
    return this;
  }
}

class _AntdSwipeActionState<T>
    extends AntdState<AntdSwipeActionStyle, AntdSwipeAction>
    with TickerProviderStateMixin {
  final List<double> _totalWidths = [0, 0];
  AntdSwipeStatus status = AntdSwipeStatus.close;

  late final AnimationController _offsetController =
      AnimationController.unbounded(vsync: this, duration: widget.duration);
  Size contentSize = Size.zero;

  double _beforeOffset = 0;
  bool _isOpen = false;
  void updateDragPosition(double offset) {
    double newOffset = _offsetController.value + offset;
    if (newOffset < 0) {
      _isOpen = newOffset < _beforeOffset;
      if (newOffset < -_totalWidths[1]) {
        return;
      }
    }
    if (newOffset > 0) {
      _isOpen = newOffset > _beforeOffset;
      if (newOffset > _totalWidths[0]) {
        return;
      }
    }

    _offsetController.value = newOffset;
    _beforeOffset = newOffset;
  }

  void _openLeft() async {
    _springAnimation(_totalWidths[0]);
    status = AntdSwipeStatus.left;
    widget.onChange?.call(AntdSwipeStatus.left);
  }

  void _openRight() async {
    _springAnimation(-_totalWidths[1]);
    status = AntdSwipeStatus.right;
    widget.onChange?.call(AntdSwipeStatus.right);
  }

  _springAnimation(double target) {
    var spring = ScrollSpringSimulation(
      const SpringDescription(
        mass: 1,
        stiffness: 200.0,
        damping: 60.0,
      ),
      _offsetController.value,
      target,
      30,
    );
    _offsetController.reset();
    _offsetController.animateWith(spring);
  }

  void _close() {
    _springAnimation(0);
    widget.onChange?.call(AntdSwipeStatus.close);
  }

  @override
  void initState() {
    super.initState();
    widget.controller?._registerState(widget.key, this);
  }

  @override
  void dispose() {
    status = AntdSwipeStatus.close;
    _totalWidths.clear();
    _offsetController.dispose();
    widget.controller?._unregisterState(widget.key, this);
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    return AntdStyleProvider<AntdSwipeItemStyle>(
        style: style.actionStyle,
        child: Stack(
          children: [
            Positioned.fill(
                left: 0,
                child: AntdSwipeItems(
                  applyOffset: (offset) {
                    return offset > 0 ? offset : 0;
                  },
                  builder: (position, child) {
                    return Positioned.fill(
                        left: position, right: null, child: child);
                  },
                  items:
                      widget.items?.where((item) => item.left).toList() ?? [],
                  onTap: (item, index) {
                    if (widget.closeOnAction == true) _close();
                  },
                  offsetController: _offsetController,
                  onTotalWidth: (total) {
                    _totalWidths[0] = total;
                  },
                  reversed: true,
                  duration: widget.duration,
                )),
            Positioned.fill(
                right: 0,
                child: AntdSwipeItems(
                  applyOffset: (offset) {
                    return offset < 0 ? offset : 0;
                  },
                  builder: (position, child) {
                    return Positioned.fill(
                        left: null, right: position, child: child);
                  },
                  items:
                      widget.items?.where((item) => !item.left).toList() ?? [],
                  onTap: (item, index) {
                    if (widget.closeOnAction == true) _close();
                  },
                  offsetController: _offsetController,
                  onTotalWidth: (total) {
                    _totalWidths[1] = total;
                  },
                  duration: widget.duration,
                )),
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                updateDragPosition(details.delta.dx);
              },
              onHorizontalDragEnd: (details) {
                var offset = _offsetController.value;
                var width = offset > 0 ? _totalWidths[0] : _totalWidths[1];
                final double openThreshold = widget.openThreshold! * width;
                if (_isOpen) {
                  if (offset.abs() >= openThreshold) {
                    if (offset > 0) {
                      _openLeft();
                    } else {
                      _openRight();
                    }
                  } else {
                    _close();
                  }
                  return;
                } else {
                  if ((width - offset.abs()) > openThreshold) {
                    _close();
                  }
                }
              },
              child: AnimatedBuilder(
                  animation: _offsetController,
                  builder: (context, _) {
                    Widget child = AntdBox(
                      style: style.bodyStyle,
                      onLayout: (context) {
                        contentSize = context.renderBox.size;
                      },
                      child: widget.child,
                    );
                    return Transform.translate(
                      offset: Offset(_offsetController.value, 0),
                      child: child,
                    );
                  }),
            ),
          ],
        ));
  }
}

class AntdSwipeActionController {
  final Map<Key, _AntdSwipeActionState> _actionStates = {};

  void _registerState(Key? key, _AntdSwipeActionState state) {
    if (key == null) {
      return;
    }
    _actionStates[key] = state;
  }

  void _unregisterState(Key? key, _AntdSwipeActionState state) {
    if (key == null) {
      return;
    }
    var state_ = _actionStates[key];
    if (state_ == null) {
      return;
    }
    if (state_ != state) {
      return;
    }
    _actionStates.remove(key);
  }

  void closeAll(List<Key>? excludeKeys) {
    for (final key in _actionStates.keys) {
      if (excludeKeys?.contains(key) == true) {
        continue;
      }
      _actionStates[key]!._close();
    }
  }

  void closeItem(Key? itemKey) {
    if (itemKey == null || !_actionStates.containsKey(itemKey)) {
      return;
    }
    _actionStates[itemKey]?._close();
  }

  void openLeft(Key? itemKey,
      {bool closeOthers = false, bool closeAllTypes = false}) {
    _performSwipeAction(
      itemKey,
      action: (state) => state._openLeft(),
      closeOthers: closeOthers,
      closeAllTypes: closeAllTypes,
    );
  }

  void openRight(Key? itemKey,
      {bool closeOthers = false, bool closeAllTypes = false}) {
    _performSwipeAction(
      itemKey,
      action: (state) => state._openRight(),
      closeOthers: closeOthers,
      closeAllTypes: closeAllTypes,
    );
  }

  void _performSwipeAction(
    Key? itemKey, {
    required void Function(_AntdSwipeActionState) action,
    bool closeOthers = false,
    bool closeAllTypes = false,
  }) {
    if (itemKey == null || !_actionStates.containsKey(itemKey)) {
      return;
    }

    if (closeOthers) {
      _closeOtherItems(currentKey: itemKey, closeAllTypes: closeAllTypes);
    }

    action(_actionStates[itemKey]!);
  }

  void _closeOtherItems({required Key currentKey, bool closeAllTypes = false}) {
    for (final key in _actionStates.keys) {
      if (key != currentKey) {
        final state = _actionStates[key];
        if (closeAllTypes || state?.status == AntdSwipeStatus.left) {
          state?._close();
        }
      }
    }
  }
}
