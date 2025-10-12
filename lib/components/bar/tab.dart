import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

/// TabBar 基础样式定义（包含默认/激活状态的图标和标题样式）
/// @l [AntdTabBar]
class AntdTabBarBaseStyle extends AntdStyle {
  /// 默认状态下的图标样式
  final AntdIconStyle? iconStyle;

  /// 激活状态下的图标样式
  final AntdIconStyle? activeIconStyle;

  /// 默认状态下的标题文本样式
  final AntdBoxStyle? titleStyle;

  /// 激活状态下的标题文本样式
  final AntdBoxStyle? activeTitleStyle;

  const AntdTabBarBaseStyle({
    super.inherit,
    this.iconStyle,
    this.activeIconStyle,
    this.titleStyle,
    this.activeTitleStyle,
  });
}

/// TabBar 完整样式（扩展基础样式，增加容器样式）
/// @l [AntdTabBar]
class AntdTabBarStyle extends AntdTabBarBaseStyle {
  /// 内容区域容器样式（通常用于包裹整个TabBar）
  final AntdBoxStyle? bodyStyle;

  /// 单个Tab项的容器样式
  final AntdBoxStyle? itemStyle;

  /// item的Column样式
  final AntdFlexStyle? itemColumnStyle;

  const AntdTabBarStyle({
    this.bodyStyle,
    this.itemStyle,
    this.itemColumnStyle,
    super.iconStyle,
    super.activeIconStyle,
    super.titleStyle,
    super.activeTitleStyle,
  });

  @override
  AntdTabBarStyle copyFrom(covariant AntdTabBarStyle? style) {
    return AntdTabBarStyle(
        bodyStyle: bodyStyle.merge(style?.bodyStyle),
        itemStyle: itemStyle.merge(style?.itemStyle),
        itemColumnStyle: itemColumnStyle.merge(style?.itemColumnStyle),
        iconStyle: iconStyle.merge(style?.iconStyle),
        activeIconStyle: activeIconStyle.mergeActive(
            iconStyle, style?.iconStyle, style?.activeIconStyle),
        titleStyle: titleStyle.merge(style?.titleStyle),
        activeTitleStyle: activeTitleStyle.mergeActive(
            titleStyle, style?.titleStyle, style?.activeTitleStyle));
  }
}

/// TabBar 单个选项卡项的定义
/// @l [AntdTabBar]
class AntdTabBarItem {
  /// 默认状态下显示的图标
  final Widget? icon;

  /// 选项卡标题（支持任意Widget）
  final Widget? title;

  /// 激活状态下显示的图标（未设置时回退使用icon）
  final Widget? activeIcon;

  ///被激活时的回调
  final VoidCallback? onActive;

  /// 自定义内容构建器（参数：child-基础内容, index-选项卡索引, active-是否激活）
  final Widget Function(Widget child, int index, bool active)? builder;

  const AntdTabBarItem(
      {this.icon, this.title, this.activeIcon, this.builder, this.onActive});
}

typedef AntdTabBarOnChange = void Function(int index);

///@t 标签栏
///@g 导航
///@o 91
///@d 页面底部导航标签。
///@u 适用于在不同页面之间进行切换。
class AntdTabBar extends AntdComponent<AntdTabBarStyle, AntdTabBar> {
  const AntdTabBar(
      {super.key,
      super.style,
      super.styleBuilder,
      this.activeIndex = 1,
      this.onChange,
      this.safeArea,
      required this.items});

  ///激活的索引
  final int activeIndex;

  ///切换面板的回调
  final AntdTabBarOnChange? onChange;

  ///是否开启安全区适配
  final AntdPosition? safeArea;

  ///列表项
  final List<AntdTabBarItem> items;

  @override
  AntdTabBarStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var titleTextStyle =
        token.font.xxs.copyWith(color: token.colorText.secondary);
    var iconStyle = AntdIconStyle(
        size: token.size.xxl.roundToDouble(),
        color: token.colorText.secondary,
        weight: 800);
    var titleStyle =
        AntdBoxStyle(textStyle: titleTextStyle, margin: token.size.xxs.top);
    return AntdTabBarStyle(
        itemStyle: AntdBoxStyle(
            padding: token.size.xs.vertical.marge(token.size.ms.horizontal)),
        itemColumnStyle: const AntdFlexStyle(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        iconStyle: iconStyle,
        activeIconStyle: AntdIconStyle(color: token.colorPrimary),
        titleStyle: titleStyle,
        activeTitleStyle: AntdBoxStyle(
            textStyle: titleTextStyle.copyWith(color: token.colorPrimary)));
  }

  @override
  AntdTabBarStyle margeStyle(
      AntdTabBarStyle defaultStyle, AntdTabBarStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdTabBarStyle, AntdTabBar>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.tabBarStyle;
  }

  @override
  Widget render(BuildContext context, AntdTabBarStyle style) {
    var childList = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      var item = items[i];
      var active = activeIndex == i;
      var child = AntdBox(
        style: style.itemStyle,
        options: const AntdTapOptions(
            behavior: HitTestBehavior.opaque, alwaysTriggerTap: true),
        onTap: () {
          item.onActive?.call();
          onChange?.call(i);
        },
        child: AntdColumn(
          style: style.itemColumnStyle,
          children: [
            if (item.icon != null)
              AntdIconWrap(
                  style: active ? style.activeIconStyle : style.iconStyle,
                  child: active ? (item.activeIcon ?? item.icon) : item.icon),
            if (item.title != null)
              AntdBox(
                style: active ? style.activeTitleStyle : style.titleStyle,
                child: item.title,
              ),
          ],
        ),
      );
      childList.add(Expanded(
          child: item.builder != null
              ? item.builder!.call(child, i, active)
              : child));
    }
    return AntdBox(
      style: style.bodyStyle,
      innerSafeArea: safeArea,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: childList,
      ),
    );
  }

  @override
  AntdTabBar getWidget(BuildContext context) {
    return this;
  }
}
