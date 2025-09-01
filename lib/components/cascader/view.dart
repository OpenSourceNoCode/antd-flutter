import 'package:antd_flutter/index.dart';
import 'package:flutter/widgets.dart';

///配置项样式
///@l [AntdCascaderView]
class AntdCascaderOptionStyle extends AntdStyle {
  /// 子选项的容器样式
  final AntdBoxStyle? childStyle;

  /// 选中状态下子选项的容器样式
  final AntdBoxStyle? checkChildStyle;

  /// 布局使用的Flex样式
  final AntdFlexStyle? flexStyle;

  /// 选中状态下显示的图标
  final Widget? checkIcon;

  /// 未选中状态下显示的图标
  final Widget? uncheckIcon;

  const AntdCascaderOptionStyle(
      {super.inherit,
      this.childStyle,
      this.checkChildStyle,
      this.flexStyle,
      this.checkIcon,
      this.uncheckIcon});

  @override
  AntdCascaderOptionStyle copyFrom(AntdCascaderOptionStyle? style) {
    return AntdCascaderOptionStyle(
      childStyle: childStyle.merge(style?.childStyle),
      checkChildStyle: checkChildStyle.merge(style?.checkChildStyle),
      flexStyle: flexStyle.merge(style?.flexStyle),
      checkIcon: style?.checkIcon ?? checkIcon,
      uncheckIcon: style?.uncheckIcon ?? uncheckIcon,
    );
  }
}

///选项
///@l [AntdCascaderView]
class AntdCascaderOption
    extends AntdComponent<AntdCascaderOptionStyle, AntdCascaderOption> {
  /// 选项的唯一标识值
  final String value;

  /// 父级选项的值，用于构建层级关系
  final String? parentValue;

  /// 选项标题组件
  final Widget? title;

  /// 选项内容组件
  final Widget? child;

  /// 选中状态下显示的图标
  final Widget? checkIcon;

  /// 未选中状态下显示的图标
  final Widget? uncheckIcon;

  /// 是否选中该选项
  final bool check;

  /// 是否禁用该选项
  final bool disabled;

  /// 选项点击回调函数
  final VoidCallback? onTap;

  const AntdCascaderOption(
      {super.key,
      super.style,
      super.styleBuilder,
      required this.value,
      this.parentValue,
      this.title,
      this.child,
      this.checkIcon,
      this.uncheckIcon,
      this.check = false,
      this.disabled = false,
      this.onTap});

  AntdCascaderOption copyFrom(AntdCascaderOption other) {
    return AntdCascaderOption(
      value: other.value,
      parentValue: other.parentValue ?? parentValue,
      title: other.title ?? title,
      check: other.check,
      disabled: other.disabled,
      checkIcon: other.checkIcon ?? checkIcon,
      uncheckIcon: other.uncheckIcon ?? uncheckIcon,
      onTap: other.onTap ?? onTap,
      child: other.child ?? child,
    );
  }

  @override
  Widget render(BuildContext context, AntdCascaderOptionStyle style) {
    var uncheckIcon = this.uncheckIcon ?? style.uncheckIcon;
    var checkIcon = this.checkIcon ?? style.checkIcon;
    return AntdBox(
      options: const AntdTapOptions(behavior: HitTestBehavior.opaque),
      onTap: onTap,
      disabled: disabled,
      style: check
          ? (style.checkChildStyle ?? const AntdBoxStyle())
              .copyFrom(style.childStyle)
          : style.childStyle,
      child: AntdRow(style: style.flexStyle, children: [
        if (child != null) child!,
        (check ? checkIcon : uncheckIcon) ?? const AntdBox()
      ]),
    );
  }

  @override
  AntdCascaderOptionStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var icon = AntdIcon(
      icon: AntdIcons.check,
      style: AntdIconStyle(color: token.colorPrimary),
    );
    return AntdCascaderOptionStyle(
        childStyle: AntdBoxStyle(
            padding: token.size.lg.vertical.marge(token.size.lg.right),
            margin: token.size.lg.left,
            border: token.borderSide.bottom),
        flexStyle: const AntdFlexStyle(
            mainAxisAlignment: MainAxisAlignment.spaceBetween),
        checkIcon: icon,
        uncheckIcon: AntdBox(
          style: const AntdBoxStyle(visibility: AntdVisibility.visible),
          child: icon,
        ));
  }

  @override
  AntdCascaderOption getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdCascaderOptionStyle margeStyle(
      AntdCascaderOptionStyle defaultStyle, AntdCascaderOptionStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

///选项
///@l [AntdCascaderView]
class AntdCascaderViewStyle extends AntdStyle {
  /// 级联选择器主体容器的样式
  final AntdBoxStyle? bodyStyle;

  /// 选项卡组件的样式配置
  final AntdTabsStyle? tabsStyle;

  /// 列表组件的样式配置
  final AntdListStyle? listStyle;

  /// 级联选项的样式配置
  final AntdCascaderOptionStyle? optionStyle;

  const AntdCascaderViewStyle(
      {super.inherit,
      this.bodyStyle,
      this.tabsStyle,
      this.listStyle,
      this.optionStyle});

  @override
  AntdCascaderViewStyle copyFrom(covariant AntdCascaderViewStyle? style) {
    return AntdCascaderViewStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      tabsStyle: tabsStyle.merge(style?.tabsStyle),
      listStyle: listStyle.merge(style?.listStyle),
      optionStyle: optionStyle.merge(style?.optionStyle),
    );
  }
}

