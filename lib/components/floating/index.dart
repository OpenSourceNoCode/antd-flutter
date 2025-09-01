import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

/// 浮动面板(FloatingPanel)的样式配置
/// @l [AntdFloatingPanel]
class AntdFloatingPanelStyle extends AntdStyle {
  /// 面板内容区域的样式（背景色、内边距等）
  final AntdBoxStyle? bodyStyle;

  /// 面板头部的样式（高度、背景色等）
  final AntdBoxStyle? headerStyle;

  /// 拖拽指示器的样式（高度、颜色等）
  final AntdBoxStyle? indicatorStyle;

  const AntdFloatingPanelStyle({
    super.inherit,
    this.bodyStyle,
    this.headerStyle,
    this.indicatorStyle,
  });

  @override
  AntdFloatingPanelStyle copyFrom(covariant AntdFloatingPanelStyle? style) {
    return AntdFloatingPanelStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      headerStyle: headerStyle.merge(style?.headerStyle),
      indicatorStyle: indicatorStyle.merge(style?.indicatorStyle),
    );
  }
}

typedef AntdFloatingPanelHeightCallback = void Function(double height);

enum AntdFloatingPanelPosition { top, bottom }

///@t 浮动面板
///@g 信息展示
///@o 89
///@d 内容型面板。
///@u 用户可自由灵活上下滑动浏览内容，常用于地图导航。
class AntdFloatingPanel
    extends AntdStateComponent<AntdFloatingPanelStyle, AntdFloatingPanel> {
  const AntdFloatingPanel(
      {super.key,
      super.style,
      super.styleBuilder,
      required this.child,
      this.content,
      this.anchors,
      this.indicator,
      this.onHeightChange,
      this.position = AntdFloatingPanelPosition.bottom});

  ///子类
  final Widget child;

  ///内容
  final Widget? content;

  ///可拖拽至哪些高度,屏幕百分比
  final List<double>? anchors;

  ///指示灯
  final Widget? indicator;

  ///高度变化
  final AntdFloatingPanelHeightCallback? onHeightChange;

  ///面板的位置
  final AntdFloatingPanelPosition position;

  @override
  State<StatefulWidget> createState() {
    return _AntdFloatingPanelState();
  }

  @override
  AntdFloatingPanelStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdFloatingPanelStyle(
        bodyStyle: AntdBoxStyle(radius: token.radius.default_.radius.all),
        headerStyle: AntdBoxStyle(
            alignment: Alignment.center,
            color: token.colorWhite,
            padding: token.size.lg.vertical),
        indicatorStyle: AntdBoxStyle(
            radius: token.radius.default_.radius.all,
            height: 4,
            width: 20,
            color: token.colorFill));
  }

  @override
  AntdFloatingPanelStyle margeStyle(
      AntdFloatingPanelStyle defaultStyle, AntdFloatingPanelStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdFloatingPanelStyle, AntdFloatingPanel>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.floatingPanelStyle;
  }

  @override
  AntdFloatingPanel getWidget(BuildContext context) {
    return this;
  }
}

