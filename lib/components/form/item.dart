import 'dart:math';

import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// 表单项布局跨度配置
/// @l[AntdForm]
class AntdFormItemSpan extends AntdStyle {
  /// 标签部分所占栅格列数（默认2）
  final int label;

  /// 控件部分所占栅格列数（默认4）
  final int item;

  const AntdFormItemSpan({
    this.label = 2,
    this.item = 4,
  });

  @override
  AntdFormItemSpan copyFrom(covariant AntdFormItemSpan? style) {
    return AntdFormItemSpan(
      label: style?.label ?? label,
      item: style?.item ?? item,
    );
  }
}

/// 必填标志的样式
/// @l [AntdForm]
class AntdFormItemRequireStyle extends AntdStyle {
  final Size size;
  final Color color;

  const AntdFormItemRequireStyle(
      {this.size = const Size(5, 5), required this.color});

  @override
  AntdFormItemRequireStyle copyFrom(covariant AntdFormItemRequireStyle? style) {
    return AntdFormItemRequireStyle(
      size: style?.size ?? size,
      color: style?.color ?? color,
    );
  }
}

/// 表单项样式配置
/// @l[AntdForm]
class AntdFormItemStyle extends AntdStyle {
  /// 表单项整体容器样式
  final AntdBoxStyle? bodyStyle;

  /// 表单控件容器样式
  final AntdBoxStyle? itemStyle;

  /// item的对齐样式
  final AntdFlexStyle? itemFlexStyle;

  /// 标签文本容器样式
  final AntdBoxStyle? labelStyle;

  /// 标签文本容器样式
  final AntdFlexStyle? labelRowStyle;

  /// 校验反馈信息容器样式
  final AntdBoxStyle? feedbackStyle;

  /// 帮助提示图标样式
  final AntdIconStyle? helpIconStyle;

  /// 额外操作图标样式
  final AntdIconStyle? extraIconStyle;

  ///扩展区域的对齐样式
  final AntdFlexStyle? extraRowStyle;

  /// 栅格布局跨度配置
  final AntdFormItemSpan span;

  ///必填标记样式
  final AntdFormItemRequireStyle? requireStyle;

  const AntdFormItemStyle(
      {super.inherit,
      this.bodyStyle,
      this.itemStyle,
      this.itemFlexStyle,
      this.labelStyle,
      this.labelRowStyle,
      this.feedbackStyle,
      this.helpIconStyle,
      this.extraIconStyle,
      this.extraRowStyle,
      this.span = const AntdFormItemSpan(),
      this.requireStyle});

  @override
  AntdFormItemStyle copyFrom(covariant AntdFormItemStyle? style) {
    return AntdFormItemStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      itemStyle: itemStyle.merge(style?.itemStyle),
      itemFlexStyle: itemFlexStyle.merge(style?.itemFlexStyle),
      labelStyle: labelStyle.merge(style?.labelStyle),
      labelRowStyle: labelRowStyle.merge(style?.labelRowStyle),
      feedbackStyle: feedbackStyle.merge(style?.feedbackStyle),
      helpIconStyle: helpIconStyle.merge(style?.helpIconStyle),
      extraIconStyle: extraIconStyle.merge(style?.extraIconStyle),
      span: span.merge(style?.span)!,
      requireStyle: requireStyle.merge(style?.requireStyle),
    );
  }
}

typedef AntdFormItemNormalize<T> = dynamic Function(T? value);

typedef AntdFormItemSetValue = void Function(
    dynamic value, AntdFormTrigger sourceTrigger);

typedef AntdFormItemChange<T> = void Function(
    AntdFormController? contoller, T? value);

typedef AntdFormItemShouUpdate = bool Function(
    Map<String, dynamic>? value, Map<String, dynamic>? beforeValue);

class AntdFormItemProvider extends InheritedWidget {
  final bool disabled;
  final bool readOnly;
  final dynamic Function() getValue;
  final AntdFormItemSetValue setValue;
  final String namePath;
  final bool existsShouUpdate;

  const AntdFormItemProvider(
      {super.key,
      required super.child,
      required this.disabled,
      required this.readOnly,
      required this.getValue,
      required this.setValue,
      required this.namePath,
      required this.existsShouUpdate});

  @override
  bool updateShouldNotify(covariant AntdFormItemProvider oldWidget) {
    return getValue != oldWidget.getValue ||
        setValue != oldWidget.setValue ||
        namePath != oldWidget.namePath ||
        disabled != oldWidget.disabled ||
        readOnly != oldWidget.readOnly ||
        existsShouUpdate != oldWidget.existsShouUpdate;
  }

