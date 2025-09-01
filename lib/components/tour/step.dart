import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

/// 提示的步骤样式
/// @l [AntdTour]
class AntdTourStepStyle extends AntdPopoverBoxStyle {
  /// 步骤内容区域的样式配置
  final AntdBoxStyle? contentStyle;

  /// 跳过按钮的样式配置
  final AntdBoxStyle? skipStyle;

  /// 下一步按钮的样式配置
  final AntdBoxStyle? nextStyle;

  /// 标题文本的样式配置
  final AntdBoxStyle? titleStyle;

  /// 标题列的布局样式配置
  final AntdFlexStyle? titleColumnStyle;

  /// 描述文本的样式配置
  final AntdBoxStyle? descriptionStyle;

  /// 高亮区域的padding设置
  final EdgeInsets? holdPadding;

  /// 高亮区域的圆角半径
  final double? holdRadius;

  const AntdTourStepStyle({
    super.inherit,
    super.bodyStyle,
    super.arrowOffset,
    super.offset,
    super.arrowStyle,
    this.contentStyle,
    this.skipStyle,
    this.nextStyle,
    this.titleStyle,
    this.titleColumnStyle,
    this.descriptionStyle,
    this.holdPadding,
    this.holdRadius,
  });

  @override
  AntdTourStepStyle copyFrom(covariant AntdTourStepStyle? style) {
    return AntdTourStepStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      arrowOffset: style?.arrowOffset ?? arrowOffset,
      offset: style?.offset ?? offset,
      arrowStyle: arrowStyle.merge(style?.arrowStyle),
      contentStyle: contentStyle.merge(style?.contentStyle),
      skipStyle: skipStyle.merge(style?.skipStyle),
      nextStyle: nextStyle.merge(style?.nextStyle),
      titleStyle: titleStyle.merge(style?.titleStyle),
      titleColumnStyle: titleColumnStyle.merge(style?.titleColumnStyle),
      descriptionStyle: descriptionStyle.merge(style?.descriptionStyle),
      holdPadding: style?.holdPadding ?? holdPadding,
      holdRadius: style?.holdRadius ?? holdRadius,
    );
  }
}

/// 提示的步骤
/// @l [AntdTour]
class AntdTourStep extends AntdStateComponent<AntdTourStepStyle, AntdTourStep> {
  const AntdTourStep(
      {super.key,
      super.style,
      super.styleBuilder,
      required this.index,
      required this.child,
      this.placement = AntdPlacement.bottom,
      this.title,
      this.description,
      this.skip = true,
      this.skipBuilder,
      this.nextBuilder,
      this.builder,
      this.defaultOpen = false});

  /// 当前步骤的索引位置（从0开始）
  final int index;

  /// 需要被高亮显示的目标组件
  final Widget child;

  /// 步骤标题组件，显示在引导内容的顶部
  final Widget? title;

  /// 步骤描述组件，显示在标题下方的主要内容区域
  final Widget? description;

  ///当前是否允许跳过
  final bool skip;

  /// 引导弹窗的显示位置
  final AntdPlacement placement;

  /// 自定义跳过按钮的构建器
  /// [skip]: 跳过回调函数
  /// [currentIndex]: 当前步骤索引
  /// [total]: 总步骤数
  final Widget Function(VoidCallback skip, int currentIndex, int total)?
      skipBuilder;

  /// 自定义下一步按钮的构建器
  /// [next]: 下一步回调函数
  final Widget Function(VoidCallback next)? nextBuilder;

  /// 完全自定义底部操作区域的构建器
  /// [skip]: 跳过按钮组件
  /// [next]: 下一步按钮组件
  final Widget Function(Widget skip, Widget next)? builder;

  ///默认打开
  final bool defaultOpen;

  @override
  State<StatefulWidget> createState() {
    return AntdTourStepState();
  }

  @override
  AntdTourStepStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdTourStepStyle(
        bodyStyle: const AntdBoxStyle(),
        arrowStyle: AntdArrowStyle(color: token.colorWhite),
        skipStyle: AntdBoxStyle(
            textStyle:
                token.font.sm.copyWith(color: token.colorTextQuaternary)),
        nextStyle: AntdBoxStyle(
            textStyle: token.font.sm.copyWith(color: token.colorPrimary),
            padding: token.size.xxl.left),
        titleStyle: const AntdBoxStyle(),
        descriptionStyle: AntdBoxStyle(
            padding: token.size.sm.vertical,
            textStyle: token.font.sm.copyWith(color: token.colorTextSecondary)),
        titleColumnStyle:
            const AntdFlexStyle(crossAxisAlignment: CrossAxisAlignment.start),
        contentStyle: AntdBoxStyle(
            padding: token.size.md.all,
            color: token.colorWhite,
            radius: token.radius.default_.radius.all),
        holdPadding: token.size.md.all,
        holdRadius: token.radius.default_.toDouble());
  }

  @override
  AntdTourStep getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdTourStepStyle margeStyle(
      AntdTourStepStyle defaultStyle, AntdTourStepStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

class AntdTourStepState extends AntdState<AntdTourStepStyle, AntdTourStep> {
  AntdTourController? controller;
  late AntdMaskHole? hole = AntdMaskHole(
      offset: Offset.zero,
      size: Size.zero,
      padding: style.holdPadding,
      radius: style.holdRadius);

  @override
  void updateDependentValues(covariant AntdTourStep? oldWidget) {
    super.updateDependentValues(oldWidget);
    controller = AntdTourController.maybeOf(context);
    controller?.registerStep(this);
  }

  @override
  void dispose() {
    controller?.unregisterStep(this);
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    return AntdBox(
      onLayout: (ctx) {
        controller?.updateStep(widget.index, ctx.renderBox);
        if (widget.defaultOpen) {
          controller?.open(widget.index);
        }
      },
      child: widget.child,
    );
  }

  Widget renderStep(BuildContext context) {
    var next = controller?.isLast != true
        ? AntdBox(
            style: style.nextStyle,
            onTap: () {
              controller?.next();
            },
            child: widget.nextBuilder != null
                ? widget.nextBuilder?.call(() {
                    controller?.next();
                  })
                : const Text("下一步"),
          )
        : const AntdBox();
    var skip = widget.skip
        ? ListenableBuilder(
            listenable: controller ?? AntdTourController(),
            builder: (context, value) {
              var activeIndex = controller?.activeIndex;
              return AntdBox(
                style: style.skipStyle,
                onTap: () {
                  controller?.finish();
                },
                child: widget.skipBuilder != null
                    ? widget.skipBuilder!.call(() {
                        controller?.next();
                      }, controller?.activeIndex ?? 0,
                        controller?.totalStep ?? 0)
                    : Text("跳过 ($activeIndex/${controller?.totalStep})"),
              );
            })
        : const AntdBox();
    var child = AntdColumn(
      style: style.titleColumnStyle,
      children: [
        if (widget.title != null)
          AntdBox(
            style: style.titleStyle,
            child: widget.title,
          ),
        if (widget.description != null)
          AntdBox(
            style: style.descriptionStyle,
            child: widget.description,
          )
      ],
    );
    return AntdBox(
      style: style.contentStyle,
      child: widget.builder != null
          ? widget.builder!(skip, next)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                child,
                Row(
                  children: [skip, next],
                )
              ],
            ),
    );
  }
}
