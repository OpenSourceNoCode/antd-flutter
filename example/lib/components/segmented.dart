import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/widgets.dart';

import 'avatar.dart';

/// @t 基础使用
/// @l [AntdSegmented]
class AntdSegmentedDemo extends StatelessWidget {
  const AntdSegmentedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSegmented(
        activeIndex: 0,
        items: const [
          AntdSegmentedItem(
            child: Text("Daily"),
          ),
          AntdSegmentedItem(
            child: Text("Weekly"),
          ),
          AntdSegmentedItem(
            child: Text("Monthly"),
          ),
          AntdSegmentedItem(
            child: Text("Yearly"),
          )
        ],
        onChange: (index) {
          AntdToast.show("当前index:$index");
        },
      )
    ]);
  }
}

class AntdControllerDemo extends StatefulWidget {
  const AntdControllerDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdControllerDemoStateDemo();
  }
}

/// @t 受控的 Segmented
/// @l [AntdSegmented]
class _AntdControllerDemoStateDemo extends State<AntdControllerDemo> {
  var value = 0;

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSegmented(activeIndex: value, items: const [
        AntdSegmentedItem(
          child: Text("Daily"),
        ),
        AntdSegmentedItem(
          child: Text("Weekly"),
        ),
        AntdSegmentedItem(
          child: Text("Monthly"),
        ),
        AntdSegmentedItem(
          child: Text("Yearly"),
        ),
      ]),
      AntdButton(
        child: const Text("选择第3个"),
        onTap: () {
          setState(() {
            value = 2;
          });
        },
      ),
      AntdButton(
          child: const Text("取消"),
          onTap: () {
            setState(() {
              value = 0;
            });
          }),
    ]);
  }
}

/// @t 禁用
/// @l [AntdSegmented]
class AntdDisabledDemo extends StatelessWidget {
  const AntdDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSegmented(activeIndex: 0, items: [
        AntdSegmentedItem(
          child: Text("Daily"),
        ),
        AntdSegmentedItem(
          disable: true,
          child: Text("Weekly"),
        ),
        AntdSegmentedItem(
          child: Text("Monthly"),
        ),
        AntdSegmentedItem(
          disable: true,
          child: Text("Yearly"),
        ),
      ]),
      AntdSegmented(disabled: true, activeIndex: 2, items: [
        AntdSegmentedItem(
          child: Text("Daily"),
        ),
        AntdSegmentedItem(
          disable: true,
          child: Text("Weekly"),
        ),
        AntdSegmentedItem(
          child: Text("Monthly"),
        ),
        AntdSegmentedItem(
          disable: true,
          child: Text("Yearly"),
        )
      ])
    ]);
  }
}

class AntdLoadMoreDemo extends StatefulWidget {
  const AntdLoadMoreDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdLoadMoreDemoStateDemo();
  }
}

/// @t 受控的 Segmented
/// @l [AntdSegmented]
class _AntdLoadMoreDemoStateDemo extends State<AntdControllerDemo> {
  var value = 0;
  var items = <AntdSegmentedItem>[
    const AntdSegmentedItem(
      child: Text("Daily"),
    ),
    const AntdSegmentedItem(
      child: Text("Weekly"),
    ),
    const AntdSegmentedItem(
      child: Text("Monthly"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSegmented(activeIndex: value, items: const [
        AntdSegmentedItem(
          child: Text("Yearly"),
        ),
      ]),
      AntdButton(
        child: const Text("加载更多"),
        onTap: () {
          setState(() {
            items = [
              ...items,
              const AntdSegmentedItem(
                child: Text("Weekly"),
              ),
              const AntdSegmentedItem(
                child: Text("Monthly"),
              ),
            ];
            value = items.length - 2;
          });
        },
      ),
    ]);
  }
}

///设置图标
///@l[AntdSegmented]
class AntdSegmentedIconDemo extends StatelessWidget {
  const AntdSegmentedIconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSegmented(activeIndex: 0, items: [
        AntdSegmentedItem(
          child: Row(
            children: [
              AntdIcon(
                icon: AntdIcons.add,
              ),
              Text("Daily"),
            ],
          ),
        ),
        AntdSegmentedItem(
          child: Text("Weekly"),
        ),
        AntdSegmentedItem(
          child: Text("Monthly"),
        ),
        AntdSegmentedItem(
          child: Text("Yearly"),
        )
      ]),
      AntdSegmented(activeIndex: 0, items: [
        AntdSegmentedItem(
          child: AntdIcon(
            icon: AntdIcons.add,
          ),
        ),
        AntdSegmentedItem(
          child: AntdIcon(
            icon: AntdIcons.appstore,
          ),
        ),
      ])
    ]);
  }
}

///更多
///@l[AntdSegmented]
class AntdSegmentedMoreDemo extends StatelessWidget {
  const AntdSegmentedMoreDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSegmented(activeIndex: 0, items: [
        AntdSegmentedItem(
          child: Column(
            children: [
              AntdAvatar(image: NetworkImage(demoAvatarImages[0])),
              const Row(
                children: [
                  AntdIcon(
                    icon: AntdIcons.add,
                  ),
                  Text("Daily"),
                ],
              )
            ],
          ),
        ),
        const AntdSegmentedItem(
          child: Text("Weekly"),
        ),
        const AntdSegmentedItem(
          child: Text("Monthly"),
        ),
        const AntdSegmentedItem(
          child: Text("Yearly"),
        )
      ]),
    ]);
  }
}
