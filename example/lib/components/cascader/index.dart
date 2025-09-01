import 'package:antd_flutter/index.dart';
import 'package:example/components/cascader/view.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

/// @t 基础用法
/// @l [AntdCascader]
class AntdCascaderDemo extends StatelessWidget {
  const AntdCascaderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdButton(
        child: const Text("选择"),
        onTap: () {
          AntdLayer.open(AntdCascader(
            onConfirm: (values) {
              AntdToast.show(values.join(","));
            },
            onCancel: (values) {
              AntdToast.show(values.join(","));
            },
            titleWidget: const Text("地址选择"),
            cascaderView: const AntdCascaderView(
              options: cascaderOptions,
            ),
          ));
        },
      )
    ]);
  }
}
