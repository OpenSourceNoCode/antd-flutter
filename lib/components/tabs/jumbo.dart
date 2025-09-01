import 'package:antd_flutter/index.dart';
import 'package:flutter/widgets.dart';

/// @t 复杂选项卡项定义
/// @l [AntdJumboTabs]
class AntdJumboTab extends AntdTab {
  /// 选项卡描述内容（显示在标题下方）
  final Widget? desc;

  const AntdJumboTab({
    required super.title,
    required super.value,
    super.disabled,
    super.child,
    this.desc,
  });
}

/// @t 复杂选项卡样式
/// @l [AntdJumboTabs]
class AntdJumboStyle extends AntdTabsStyle {
  /// 描述文本默认样式
  final AntdBoxStyle? descStyle;

  /// 选中态描述文本样式
  final AntdBoxStyle? activeDescTextStyle;

  const AntdJumboStyle({
    super.inherit,
    super.tabStyle,
    super.panelStyle,
    super.titleStyle,
    super.activeTitleStyle,
    this.descStyle,
    this.activeDescTextStyle,
  });

  @override
  AntdJumboStyle copyFrom(covariant AntdJumboStyle? style) {
    return AntdJumboStyle(
      tabStyle: tabStyle.merge(style?.tabStyle),
      panelStyle: panelStyle.merge(style?.panelStyle),
      titleStyle: titleStyle.merge(style?.titleStyle),
      activeTitleStyle: activeTitleStyle.merge(style?.activeTitleStyle),
      descStyle: descStyle.merge(style?.descStyle),
      activeDescTextStyle:
          activeDescTextStyle.merge(style?.activeDescTextStyle),
    );
  }
}

///@t 复杂选项卡
///@g 导航
///@o 94
///@d 内容组之间进行导航切换
///@u 选项需要有进一步描述时，用在展示型界面的列表或模块中。
class AntdJumboTabs
    extends AntdBaseTabs<AntdJumboStyle, AntdJumboTab, AntdJumboTabs> {
  const AntdJumboTabs({
    super.key,
    super.style,
    super.styleBuilder,
    super.leftExtra,
    super.rightExtra,
    super.controller,
    super.activeValue,
    super.onChange,
    super.tabAlignment = AntdTabAlignment.center,
    required super.tabs,
  });

  @override
  AntdJumboStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var titleTextStyle = token.font.xl;
    var titleStyle = AntdBoxStyle(
        color: token.colorWhite,
        textStyle: titleTextStyle,
        margin: token.size.xs.horizontal);

    var descTextStyle = token.font.sm;
    var descStyle = AntdBoxStyle(
      radius: token.radius.lg.radius.all,
      margin: token.size.xxs.top,
      padding: token.size.default_.horizontal,
      color: token.colorFillTertiary,
      textStyle: descTextStyle.copyWith(color: token.colorTextSecondary),
    );
    var style = AntdJumboStyle(
      tabStyle: AntdBoxStyle(
        padding: token.size.lg.vertical,
        color: token.colorWhite,
        border: token.borderSide.bottom,
      ),
      panelStyle: AntdBoxStyle(
        color: token.colorWhite,
        padding: token.size.lg.all,
      ),
      titleStyle: titleStyle,
      activeTitleStyle: titleStyle.copyWith(
          textStyle: titleTextStyle.copyWith(color: token.colorPrimary)),
      descStyle: descStyle,
      activeDescTextStyle: descStyle.copyWith(
          color: token.colorPrimary,
          textStyle: descTextStyle.copyWith(color: token.colorWhite)),
    );
    return margeStyle(
        style, theme.jumboStyle?.call(context, this, style, token));
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdJumboTabsState();
  }

  @override
  AntdJumboStyle margeStyle(
      AntdJumboStyle defaultStyle, AntdJumboStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdJumboTabs getWidget(BuildContext context) {
    return this;
  }
}

class _AntdJumboTabsState
    extends AntdBaseTabsState<AntdJumboStyle, AntdJumboTab, AntdJumboTabs> {
  @override
  Widget buildHeader(AntdJumboTab tab, int index, bool active) {
    return Column(
      children: [
        tab.title,
        AntdBox(
          style: active ? style.activeDescTextStyle : style.descStyle,
          child: tab.desc,
        )
      ],
    );
  }

  @override
  Widget buildExtra() {
    return const AntdBox();
  }
}
