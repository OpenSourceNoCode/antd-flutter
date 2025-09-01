import 'package:antd_flutter/index.dart';
import 'package:flutter/widgets.dart';

/// Flex布局样式配置类（用于Row/Column等弹性布局）
/// @l [AntdFlex]
class AntdFlexStyle extends AntdStyle {
  /// 主轴对齐方式（默认start）
  final MainAxisAlignment mainAxisAlignment;

  /// 主轴尺寸占用方式（默认max占满可用空间）
  final MainAxisSize mainAxisSize;

  /// 交叉轴对齐方式（默认center居中）
  final CrossAxisAlignment crossAxisAlignment;

  /// 文本方向（影响水平布局）
  final TextDirection? textDirection;

  /// 垂直方向布局顺序（默认down从上到下）
  final VerticalDirection verticalDirection;

  /// 文本基线对齐方式（用于文字对齐）
  final TextBaseline? textBaseline;

  /// 内容裁剪行为（默认none不裁剪）
  final Clip clipBehavior;

  /// 子元素间距（单位：逻辑像素，默认0）
  final double spacing;

  /// 是否强制子元素扩展（覆盖mainAxisSize）
  final bool? expanded;

  const AntdFlexStyle({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
    this.spacing = 0.0,
    this.expanded,
  });

  /// 复制并合并样式配置
  @override
  AntdFlexStyle copyFrom(AntdFlexStyle? style) {
    return AntdFlexStyle(
      mainAxisAlignment: style?.mainAxisAlignment ?? mainAxisAlignment,
      mainAxisSize: style?.mainAxisSize ?? mainAxisSize,
      crossAxisAlignment: style?.crossAxisAlignment ?? crossAxisAlignment,
      textDirection: style?.textDirection ?? textDirection,
      verticalDirection: style?.verticalDirection ?? verticalDirection,
      textBaseline: style?.textBaseline ?? textBaseline,
      clipBehavior: style?.clipBehavior ?? clipBehavior,
      spacing: style?.spacing ?? spacing,
      expanded: style?.expanded ?? expanded,
    );
  }
}

abstract class AbstractAntdFlex<WidgetType>
    extends AntdComponent<AntdFlexStyle, WidgetType> {
  const AbstractAntdFlex({
    super.key,
    super.styleBuilder,
    super.style,
    required this.direction,
    required this.children,
  });

  final Axis direction;

  final List<Widget> children;

  @override
  Widget render(BuildContext context, AntdFlexStyle style) {
    var flex = Flex(
      direction: direction,
      mainAxisAlignment: style.mainAxisAlignment,
      mainAxisSize: style.mainAxisSize,
      crossAxisAlignment: style.crossAxisAlignment,
      textDirection: style.textDirection,
      verticalDirection: style.verticalDirection,
      textBaseline: style.textBaseline,
      clipBehavior: style.clipBehavior,
      spacing: style.spacing,
      children: children.map((value) {
        var index = children.indexOf(value);
        return AntdScrollItemProvider(
            index: index,
            position: AntdScrollItemPosition.fromIndex(index, children.length),
            child: value);
      }).toList(),
    );
    return style.expanded == true ? Expanded(child: flex) : flex;
  }

  @override
  AntdFlexStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return const AntdFlexStyle();
  }

  @override
  AntdFlexStyle margeStyle(AntdFlexStyle defaultStyle, AntdFlexStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

///@t 弹性布局
///@g 通用
///@o 101
///@d 只是对于Flex的Style包装
class AntdFlex extends AbstractAntdFlex<AntdFlex> {
  const AntdFlex(
      {super.key,
      super.style,
      super.styleBuilder,
      required super.direction,
      required super.children});

  @override
  AntdFlex getWidget(BuildContext context) {
    return this;
  }
}

/// 行布局
/// @l [AntdFlex]
class AntdRow extends AbstractAntdFlex<AntdRow> {
  const AntdRow({
    super.key,
    super.style,
    super.styleBuilder,
    required super.children,
  }) : super(direction: Axis.horizontal);

  @override
  AntdRow getWidget(BuildContext context) {
    return this;
  }
}

/// 列布局
/// @l [AntdFlex]
class AntdColumn extends AbstractAntdFlex<AntdColumn> {
  const AntdColumn(
      {super.key, super.style, super.styleBuilder, required super.children})
      : super(direction: Axis.vertical);

  @override
  AntdFlexStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var defaultStyle = super.getDefaultStyle(context, theme, token);
    return defaultStyle
        .copyFrom(const AntdFlexStyle(mainAxisSize: MainAxisSize.min));
  }

  @override
  AntdColumn getWidget(BuildContext context) {
    return this;
  }
}