  static AntdFormItemProvider? ofMaybe<T>(BuildContext context) {
    var provider =
        context.dependOnInheritedWidgetOfExactType<AntdFormItemProvider>();
    return provider;
  }
}

class AntdFormItemContext<T> {
  final BuildContext context;
  final AntdFormController? controller;
  final Map<String, dynamic>? formValue;
  final T? value;
  final ValueChanged<dynamic> onChange;

  const AntdFormItemContext(
      {required this.context,
      this.controller,
      this.formValue,
      this.value,
      required this.onChange});
}

typedef AntdFormItemBuilder<T> = Widget Function(AntdFormItemContext<T> ctx);

class AntdFormItemLayoutContext {
  final Widget item;
  final Widget? label;
  final Widget? feedback;
  final Widget? extra;

  const AntdFormItemLayoutContext(
      {required this.item, this.label, this.feedback, this.extra});
}

typedef AntdFormItemLayoutBuilder = Widget Function(
    AntdFormItemLayoutContext ctx);

///@t 表单项
///@g 信息录入
///@o 59
///@d 与表单搭配使用，只是属性太多单独列出来了
class AntdFormItem extends AntdFormBase<AntdFormItemStyle, AntdFormItem> {
  const AntdFormItem(
      {super.key,
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
      this.help,
      this.helpIcon = const AntdIcon(
        icon: AntdIcons.questionCircle,
      ),
      this.hidden,
      this.initialValue,
      this.onChange,
      this.label,
      required this.name,
      this.dependencies,
      this.normalize,
      this.rules,
      this.extra,
      required this.builder,
      this.layoutBuilder,
      this.shouUpdate});

  ///提示文本
  final Widget? help;

  ///提示图标
  final Widget helpIcon;

  ///是否隐藏整个字段
  final bool? hidden;

  ///设置子元素默认值，如果与 Form 的 initialValues 冲突则以 Form 为准
  final dynamic initialValue;

  ///数据改变时调用
  final AntdFormItemChange? onChange;

  ///标签名
  final Widget? label;

  ///字段名,嵌套的路径如 "user.address.city"
  final String name;

  ///依赖的字段信息
  final List<String>? dependencies;

  ///组件获取值后进行转换，再放入 Form 中。不支持异步
  final AntdFormItemNormalize? normalize;

  ///校验规则，设置字段的校验逻辑
  final List<AntdFormRule>? rules;

  ///右侧扩展区
  final Widget? extra;

  ///内容
  final AntdFormItemBuilder builder;

  ///自定义布局
  final AntdFormItemLayoutBuilder? layoutBuilder;

  ///更新判断函数
  final AntdFormItemShouUpdate? shouUpdate;

  @override
  AntdFormItemStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    var form = AntdFormProvider.ofMaybe(context)?.from;
    var finalLayout = layout ?? form?.layout;
    return AntdFormItemStyle(
        helpIconStyle: AntdIconStyle(
            size: 17,
            color: token.colorText.tertiary,
            bodyStyle: AntdBoxStyle(margin: token.size.xxs.left)),
        extraIconStyle: AntdIconStyle(
          size: 17,
          color: token.colorText.tertiary,
        ),
        feedbackStyle: AntdBoxStyle(
            textStyle: token.font.sm.copyWith(color: token.colorError.text)),
        bodyStyle: const AntdBoxStyle(
          options: AntdTapOptions(
              behavior: HitTestBehavior.translucent, alwaysReceiveTap: true),
        ),
        itemStyle: const AntdBoxStyle(),
        itemFlexStyle: AntdFlexStyle(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: layout == AntdFormLayout.horizontal
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisAlignment: layout == AntdFormLayout.horizontal
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
        ),
        labelStyle: AntdBoxStyle(
            margin: finalLayout == AntdFormLayout.vertical
                ? token.size.xs.bottom
                : token.size.seed.right,
            textStyle:
                token.font.xxl.copyWith(color: token.colorText.tertiary)),
        labelRowStyle: const AntdFlexStyle(
          mainAxisSize: MainAxisSize.min,
        ),
        span: const AntdFormItemSpan(),
        requireStyle: AntdFormItemRequireStyle(color: token.colorError),
        extraRowStyle: const AntdFlexStyle());
  }

  @override
  AntdStyleBuilder<AntdFormItemStyle, AntdFormItem>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.formItemStyle;
  }

  @override
  AntdFormItemStyle margeStyle(
      AntdFormItemStyle defaultStyle, AntdFormItemStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  State<StatefulWidget> createState() {
    return AntdFormItemState();
  }

  @override
  AntdFormItem getWidget(BuildContext context) {
    return this;
  }
}

