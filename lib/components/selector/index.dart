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

class AntdSelectorOptionStyle extends AntdStyle {
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

  const AntdSelectorOptionStyle({
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
  AntdSelectorOptionStyle copyFrom(AntdSelectorOptionStyle? style) {
    return AntdSelectorOptionStyle(
      itemStyle: itemStyle.merge(style?.itemStyle),
      activeItemStyle: activeItemStyle.merge(style?.activeItemStyle),
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
class AntdSelectorOption
    extends AntdComponent<AntdSelectorOptionStyle, AntdSelectorOption> {
  /// 选项的描述信息组件（显示在label下方）
  final Widget? description;

  /// 是否禁用该选项（默认false）
  final bool disabled;

  /// 是否选中该选项（默认false）
  final bool check;

  /// 选项的主标签组件
  final Widget label;

  /// 选项的唯一标识值
  final String? value;

  ///更改事件
  final ValueChanged<bool>? onChange;

  const AntdSelectorOption(
      {super.key,
      super.style,
      super.styleBuilder,
      this.description,
      this.disabled = false,
      this.check = false,
      required this.label,
      this.value,
      this.onChange});

  AntdSelectorOption copyFrom(AntdSelectorOption? other) {
    if (other == null) return this;

    return AntdSelectorOption(
      key: other.key ?? key,
      style: other.style ?? style,
      styleBuilder: other.styleBuilder ?? styleBuilder,
      description: other.description ?? description,
      disabled: other.disabled,
      check: other.check,
      label: other.label,
      value: other.value ?? value,
      onChange: other.onChange ?? onChange,
    );
  }

  @override
  Widget render(BuildContext context, AntdSelectorOptionStyle style) {
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
        disabled: disabled,
        onTap: () {
          onChange?.call(!check);
        },
        child: Stack(
          children: [
            AntdBox(
              style: (check ? style.activeItemStyle : style.itemStyle),
              child: Column(
                children: [
                  AntdBox(
                    style: style.labelStyle,
                    child: label,
                  ),
                  if (description != null)
                    AntdBox(
                      style: style.descriptionStyle,
                      child: description!,
                    )
                ],
              ),
            ),
            if (check) Positioned(right: 0, bottom: 0, child: badge),
            if (check)
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

  @override
  AntdSelectorOptionStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var text = token.font.md;
    var base = AntdBoxStyle(
        alignment: Alignment.center,
        padding: token.size.default_.vertical.marge(token.size.xl.horizontal),
        textStyle: text,
        radius: token.radius.default_.radius.all,
        color: token.colorFillContent);
    return AntdSelectorOptionStyle(
      itemStyle: base,
      activeItemStyle: base.copyWith(
          color: token.colorPrimaryBg,
          textStyle: text.copyWith(color: token.colorPrimary)),
      bodyStyle: const AntdBoxStyle(),
      labelStyle: const AntdBoxStyle(),
      descriptionStyle: AntdBoxStyle(
          textStyle: token.font.sm.copyWith(color: token.colorTextDescription)),
      badge: AntdSelectorBadgeStyle(
          size: const Size(20, 16), color: token.colorPrimary),
      checkIcon: AntdSelectorBadgeStyle(
          size: const Size(8, 6), color: token.colorWhite),
    );
  }

  @override
  AntdSelectorOption getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdSelectorOptionStyle margeStyle(
      AntdSelectorOptionStyle defaultStyle, AntdSelectorOptionStyle? style) {
    return defaultStyle.copyFrom(style);
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
  final AntdSelectorOptionStyle? optionStyle;

  const AntdSelectorStyle({
    super.inherit,
    this.bodyStyle,
    this.wrapStyle,
    this.optionStyle,
  });

  @override
  AntdSelectorStyle copyFrom(covariant AntdSelectorStyle? style) {
    return AntdSelectorStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      wrapStyle: wrapStyle.merge(style?.wrapStyle),
      optionStyle: optionStyle.merge(style?.optionStyle),
    );
  }
}

typedef AntdSelectorOnChange = void Function(
    String value, bool check, Set<String> values);

///@t 选择组
///@g 信息录入
///@o 52
///@d  在一组选项中选择一个或多个。
///@u 提供多个选项供用户选择，一般在筛选和表单中使用。
class AntdSelector extends AntdFormItemComponent<Set<String>, AntdSelectorStyle,
    AntdSelector> {
  const AntdSelector({
    super.key,
    super.style,
    super.styleBuilder,
    super.disabled,
    super.readOnly,
    super.value,
    super.autoCollect,
    super.onChange,
    this.columns = 2,
    required this.options,
  });

  ///列数
  final int columns;

  ///可选项
  final List<AntdSelectorOption> options;

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
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
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
  Widget get child => this;

  @override
  AntdSelector getWidget(BuildContext context) {
    return this;
  }
}

class _AntdSelectorState extends AntdFormItemComponentState<Set<String>,
    AntdSelectorStyle, AntdSelector> {
  @override
  Set<String> getNewValue(Set<String> value) {
    return {...value};
  }

  @override
  Widget render(BuildContext context) {
    return AntdBox(
      style: style.bodyStyle,
      child: AntdWrap(
        style: style.wrapStyle?.copyWith(spacing: 0),
        children: widget.options.map((value) {
          var contains = this.value?.contains(value.value) == true;
          return AntdBox(
            style: AntdBoxStyle(
              width: 1 / widget.columns,
              layoutModes: [AntdBoxLayoutMode.factorWidth],
            ),
            child: AntdBox(
                style: AntdBoxStyle(
                    margin: EdgeInsets.symmetric(
                        horizontal: (style.wrapStyle?.spacing ?? 0) / 2)),
                child: value.copyFrom(
                  AntdSelectorOption(
                    label: value.label,
                    check: contains,
                    value: value.value,
                    disabled: disabled == true,
                    onChange: (check) {
                      if (value.value == null) {
                        return;
                      }

                      changeValue(() {
                        this.value ??= {};
                        if (check) {
                          this.value?.add(value.value!);
                        } else {
                          this.value?.remove(value.value);
                        }
                        return {...?this.value};
                      });
                    },
                  ),
                )),
          );
        }).toList(),
      ),
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
