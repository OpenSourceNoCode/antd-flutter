import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

/// @t 导航样式
/// @l [AntdNavBar]
class AntdNavBarStyle extends AntdStyle {
  ///主体大小
  final AntdBoxStyle? bodyStyle;

  ///主体轴对齐方式
  final AntdFlexStyle? bodyRowStyle;

  ///返回按钮图标样式
  final AntdIconStyle? backIconStyle;

  ///返回区域轴对齐方式
  final AntdFlexStyle? backRowStyle;

  ///标题样式
  final AntdBoxStyle? backStyle;

  ///子标题样式
  final AntdBoxStyle? titleStyle;

  ///子标题样式
  final AntdBoxStyle? subTitleStyle;

  ///标题轴对齐方式
  final AntdFlexStyle? titleColumnStyle;

  ///右侧是否以Expanded渲染
  final bool? rightExpanded;

  const AntdNavBarStyle(
      {super.inherit,
      this.bodyStyle,
      this.bodyRowStyle,
      this.backIconStyle,
      this.backStyle,
      this.backRowStyle,
      this.titleStyle,
      this.subTitleStyle,
      this.titleColumnStyle,
      this.rightExpanded});

  @override
  AntdNavBarStyle copyFrom(covariant AntdNavBarStyle? style) {
    return AntdNavBarStyle(
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        bodyRowStyle: bodyRowStyle.merge(style?.bodyRowStyle),
        backIconStyle: backIconStyle.merge(style?.backIconStyle),
        backStyle: backStyle.merge(style?.backStyle),
        backRowStyle: backRowStyle.merge(style?.backRowStyle),
        titleStyle: titleStyle.merge(style?.titleStyle),
        subTitleStyle: style?.subTitleStyle ?? subTitleStyle,
        titleColumnStyle: titleColumnStyle.merge(style?.titleColumnStyle),
        rightExpanded: style?.rightExpanded ?? rightExpanded);
  }
}

///@t 导航栏
///@g 导航
///@o 93
///@d 为页面提供全局性的导航功能。
///@u 需要显示当前页面内容的标题和操作。
class AntdNavBar extends AntdComponent<AntdNavBarStyle, AntdNavBar> {
  const AntdNavBar(
      {super.key,
      super.style,
      super.styleBuilder,
      this.back,
      this.backIcon,
      this.title,
      this.subTitle,
      this.left,
      this.right,
      this.safeArea,
      this.onTap,
      this.onBack});

  ///返回区域的文字，如果为 null 的话，backIcon 也不会渲染
  final Widget? back;

  ///返回图标
  final Widget? backIcon;

  ///标题
  final Widget? title;

  ///子标题
  final Widget? subTitle;

  ///左侧区域
  final Widget? left;

  ///右侧区域
  final Widget? right;

  ///安全区
  final AntdPosition? safeArea;

  ///点击事件
  final VoidCallback? onTap;

  ///返回事件
  final VoidCallback? onBack;

  @override
  AntdNavBarStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdNavBarStyle(
        bodyStyle: AntdBoxStyle(
            padding: token.size.lg.horizontal.marge(token.size.xs.vertical),
            textStyle: token.font.md,
            options: const AntdTapOptions(alwaysReceiveTap: true)),
        bodyRowStyle: const AntdFlexStyle(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        backIconStyle: AntdIconStyle(
            size: token.size.xxl.roundToDouble(),
            color: token.colorText,
            bodyStyle: AntdBoxStyle(
                margin: token.size.xs.right,
                padding: token.size.sm.vertical,
                options: const AntdTapOptions(alwaysReceiveTap: true))),
        backStyle: AntdBoxStyle(
            margin: token.size.xl.right,
            options: const AntdTapOptions(alwaysReceiveTap: true)),
        backRowStyle: const AntdFlexStyle(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            expanded: true),
        titleStyle: AntdBoxStyle(
            textStyle:
                token.font.xxl.copyWith(fontWeight: token.fontWeightStrong)),
        titleColumnStyle: const AntdFlexStyle(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            expanded: true),
        subTitleStyle: AntdBoxStyle(textStyle: token.font.xs),
        rightExpanded: true);
  }

  @override
  AntdStyleBuilder<AntdNavBarStyle, AntdNavBar>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.navBarStyle;
  }

  @override
  Widget render(BuildContext context, AntdNavBarStyle style) {
    var leftRow = AntdRow(
      style: style.backRowStyle,
      children: [
        if (left != null) left!,
        if (backIcon != null)
          AntdBox(
            options: const AntdTapOptions(alwaysReceiveTap: true),
            onTap: onBack,
            child: AntdIconWrap(
              style: style.backIconStyle,
              child: backIcon,
            ),
          ),
        if (back != null)
          AntdBox(
            onTap: onBack,
            style: style.backStyle,
            child: back,
          ),
      ],
    );

    return AntdBox(
      onTap: onTap,
      innerSafeArea: safeArea,
      style: style.bodyStyle,
      child: AntdRow(
        style: style.bodyRowStyle,
        children: [
          leftRow,
          AntdColumn(
            style: style.titleColumnStyle,
            children: [
              if (title != null)
                AntdBox(
                  style: style.titleStyle,
                  child: title,
                ),
              if (subTitle != null)
                AntdBox(
                  style: style.subTitleStyle,
                  child: subTitle,
                ),
            ],
          ),
          style.rightExpanded == true
              ? Expanded(child: (right ?? const AntdBox()))
              : (right ?? const AntdBox())
        ],
      ),
    );
  }

  @override
  AntdNavBarStyle margeStyle(
      AntdNavBarStyle defaultStyle, AntdNavBarStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdNavBar getWidget(BuildContext context) {
    return this;
  }
}
