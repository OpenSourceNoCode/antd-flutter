import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

/// 步骤条样式
/// @l [AntdSteps]
class AntdStepsStyle extends AntdStyle {
  ///标题样式
  final AntdBoxStyle? titleStyle;

  ///激活标题样式
  final AntdBoxStyle? activeTitleStyle;

  ///描述样式
  final AntdBoxStyle? descStyle;

  ///激活描述样式
  final AntdBoxStyle? activeDescStyle;

  ///线的样式
  final AntdBoxStyle? lineStyle;

  ///激活线的样式
  final AntdBoxStyle? activeLineStyle;

  ///节点样式
  final AntdBoxStyle? stepStyle;

  ///轴对齐样式
  final AntdFlexStyle? stepColumnStyle;

  const AntdStepsStyle(
      {super.inherit,
      this.titleStyle,
      this.activeTitleStyle,
      this.descStyle,
      this.activeDescStyle,
      this.lineStyle,
      this.activeLineStyle,
      this.stepStyle,
      this.stepColumnStyle});

  @override
  AntdStepsStyle copyFrom(covariant AntdStepsStyle? style) {
    return AntdStepsStyle(
        titleStyle: titleStyle.merge(style?.titleStyle),
        activeTitleStyle: activeTitleStyle.mergeActive(
            titleStyle, style?.titleStyle, style?.activeTitleStyle),
        descStyle: descStyle.merge(style?.descStyle),
        activeDescStyle: activeDescStyle.mergeActive(
            descStyle, style?.descStyle, style?.activeDescStyle),
        lineStyle: lineStyle.merge(style?.lineStyle),
        activeLineStyle: activeLineStyle.mergeActive(
            lineStyle, style?.lineStyle, style?.activeLineStyle),
        stepStyle: stepStyle.merge(style?.stepStyle),
        stepColumnStyle: stepColumnStyle.merge(style?.stepColumnStyle));
  }
}

enum AntdStepStatus {
  wait,
  process,
  finish,
  error;

  Color getColor(AntdMapToken token) {
    switch (this) {
      case wait:
        return token.colorFill;
      case process:
        return token.colorPrimary;
      case finish:
        return token.colorSuccess;
      case error:
        return token.colorError;
    }
  }
}

/// 步骤条定义
/// @l [AntdSteps]
class AntdStep {
  ///	步骤的详情描述，可选
  final Widget? description;

  ///步骤图标的类型
  final Widget? icon;

  ///指定状态。当不配置该属性时，会使用 Steps 的 current 来自动指定状态；如果该属性与 current 指定的状态不匹配会覆盖自动匹配的状态
  final AntdStepStatus? status;

  ///标题
  final Widget? title;

  const AntdStep({this.description, this.icon, this.status, this.title});
}

///@t 步骤条
///@g 信息展示
///@o 78
///@d 引导用户按照流程完成任务的导航条。
///@u 当任务复杂或者存在先后关系时，将其分解成一系列步骤，从而简化任务。
class AntdSteps extends AntdStateComponent<AntdStepsStyle, AntdSteps> {
  ///指定当前步骤，从 0 开始记数。在子 Step 元素中，可以通过 status 属性覆盖状态
  final int current;

  ///指定步骤条方向。目前支持水平（horizontal）和竖直（vertical）两种方向
  final bool vertical;

  ///步骤
  final List<AntdStep> steps;

  const AntdSteps(
      {super.key,
      super.style,
      super.styleBuilder,
      this.current = 0,
      this.vertical = false,
      required this.steps});

  @override
  AntdStepsStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var titleTextStyle = token.font.sm;
    var titleStyle = AntdBoxStyle(
        textStyle: titleTextStyle,
        padding: vertical
            ? null
            : token.size.xxs.top.marge(token.size.seed.horizontal));
    var descTextStyle = AntdBoxStyle(
        margin: vertical
            ? token.size.xs.top.marge(token.size.xl.bottom)
            : token.size.xs.top,
        textStyle: token.font.xs.copyWith(color: token.colorText.tertiary));
    return AntdStepsStyle(
        titleStyle: titleStyle,
        activeTitleStyle: titleStyle.copyWith(
            textStyle: titleTextStyle.copyWith(color: token.colorPrimary)),
        descStyle: descTextStyle,
        activeDescStyle: descTextStyle,
        lineStyle: AntdBoxStyle(color: token.colorFill.quaternary),
        activeLineStyle: AntdBoxStyle(color: token.colorPrimary),
        stepStyle: AntdBoxStyle(
            color: token.colorFill.quaternary,
            radius: const Radius.circular(8).all,
            size: 8,
            margin: vertical
                ? token.size.seed.horizontal
                : token.size.seed.vertical),
        stepColumnStyle: AntdFlexStyle(
          crossAxisAlignment:
              vertical ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
        ));
  }

  @override
  AntdStepsStyle margeStyle(
      AntdStepsStyle defaultStyle, AntdStepsStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdStepsStyle, AntdSteps>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.stepsStyle;
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdStepsState();
  }

  @override
  AntdSteps getWidget(BuildContext context) {
    return this;
  }
}

