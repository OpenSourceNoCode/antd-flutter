import 'dart:math';

import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

///样式
///@l [AntdSlider]
class AntdSliderStyle extends AntdStyle {
  /// 主体样式
  final AntdBoxStyle? bodyStyle;

  /// 滑块刻度标记点的默认样式
  final AntdBoxStyle? markStyle;

  /// 滑块激活状态下刻度标记点的样式
  final AntdBoxStyle? activeMarkStyle;

  /// 滑块刻度文本的默认样式
  final AntdBoxStyle? markTextStyle;

  /// 滑块激活状态下刻度文本的样式
  final AntdBoxStyle? activeMarkTextStyle;

  /// 滑块轨道的默认样式（未激活部分）
  final AntdBoxStyle? trackStyle;

  /// 滑块轨道的激活部分样式
  final AntdBoxStyle? activeTrackStyle;

  ///滑块图标
  final Widget? slider;

  /// 滑块手柄内图标的样式（如果有的话）
  final AntdIconStyle? sliderIconStyle;

  const AntdSliderStyle({
    super.inherit,
    this.bodyStyle,
    this.markStyle,
    this.activeMarkStyle,
    this.markTextStyle,
    this.activeMarkTextStyle,
    this.trackStyle,
    this.activeTrackStyle,
    this.slider,
    this.sliderIconStyle,
  });

  @override
  AntdSliderStyle copyFrom(covariant AntdSliderStyle? style) {
    return AntdSliderStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      markStyle: markStyle.merge(style?.markStyle),
      activeMarkStyle: activeMarkStyle.merge(style?.activeMarkStyle),
      markTextStyle: markTextStyle.merge(style?.markTextStyle),
      activeMarkTextStyle:
          activeMarkTextStyle.merge(style?.activeMarkTextStyle),
      trackStyle: trackStyle.merge(style?.trackStyle),
      activeTrackStyle: activeTrackStyle.merge(style?.activeTrackStyle),
      slider: style?.slider ?? slider,
      sliderIconStyle: sliderIconStyle.merge(style?.sliderIconStyle),
    );
  }
}

class AntdSliderValue {
  final int start;
  final int end;

  const AntdSliderValue({required this.start, required this.end});

  bool active(int value) {
    return value <= end;
  }
}

typedef AntdSliderChange = void Function(AntdSliderValue value);

typedef AntdSliderRenderTicks = Widget Function(int value);

///@t 滑动输入条
///@g 信息录入
///@o 50
///@d 滑动型输入器，展示当前值和可选范围。
///@u 当用户需要在数值区间/自定义区间内进行选择时，可为连续或离散值。
class AntdSlider extends AntdStateComponent<AntdSliderStyle, AntdSlider> {
  const AntdSlider(
      {super.key,
      super.style,
      super.styleBuilder,
      this.value,
      this.disabled = false,
      this.slider,
      this.max,
      this.min,
      this.onChange,
      this.range = false,
      this.step = 1,
      this.length = 100,
      this.ticks = false,
      this.renderTicks,
      this.hapticFeedback = AntdHapticFeedback.light});

  ///默认值
  final AntdSliderValue? value;

  ///是否禁用
  final bool disabled;

  ///滑块的图标
  final Widget? slider;

  ///最大值
  final int? max;

  ///最小值
  final int? min;

  ///长度
  final int length;

  ///拖拽滑块时触发，并把当前拖拽的值作为参数传入
  final AntdSliderChange? onChange;

  ///是否为双滑块
  final bool range;

  ///步距，取值必须大于 0，并且 (max - min) 可被 step 整除。当 marks 不为空对象时，step 的配置失效
  final int step;

  ///是否显示刻度
  final bool ticks;

  ///渲染的tick
  final AntdSliderRenderTicks? renderTicks;

  ///开启反馈
  final AntdHapticFeedback? hapticFeedback;

  @override
  State<StatefulWidget> createState() {
    return _AntdSliderState();
  }

