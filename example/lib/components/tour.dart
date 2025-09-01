import 'package:antd_flutter/components/box/index.dart';
import 'package:antd_flutter/components/box/style.dart';
import 'package:antd_flutter/components/button/index.dart';
import 'package:antd_flutter/components/tour/index.dart';
import 'package:antd_flutter/components/tour/step.dart';
import 'package:example/components/tab/tabs.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 基础使用
/// @l [AntdTour]
class AntdTourDemo extends StatelessWidget {
  const AntdTourDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Center(
        child: AntdTour(
            child: Column(
          children: List.generate(4, (i) {
            var index = i + 1;
            return AntdTourStep(
                index: index,
                defaultOpen: index == 1,
                title: Text("第$index个的标题"),
                description: Text("第$index个的描述"),
                child: AntdBox(
                  style:
                      AntdBoxStyle(size: index * 30, color: getRandomColor()),
                  child: Text("$index"),
                ));
          }),
        )),
      )
    ]);
  }
}

class AntdTourControllerDemo extends StatefulWidget {
  const AntdTourControllerDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdTourControllerDemoStateDemo();
  }
}

/// @t 使用Controller
/// @l [AntdTour]
class _AntdTourControllerDemoStateDemo extends State<AntdTourControllerDemo> {
  AntdTourController controller = AntdTourController();

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      Center(
        child: AntdTour(
            controller: controller,
            child: Column(
              children: List.generate(4, (i) {
                var index = i + 1;
                return AntdTourStep(
                    index: index,
                    title: Text("第$index个的标题"),
                    description: Text("第$index个的描述"),
                    child: AntdBox(
                      style: AntdBoxStyle(
                          size: index * 30, color: getRandomColor()),
                      child: Text("$index"),
                    ));
              }),
            )),
      ),
      AntdButton(
        child: const Text("打开第3个"),
        onTap: () {
          controller.open(3);
        },
      )
    ]);
  }
}
