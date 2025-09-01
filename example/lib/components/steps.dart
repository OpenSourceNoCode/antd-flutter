import 'package:antd_flutter/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 基础使用
/// @l [AntdSteps]
class AntdStepsDemo extends StatelessWidget {
  const AntdStepsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSteps(current: 1, steps: [
        AntdStep(title: Text("标题1"), description: Text("描述")),
        AntdStep(title: Text("标题2"), description: Text("描述")),
        AntdStep(title: Text("标题3"), description: Text("描述"))
      ])
    ]);
  }
}

/// @t 带失败节点
/// @l [AntdSteps]
class AntdStepsErrorDemo extends StatelessWidget {
  const AntdStepsErrorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSteps(current: 2, steps: [
        AntdStep(title: Text("第一步")),
        AntdStep(title: Text("第二步")),
        AntdStep(title: Text("第三步"), status: AntdStepStatus.error),
        AntdStep(title: Text("第四步"))
      ])
    ]);
  }
}

/// @t 纵向步骤条
/// @l [AntdSteps]
class AntdStepsVerticalDemo extends StatelessWidget {
  const AntdStepsVerticalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSteps(current: 0, vertical: true, steps: [
        AntdStep(title: Text("填写机构信息")),
        AntdStep(title: Text("签约机构")),
        AntdStep(title: Text("关联服务区"))
      ])
    ]);
  }
}

/// @t 纵向步骤条带失败
/// @l [AntdSteps]
class AntdStepsVerticalErrorDemo extends StatelessWidget {
  const AntdStepsVerticalErrorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSteps(
          current: 1,
          vertical: true,
          style: AntdStepsStyle(
              titleStyle: AntdBoxStyle(textStyle: TextStyle(fontSize: 18)),
              activeTitleStyle:
                  AntdBoxStyle(textStyle: TextStyle(fontSize: 18)),
              stepStyle: AntdBoxStyle(
                  padding: 6.all, size: 24, radius: 24.radius.all)),
          steps: [
            AntdStep(
                title: Text("填写机构信息"),
                icon: AntdIcon(
                  icon: AntdIcons.check,
                  style: AntdIconStyle(color: Colors.white),
                ),
                description: Text("完成时间：2020-12-01 12:30")),
            AntdStep(
                title: Text("签约机构"),
                icon: AntdIcon(
                  icon: AntdIcons.close,
                  style: AntdIconStyle(color: Colors.white),
                ),
                description: Text("完成时间：2020-12-01 12:30"),
                status: AntdStepStatus.error),
            AntdStep(
                title: Text("关联服务区"),
                icon: AntdIcon(
                  icon: AntdIcons.link,
                  style: AntdIconStyle(color: Colors.white),
                ),
                description: Text("完成时间：2020-12-01 12:30"))
          ])
    ]);
  }
}

/// @t 自定义图标及大小
/// @l [AntdSteps]
class AntdStepsVerticalCustomDemo extends StatelessWidget {
  const AntdStepsVerticalCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSteps(current: 1, vertical: true, steps: [
        AntdStep(title: Text("填写机构信息"), description: Text("这里是一些描述")),
        AntdStep(
            title: Text("签约机构"),
            description: Column(
              children: [
                Text("这里是一些描述"),
                AntdButton(
                  color: AntdColor.primary,
                  child: Text("去看看"),
                )
              ],
            ),
            status: AntdStepStatus.error),
        AntdStep(title: Text("关联服务区"), description: Text("这里是一些描述"))
      ])
    ]);
  }
}
