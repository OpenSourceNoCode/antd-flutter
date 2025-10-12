import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

/// 选择器角标
/// @l [AntdSelector]
class AntdSelectorBadgeStyle extends AntdStyle {
  /// 角标尺寸配置（宽高）
  final Size size;

  /// 角标背景颜色
  final Color color;

  const AntdSelectorBadgeStyle(
      {super.inherit, required this.size, required this.color});

  @override
  AntdSelectorBadgeStyle copyFrom(covariant AntdSelectorBadgeStyle? style) {
    return AntdSelectorBadgeStyle(
      size: style?.size ?? size,
      color: style?.color ?? color,
    );
  }
}

class AntdSelectorItemStyle extends AntdStyle {
  /// 选项外层容器的默认样式
  final AntdBoxStyle? itemStyle;

  /// 选项激活状态的外层容器样式
  final AntdBoxStyle? activeItemStyle;

  /// 选项主体内容区域样式
  final AntdBoxStyle? bodyStyle;

  /// 选项标签文本样式
  final AntdBoxStyle? labelStyle;

  /// 选项描述文本样式
  final AntdBoxStyle? descriptionStyle;

  /// 角标尺寸配置（宽高）
  final AntdSelectorBadgeStyle badge;

  /// 角标尺寸配置（宽高）
  final AntdSelectorBadgeStyle checkIcon;

  const AntdSelectorItemStyle({
    super.inherit,
    this.itemStyle,
    this.activeItemStyle,
    this.bodyStyle,
    this.labelStyle,
    this.descriptionStyle,
    required this.badge,
    required this.checkIcon,
  });

  @override
  AntdSelectorItemStyle copyFrom(AntdSelectorItemStyle? style) {
    return AntdSelectorItemStyle(
      itemStyle: itemStyle.merge(style?.itemStyle),
      activeItemStyle: activeItemStyle.mergeActive(
          itemStyle, style?.itemStyle, style?.activeItemStyle),
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      labelStyle: labelStyle.merge(style?.labelStyle),
      descriptionStyle: descriptionStyle.merge(style?.descriptionStyle),
      badge: badge.merge(style?.badge)!,
      checkIcon: checkIcon.merge(style?.checkIcon)!,
    );
  }
}

/// 选择器选项数据类
/// @l [AntdSelector]
class AntdSelectorItem extends AntdFormItemComponent<dynamic,
    AntdSelectorItemStyle, AntdSelectorItem> {
  /// 选项的描述信息组件（显示在label下方）
  final Widget? description;

  /// 选项的主标签组件
  final Widget label;

  const AntdSelectorItem({
    super.key,
    super.style,
    super.styleBuilder,
    super.disabled,
    super.value,
    this.description,
    required this.label,
  });

  @override
  AntdSelectorItemStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var text = token.font.md;
    var base = AntdBoxStyle(
        alignment: Alignment.center,
        padding: token.size.seed.vertical.marge(token.size.xl.horizontal),
        textStyle: text,
        color: token.colorFill.tertiary);
    return AntdSelectorItemStyle(
      itemStyle: base,
      activeItemStyle: AntdBoxStyle(
          color: token.colorPrimary.bg,
          textStyle: text.copyWith(color: token.colorPrimary)),
      bodyStyle: AntdBoxStyle(
          radius: token.radius.all,
          options: const AntdTapOptions(alwaysReceiveTap: true)),
      labelStyle: const AntdBoxStyle(),
      descriptionStyle: AntdBoxStyle(
          textStyle: token.font.sm.copyWith(color: token.colorText.tertiary)),
      badge: AntdSelectorBadgeStyle(
          size: const Size(20, 16), color: token.colorPrimary),
      checkIcon: AntdSelectorBadgeStyle(
          size: const Size(8, 6), color: token.colorWhite),
    );
  }

  @override
  AntdSelectorItem getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdSelectorItemStyle margeStyle(
      AntdSelectorItemStyle defaultStyle, AntdSelectorItemStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdSelectorItemState();
  }
}

