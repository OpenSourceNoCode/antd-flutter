import 'package:antd_flutter/index.dart';
import 'package:flutter/widgets.dart';

///可勾选列表样式
///@l [AntdCheckList]
class AntdCheckListStyle extends AntdStyle {
  /// 整个复选框列表容器的样式
  final AntdBoxStyle? bodyStyle;

  /// 复选框项目中各个选项项的样式配置
  final AntdCheckItemStyle? checkItemStyle;

  const AntdCheckListStyle({
    super.inherit,
    this.bodyStyle,
    this.checkItemStyle,
  });

  @override
  AntdCheckListStyle copyFrom(covariant AntdCheckListStyle? style) {
    return AntdCheckListStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      checkItemStyle: checkItemStyle.merge(style?.checkItemStyle),
    );
  }
}

typedef AntdCheckListChange = void Function(
    Set<String> values, String? value, bool check);

class AntdCheckListController
    extends AntdScrollPositionController<AntdCheckItem> {}

///@t 可勾选列表
///@g 信息录入
///@o 60
///@d 列表的勾选操作。
///@u 在一组列表项中选择一个或多个。
class AntdCheckList extends AntdScrollPositionedBase<AntdCheckItem,
    AntdCheckListStyle, AntdCheckList, AntdCheckListController> {
  const AntdCheckList(
      {super.key,
      super.style,
      super.styleBuilder,
      super.controller,
      required super.items,
      super.itemBuilder,
      super.edgeThreshold,
      super.onEdgeReached,
      super.virtual = false,
      super.fit = AntdScrollItemFit.child,
      super.shrinkWrap = true,
      this.disable,
      this.onChange,
      this.values});

  ///禁用
  final bool? disable;

  ///选项改变时触发
  final AntdCheckListChange? onChange;

  ///默认选中的值
  final Set<String>? values;

  @override
  State<StatefulWidget> createState() {
    return _AntdCheckListState();
  }

  @override
  AntdCheckListStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdCheckListStyle(
        bodyStyle: AntdBoxStyle(border: token.borderSide.vertical),
        checkItemStyle: const AntdCheckItemStyle());
  }

  @override
  AntdCheckListStyle margeStyle(
      AntdCheckListStyle defaultStyle, AntdCheckListStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdCheckListStyle, AntdCheckList>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.checkListStyle;
  }

  @override
  AntdCheckList getWidget(BuildContext context) {
    return this;
  }
}

class _AntdCheckListState extends AntdScrollPositionedBaseState<AntdCheckItem,
    AntdCheckListStyle, AntdCheckListController, AntdCheckList> {
  var _values = <String>{};

  @override
  void updateDependentValues(covariant AntdCheckList? oldWidget) {
    super.updateDependentValues(oldWidget);
    _values = widget.values != null ? {...widget.values!} : {};
  }

  @override
  Widget? buildItemBuilder(
      AntdScrollItemContext<AntdCheckItem, AntdCheckListController> ctx) {
    var item = super.buildItemBuilder(ctx);
    if (item != null) {
      return item;
    }
    var data = ctx.data;
    return AntdStyleProvider<AntdCheckItemStyle>(
        style: style.checkItemStyle,
        child: ctx.data.copyFrom(AntdCheckItem(
          disable: widget.disable,
          check: _values.contains(data.value),
          onChange: (value, check) {
            if (value == null) {
              return;
            }
            setState(() {
              if (check) {
                _values.add(value);
              } else {
                _values.remove(value);
              }
              widget.onChange?.call(_values, value, check);
            });
          },
        )));
  }

  @override
  Widget build(BuildContext context) {
    return AntdBox(
      style: style.bodyStyle,
      child: super.build(context),
    );
  }

  @override
  AntdCheckListController createController() {
    return AntdCheckListController();
  }
}