class _AntdStepsState extends AntdState<AntdStepsStyle, AntdSteps> {
  final Map<int, Size> _pointSizeMap = {};
  final Map<int, Size> _titleSizeMap = {};
  final Map<int, Size> _contentSizeMap = {};

  double _getMiddleHeight(AntdStep step) {
    var titleSize = _titleSizeMap[step.hashCode] ?? Size.zero;
    var pointSize = _pointSizeMap[step.hashCode] ?? Size.zero;
    return (titleSize.height - pointSize.height);
  }

  Widget _buildStepContent(AntdStep step, bool current) {
    var titleStyle = current ? style.activeTitleStyle : style.titleStyle;
    var middleHeight = _getMiddleHeight(step);
    return AntdBox(
      onLayout: (context) {
        if (!_contentSizeMap.containsKey(step.hashCode) ||
            context.hasSizeChange) {
          setState(() {
            _contentSizeMap[step.hashCode] = context.renderBox.size;
          });
        }
      },
      child: AntdColumn(
        style: style.stepColumnStyle,
        children: [
          AntdBox(
            onLayout: (context) {
              if (!_titleSizeMap.containsKey(step.hashCode) ||
                  context.hasSizeChange) {
                setState(() {
                  _titleSizeMap[step.hashCode] = context.renderBox.size;
                });
              }
            },
            style: titleStyle?.copyWith(
                padding: widget.vertical && middleHeight < 0
                    ? (middleHeight.abs() / 2).top
                    : null,
                textStyle: titleStyle.textStyle
                    ?.copyWith(color: _getStepColor(step, current))),
            child: step.title,
          ),
          AntdBox(
            style: current ? style.activeDescStyle : style.descStyle,
            child: step.description,
          ),
        ],
      ),
    );
  }

  List<Widget> buildPositionedList(AntdStep step, bool active, bool current) {
    var pointSize = _pointSizeMap[step.hashCode];
    var titleSize = _titleSizeMap[step.hashCode];
    var contentSize = _contentSizeMap[step.hashCode];
    if (pointSize == null || titleSize == null || contentSize == null) {
      return [];
    }

    var margeStyle =
        active && !current ? style.activeLineStyle : style.lineStyle;
    if (widget.vertical) {
      return [
        if (step != widget.steps.last)
          Positioned(
              top: pointSize.height,
              left: pointSize.height / 2,
              right: pointSize.height / 2,
              child: Center(
                child: AntdBox(
                  style: margeStyle?.copyFrom(AntdBoxStyle(
                      height: contentSize.height - pointSize.height, width: 2)),
                ),
              ))
      ];
    }

    var horizontalLineStyle = AntdBoxStyle(
        height: 2, width: (contentSize.width - pointSize.width) / 2);

    return [
      if (step != widget.steps.first)
        Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: (-contentSize.width - pointSize.width) / 2,
            child: Center(
              child: AntdBox(
                style: (active || current
                        ? style.activeLineStyle
                        : style.lineStyle)
                    ?.copyFrom(horizontalLineStyle),
              ),
            )),
      if (step != widget.steps.last)
        Positioned(
            top: 0,
            bottom: 0,
            right: (-contentSize.width - pointSize.width) / 2,
            left: 0,
            child: Center(
              child: AntdBox(style: margeStyle?.copyFrom(horizontalLineStyle)),
            )),
    ];
  }

  Color? _getStepColor(AntdStep step, bool current) {
    return step.status?.getColor(token) ??
        (current ? token.colorPrimary : null);
  }

  Widget buildStep(AntdStep step, bool active, bool current) {
    var middleHeight = _getMiddleHeight(step);
    var child = AntdBox(
      onLayout: (context) {
        if (!_pointSizeMap.containsKey(step.hashCode) ||
            context.hasSizeChange) {
          setState(() {
            _pointSizeMap[step.hashCode] = context.renderBox.size;
          });
        }
      },
      child: AntdBox(
        style: style.stepStyle?.copyFrom(AntdBoxStyle(
          color: _getStepColor(step, active || current),
        )),
        child: step.icon,
      ),
    );
    var childList = <Widget>[
      AntdBox(
        style: AntdBoxStyle(
            margin: (widget.vertical && middleHeight > 0
                ? (middleHeight / 2).top
                : null)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [...buildPositionedList(step, active, current), child],
        ),
      ),
      _buildStepContent(step, current),
    ];

    return !widget.vertical
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: childList,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: childList,
          );
  }

  @override
  Widget render(BuildContext context) {
    var childList = <Widget>[];
    for (int i = 0; i < widget.steps.length; i++) {
      childList.add(
          buildStep(widget.steps[i], i <= widget.current, i == widget.current));
    }

    return !widget.vertical
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: childList,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: childList,
          );
  }
}
