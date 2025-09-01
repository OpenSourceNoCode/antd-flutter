import 'package:antd_flutter/index.dart';
import 'package:flutter/widgets.dart';

///卡片样式
///@l [AntdCard]
class AntdCardStyle extends AntdStyle {
  ///body样式
  final AntdBoxStyle? bodyStyle;

  ///body样式
  final AntdFlexStyle? bodyColumnStyle;

  ///header样式
  final AntdBoxStyle? headerStyle;

  ///header样式
  final AntdFlexStyle? headerRowStyle;

  ///标题样式
  final AntdBoxStyle? titleStyle;

  ///额外样式
  final AntdBoxStyle? extraStyle;

  ///内容样式
  final AntdBoxStyle? contentStyle;

  ///底部样式
  final AntdBoxStyle? footerStyle;

  const AntdCardStyle(
      {super.inherit,
      this.bodyStyle,
      this.bodyColumnStyle,
      this.headerStyle,
      this.headerRowStyle,
      this.titleStyle,
      this.extraStyle,
      this.contentStyle,
      this.footerStyle});

  @override
  AntdCardStyle copyFrom(AntdCardStyle? style) {
    return AntdCardStyle(
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        bodyColumnStyle: bodyColumnStyle.merge(style?.bodyColumnStyle),
        headerStyle: headerStyle.merge(style?.headerStyle),
        headerRowStyle: headerRowStyle.merge(style?.headerRowStyle),
        titleStyle: titleStyle.merge(style?.titleStyle),
        extraStyle: extraStyle.merge(style?.extraStyle),
        contentStyle: contentStyle.merge(style?.contentStyle),
        footerStyle: footerStyle.merge(style?.footerStyle));
  }
}

///@t 卡片
///@g 信息展示
///@o 91
///@d 通用卡片容器。
///@u 可承载文字、列表、图片、段落等，便于用户浏览内容。
class AntdCard extends AntdComponent<AntdCardStyle, AntdCard> {
  const AntdCard(
      {super.key,
      super.style,
      super.styleBuilder,
      this.icon,
      this.extra,
      this.title,
      this.child,
      this.footer});

  ///标题右边的扩展区
  final Widget? icon;

  ///标题左边的扩展区
  final Widget? extra;

  ///标题
  final Widget? title;

  ///卡片内容
  final Widget? child;

  ///底部内容
  final Widget? footer;

  @override
  Widget render(BuildContext context, AntdCardStyle style) {
    return AntdBox(
      style: style.bodyStyle,
      child: AntdColumn(
        style: style.bodyColumnStyle,
        children: [
          if (title != null || extra != null || icon != null)
            AntdBox(
              style: style.headerStyle,
              child: AntdRow(
                style: style.headerRowStyle,
                children: [
                  if (icon != null) icon!,
                  if (title != null)
                    AntdBox(
                      style: style.titleStyle,
                      child: title!,
                    ),
                  if (extra != null)
                    AntdBox(
                      style: style.extraStyle,
                      child: extra!,
                    )
                ],
              ),
            ),
          if (child != null)
            AntdBox(
              style: style.contentStyle,
              child: child,
            ),
          if (footer != null)
            AntdBox(
              style: style.footerStyle,
              child: footer,
            )
        ],
      ),
    );
  }

  @override
  AntdCardStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdCardStyle(
        bodyStyle: AntdBoxStyle(
            radius: token.radius.default_.radius.all,
            textStyle: token.font.sm,
            color: token.colorWhite,
            padding: token.size.lg.horizontal),
        bodyColumnStyle: const AntdFlexStyle(mainAxisSize: MainAxisSize.min),
        headerStyle: AntdBoxStyle(
            border: token.borderSide.bottom,
            textStyle: token.font.md,
            padding: token.size.lg.vertical),
        headerRowStyle: const AntdFlexStyle(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        extraStyle: const AntdBoxStyle(),
        titleStyle: const AntdBoxStyle(
          alignment: Alignment.center,
        ),
        contentStyle: AntdBoxStyle(padding: token.size.lg.vertical),
        footerStyle: AntdBoxStyle(
            border: token.borderSide.top, padding: token.size.lg.vertical));
  }

  @override
  AntdCardStyle margeStyle(AntdCardStyle defaultStyle, AntdCardStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdCardStyle, AntdCard>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.cardStyle;
  }

  @override
  AntdCard getWidget(BuildContext context) {
    return this;
  }
}
