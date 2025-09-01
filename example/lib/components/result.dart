import 'package:antd_flutter/components/icon/icon.dart';
import 'package:antd_flutter/components/icon/index.dart';
import 'package:antd_flutter/components/result/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

const desc = Text("内容详情可折行，建议不超过两行建议不超过两行建议不超过两行");

/// @t 成功状态
/// @l [AntdResult]
class AntdResultSuccessDemo extends StatelessWidget {
  const AntdResultSuccessDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdResult(
        status: AntdResultStatus.success,
        desc: desc,
      )
    ]);
  }
}

/// @t 等待状态
/// @l [AntdResult]
class AntdResultWaitingDemo extends StatelessWidget {
  const AntdResultWaitingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdResult(
        status: AntdResultStatus.waiting,
        desc: desc,
      )
    ]);
  }
}

/// @t 提示状态
/// @l [AntdResult]
class AntdResultInfoDemo extends StatelessWidget {
  const AntdResultInfoDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdResult(
        status: AntdResultStatus.info,
        desc: desc,
      )
    ]);
  }
}

/// @t 警告状态
/// @l [AntdResult]
class AntdResultWarningDemo extends StatelessWidget {
  const AntdResultWarningDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdResult(
        status: AntdResultStatus.warning,
        desc: desc,
      )
    ]);
  }
}

/// @t 失败状态
/// @l [AntdResult]
class AntdResultErrorDemo extends StatelessWidget {
  const AntdResultErrorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdResult(
        status: AntdResultStatus.error,
        desc: desc,
      )
    ]);
  }
}

/// @t 自定义状态
/// @l [AntdResult]
class AntdResultCustomerDemo extends StatelessWidget {
  const AntdResultCustomerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdResult(
        title: Text("Well done"),
        icon: AntdIcon(
          icon: AntdIcons.message,
        ),
        desc: desc,
      )
    ]);
  }
}
