import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

class AntdTabPanel extends AntdScrollPositionedBase<Widget, AntdBoxStyle,
    AntdTabPanel, AntdScrollPositionController<Widget>> {
  final AntdTabController? tabController;

  const AntdTabPanel({
    super.key,
    super.style,
    super.styleBuilder,
    required super.items,
    super.fit = AntdScrollItemFit.fill,
    super.virtual,
    super.physics,
    super.alignment = AntdEdge.center,
    super.vertical = false,
    this.tabController,
  });

  @override
  State<StatefulWidget> createState() {
    return _AntdTabPanelState();
  }

  @override
  AntdTabPanel getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdBoxStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return const AntdBoxStyle();
  }

  @override
  AntdBoxStyle margeStyle(AntdBoxStyle defaultStyle, AntdBoxStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

class _AntdTabPanelState extends AntdScrollPositionedBaseState<Widget,
    AntdBoxStyle, AntdScrollPositionController<Widget>, AntdTabPanel> {
  @override
  void initState() {
    super.initState();
    widget.tabController?.panelScrollController = scrollController;
  }

  @override
  Widget? buildItemBuilder(
      AntdScrollItemContext<Widget, AntdScrollPositionController<Widget>>
          entity) {
    return AntdBox(
      style: style,
      child: entity.data,
    );
  }

  @override
  AntdScrollPositionController<Widget> createController() {
    return AntdScrollPositionController<Widget>();
  }
}