  @override
  AntdSliderStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var markStyle = AntdBoxStyle(
        margin: 8.vertical,
        size: token.size.ms.roundToDouble(),
        radius: BorderRadius.circular(token.size.ms.roundToDouble()),
        color: token.colorFill.tertiary);
    var trackStyle = AntdBoxStyle(color: token.colorFill.tertiary, height: 3);
    var activeTrackStyle = trackStyle.copyWith(color: token.colorPrimary);
    return AntdSliderStyle(
        bodyStyle: AntdBoxStyle(
            margin: renderTicks != null ? token.size.xxl.bottom : null),
        markStyle: ticks ? markStyle : trackStyle,
        activeMarkStyle: ticks
            ? markStyle.copyWith(color: token.colorPrimary)
            : activeTrackStyle,
        trackStyle: trackStyle,
        activeTrackStyle: activeTrackStyle,
        slider: const AntdIcon(
          icon: AntdIcons.sliderThumb,
        ),
        sliderIconStyle: AntdIconStyle(
            color: token.colorPrimary,
            size: 18,
            bodyStyle: AntdBoxStyle(
                alignment: Alignment.center,
                color: token.colorBgContainer,
                size: 32,
                radius: BorderRadius.circular(32),
                shadows: token.shadow.primary)),
        markTextStyle:
            AntdBoxStyle(margin: token.size.md.top, textStyle: token.font.sm));
  }

  @override
  AntdSliderStyle margeStyle(
      AntdSliderStyle defaultStyle, AntdSliderStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdSliderStyle, AntdSlider>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.sliderStyle;
  }

  @override
  AntdSlider getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdSliderStyle getFinalStyle(
      BuildContext context, AntdSliderStyle style, AntdMapToken token) {
    return margeStyle(
        style,
        AntdSliderStyle(
            activeMarkStyle: style.markStyle.merge(style.activeMarkStyle),
            activeTrackStyle: style.trackStyle.merge(style.activeTrackStyle),
            activeMarkTextStyle:
                style.markTextStyle.merge(style.activeMarkTextStyle)));
  }
}

class _AntdSliderState extends AntdState<AntdSliderStyle, AntdSlider> {
  RenderBox? parentBox;
  var tractHeight = 0.0;
  var activeTractHeight = 0.0;
  var markSize = Size.zero;
  var markMaxOffset = 0.0;
  var sliderY = 0.0;
  var sliderSize = Size.zero;

  final List<int> _values = [0, 0];
  final Map<int, double> _markXOffset = {};
  final Map<int, double> _dragStartPosition = {};

  @override
  void initState() {
    _dragStartPosition[0] = 0;
    _dragStartPosition[1] = 0;
    super.initState();
  }

  @override
  void updateDependentValues(covariant AntdSlider? oldWidget) {
    super.updateDependentValues(oldWidget);
    if (widget.value != oldWidget?.value ||
        widget.max != oldWidget?.max ||
        widget.min != oldWidget?.min) {
      _values[0] = max(widget.value?.start ?? 0, widget.min ?? 0);
      _values[1] = min(widget.value?.end ?? 0, widget.max ?? widget.length);
    }
  }

  int? findNearestValueOptimizedWithTolerance(double targetValue) {
    if (_markXOffset.isEmpty) {
      return null;
    }

    final double tolerance = 4 * targetValue;
    final sortedEntries = _markXOffset.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    int low = 0;
    int high = sortedEntries.length - 1;
    int? nearestKey;
    double minDistance = double.infinity;

    while (low <= high) {
      final mid = (low + high) ~/ 2;
      final currentValue = sortedEntries[mid].value;
      final distance = (currentValue - targetValue).abs();

      if (distance <= tolerance && distance < minDistance) {
        minDistance = distance;
        nearestKey = sortedEntries[mid].key;
      }

      if (currentValue < targetValue) {
        low = mid + 1;
      } else if (currentValue > targetValue) {
        high = mid - 1;
      } else {
        return sortedEntries[mid].key; // 直接命中
      }
    }

    return nearestKey;
  }

  _handlerOnChange() {
    if (widget.ticks) {
      handleHapticFeedback(widget.hapticFeedback);
    }

    widget.onChange?.call(AntdSliderValue(
      start: _values.firstOrNull ?? 0,
      end: _values.lastOrNull ?? 0,
    ));
  }

  Widget buildSlider(AntdSliderStyle style, int index, int currentValue) {
    var child = Listener(
      behavior: HitTestBehavior.opaque,
      onPointerMove: (details) {
        if (widget.disabled == true) {
          return;
        }
        var dragPosition = _dragStartPosition[index];
        if (dragPosition == 0 && currentValue > 0) {
          dragPosition = _markXOffset[currentValue] ?? 0;
        }
        final newPosition = (dragPosition ?? 0) + details.delta.dx;
        _dragStartPosition[index] = newPosition;
        var value = findNearestValueOptimizedWithTolerance(newPosition);
        if (value == null ||
            value == _values[index] ||
            (widget.min != null && value < widget.min!) ||
            (widget.max != null && value > widget.max!)) {
          return;
        }
        setState(() {
          _values[index] = value;
        });
        _handlerOnChange();
      },
      child: AntdBox(
        onLayout: (context) {
          if (sliderSize != context.renderBox.size) {
            setState(() {
              sliderSize = context.renderBox.size;
            });
          }
        },
        child: AntdIconWrap(
          style: style.sliderIconStyle,
          child: widget.slider ?? style.slider,
        ),
      ),
    );
    var pointXOffset =
        _markXOffset[_values[index]] ?? _markXOffset.values.firstOrNull ?? 0;
    return Transform.translate(
      offset: Offset(
          pointXOffset - (markSize.width - sliderSize.width).abs() / 2, 0),
      child: child,
    );
  }