typedef AntdCascaderViewChange = void Function(List<String> value);

///@t 级联选择视图
///@g 信息录入
///@o 61
///@d CascaderView 是 Cascader 的内容区域。
///@u 需要从一组相关联的数据集合进行选择，例如省市区，公司层级，事物分类等。
class AntdCascaderView
    extends AntdStateComponent<AntdCascaderViewStyle, AntdCascaderView> {
  const AntdCascaderView(
      {super.key,
      super.style,
      super.styleBuilder,
      this.placeholder = const Text("请选择"),
      this.value,
      required this.options,
      this.onTabsChange,
      this.onChange});

  ///未选中时的提示文案
  final Widget placeholder;

  ///配置每一列的选项
  final List<String>? value;

  ///配置每一列的选项
  final List<AntdCascaderOption> options;

  ///默认选中项
  final AntdTabsOnChange<AntdTab>? onTabsChange;

  ///选项变化时的回调
  final AntdCascaderViewChange? onChange;

  AntdCascaderView copyFrom(AntdCascaderView? view) {
    return AntdCascaderView(
      placeholder: view?.placeholder ?? placeholder,
      value: view?.value ?? value,
      options: view?.options ?? options,
      onTabsChange: view?.onTabsChange ?? onTabsChange,
      onChange: view?.onChange ?? onChange,
    );
  }

  @override
  AntdCascaderViewStyle margeStyle(
      AntdCascaderViewStyle defaultStyle, AntdCascaderViewStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdCascaderViewStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdCascaderViewStyle(
        bodyStyle: const AntdBoxStyle(),
        tabsStyle: const AntdTabsStyle(),
        listStyle: AntdListStyle(
            bodyStyle: AntdBoxStyle(border: token.borderSide.bottom)),
        optionStyle: const AntdCascaderOptionStyle());
  }

  @override
  AntdStyleBuilder<AntdCascaderViewStyle, AntdCascaderView>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.cascaderViewStyle;
  }

  @override
  State<StatefulWidget> createState() {
    return _AntdCascaderViewState();
  }

  @override
  AntdCascaderView getWidget(BuildContext context) {
    return this;
  }
}

class _AntdCascaderViewState
    extends AntdState<AntdCascaderViewStyle, AntdCascaderView> {
  int _currentIndex = -1;
  var _items = <List<AntdCascaderOption>>[];
  final _values = <int, AntdCascaderOption>{};
  final AntdTabController _tabController = AntdTabController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      changePanel(0, 0);
    });
  }

  @override
  void dispose() {
    _values.clear();
    _tabController.dispose();
    super.dispose();
  }

  void changePanel(int clickIndex, int tagetIndex) {
    if (widget.options.isEmpty) {
      return;
    }

    var value = _values[tagetIndex - 1]?.value;
    var subList =
        widget.options.where((option) => option.parentValue == value).toList();
    if (widget.value != null) {
      var data = subList
          .where((data) => widget.value?.contains(data.value) == true)
          .toList()
          .firstOrNull;
      if (data != null) {
        _values[tagetIndex] = data;
      }
    }

    if (clickIndex <= tagetIndex) {
      for (int i = tagetIndex; i < _items.length; i++) {
        _values.remove(i);
      }
      _items = _items.sublist(0, tagetIndex);
    }

    if (subList.isEmpty) {
      setState(() {});
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _tabController.switchTo(clickIndex);
      });
      return;
    }
    setState(() {
      _currentIndex = tagetIndex;
      _items.add(subList);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _tabController.switchTo(_currentIndex);
      });
    });
  }

  Widget getTitle(int index) {
    if (_values.containsKey(index) && _values[index] != null) {
      var option = _values[index];
      if (option == null) {
        return widget.placeholder;
      }
      if (option.title != null) {
        return option.title!;
      }
      if (option.child != null) {
        return option.child!;
      }
      return Text(option.value);
    }
    return widget.placeholder;
  }

  @override
  Widget render(BuildContext context) {
    return AntdBox(
      style: style.bodyStyle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AntdTabs(
            tabs: List.generate(_items.length, (index) {
              return AntdTab(
                title: getTitle(index),
                value: "$index",
              );
            }),
            controller: _tabController,
            tabAlignment: AntdTabAlignment.left,
            indicatorMode: AntdIndicatorMode.full,
            style: style.tabsStyle,
            onChange: (key, tab) {
              widget.onTabsChange?.call(key, tab);
            },
          ),
          AntdStyleProvider<AntdCascaderOptionStyle>(
              style: style.optionStyle,
              child: AntdTabPanel(
                  vertical: false,
                  tabController: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  items: List.generate(_items.length, (i) {
                    var value = _values[i]?.value;

                    return AntdList(
                      style: style.listStyle,
                      shrinkWrap: true,
                      itemBuilder: (ctx) {
                        return ctx.data;
                      },
                      items: _items[i].map((item) {
                        var check = value == item.value;
                        return item.copyFrom(AntdCascaderOption(
                          check: check == true,
                          onTap: () {
                            item.onTap?.call();
                            if (check == true) {
                              _values.remove(i);
                              changePanel(i, i);
                            } else {
                              _values[i] = item;
                              changePanel(i, i + 1);
                            }
                            widget.onChange?.call(_values.values
                                .map((value) => value.value)
                                .toList());
                          },
                          value: item.value,
                        ));
                      }).toList(),
                    );
                  })))
        ],
      ),
    );
  }
}
