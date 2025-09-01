import 'package:antd_flutter/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

class AntdProgressBarDemo extends StatefulWidget {
  const AntdProgressBarDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdProgressBarDemoStateDemo();
  }
}

/// @t 基础用法
/// @l [AntdProgressBar]
class _AntdProgressBarDemoStateDemo extends State<AntdProgressBarDemo> {
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
              padding: 12.top,
              child: AntdProgressBar(
                onChange: (c) {
                  AntdToast.show('当前$c');
                },
                onFinish: () {
                  AntdToast.show('完成了');
                },
                percent: currentStep,
              ),
            ),
            Padding(
              padding: 12.top,
              child: AntdProgressBar(
                percent: currentStep,
                child: Text("$currentStep%"),
              ),
            )
          ],
        )
      ],
    );
  }
}

/// @t 显示进度文字
/// @d 进度文字展示在末尾
/// @l [AntdProgressBar]
class AntdProgressBarTextDemo extends StatelessWidget {
  const AntdProgressBarTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      child: [
        AntdProgressBar(
          percent: 30,
          child: Text("30%"),
        ),
        AntdProgressBar(
          percent: 50,
          child: Text("已完成 3/6 步"),
        ),
      ],
    );
  }
}

/// @t 指定线条宽度
/// @d stroke指定宽度
/// @l [AntdProgressBar]
class AntdProgressBarLineWidthDemo extends StatelessWidget {
  const AntdProgressBarLineWidthDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      child: [
        AntdProgressBar(
          percent: 30,
          stroke: 5,
        ),
        AntdProgressBar(
          percent: 40,
          stroke: 10,
        ),
      ],
    );
  }
}

/// @t 指定线条颜色
/// @d color指定颜色
/// @l [AntdProgressBar]
class AntdProgressBarLineColorDemo extends StatelessWidget {
  const AntdProgressBarLineColorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      child: [
        AntdProgressBar(
          percent: 30,
          color: AntdColor.danger,
          child: Text("30%"),
        ),
        AntdProgressBar(
          percent: 30,
          color: AntdColor.warning,
          child: Text("30%"),
        ),
        AntdProgressBar(
          percent: 30,
          color: AntdColor.success,
          child: Text("30%"),
        ),
      ],
    );
  }
}

/// @t 自定义轨道和直角
/// @d 通过style指定样式
/// @l [AntdProgressBar]
class AntdProgressBarBgColorDemo extends StatelessWidget {
  const AntdProgressBarBgColorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
      child: [
        AntdProgressBar(
          percent: 30,
          color: AntdColor.danger,
          style: AntdProgressBarStyle(color: token.colorPrimary),
        ),
        AntdProgressBar(
          percent: 30,
          color: AntdColor.danger,
          style: AntdProgressBarStyle(color: token.colorSuccess, radius: 0),
        ),
      ],
    );
  }
}
