import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 基础使用
/// @l [AntdCheckList]
class AntdCheckListDemo extends StatelessWidget {
  const AntdCheckListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdCheckList(
        onChange: (value) {
          AntdToast.show("当前的值:${value?.join(",")},变化的值:$value");
        },
        defaultValue: const ["A", "C"],
        items: const [
          AntdCheckItem(
            value: "A",
            child: Text("A"),
          ),
          AntdCheckItem(
            value: "B",
            child: Text("B"),
          ),
          AntdCheckItem(
            value: "C",
            child: Text("C"),
          ),
          AntdCheckItem(
            value: "D",
            child: Text("D"),
          ),
        ],
      )
    ]);
  }
}

/// @t 自定义选中图标
/// @l [AntdCheckList]
class AntdCheckListActiveContentDemo extends StatelessWidget {
  const AntdCheckListActiveContentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var action = AntdIcon(
      icon: AntdIcons.smile,
      style: AntdIconStyle(size: 24, color: token.colorPrimary),
    );
    return DemoWrapper(outline: true, child: [
      AntdCheckList(
        items: [
          AntdCheckItem(
            value: "A",
            activeIcon: action,
            child: const Text("A"),
          ),
          AntdCheckItem(value: "B", activeIcon: action, child: const Text("B")),
        ],
      )
    ]);
  }
}

/// @t 整组只读
/// @l [AntdCheckList]
class AntdCheckListReadOnlyDemo extends StatelessWidget {
  const AntdCheckListReadOnlyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdCheckList(
        defaultValue: ['A'],
        items: [
          AntdCheckItem(
            value: "A",
            child: Text("A"),
          ),
          AntdCheckItem(
            value: "B",
            child: Text("B"),
          ),
        ],
      )
    ]);
  }
}

/// @t 整组禁用
/// @l [AntdCheckList]
class AntdCheckListDisableDemo extends StatelessWidget {
  const AntdCheckListDisableDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdCheckList(items: [
        AntdCheckItem(value: "A", disabled: true, child: Text("A")),
        AntdCheckItem(
          value: "B",
          disabled: true,
          child: Text("B"),
        ),
      ])
    ]);
  }
}

class AntdCheckListValueDemo extends StatefulWidget {
  const AntdCheckListValueDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdCheckListValueDemoStateDemo();
  }
}

/// @t 受控模式
/// @l [AntdCheckList]
class _AntdCheckListValueDemoStateDemo extends State<AntdCheckListValueDemo> {
  var values = <String>['A'];
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdCheckList(
        value: values,
        onChange: (value) {
          setState(() {
            values = value ?? [];
          });
        },
        items: const [
          AntdCheckItem(value: "A", child: Text("A")),
          AntdCheckItem(
            value: "B",
            child: Text("B"),
          ),
          AntdCheckItem(
            value: "C",
            child: Text("C"),
          ),
        ],
      ),
      Row(
        children: [
          AntdButton(
            child: const Text("选中B"),
            onTap: () {
              setState(() {
                values.add("B");
              });
            },
          ),
          AntdButton(
            child: const Text("取消B"),
            onTap: () {
              setState(() {
                values.remove("B");
              });
            },
          )
        ],
      )
    ]);
  }
}