class AntdFormItemState extends AntdState<AntdFormItemStyle, AntdFormItem> {
  bool required = false;
  bool preserve = false;
  bool? existsRequired;
  AntdFormController? controller;
  AntdFormTrigger? trigger;
  bool? validateFirst;
  AntdFormTrigger? validateTrigger;
  AntdFormLayout? layout;
  bool? disabled;
  bool? readOnly;
  late final FocusNode _createFocusNode = FocusNode();
  late final FocusNode? _inheritedFocusNode = AntdFocus.maybeOf(context);
  late final FocusNode focusNode = _inheritedFocusNode ?? _createFocusNode;

  @override
  void updateDependentValues(AntdFormItem? oldWidget) {
    super.updateDependentValues(oldWidget);
    existsRequired = widget.rules != null &&
        widget.rules!.where((value) => value.required == true).isNotEmpty;

    var provider = AntdFormProvider.ofMaybe(context);
    var form = provider?.from;
    trigger = widget.trigger ?? form?.trigger;
    validateFirst = widget.validateFirst ?? form?.validateFirst;
    validateTrigger = widget.validateTrigger ?? form?.validateTrigger;
    layout = widget.layout ?? form?.layout;
    disabled = widget.disabled ?? form?.disabled;
    readOnly = widget.readOnly ?? form?.readOnly;
    controller = provider?.controller;
    required = (widget.required ?? form?.required) == true;
    preserve = (widget.preserve ?? form?.preserve) == true;

    _createFocusNode.canRequestFocus = disabled != true;
    controller?.addItem(widget.name, this);
    if (widget.dependencies != null) {
      controller?.addDependencies(widget.name, widget.dependencies);
    }
  }

  @override
  void dispose() {
    _createFocusNode.dispose();
    controller?.removeItem(widget.name, this, preserve);
    super.dispose();
  }

  Widget? buildLabel() {
    if (widget.label == null) {
      return null;
    }

    return AntdBox(
      style: style.labelStyle,
      child: AntdRow(style: style.labelRowStyle, children: [
        if (required == true || existsRequired == true)
          Padding(
            padding: 2.right,
            child: CustomPaint(
              size: style.requireStyle?.size ?? const Size(5, 5),
              painter: _SnowflakePainter(
                  color: style.requireStyle?.color ?? token.colorError),
            ),
          ),
        Expanded(
            child: Text.rich(TextSpan(children: [
          if (widget.label != null) WidgetSpan(child: widget.label!),
          if (widget.help != null)
            WidgetSpan(
                child: AntdPopover(
              mode: AntdPopoverMode.dark,
              builder: (close, ctx) {
                return AntdBox(
                  child: widget.help,
                );
              },
              child: AntdIconWrap(
                  style: style.helpIconStyle, child: widget.helpIcon),
            ))
        ])))
      ]),
    );
  }

  Future<AntdFormRuleResult?> validator(
      dynamic value, dynamic formValue, AntdFormTrigger? trigger) async {
    var rules = [...(widget.rules ?? [])];
    if (required && existsRequired != true) {
      rules.add(const AntdFormRule(required: true));
    }
    List<AntdFormRuleMessage> messages = [];
    for (var rule in rules) {
      if (rule.trigger != null && trigger != null && rule.trigger != trigger) {
        continue;
      }

      var validList = rule.buildValidList();
      for (var valid in validList) {
        var message =
            await valid.buildValidator()?.call(widget, value, formValue);
        if (message != null) {
          messages.add(AntdFormRuleMessage(
              message: message, warningOnly: rule.warningOnly));
        }
        if (messages.isNotEmpty && widget.validateFirst == true) {
          break;
        }
      }
    }
    return AntdFormRuleResult(
        name: widget.name, value: value, errorMessages: messages);
  }

  dynamic getValue() {
    return controller?.getFieldValue(name: widget.name);
  }

