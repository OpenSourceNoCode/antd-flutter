import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/cupertino.dart';

enum AntdFormLayout { vertical, horizontal }

enum AntdFormTrigger { onChange, onFocus, any }

abstract class AntdFormBase<Style extends AntdStyle, WidgetType>
    extends AntdStateComponent<Style, WidgetType> {
  ///只读
  final bool? readOnly;

  ///禁用
  final bool? disabled;

  ///是否展示错误反馈
  final bool? hasFeedback;

  ///布局模式
  final AntdFormLayout? layout;

  ///当字段被删除时保留字段值
  final bool? preserve;

  ///是否必选，需要注意的是这个属性仅仅用来控制外观，并不包含校验逻辑
  final bool? required;

  ///设置收集字段值变更的时机
  final AntdFormTrigger? trigger;

  ///当某一规则校验不通过时，是否停止剩下的规则的校验。设置 parallel 时会并行校验
  final bool? validateFirst;

  ///设置字段校验的时机
  final AntdFormTrigger? validateTrigger;

  ///控制器
  final AntdFormController? controller;

  const AntdFormBase(
      {super.key,
      super.style,
      super.styleBuilder,
      this.readOnly,
      this.disabled,
      this.hasFeedback,
      this.layout,
      this.preserve,
      this.required,
      this.trigger,
      this.validateFirst,
      this.validateTrigger,
      this.controller});
}

typedef AntdFormFieldsChange = void Function(
    List<String> newNames, bool add, List<String> names);

typedef AntdFormValuesChange = void Function(
    AntdFormController contoller, Map<String, dynamic> changeValues);

typedef AntdFormFinish = void Function(
    Map<String, dynamic>? values, List<AntdFormRuleResult> ruleResults);

class AntdFormProvider extends InheritedWidget {
  final AntdFormState fromState;
  final AntdFormController controller;

  AntdForm get from => fromState.widget;

  const AntdFormProvider(
      {super.key,
      required super.child,
      required this.fromState,
      required this.controller});

  @override
  bool updateShouldNotify(covariant AntdFormProvider oldWidget) {
    return fromState != oldWidget.fromState ||
        controller != oldWidget.controller;
  }

  static AntdFormProvider? ofMaybe(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AntdFormProvider>();
  }
}

typedef AntdFormBuilder = Widget Function(AntdFormController contoller);

///@t 表单
///@g 信息录入
///@o 59
///@d 高性能表单控件，自带数据域管理。包含数据录入、校验以及对应样式。
///@u 适用于创建一个实体或收集信息。需要对输入的数据类型进行校验时。
class AntdForm extends AntdFormBase<AntdBoxStyle, AntdForm> {
  const AntdForm({
    super.key,
    super.style,
    super.styleBuilder,
    super.readOnly,
    super.disabled,
    super.hasFeedback,
    super.layout,
    super.preserve,
    super.required,
    super.trigger,
    super.validateFirst,
    super.validateTrigger,
    super.controller,
    this.initialValues,
    required this.builder,
    this.onFieldsChange,
    this.onFinish,
    this.onValuesChange,
  });

  ///表单默认值，只有初始化以及重置时生效
  final Map<String, dynamic>? initialValues;

  ///子项
  final AntdFormBuilder builder;

  ///字段更新时触发
  final AntdFormFieldsChange? onFieldsChange;

  ///提交表单且数据验证成功后触发
  final AntdFormFinish? onFinish;

  ///字段值更新时触发
  final AntdFormValuesChange? onValuesChange;

  @override
  State<StatefulWidget> createState() {
    return AntdFormState();
  }

  @override
  AntdBoxStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return const AntdBoxStyle();
  }

  @override
  AntdStyleBuilder<AntdBoxStyle, AntdForm>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.formStyle;
  }

  @override
  AntdBoxStyle margeStyle(AntdBoxStyle defaultStyle, AntdBoxStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdForm getWidget(BuildContext context) {
    return this;
  }
}

class AntdFormState extends AntdState<AntdBoxStyle, AntdForm> {
  late final AntdFormController innerController =
      widget.controller ?? AntdFormController();

  @override
  void updateDependentValues(covariant AntdForm? oldWidget) {
    super.updateDependentValues(oldWidget);
    innerController.removeFinishListener(oldWidget?.onFinish);
    innerController.removeValuesChangeListener(oldWidget?.onValuesChange);
    innerController.removeFieldsChangeListener(oldWidget?.onFieldsChange);
    innerController.addFinishListener(widget.onFinish);
    innerController.addValuesChangeListener(widget.onValuesChange);
    innerController.addFieldsChangeListener(widget.onFieldsChange);

    if (widget.initialValues != oldWidget?.initialValues) {
      innerController.init(widget.initialValues);
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      innerController.dispose();
    }
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    return AntdBox(
      style: style,
      child: AntdFormProvider(
          fromState: this,
          controller: innerController,
          child: widget.builder(innerController)),
    );
  }
}
