import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

/// @t 基础使用
/// @l [AntdCheckbox]
class AntdCheckboxDemo extends StatelessWidget {
  const AntdCheckboxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AntdCheckbox(
            onChange: (value) {
              AntdToast.show("变更为:$value");
            },
            extra: const Text("有描述的复选框"),
          ),
          const AntdCheckbox(
            disabled: true,
            extra: Text("禁用"),
          )
        ],
      )
    ]);
  }
}

class AntdCheckboxIndeterminateDemo extends StatefulWidget {
  const AntdCheckboxIndeterminateDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdCheckboxIndeterminateDemoStateDemo();
  }
}

/// @t 全选和半选
/// @l [AntdCheckbox]
class _AntdCheckboxIndeterminateDemoStateDemo
    extends State<AntdCheckboxIndeterminateDemo> {
  var values = <int>[];
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AntdCheckbox(
            value: true,
            indeterminate: values.length != 3,
            extra: const Text("半选"),
          ),
          ...(List.generate(3, (i) {
            return AntdCheckbox(
              value: values.contains(i),
              onChange: (check) {
                setState(() {
                  if (check == true) {
                    values.add(i);
                  } else {
                    values.remove(i);
                  }
                });
              },
              extra: Text("我是$i"),
            );
          }))
        ],
      )
    ]);
  }
}

/// @t 自定义样式
/// @l [AntdCheckbox]
class AntdCheckboxCustomDemo extends StatelessWidget {
  const AntdCheckboxCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdCheckbox(
        value: true,
        style: AntdCheckboxStyle(
            defaultIcon: const AntdIcon(
              icon: AntdIcons.smile,
            ),
            activeIcon: AntdIcon(
              style: AntdIconStyle(size: 22, color: token.colorPrimary),
              icon: AntdIcons.smileFill,
            ),
            disableIcon: AntdIcon(
              style: AntdIconStyle(color: token.colorPrimary),
              icon: AntdIcons.delete,
            ),
            activeIconStyle: AntdIconStyle(
                bodyStyle: AntdBoxStyle(color: token.colorWhite))),
        extra: const Text("我是自定义内容"),
      ),
    ]);
  }
}

class AntdCheckboxListDemo extends StatefulWidget {
  const AntdCheckboxListDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdCheckboxListDemoStateDemo();
  }
}

/// @t 列表选择
/// @l [AntdCheckbox]
class _AntdCheckboxListDemoStateDemo extends State<AntdCheckboxListDemo> {
  var values = <int>[];
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdList(
        shrinkWrap: true,
        items: List.generate(
          5,
          (i) {
            return AntdCheckbox(
              value: values.contains(i),
              onChange: (check) {
                if (check == true) {
                  values.add(i);
                } else {
                  values.remove(i);
                }
              },
              extra: Text("内容${i}"),
            );
          },
        ),
      )
    ]);
  }
}

class AntdCheckboxValueDemo extends StatefulWidget {
  const AntdCheckboxValueDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdCheckboxValueDemoStateDemo();
  }
}

/// @t 受控模式
/// @l [AntdCheckbox]
class _AntdCheckboxValueDemoStateDemo extends State<AntdCheckboxValueDemo> {
  var check = false;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdCheckbox(
        value: check,
        extra: const Text("受控模式"),
      ),
      Row(
        children: [
          AntdButton(
            child: const Text("选中"),
            onTap: () {
              setState(() {
                check = true;
              });
            },
          ),
          AntdButton(
            child: const Text("取消"),
            onTap: () {
              setState(() {
                check = false;
              });
            },
          )
        ],
      )
    ]);
  }
}

/// @t 只读和禁用
/// @l [AntdCheckbox]
class AntdCheckboxDisabledDemo extends StatelessWidget {
  const AntdCheckboxDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdCheckbox(
        disabled: true,
        extra: Text("禁用"),
      ),
      AntdCheckbox(
        readOnly: true,
        value: true,
        extra: Text("只读"),
      ),
    ]);
  }
}