  void setValue(dynamic value, AntdFormTrigger sourceTrigger) {
    if (trigger == null ||
        trigger == sourceTrigger ||
        sourceTrigger == AntdFormTrigger.any) {
      widget.onChange?.call(controller!, value);
      controller?.setFieldValue(widget.name, value);
    }

    if (validateTrigger == null ||
        validateTrigger == sourceTrigger ||
        sourceTrigger == AntdFormTrigger.any) {
      controller?.validateFields(
          name: [widget.name],
          validateFirst: validateFirst == true,
          trigger: validateTrigger);
    }
  }

  @override
  Widget render(BuildContext context) {
    if (widget.hidden == true) {
      return const AntdBox();
    }

    var label = buildLabel();
    Widget? feedback = widget.hasFeedback != false
        ? ValueListenableBuilder(
            valueListenable: controller?.getFeedbackRebuildMark(widget.name) ??
                ValueNotifier(false),
            builder: (context, value, _) {
              var errorMessage = controller?.getFieldError(widget.name);
              if (errorMessage?.firstMessage == null) {
                return const AntdBox();
              }
              return AntdBox(
                style: style.feedbackStyle,
                child: Text(errorMessage!.firstMessage!),
              );
            })
        : null;

    Widget? item = AntdBox(
      style: style.itemStyle,
      child: ValueListenableBuilder(
          valueListenable: controller?.getItemRebuildMark(widget.name) ??
              ValueNotifier(false),
          builder: (context, value, _) {
            var ctx = AntdFormItemContext(
                context: context,
                controller: controller,
                formValue: controller?.getFieldsValue(),
                value: controller?.getFieldValue(name: widget.name),
                onChange: (dynamic data) {
                  setValue(data, trigger ?? AntdFormTrigger.onChange);
                });
            return widget.builder(ctx);
          }),
    );

    Widget? extra = widget.extra != null
        ? AntdIconWrap(style: style.extraIconStyle, child: widget.extra)
        : null;
    var itemProvider = AntdFormItemProvider(
      getValue: getValue,
      setValue: setValue,
      namePath: widget.name,
      disabled: disabled == true,
      readOnly: readOnly == true,
      existsShouUpdate: widget.shouUpdate != null,
      child: item,
    );

    Widget build() {
      if (widget.layoutBuilder != null) {
        return widget.layoutBuilder!(AntdFormItemLayoutContext(
            item: itemProvider,
            label: label,
            feedback: feedback,
            extra: extra));
      }
      var child = layout == AntdFormLayout.horizontal
          ? AntdRow(
              style: style.itemFlexStyle,
              children: [
                if (label != null)
                  Expanded(flex: style.span.label, child: label),
                Expanded(
                    flex: label != null ? style.span.item : 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [itemProvider, if (feedback != null) feedback],
                    ))
              ],
            )
          : AntdColumn(
              style: style.itemFlexStyle,
              children: [
                if (label != null) label,
                itemProvider,
                if (feedback != null) feedback
              ],
            );
      return AntdRow(
        style: style.extraRowStyle,
        children: [Expanded(child: child), if (extra != null) extra],
      );
    }

    return AntdBox(
      focusNode: focusNode,
      onTap: () {
        focusNode.requestFocus();
        controller?.addTouched(widget.name);
      },
      disabled: disabled,
      style: style.bodyStyle,
      child: build(),
    );
  }
}

class _SnowflakePainter extends CustomPainter {
  final Color color;

  _SnowflakePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    for (int i = 0; i < 6; i++) {
      final angle = i * 60 * (pi / 180);
      final end = center + Offset(cos(angle), sin(angle)) * radius;
      canvas.drawLine(center, end, paint);
    }

