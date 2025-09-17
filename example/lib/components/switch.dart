import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 基础使用
/// @l [AntdSwitch]
class AntdSwitchDemo extends StatelessWidget {
  const AntdSwitchDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSwitch(
        content: const Text("关闭"),
        activeContent: const Text("打开"),
        onChange: (value) {
          AntdToast.show("当前值:$value");
        },
      ),
      AntdSwitch(
        content: const Text("关闭"),
        activeContent: const Text("打开"),
        onChange: (value) {
          AntdToast.show("当前值:$value");
        },
      ),
    ]);
  }
}

/// @t 自定义样式
/// @l [AntdSwitch]
class AntdSwitchCustomDemo extends StatelessWidget {
  const AntdSwitchCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdSwitch(
        style: AntdSwitchStyle(
            trackStyle: AntdBoxStyle(color: token.colorError),
            activeTrackStyle:
                AntdBoxStyle(color: token.colorSuccess, height: 14),
            thumbStyle: AntdBoxStyle(height: 14, color: token.colorPrimary)),
      ),
    ]);
  }
}

class AntdSwitchValueDemo extends StatefulWidget {
  const AntdSwitchValueDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdSwitchValueDemoStateDemo();
  }
}

/// @t 受控模式
/// @l [AntdSwitch]
class _AntdSwitchValueDemoStateDemo extends State<AntdSwitchValueDemo> {
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSwitch(
        value: open,
        content: const Text("关闭"),
        activeContent: const Text("打开"),
        onChange: (value) {
          AntdToast.show("当前值:$value");
        },
      ),
      Row(
        children: [
          AntdButton(
            child: const Text("打开"),
            onTap: () {
              setState(() {
                open = true;
              });
            },
          ),
          AntdButton(
            child: const Text("关闭"),
            onTap: () {
              setState(() {
                open = false;
              });
            },
          )
        ],
      )
    ]);
  }
}

/// @t 只读和禁用
/// @l [AntdSwitch]
class AntdSwitchDisabledDemo extends StatelessWidget {
  const AntdSwitchDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSwitch(
        disabled: true,
        content: Text("禁用"),
      ),
      AntdSwitch(
        readOnly: true,
        value: true,
        activeContent: Text("只读"),
      ),
    ]);
  }
}
