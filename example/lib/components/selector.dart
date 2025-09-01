import 'package:antd_flutter/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

const options = [
  AntdSelectorOption(
    label: Text("选项1"),
    value: "1",
  ),
  AntdSelectorOption(
    label: Text("选项2"),
    value: "2",
  ),
  AntdSelectorOption(
      label: Text("选项3"), value: "3", description: Text("选项1的描述"))
];

/// @t 基础使用
/// @l [AntdSelector]
class AntdSelectorDemo extends StatelessWidget {
  const AntdSelectorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSelector(
        options: options,
      )
    ]);
  }
}

/// @t 多列布局
/// @l [AntdSelector]
class AntdSelectorColumnsDemo extends StatelessWidget {
  const AntdSelectorColumnsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSelector(columns: 2, options: options),
      AntdSelector(columns: 3, options: options)
    ]);
  }
}

class AntdSelectorValueDemo extends StatefulWidget {
  const AntdSelectorValueDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdSelectorValueDemoStateDemo();
  }
}

/// @t 受控模式 不要忘记使用onChange更新
/// @l [AntdSelector]
class _AntdSelectorValueDemoStateDemo extends State<AntdSelectorValueDemo> {
  var values = {"1"};
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSelector(
          value: values,
          onChange: (values) {
            this.values = values ?? {};
          },
          options: options
              .map((option) => AntdSelectorOption(
                  label: option.label, value: option.value, disabled: true))
              .toList()),
      Row(
        children: [
          AntdButton(
            child: Text("选中2"),
            onTap: () {
              setState(() {
                values.add("2");
              });
            },
          ),
          AntdButton(
            child: Text("取消2"),
            onTap: () {
              setState(() {
                values.remove("2");
              });
            },
          )
        ],
      )
    ]);
  }
}

/// @t 只读和禁用
/// @l [AntdSelector]
class AntdSelectorDisabledDemo extends StatelessWidget {
  const AntdSelectorDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSelector(
        options: options,
        disabled: true,
      ),
      AntdSelector(
        readOnly: true,
        value: {"2"},
        options: options,
      ),
    ]);
  }
}
