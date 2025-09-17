import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/cupertino.dart';

/// 折叠面板(Collapse)的整体样式配置
/// @l [AntdCollapse]
class AntdCollapseStyle extends AntdStyle {
  /// 面板标题的默认样式
  final AntdBoxStyle? titleStyle;

  /// 面板内容区域的容器样式
  final AntdBoxStyle? bodyStyle;

  /// 单个折叠项的容器样式
  final AntdBoxStyle? itemStyle;

  ///子类的样式,当没有使用itemBuilder的默认样式
  final AntdBoxStyle? childStyle;

  /// 面板展开时的内容区域样式
  final AntdBoxStyle? contentStyle;

  /// 折叠图标的默认样式
  final AntdIconStyle? iconStyle;

  /// 默认状态下的折叠图标
  final Widget? icon;

  /// 展开图标的默认样式
  final AntdIconStyle? activeIconStyle;

  /// 展开状态下的折叠图标
  final Widget? activeIcon;

  /// 禁用图标的默认样式
  final AntdIconStyle? disableIconStyle;

  /// 禁用状态下的折叠图标
  final Widget? disableIcon;

  const AntdCollapseStyle({
    this.titleStyle,
    this.bodyStyle,
    this.itemStyle,
    this.childStyle,
    this.contentStyle,
    this.iconStyle,
    this.icon,
    this.activeIconStyle,
    this.activeIcon,
    this.disableIconStyle,
    this.disableIcon,
  });

  @override
  AntdCollapseStyle copyFrom(covariant AntdCollapseStyle? style) {
    return AntdCollapseStyle(
      itemStyle: itemStyle.merge(style?.itemStyle),
      childStyle: childStyle.merge(style?.childStyle),
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      titleStyle: titleStyle.merge(style?.titleStyle),
      contentStyle: contentStyle.merge(style?.contentStyle),
      iconStyle: iconStyle.merge(style?.iconStyle),
      icon: style?.icon ?? icon,
      activeIconStyle: activeIconStyle.merge(style?.activeIconStyle),
      activeIcon: style?.activeIcon ?? activeIcon,
      disableIconStyle: disableIconStyle.merge(style?.disableIconStyle),
      disableIcon: style?.disableIcon ?? disableIcon,
    );
  }
}

/// 折叠面板中的单个可折叠项
/// @l [AntdCollapse]
class AntdCollapseItem {
  /// 是否禁用当前折叠项
  final bool disabled;

  /// 折叠项的标题内容
  final Widget? title;

  /// 折叠项展开时显示的内容
  final Widget? content;

  /// 自定义折叠图标
  final Widget? icon;

  /// 展开状态下的自定义图标
  final Widget? activeIcon;

  /// 禁用状态下的自定义图标
  final Widget? disableIcon;

  /// 点击折叠项的回调函数
  final VoidCallback? onTap;

  /// 自定义项渲染构建器（参数：当前项实例/基础子组件）
  final Widget Function(AntdCollapseItem item, Widget child)? builder;

  const AntdCollapseItem({
    this.disabled = false,
    this.title,
    this.content,
    this.icon,
    this.activeIcon,
    this.disableIcon,
    this.onTap,
    this.builder,
  });
}

class AntdCollapseController
    extends AntdScrollPositionController<AntdCollapseItem> {}

typedef AntdCollapseChange = void Function(int index, bool select);