class _AntdFloatingPanelState
    extends AntdState<AntdFloatingPanelStyle, AntdFloatingPanel>
    with SingleTickerProviderStateMixin {
  double _initHeight = 0;
  double _currentOffset = 0;
  double maxOffset = 0;
  double minOffset = 0;
  List<double> _rangeHeightList = [];
  late final AnimationController _animationController =
      AnimationController.unbounded(
          vsync: this, duration: const Duration(milliseconds: 200));
  bool forward = false;

  @override
  void initState() {
    super.initState();
    _setAnimation(0, false);
  }

  _setAnimation(double offset, bool call) {
    _animationController.value = offset;
    _currentOffset = offset;
    if (call) {
      widget.onHeightChange?.call(_currentOffset);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double getEndOffset() {
    if (_rangeHeightList.isEmpty) {
      return _currentOffset.clamp(
        minOffset,
        maxOffset,
      );
    }

    final sortedAnchors = [..._rangeHeightList]..sort();
    if (forward) {
      for (int i = sortedAnchors.length - 1; i >= 0; i--) {
        if (sortedAnchors[i] < _currentOffset) {
          return sortedAnchors[i];
        }
      }
      return minOffset;
    } else {
      for (int i = 0; i < sortedAnchors.length; i++) {
        if (sortedAnchors[i] > _currentOffset) {
          return sortedAnchors[i];
        }
      }
      return maxOffset;
    }
  }

  @override
  Widget render(BuildContext context) {
    var style = widget.getStyle(context);

    var childList = [
      GestureDetector(
        onVerticalDragUpdate: (details) {
          double deltaDy = details.delta.dy;
          var action = (widget.position == AntdFloatingPanelPosition.bottom
              ? deltaDy
              : -deltaDy);
          double newOffset = _currentOffset + action;

          if (newOffset > maxOffset) {
            deltaDy *= (1 - (newOffset - maxOffset) / 100).clamp(0.1, 1.0);
            newOffset = _currentOffset +
                (widget.position == AntdFloatingPanelPosition.bottom
                    ? deltaDy
                    : -deltaDy);
          } else if (newOffset < minOffset) {
            deltaDy *= (1 - (minOffset - newOffset) / 100).clamp(0.1, 1.0);
            newOffset = _currentOffset +
                (widget.position == AntdFloatingPanelPosition.bottom
                    ? deltaDy
                    : -deltaDy);
          }

          forward = newOffset <= _currentOffset;
          _setAnimation(newOffset, true);
        },
        onVerticalDragEnd: (details) {
          if (_currentOffset > maxOffset || _currentOffset < minOffset) {
            final simulation = BouncingScrollSimulation(
              position: _currentOffset,
              velocity: details.velocity.pixelsPerSecond.dy,
              leadingExtent: minOffset,
              trailingExtent: maxOffset,
              spring: const SpringDescription(
                  mass: 0.5, stiffness: 500, damping: 20),
            );
            _animationController.reset();
            _animationController.animateWith(simulation);
            _animationController.addListener(() {
              _currentOffset = _animationController.value;
            });
            return;
          }

          var off = getEndOffset();
          _animationController.animateTo(off);
          _currentOffset = off;
          return;
        },
        child: AntdBox(
          style: style.headerStyle,
          child: widget.indicator ??
              AntdBox(
                style: style.indicatorStyle,
                child: widget.indicator,
              ),
        ),
      ),
      if (widget.content != null) widget.content!,
    ];
    var child = AntdBox(
      child: Column(
        children: widget.position == AntdFloatingPanelPosition.top
            ? childList.reversed.toList()
            : childList,
      ),
    );
    var body = AntdBox(
      style: style.bodyStyle,
      child: child,
    );
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          AntdBox(
            onLayout: (layoutContent) {
              _initHeight = !constraints.hasBoundedHeight
                  ? layoutContent.renderBox.size.height
                  : constraints.maxHeight;

              maxOffset = _initHeight * (widget.anchors?.lastOrNull ?? 0.8);
              minOffset = _initHeight * (widget.anchors?.firstOrNull ?? 0.3);

              if (widget.anchors != null) {
                _rangeHeightList = widget.anchors!.map((value) {
                  return _initHeight * value;
                }).toList();
              }
              _setAnimation(maxOffset, false);
            },
            child: widget.child,
          ),
          AnimatedBuilder(
              animation: _animationController,
              builder: (context, _) {
                if (widget.position == AntdFloatingPanelPosition.bottom) {
                  return Positioned(
                      top: _animationController.value,
                      left: 0,
                      right: 0,
                      child: body);
                }
                return Positioned(
                    left: 0,
                    right: 0,
                    bottom: _animationController.value,
                    child: body);
              })
        ],
      );
    });
  }
}
