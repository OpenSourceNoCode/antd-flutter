import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

///@t 胶囊选项卡
///@g 导航
///@o 96
///@d 内容组之间进行导航切换。实现自[AntdTab]支持他的所有行为
///@u 选项卡的另外一种样式，用在展示型界面的列表或模块中。
class AntdCapsuleTabs extends AntdTabs {
  const AntdCapsuleTabs(
      {super.key,
      super.style,
      super.styleBuilder,
      super.leftExtra,
      super.rightExtra,
      super.controller,
      super.activeValue,
      super.onChange,
      super.tabAlignment = AntdTabAlignment.center,
      required super.tabs,
      super.hapticFeedback});

  @override
  AntdTabsStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var baseText = token.font.md;
    var titleStyle = AntdBoxStyle(
      radius: BorderRadius.circular(20),
      color: token.colorFillContent,
      margin: token.size.sm.horizontal,
      padding: token.size.default_.vertical.marge(token.size.xl.horizontal),
      textStyle: baseText,
    );
    var style = AntdTabsStyle(
      tabStyle: AntdBoxStyle(
        padding: token.size.lg.vertical,
        color: token.colorWhite,
        border: token.borderSide.bottom,
      ),
      panelStyle: AntdBoxStyle(
        color: token.colorWhite,
        padding: token.size.lg.all,
      ),
      activeTitleStyle: titleStyle.copyWith(
          color: token.colorPrimary,
          textStyle: baseText.copyWith(color: token.colorWhite)),
      titleStyle: titleStyle,
    );
    return margeStyle(
        style, theme.capsuleTabsStyle?.call(context, this, style, token));
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdCapsuleTabsState();
  }
}

class _AntdCapsuleTabsState extends AntdTabsState {}
