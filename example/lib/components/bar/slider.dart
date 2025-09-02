import 'dart:math';

import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 事件
/// @l [AntdSliderBar]
class AntdSliderBarDemo extends StatelessWidget {
  const AntdSliderBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      SizedBox(
        height: 500,
        child: AntdSliderBar(
            onChange: (item) {
              AntdToast.show("我是:${item.value}");
            },
            items: const [
              AntdSliderBarItem(
                  value: "1", content: Text("选项1"), title: Text("我是标题1")),
              AntdSliderBarItem(
                  value: "2", content: Text("选项2"), title: Text("我是标题2")),
              AntdSliderBarItem(
                  value: "3", content: Text("选项3"), title: Text("我是标题3")),
              AntdSliderBarItem(
                  value: "4", content: Text("选项4"), title: Text("我是标题4"))
            ]),
      )
    ]);
  }
}

/// @t 自定义样式
/// @d 通过style 可以覆盖默认样式
/// @l [AntdSliderBar]
class AntdSliderBarStyleDemo extends StatelessWidget {
  const AntdSliderBarStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      SizedBox(
        height: 500,
        child: AntdSliderBar(items: [
          AntdSliderBarItem(
              value: "1",
              content: Row(
                children: [
                  const Text("选项1"),
                  Text(
                    "(8)",
                    style: token.font.default_
                        .copyWith(color: token.colorTextTertiary),
                  )
                ],
              ),
              title: const Text("我是标题1")),
          const AntdSliderBarItem(
              value: "2",
              disabled: true,
              content: Text("选项2"),
              title: Text("我是标题2")),
          const AntdSliderBarItem(
              value: "3", content: Text("选项3"), title: Text("我是标题3")),
          const AntdSliderBarItem(
              value: "4", content: Text("选项4"), title: Text("我是标题4"))
        ]),
      )
    ]);
  }
}

String generateRandomString(int length) {
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final random = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
}

class _Child extends StatelessWidget {
  final String title;
  final String desc;

  const _Child({required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: 10.bottom,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Text(desc)
      ],
    );
  }
}

/// @t 超多内容填满
/// @d 每个页面可以自己适应内容的高度
/// @l [AntdSliderBar]
class AntdSliderBarBigContentDemo extends StatelessWidget {
  const AntdSliderBarBigContentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      SizedBox(
        height: 500,
        child: AntdSliderBar(
            style: const AntdSliderBarStyle(
                activeCornerRadius: 0, bodyStyle: AntdBoxStyle(width: 150)),
            items: [
              AntdSliderBarItem(
                  value: "1",
                  content:
                      _Child(title: "选项1", desc: generateRandomString(1000)),
                  title: const Text("我是标题1")),
              AntdSliderBarItem(
                  value: "2",
                  disabled: true,
                  content:
                      _Child(title: "选项2", desc: generateRandomString(1200)),
                  title: const Text("我是标题2")),
              AntdSliderBarItem(
                  value: "3",
                  content:
                      _Child(title: "选项3", desc: generateRandomString(1400)),
                  title: const Text("我是标题3")),
              AntdSliderBarItem(
                  value: "4",
                  content:
                      _Child(title: "选项4", desc: generateRandomString(200)),
                  title: const Text("我是标题4"))
            ]),
      )
    ]);
  }
}
