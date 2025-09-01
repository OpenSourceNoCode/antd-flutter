import 'package:antd_flutter/components/cascader/view.dart';
import 'package:antd_flutter/components/toast/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

const cascaderOptions = [
  AntdCascaderOption(child: Text("浙江"), value: '1'),
  AntdCascaderOption(child: Text("安徽"), value: '2'),
  AntdCascaderOption(child: Text("江苏"), value: '3'),
  AntdCascaderOption(
    child: Text("杭州"),
    value: '2-1',
    parentValue: "1",
  ),
  AntdCascaderOption(
    child: Text("宁波"),
    value: '2-2',
    parentValue: "1",
  ),
  AntdCascaderOption(
    child: Text("西昌"),
    value: '2-3',
    parentValue: "1",
  ),
  AntdCascaderOption(
    child: Text("庆阳"),
    value: '3-1',
    parentValue: "2-1",
  ),
  AntdCascaderOption(
    child: Text("天水"),
    value: '3-2',
    parentValue: "2-1",
  ),
  AntdCascaderOption(
    child: Text("西安"),
    value: '3-3',
    parentValue: "2-1",
  )
];

/// @t 基础用法
/// @l [AntdCascaderView]
class AntdCascaderViewDemo extends StatelessWidget {
  const AntdCascaderViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdCascaderView(
        onChange: (values) {
          AntdToast.show(values.join(","));
        },
        options: cascaderOptions,
      )
    ]);
  }
}

/// @t 默认选中
/// @l [AntdCascaderView]
class AntdCascaderViewDefaultDemo extends StatelessWidget {
  const AntdCascaderViewDefaultDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdCascaderView(
        value: ['2-1', '3-1'],
        options: cascaderOptions,
      )
    ]);
  }
}