class _AntdSelectorItemState extends AntdFormItemSelectComponentState<dynamic,
    AntdSelectorItemStyle, AntdSelectorItem> {
  @override
  Widget render(BuildContext context) {
    var badge = CustomPaint(
      size: style.badge.size,
      painter: _TrianglePainter(
        color: style.badge.color,
      ),
    );
    var checkIcon = CustomPaint(
      size: style.checkIcon.size,
      painter: _CheckMarkPainter(
        color: style.checkIcon.color,
      ),
    );
    return AntdBox(
        style: style.bodyStyle,
        disabled: disabled,
        onTap: switchValue,
        child: Stack(
          children: [
            AntdBox(
              style: (select ? style.activeItemStyle : style.itemStyle),
              child: Column(
                children: [
                  AntdBox(
                    style: style.labelStyle,
                    child: widget.label,
                  ),
                  if (widget.description != null)
                    AntdBox(
                      style: style.descriptionStyle,
                      child: widget.description,
                    )
                ],
              ),
            ),
            if (select) Positioned(right: 0, bottom: 0, child: badge),
            if (select)
              Positioned(
                  right:
                      (style.badge.size.width - style.checkIcon.size.width) / 8,
                  bottom:
                      (style.badge.size.height - style.checkIcon.size.height) /
                          6,
                  child: checkIcon)
          ],
        ));
  }
}

/// 选择器样式配置类
/// @l [AntdSelector]
class AntdSelectorStyle extends AntdStyle {
  /// 最外层样式
  final AntdBoxStyle? bodyStyle;

  /// 布局
  final AntdWrapStyle? wrapStyle;

  ///选项样式
  final AntdSelectorItemStyle? itemStyle;

  const AntdSelectorStyle({
    super.inherit,
    this.bodyStyle,
    this.wrapStyle,
    this.itemStyle,
  });

  @override
  AntdSelectorStyle copyFrom(covariant AntdSelectorStyle? style) {
    return AntdSelectorStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      wrapStyle: wrapStyle.merge(style?.wrapStyle),
      itemStyle: itemStyle.merge(style?.itemStyle),
    );
  }
}

///@t 选择组
///@g 信息录入
///@o 52
///@d  在一组选项中选择一个或多个。
///@u 提供多个选项供用户选择，一般在筛选和表单中使用。
class AntdSelector extends AntdFormItemGroup<AntdSelectorItem,
    AntdSelectorStyle, List<dynamic>, AntdSelector> {
  const AntdSelector({
    super.key,
    super.style,
    super.styleBuilder,
    super.disabled,
    super.readOnly,
    super.defaultValue,
    super.value,
    super.autoCollect,
    super.onChange,
    super.shouldTriggerChange,
    super.hapticFeedback,
    super.items,
    super.builder,
    this.columns = 2,
  });

  ///列数
  final int columns;

  @override
  State<StatefulWidget> createState() {
    return _AntdSelectorState();
  }

  @override
  AntdSelectorStyle margeStyle(
      AntdSelectorStyle defaultStyle, AntdSelectorStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdSelectorStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdSelectorStyle(
        bodyStyle: const AntdBoxStyle(),
        wrapStyle: AntdWrapStyle(
          runSpacing: token.size.xs.roundToDouble(),
          spacing: token.size.xs.roundToDouble(),
        ));
  }

  @override
  AntdStyleBuilder<AntdSelectorStyle, AntdSelector>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.selectorStyle;
  }

  @override
  Widget get bindWidget => this;

  @override
  AntdSelector getWidget(BuildContext context) {
    return this;
  }
}

class _AntdSelectorState extends AntdFormItemGroupMultipleState<
    AntdSelectorItem, AntdSelectorStyle, dynamic, AntdSelector> {
  @override
  Widget buildDefaultWidget() {
    return AntdWrap(
      style: style.wrapStyle?.copyWith(spacing: 0),
      children: (widget.items ?? []).map((value) {
        return AntdBox(
          style: AntdBoxStyle(
            width: 1 / widget.columns,
            layoutModes: [AntdBoxLayoutMode.factorWidth],
          ),
          child: AntdBox(
              style: AntdBoxStyle(
                  margin: EdgeInsets.symmetric(
                      horizontal: (style.wrapStyle?.spacing ?? 0) / 2)),
              child: value),
        );
      }).toList(),
    );
  }

  @override
  Widget render(BuildContext context) {
    var child = super.render(context);
    return AntdBox(
      style: style.bodyStyle,
      child: child,
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;

  const _TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CheckMarkPainter extends CustomPainter {
  final Color color;

  _CheckMarkPainter({
    this.color = Colors.green,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(size.width * 0.15, size.height * 0.4)
      ..lineTo(size.width * 0.4, size.height * 0.7)
      ..lineTo(size.width * 0.85, size.height * 0.1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
