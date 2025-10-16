import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

typedef AntdTextAreaCountBuilder = Widget Function(
    AntdInputController controller);

///@t 文本域
///@g 信息录入
///@o 47
///@d 通过键盘输入内容，是最基础的表单域包装。
///@u 需要折行的长文本输入。
class AntdTextArea extends AntdInputBase<AntdTextArea> {
  const AntdTextArea(
      {super.key,
      super.style,
      super.styleBuilder,
      super.focusNode,
      super.clearable = true,
      super.value,
      super.disabled,
      super.onChange,
      super.onEditingComplete,
      super.onSubmitted,
      super.onClear,
      super.placeholder,
      super.readOnly,
      super.controller,
      super.autoCollect,
      super.autocorrect = false,
      super.maxLines,
      super.minLines,
      super.maxLength,
      super.keyboardType = TextInputType.text,
      super.inputAction,
      super.onSelectionChanged,
      super.formatters,
      super.prefix,
      super.suffix,
      super.onTap,
      super.contextMenuBuilder,
      super.undoController,
      super.spellCheckConfiguration,
      super.magnifierConfiguration,
      super.onAppPrivateCommand,
      super.dragStartBehavior = DragStartBehavior.start,
      super.scrollController,
      super.scrollPhysics = const NeverScrollableScrollPhysics(),
      super.clipBehavior = Clip.hardEdge,
      super.onFocus,
      super.shouldTriggerChange = true,
      super.hapticFeedback,
      this.showCount = true,
      this.countBuilder})
      : super(textAlign: TextAlign.start);

  ///是否展示字数统计
  final bool showCount;

  ///自定义统计数字
  final AntdTextAreaCountBuilder? countBuilder;

  @override
  State<StatefulWidget> createState() {
    return _AntdTextAreaState();
  }

  @override
  Widget get bindWidget => this;

  @override
  AntdTextArea getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdStyleBuilder<AntdInputStyle, AntdTextArea>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.textAreaStyle;
  }
}

class _AntdTextAreaState
    extends AntdInputBaseState<AntdTextArea, AntdTextArea> {
  @override
  Alignment buildAlignment() {
    return Alignment.topLeft;
  }

  @override
  Widget buildInput(Widget input) {
    var token = AntdTheme.ofToken(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        input,
        if (widget.showCount)
          Padding(
            padding: 8.top,
            child: ValueListenableBuilder(
                valueListenable: innerController,
                builder: (conte, value, _) {
                  var child = widget.countBuilder?.call(innerController);
                  child ??= DefaultTextStyle(
                      style: token.font.lg
                          .copyWith(color: token.colorText.secondary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(value.text.length.toString()),
                          if (widget.maxLength != null) const Text("/"),
                          if (widget.maxLength != null)
                            Text(widget.maxLength.toString()),
                        ],
                      ));
                  return child;
                }),
          )
      ],
    );
  }
}
