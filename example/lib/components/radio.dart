import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

/// @t 基础使用
/// @l [AntdRadio]
class AntdRadioDemo extends StatelessWidget {
  const AntdRadioDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AntdRadio(
            onChange: (value) {
              AntdToast.show("变更为:$value");
            },
            extra: const Text("有描述的单选框"),
          ),
          const AntdRadio(
            indeterminate: true,
            extra: Text("半选"),
          ),
          const AntdRadio(
            disabled: true,
            extra: Text("禁用"),
          )
        ],
      )
    ]);
  }
}

/// @t 自定义样式
/// @l [AntdRadio]
class AntdRadioCustomDemo extends StatelessWidget {
  const AntdRadioCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdRadio(
        style: AntdRadioStyle(
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

/// @t 列表选择
/// @l [AntdRadio]
class AntdRadioListDemo extends StatefulWidget {
  const AntdRadioListDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdRadioListDemoStateDemo();
  }
}

class _AntdRadioListDemoStateDemo extends State<AntdRadioListDemo> {
  var value = -1;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdList(
        shrinkWrap: true,
        items: List.generate(
          5,
          (i) {
            return i;
          },
        ),
        itemBuilder: (ctx) {
          return AntdBox(
              onTap: () {
                setState(() {
                  value = ctx.index;
                });
              },
              style: AntdBoxStyle(
                  feedbackStyle:
                      AntdBoxStyle(color: defaultToken.colorFillContent)),
              child: AntdBox(
                style: AntdBoxStyle(
                    padding: 12.vertical,
                    margin: 12.left,
                    border: defaultToken.borderSide.bottom),
                child: AntdCheckbox(
                  value: value == ctx.index,
                  onChange: (check) {
                    setState(() {
                      value = check == true ? ctx.index : -1;
                    });
                  },
                  extra: Text("内容${ctx.index}"),
                ),
              ));
        },
      )
    ]);
  }
}

class AntdRadioValueDemo extends StatefulWidget {
  const AntdRadioValueDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdRadioValueDemoStateDemo();
  }
}

/// @t 受控模式
/// @l [AntdCheckbox]
class _AntdRadioValueDemoStateDemo extends State<AntdRadioValueDemo> {
  var check = false;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdRadio(
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
/// @l [AntdRadio]
class AntdRadioDisabledDemo extends StatelessWidget {
  const AntdRadioDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdRadio(
        disabled: true,
        extra: Text("禁用"),
      ),
      AntdRadio(
        readOnly: true,
        value: true,
        extra: Text("只读"),
      ),
    ]);
  }
}
