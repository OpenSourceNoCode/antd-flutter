import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 页脚样式类
/// @l [AntdFooter]
class AntdFooterStyle extends AntdStyle {
  /// 标签文本样式（如版权信息等静态文本）
  final AntdBoxStyle? labelStyle;

  /// 链接文本样式（可点击的链接元素）
  final AntdBoxStyle? linkStyle;

  /// 内容区域容器样式（包裹所有内容的容器）
  final AntdBoxStyle? contentStyle;

  /// 标签项默认样式（如分类标签/Tab标签）
  final AntdBoxStyle? chipStyle;

  /// 标签项激活状态样式（当前选中标签）
  final AntdBoxStyle? chipActiveStyle;

  const AntdFooterStyle({
    super.inherit,
    this.labelStyle,
    this.linkStyle,
    this.contentStyle,
    this.chipStyle,
    this.chipActiveStyle,
  });

  @override
  AntdFooterStyle copyFrom(covariant AntdFooterStyle? style) {
    return AntdFooterStyle(
      labelStyle: labelStyle.merge(style?.labelStyle),
      linkStyle: linkStyle.merge(style?.linkStyle),
      contentStyle: contentStyle.merge(style?.contentStyle),
      chipStyle: chipStyle.merge(style?.chipStyle),
      chipActiveStyle: chipActiveStyle.mergeActive(
          chipStyle, style?.chipStyle, style?.chipActiveStyle),
    );
  }
}

/// 页脚标签项数据类
/// @l [AntdFooter]
class AntdFooterChip {
  /// 标签项组件（可自定义Widget内容）
  final Widget? chip;

  /// 是否处于激活状态（控制高亮显示）
  final bool? active;

  const AntdFooterChip({
    this.chip,
    this.active,
  });
}

///@t 页脚
///@g 信息展示
///@o 73
///@u 适用于页面底部信息描述。
class AntdFooter extends AntdComponent<AntdFooterStyle, AntdFooter> {
  const AntdFooter({
    super.key,
    super.style,
    super.styleBuilder,
    this.label,
    this.links,
    this.content,
    this.chips,
  });

  ///带分割线的顶部内容
  final Widget? label;

  ///链接内容
  final List<Widget>? links;

  ///普通的内容部分
  final Widget? content;

  ///底部标签
  final List<AntdFooterChip>? chips;

  @override
  Widget render(BuildContext context, AntdFooterStyle style) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          AntdDivider(
            style: AntdDividerStyle(childStyle: style.labelStyle),
            child: label,
          ),
        if (links != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...links!.map((value) {
                return Row(
                  children: [
                    AntdBox(
                      style: style.linkStyle,
                      child: value,
                    ),
                    if (value != links!.last)
                      const AntdDivider(
                        vertical: true,
                      )
                  ],
                );
              })
            ],
          ),
        if (content != null)
          AntdBox(
            style: style.contentStyle,
            child: content!,
          ),
        if (chips != null)
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ...chips!.map((value) {
              return AntdBox(
                  style: value.active == true
                      ? style.chipActiveStyle
                      : style.chipStyle,
                  child: value.chip);
            })
          ])
      ],
    );
  }

  @override
  AntdFooterStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var chipStyle = AntdBoxStyle(
        textStyle: token.font.xs.copyWith(color: token.colorText.secondary),
        color: token.colorFill.tertiary,
        radius: 9999.radius.all,
        margin: token.size.xxl.right.marge(token.size.seed.vertical),
        padding: token.size.xs.vertical.marge(token.size.lg.horizontal));
    return AntdFooterStyle(
        labelStyle: AntdBoxStyle(
            textStyle: token.font.ms.copyWith(color: token.colorText.tertiary),
            padding: token.size.xl.horizontal,
            margin: token.size.xl.vertical),
        linkStyle: AntdBoxStyle(
            textStyle: token.font.sm.copyWith(color: token.colorLink),
            padding: token.size.ms.vertical),
        contentStyle: AntdBoxStyle(
            alignment: Alignment.center,
            textStyle: token.font.sm.copyWith(color: token.colorText.tertiary),
            margin: token.size.ms.vertical),
        chipStyle: chipStyle,
        chipActiveStyle: chipStyle.copyWith(
            color: token.colorLink.bg,
            textStyle: chipStyle.textStyle?.copyWith(color: token.colorLink)));
  }

  @override
  AntdFooterStyle margeStyle(
      AntdFooterStyle defaultStyle, AntdFooterStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdFooterStyle, AntdFooter>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.footerStyle;
  }

  @override
  AntdFooter getWidget(BuildContext context) {
    return this;
  }
}