  double getMinOffset() {
    if (widget.min != null) {
      return _markXOffset[widget.min] ?? 0.0;
    }
    return 0.0;
  }

  List<double> getOffsets() {
    var values = _values;
    var startMarkOffset = _markXOffset[values[0]] ?? 0.0;
    var endMarkOffset = _markXOffset[values[1]] ?? 0.0;
    return startMarkOffset <= endMarkOffset
        ? [startMarkOffset, endMarkOffset]
        : [endMarkOffset, startMarkOffset];
  }

  bool isActive(int value) {
    if ((widget.min != null && value < widget.min!) ||
        (widget.max != null && value > widget.max!)) {
      return false;
    }
    return (value <= _values[1] && value >= _values[0]) ||
        (value <= _values[0] && value >= _values[1]);
  }

  @override
  Widget render(BuildContext context) {
    int totalSteps = (widget.length / widget.step).toInt();
    var offsets = getOffsets();
    var minOffset = max(offsets[0], getMinOffset());
    var activeTractWidth = max(
        offsets[1] - minOffset - (_markXOffset.values.firstOrNull ?? 0), 0.0);
    return AntdBox(
      disabled: widget.disabled,
      style:
          const AntdBoxStyle(width: double.infinity).copyFrom(style.bodyStyle),
      onLayout: (context) {
        parentBox = context.renderBox;
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: sliderY - (tractHeight - sliderSize.height) / 2,
              left: _markXOffset.values.firstOrNull,
              right: _markXOffset.values.firstOrNull,
              child: AntdBox(
                child: AntdBox(
                  style: style.trackStyle,
                  onLayout: (ctx) {
                    if (tractHeight != ctx.size.height) {
                      setState(() {
                        tractHeight = ctx.size.height;
                      });
                    }
                  },
                ),
              )),
          Positioned(
              top: sliderY - (activeTractHeight - sliderSize.height) / 2,
              left: max(minOffset, _markXOffset.values.firstOrNull ?? 0),
              child: AntdBox(
                style: style.activeTrackStyle
                    ?.copyWith(width: activeTractWidth.toDouble()),
                onLayout: (ctx) {
                  if (activeTractHeight != ctx.size.height) {
                    setState(() {
                      activeTractHeight = ctx.size.height;
                    });
                  }
                },
              )),
          Positioned(
              top: sliderY - (markSize.height - sliderSize.height) / 2,
              left: 0,
              right: 0,
              child: Row(
                children: List.generate(totalSteps + 1, (index) {
                  var value = index * widget.step;

                  var finalStyle =
                      isActive(value) ? style.activeMarkStyle : style.markStyle;
                  return Expanded(
                      child: AntdBox(
                    options:
                        const AntdTapOptions(behavior: HitTestBehavior.opaque),
                    onTap: () {
                      if (widget.disabled == true) {
                        return;
                      }
                      setState(() {
                        if (widget.range) {
                          _values[index] = value;
                        } else {
                          _values[0] = value;
                        }

                        _handlerOnChange();
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AntdBox(
                          style: finalStyle,
                          onLayout: (context) {
                            final renderBox = context.renderBox;
                            var offset = renderBox.localToGlobal(Offset.zero,
                                ancestor: parentBox);
                            _markXOffset[value] = offset.dx;
                            if (offset.dx > markMaxOffset) {
                              markMaxOffset = offset.dx;
                            }
                            if (markSize != renderBox.size) {
                              setState(() {
                                markSize = renderBox.size;
                              });
                            }
                          },
                        ),
                        if (widget.renderTicks != null)
                          AntdBox(
                            style: style.markTextStyle,
                            child: widget.renderTicks!(value),
                          )
                      ],
                    ),
                  ));
                }),
              )),
          buildSlider(style, 0, _values[0]),
          if (widget.range) buildSlider(style, 1, _values[1]),
        ],
      ),
    );
  }
}
