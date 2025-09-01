import 'package:antd_flutter/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 基础使用
/// @l [AntdInput]
class AntdInputDemo extends StatelessWidget {
  const AntdInputDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdInput(
        onChange: (value) {
          AntdToast.show("当前的输入值:$value");
        },
        placeholder: const Text("请输入内容"),
      )
    ]);
  }
}

/// @t 带清除按钮
/// @l [AntdInput]
class AntdInputClearableDemo extends StatelessWidget {
  const AntdInputClearableDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdInput(
        onClear: () {
          AntdToast.show("清理了所有输入");
        },
        placeholder: const Text("请输入内容"),
        clearable: true,
      ),
    ]);
  }
}

/// @t 输入内容右对齐
/// @l [AntdInput]
class AntdInputTextAlignDemo extends StatelessWidget {
  const AntdInputTextAlignDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdInput(
        placeholder: Text("请输入内容"),
        clearable: true,
        textAlign: TextAlign.right,
      ),
    ]);
  }
}

/// @t 只读状态
/// @l [AntdInput]
class AntdInputReadOnlyDemo extends StatelessWidget {
  const AntdInputReadOnlyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdInput(
        readOnly: true,
        value: "只读模式的输入框",
      ),
    ]);
  }
}

/// @t 禁用状态
/// @l [AntdInput]
class AntdInputDisabledDemo extends StatelessWidget {
  const AntdInputDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdInput(
        disabled: true,
        placeholder: Text("被禁用的输入框"),
      ),
    ]);
  }
}

/// @t 查看密码
/// @l [AntdInput]
class AntdInputObscureTextDemo extends StatelessWidget {
  const AntdInputObscureTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdInput(
        obscureText: true,
        placeholder: Text("请输入密码"),
      ),
    ]);
  }
}

/// @t 前缀和后缀
/// @l [AntdInput]
class AntdInputPrefixSuffixTextDemo extends StatelessWidget {
  const AntdInputPrefixSuffixTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdInput(
        obscureText: true,
        prefix: Text("我是前缀"),
        suffix: Text("我是后缀"),
        placeholder: Text("请输入密码"),
      ),
    ]);
  }
}

/// @t 焦点
/// @l [AntdInput]
class AntdInputFocusTextDemo extends StatelessWidget {
  const AntdInputFocusTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdInput(
        onFocus: (value) {
          AntdToast.show("焦点状态:$value");
        },
        prefix: const Text("我是前缀"),
        suffix: const Text("我是后缀"),
        placeholder: const Text("请输入密码"),
      ),
    ]);
  }
}
