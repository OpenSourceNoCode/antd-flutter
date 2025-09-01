import 'package:antd_flutter/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

/// @t 基本的输入框组件
/// @l [AntdTextArea]
class AntdTextAreaDemo extends StatelessWidget {
  const AntdTextAreaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdTextArea(
        onChange: (value) {
          AntdToast.show("当前的输入值:$value");
        },
        placeholder: const Text("请输入内容"),
      )
    ]);
  }
}

/// @t 指定行数
/// @l [AntdTextArea]
class AntdTextAreaMinLinesDemo extends StatelessWidget {
  const AntdTextAreaMinLinesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdTextArea(
        minLines: 5,
        placeholder: Text("请输入内容"),
      )
    ]);
  }
}

/// @t 字数统计
/// @l [AntdTextArea]
class AntdTextAreaShowCountDemo extends StatelessWidget {
  const AntdTextAreaShowCountDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdTextArea(
        showCount: true,
        minLines: 5,
        value: "北极星垂地，东山月满川。",
      )
    ]);
  }
}

/// @t 字数限制
/// @l [AntdTextArea]
class AntdTextAreaMaxLengthDemo extends StatelessWidget {
  const AntdTextAreaMaxLengthDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdTextArea(
        showCount: true,
        maxLength: 30,
        minLines: 5,
        value: "北极星垂地，东山月满川。",
      )
    ]);
  }
}

/// @t 禁用状态
/// @l [AntdTextArea]
class AntdTextAreaDisabledDemo extends StatelessWidget {
  const AntdTextAreaDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdTextArea(
        showCount: true,
        minLines: 5,
        disabled: true,
        value: "北极星垂地，东山月满川。",
      )
    ]);
  }
}

/// @t 只读状态
/// @l [AntdTextArea]
class AntdTextAreaReadOnlyDemo extends StatelessWidget {
  const AntdTextAreaReadOnlyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdTextArea(
        showCount: true,
        minLines: 5,
        readOnly: true,
        value: "北极星垂地，东山月满川。",
      )
    ]);
  }
}

/// @t 只读状态
/// @l [AntdTextArea]
class AntdTextClearDemo extends StatelessWidget {
  const AntdTextClearDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdTextArea(
        showCount: true,
        minLines: 5,
        readOnly: true,
        onClear: () {
          AntdToast.show("清理了所有输入");
        },
        value: "北极星垂地，东山月满川。",
      )
    ]);
  }
}