    canvas.drawLine(
      center + Offset(-radius * 0.4, 0),
      center + Offset(radius * 0.4, 0),
      paint,
    );
    canvas.drawLine(
      center + Offset(0, -radius * 0.4),
      center + Offset(0, radius * 0.4),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

abstract mixin class AntdFormItemMixin {
  bool isFromItemEnv(BuildContext context) {
    return AntdFormItemProvider.ofMaybe(context) != null;
  }

  dynamic getValue(BuildContext context) {
    var provider = AntdFormItemProvider.ofMaybe(context);
    if (provider == null) {
      return null;
    }
    return provider.getValue();
  }

  void setValue(
      BuildContext context, dynamic value, AntdFormTrigger sourceTrigger) {
    var provider = AntdFormItemProvider.ofMaybe(context);
    if (provider == null) {
      return;
    }

    provider.setValue(value, sourceTrigger);
  }

  Widget get bindWidget;
}

abstract class AntdFormItemComponent<T, Style extends AntdStyle, WidgetType>
    extends AntdStateComponent<Style, WidgetType> with AntdFormItemMixin {
  ///禁用
  final bool? disabled;

  ///只读
  final bool? readOnly;

  ///值
  final T? value;

  ///变更事件
  final ValueChanged<T?>? onChange;

  ///自动同步值到表单
  final bool? autoCollect;

  ///当value手动控制的时候 是否应该触发onChange
  final bool? shouldTriggerChange;

  ///开启反馈
  final AntdHapticFeedback? hapticFeedback;

  ///受控模式 value的值必须手动更新 默认不开启
  final bool? manual;

  const AntdFormItemComponent(
      {super.key,
      super.style,
      super.styleBuilder,
      this.disabled,
      this.readOnly,
      this.value,
      this.onChange,
      this.autoCollect = true,
      this.shouldTriggerChange = true,
      this.hapticFeedback = AntdHapticFeedback.light,
      this.manual});

  @override
  Widget get bindWidget => this;
}

abstract class AntdFormItemComponentState<T, Style extends AntdStyle,
        WidgetType extends AntdFormItemComponent<T, Style, WidgetType>>
    extends AntdState<Style, WidgetType> {
  bool? disabled;
  bool? readOnly;
  var manual = false;
  T? value;
  AntdFormItemGroupProvider? groupProvider;
  AntdFormItemOnChangeProvider<T>? onChangeProvider;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  @mustCallSuper
  void updateDependentValues(WidgetType? oldWidget) {
    super.updateDependentValues(oldWidget);
    manual = widget.manual == true;
    onChangeProvider = AntdFormItemOnChangeProvider.of<T>(context);
    groupProvider = AntdFormItemGroupProvider.of(context);
    var formItem = AntdFormItemProvider.ofMaybe(context);
    disabled =
        (widget.disabled ?? groupProvider?.disabled ?? formItem?.disabled) ==
            true;
    readOnly =
        (widget.readOnly ?? groupProvider?.readOnly ?? formItem?.readOnly) ==
            true;
    if (formItem != null && formItem.existsShouUpdate != true) {
      var name = formItem.namePath;
      AntdLogs.w(
          msg:
              "A default shouldUpdate has been added for field '$name'. If you use other fields in your builder, remember to include them in dependencies, or use a custom shouldUpdate to ensure your logic works correctly.");
      AntdFormProvider.ofMaybe(context)?.controller.addShouUpUpdate(name,
          (value, beforeValue) {
        return isChanged(value?[name], beforeValue?[name]);
      });
    }

    if (manual) {
      value = widget.value;
      AntdLogs.w(
          msg:
              "Controlled mode active (non-empty value). Manual value update required.",
          biz: widget.runtimeType.toString());
      if (oldWidget != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          handlerAutoCollect(value, oldWidget.value);
        });
      }
    } else {
      var formValue = widget.getValue(context);
      if (formValue != null && value == null) {
        value = formValue;
      }
    }

    if (manual &&
        oldWidget != null &&
        widget.shouldTriggerChange == true &&
        widget.onChange != null &&
        isChanged(value, oldWidget.value)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        handlerOnChange(value);
      });
    }
  }

  void handlerOnChange(T? value) {
    widget.onChange?.call(value);
    onChangeProvider?.onChange?.call(value);
  }

  bool isChanged(T? newValue, T? value) {
    return newValue != value || newValue.runtimeType != value.runtimeType;
  }

  bool setValue(T? newValue, [bool state = true]) {
    if (readOnly == true || disabled == true) {
      return false;
    }

    handlerOnChange(newValue);
    if (manual) {
      return true;
    }
    handlerAutoCollect(newValue, value);
    if (isChanged(newValue, value)) {
      if (openHapticFeedback()) {
        handleHapticFeedback(widget.hapticFeedback);
      }

      value = newValue;
      if (state) {
        var call = getSetStateCallback();
        setState(call);
      }
    }
    return true;
  }

  bool openHapticFeedback() {
    return true;
  }

  VoidCallback getSetStateCallback() {
    return () {};
  }

  void handlerAutoCollect(T? newValue, T? value) {
    if (widget.autoCollect == true && isChanged(newValue, value)) {
      widget.setValue(context, newValue, AntdFormTrigger.any);
    }
  }
}