/// Wrap布局样式配置类（用于流式布局）
class AntdWrapStyle extends AntdStyle {
  /// 主轴方向子元素间距（单位：逻辑像素，默认0）
  final double spacing;

  /// 交叉轴方向行间距（单位：逻辑像素，默认0）
  final double runSpacing;

  /// 主轴对齐方式（默认start）
  final WrapAlignment alignment;

  /// 交叉轴行对齐方式（默认start）
  final WrapCrossAlignment crossAxisAlignment;

  /// 布局方向（默认水平方向）
  final Axis direction;

  /// 垂直方向布局顺序（默认down从上到下）
  final VerticalDirection verticalDirection;

  /// 文本方向（影响对齐）
  final TextDirection? textDirection;

  /// 内容裁剪行为（默认none不裁剪）
  final Clip clipBehavior;

  /// 子元素在主轴上的对齐基准（仅当crossAxisAlignment为baseline时有效）
  final TextBaseline? textBaseline;

  /// 子元素在交叉轴上的尺寸分布方式（默认start）
  final WrapAlignment runAlignment;

  const AntdWrapStyle({
    this.spacing = 0.0,
    this.runSpacing = 0.0,
    this.alignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.direction = Axis.horizontal,
    this.verticalDirection = VerticalDirection.down,
    this.textDirection,
    this.clipBehavior = Clip.none,
    this.textBaseline,
    this.runAlignment = WrapAlignment.start,
  });

  /// 从另一个AntdWrapStyle实例复制属性值（空值不覆盖）
  AntdWrapStyle copyFrom(AntdWrapStyle? style) {
    if (style == null) {
      return this;
    }

    return AntdWrapStyle(
      spacing: style.spacing,
      runSpacing: style.runSpacing,
      alignment: style.alignment,
      crossAxisAlignment: style.crossAxisAlignment,
      direction: style.direction,
      verticalDirection: style.verticalDirection,
      textDirection: style.textDirection ?? textDirection,
      clipBehavior: style.clipBehavior,
      textBaseline: style.textBaseline ?? textBaseline,
      runAlignment: style.runAlignment,
    );
  }

  AntdWrapStyle copyWith({
    double? spacing,
    double? runSpacing,
    WrapAlignment? alignment,
    WrapCrossAlignment? crossAxisAlignment,
    Axis? direction,
    VerticalDirection? verticalDirection,
    TextDirection? textDirection,
    Clip? clipBehavior,
    TextBaseline? textBaseline,
    WrapAlignment? runAlignment,
  }) {
    return AntdWrapStyle(
      spacing: spacing ?? this.spacing,
      runSpacing: runSpacing ?? this.runSpacing,
      alignment: alignment ?? this.alignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      direction: direction ?? this.direction,
      verticalDirection: verticalDirection ?? this.verticalDirection,
      textDirection: textDirection ?? this.textDirection,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      textBaseline: textBaseline ?? this.textBaseline,
      runAlignment: runAlignment ?? this.runAlignment,
    );
  }
}

///@t Wrap
///@l [AntdFlex]
class AntdWrap extends AntdComponent<AntdWrapStyle, AntdWrap> {
  const AntdWrap({
    super.key,
    super.styleBuilder,
    super.style,
    required this.children,
  });

  ///子元素
  final List<Widget> children;

  @override
  Widget render(BuildContext context, AntdWrapStyle style) {
    return Wrap(
      direction: style.direction,
      alignment: style.alignment,
      spacing: style.spacing,
      runAlignment: style.runAlignment,
      runSpacing: style.runSpacing,
      crossAxisAlignment: style.crossAxisAlignment,
      textDirection: style.textDirection,
      verticalDirection: style.verticalDirection,
      clipBehavior: style.clipBehavior,
      children: children.map((value) {
        var index = children.indexOf(value);
        return AntdScrollItemProvider(
            index: index,
            position: AntdScrollItemPosition.fromIndex(index, children.length),
            child: value);
      }).toList(),
    );
  }

  @override
  AntdWrapStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return const AntdWrapStyle();
  }

  @override
  AntdWrap getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdWrapStyle margeStyle(AntdWrapStyle defaultStyle, AntdWrapStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}
