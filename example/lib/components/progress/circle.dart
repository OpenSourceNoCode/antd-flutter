import 'package:antd_flutter/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

class AntdProgressCircleDemo extends StatefulWidget {
  const AntdProgressCircleDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdProgressCircleDemoStateDemo();
  }
}

/// @t 基础用法
/// @l [AntdProgressCircle]
class _AntdProgressCircleDemoStateDemo extends State<AntdProgressCircleDemo> {
  double currentStep = 0.0;
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
      child: [
        Column(
          children: [
            Row(
              children: [
                AntdButton(
                  disabled: currentStep == 0,
                  onTap: () {
                    setState(() {
                      currentStep = currentStep - 10;
                    });
                  },
                  child: const Text("进度-10"),
                ),
                Padding(
                  padding: 10.left,
                  child: AntdButton(
                    disabled: currentStep == 100,
                    onTap: () {
                      setState(() {
                        currentStep = currentStep + 10;
                      });
                    },
                    child: const Text("进度+10"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: 10.top,
              child: Row(
                children: [
                  AntdProgressCircle(
                    stroke: 5,
                    onChange: (c) {
                      AntdToast.show('当前$c');
                    },
                    onFinish: () {
                      AntdToast.show('完成了');
                    },
                    percent: currentStep,
                  ),
                  Padding(
                    padding: 10.left,
                    child: AntdProgressCircle(
                      percent: currentStep,
                      stroke: 5,
                      child: Text("$currentStep%"),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

/// @t 指定线条宽度
/// @d stroke指定宽度
/// @l [AntdProgressCircle]
class AntdProgressCircleWidthDemo extends StatelessWidget {
  const AntdProgressCircleWidthDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      child: [
        AntdProgressCircle(
          percent: 30,
          child: Text("默认"),
        ),
        AntdProgressCircle(
          percent: 50,
          stroke: 4,
          child: Text("50%"),
        ),
        AntdProgressCircle(
          percent: 60,
          stroke: 5,
          child: Text("50%"),
        )
      ],
    );
  }
}

/// @t 指定线条颜色
/// @d color指定颜色
/// @l [AntdProgressCircle]
class AntdProgressCircleColorDemo extends StatelessWidget {
  const AntdProgressCircleColorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      child: [
        AntdProgressCircle(
          percent: 30,
          color: AntdColor.danger,
          child: Text("30%"),
        ),
        AntdProgressCircle(
          percent: 30,
          color: AntdColor.warning,
          child: Text("30%"),
        ),
        AntdProgressCircle(
          percent: 30,
          color: AntdColor.success,
          child: Text("30%"),
        ),
      ],
    );
  }
}

/// @t 指定大小
/// @d size指定大小
/// @l [AntdProgressCircle]
class AntdProgressCircleSizeDemo extends StatelessWidget {
  const AntdProgressCircleSizeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      child: [
        AntdProgressCircle(
          percent: 30,
        ),
        AntdProgressCircle(
          percent: 40,
          size: 57,
        ),
        AntdProgressCircle(
          percent: 50,
          size: 87,
        ),
      ],
    );
  }
}

/// @t 自定义
/// @d 通过style指定样式
/// @l [AntdProgressCircle]
class AntdProgressCircleCustomerDemo extends StatelessWidget {
  const AntdProgressCircleCustomerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      child: [
        AntdProgressCircle(
          percent: 30,
          size: 100,
          color: AntdColor.danger,
          style: AntdProgressCircleStyle(),
          child: DefaultTextStyle(
              style: TextStyle(fontSize: 12, color: Colors.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("本月剩余流量"),
                  Text("60"),
                  Text("G"),
                ],
              )),
        ),
        AntdProgressCircle(
          percent: 30,
          size: 100,
          color: AntdColor.danger,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("3241"),
              Text("步"),
            ],
          ),
        ),
      ],
    );
  }
}