///@t 折叠面板
///@g 信息展示
///@o 90
///@d 可以折叠/展开的内容区域。
///@u 对复杂区域进行分组和隐藏，保持页面的整洁。
class AntdCollapse extends AntdScrollPositionedBase<AntdCollapseItem,
    AntdCollapseStyle, AntdCollapse, AntdCollapseController> {
  const AntdCollapse(
      {super.key,
      super.style,
      super.styleBuilder,
      required super.items,
      super.itemBuilder,
      super.shrinkWrap = true,
      super.controller,
      this.value,
      this.onChange});

  ///活动的索引
  final List<int>? value;

  ///变更时出触发
  final AntdCollapseChange? onChange;

  @override
  AntdCollapseStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var style = AntdListStyle.defaultStyle(token, false);
    return AntdCollapseStyle(
        itemStyle: style.itemStyle,
        childStyle: style.childStyle?.copyWith(
            options: const AntdTapOptions(accepter: AntdTapAccepter.listener)),
        bodyStyle: style.bodyStyle,
        titleStyle: AntdBoxStyle(textStyle: token.font.lg),
        iconStyle: AntdIconStyle(size: 20, color: token.colorText.quaternary),
        contentStyle: AntdBoxStyle(padding: token.size.md.all),
        icon: const AntdIcon(
          icon: AntdIcons.up,
        ),
        activeIcon: const AntdIcon(
          icon: AntdIcons.down,
        ));
  }

  @override
  AntdCollapseStyle getFinalStyle(
      BuildContext context, AntdCollapseStyle style, AntdMapToken token) {
    return margeStyle(
        style,
        AntdCollapseStyle(
            activeIcon: style.activeIcon ?? style.icon,
            activeIconStyle: style.iconStyle.merge(style.activeIconStyle),
            disableIcon: style.disableIcon ?? style.icon,
            disableIconStyle: style.iconStyle.merge(style.disableIconStyle)));
  }

  @override
  AntdCollapseStyle margeStyle(
      AntdCollapseStyle defaultStyle, AntdCollapseStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdCollapseState();
  }

  @override
  AntdStyleBuilder<AntdCollapseStyle, AntdCollapse>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.collapseStyle;
  }

  @override
  AntdCollapse getWidget(BuildContext context) {
    return this;
  }
}

class _AntdCollapseState extends AntdScrollPositionedBaseState<AntdCollapseItem,
    AntdCollapseStyle, AntdCollapseController, AntdCollapse> {
  List<int> value = [];

  @override
  void updateDependentValues(covariant AntdCollapse? oldWidget) {
    super.updateDependentValues(oldWidget);
    value.clear();
    value.addAll(widget.value ?? []);
  }

  Widget getIcon(AntdCollapseItem item, int index) {
    if (item.disabled) {
      return AntdIconWrap(
        style: style.disableIconStyle,
        child: item.disableIcon ?? style.disableIcon,
      );
    }
    return value.contains(index)
        ? AntdIconWrap(
            style: style.activeIconStyle,
            child: item.activeIcon ?? style.activeIcon,
          )
        : AntdIconWrap(
            style: style.iconStyle,
            child: item.icon ?? style.icon,
          );
  }

  @override
  Widget? buildItemBuilder(
      AntdScrollItemContext<AntdCollapseItem, AntdCollapseController> entity) {
    if (widget.itemBuilder != null) {
      return widget.itemBuilder!(entity);
    }

    var item = entity.data;
    var active = value.contains(entity.index) == true;
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AntdBox(
          style: style.titleStyle,
          child: item.title,
        ),
        getIcon(item, entity.index)
      ],
    );
    var finalHeader =
        item.builder != null ? item.builder!(item, header) : header;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AntdBox(
          style: style.itemStyle,
          child: AntdBox(
            disabled: item.disabled,
            style: style.childStyle,
            onTap: () {
              widget.onChange?.call(entity.index, !active);
              item.onTap?.call();
              setState(() {
                if (active) {
                  value.remove(entity.index);
                } else {
                  value.add(entity.index);
                }
              });
            },
            child: finalHeader,
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          curve: Curves.easeOutCubic,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: active ? 1.0 : 0.0,
            child: active
                ? AntdBox(
                    style: style.contentStyle,
                    child: item.content,
                  )
                : const AntdBox(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AntdBox(
      style: style.bodyStyle,
      child: super.build(context),
    );
  }

  @override
  AntdCollapseController createController() {
    return AntdCollapseController();
  }
}