abstract class AntdFormItemSelectComponentState<Style extends AntdStyle,
        WidgetType extends AntdFormItemComponent<dynamic, Style, WidgetType>>
    extends AntdFormItemComponentState<dynamic, Style, WidgetType> {
  bool select = false;

  @override
  void updateDependentValues(covariant WidgetType? oldWidget) {
    super.updateDependentValues(oldWidget);
    select = isSelect();
  }

  bool isSelect() {
    if (groupProvider != null) {
      return groupProvider?.isExists(value) == true;
    }

    return value == true;
  }

  bool switchValue() {
    return setValue(value == true ? false : true);
  }

  @override
  VoidCallback getSetStateCallback() {
    return () {
      select = isSelect();
    };
  }

  @override
  bool setValue(newValue, [bool state = true]) {
    if (readOnly == true || disabled == true) {
      return false;
    }

    if (groupProvider != null) {
      return groupProvider!.setValue(widget.value);
    }
    return super.setValue(newValue, state);
  }
}

class AntdFormItemOnChangeProvider<T> extends InheritedWidget {
  final ValueChanged<T?>? onChange;

  const AntdFormItemOnChangeProvider(
      {super.key, required super.child, this.onChange});

  @override
  bool updateShouldNotify(covariant AntdFormItemOnChangeProvider<T> oldWidget) {
    return onChange != oldWidget.onChange;
  }

  static AntdFormItemOnChangeProvider<T>? of<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AntdFormItemOnChangeProvider<T>>();
  }
}

class AntdFormItemGroupProvider extends InheritedWidget {
  final bool? disabled;
  final bool? readOnly;
  final bool Function(dynamic value) isExists;
  final bool Function(dynamic value) setValue;

  const AntdFormItemGroupProvider(
      {super.key,
      required super.child,
      this.disabled,
      this.readOnly,
      required this.isExists,
      required this.setValue});

  @override
  bool updateShouldNotify(covariant AntdFormItemGroupProvider oldWidget) {
    return true;
  }

  static AntdFormItemGroupProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AntdFormItemGroupProvider>();
  }
}

abstract class AntdFormItemGroup<ChildType, Style extends AntdStyle, T,
    WidgetType> extends AntdFormItemComponent<T, Style, WidgetType> {
  const AntdFormItemGroup(
      {super.key,
      super.style,
      super.styleBuilder,
      super.disabled,
      super.readOnly,
      super.value,
      super.autoCollect,
      super.onChange,
      super.shouldTriggerChange,
      super.hapticFeedback,
      super.manual,
      this.items,
      this.builder});

  ///列表项
  final List<ChildType>? items;

  ///自定义构建 默认使用List
  final Widget? Function(List<ChildType>? items)? builder;
}

class AntdFormItemGroupState<ChildType, Style extends AntdStyle, T,
        WidgetType extends AntdFormItemGroup<ChildType, Style, T, WidgetType>>
    extends AntdFormItemComponentState<T, Style, WidgetType> {
  bool isExists(dynamic value) {
    return value != null && value == this.value;
  }

  bool setInnerValue(dynamic value) {
    return setValue(this.value == value ? null : value);
  }

  Widget buildDefaultWidget() {
    return AntdList(
      items: widget.items ?? [],
      shrinkWrap: true,
    );
  }

  @override
  Widget render(BuildContext context) {
    if (widget.items == null && widget.builder == null) {
      return const AntdBox();
    }
    var child = widget.builder?.call(widget.items);
    child ??= buildDefaultWidget();
    return AntdFormItemGroupProvider(
        disabled: widget.disabled,
        readOnly: widget.readOnly,
        isExists: isExists,
        setValue: setInnerValue,
        child: child);
  }
}

class AntdFormItemGroupMultipleState<
        ChildType,
        Style extends AntdStyle,
        T,
        WidgetType extends AntdFormItemGroup<ChildType, Style, List<T>,
            WidgetType>>
    extends AntdFormItemGroupState<ChildType, Style, List<T>, WidgetType> {
  @override
  bool isChanged(List<T>? newValue, List<T>? value) {
    return !listEquals(newValue, value);
  }

  @override
  bool isExists(value) {
    return this.value?.contains(value) == true;
  }

  @override
  bool setInnerValue(value) {
    var values = [...(this.value ??= [])];
    if (!values.contains(value)) {
      values.add(value!);
    } else {
      values.remove(value);
    }

    return setValue(values);
  }
}
