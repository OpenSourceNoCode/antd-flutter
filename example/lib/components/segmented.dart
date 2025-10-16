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
        value: "1",
        items: const [
          AntdSegmentedItem(
            value: "1",
            child: Text("Daily"),
          ),
          AntdSegmentedItem(
            value: "2",
            child: Text("Weekly"),
          ),
          AntdSegmentedItem(
            value: "3",
            child: Text("Monthly"),
          ),
          AntdSegmentedItem(
            value: "4",
            child: Text("Yearly"),
          )
        ],
        onChange: (index) {
          AntdToast.show("当前index:$index", position: AntdToastPosition.top);
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
  String? value;

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSegmented(
        value: value,
        manual: true,
        items: const [
          AntdSegmentedItem(
            value: "1",
            child: Text("Daily"),
          ),
          AntdSegmentedItem(
            value: "2",
            child: Text("Weekly"),
          ),
          AntdSegmentedItem(
            value: "3",
            child: Text("Monthly"),
          ),
          AntdSegmentedItem(
            value: "4",
            child: Text("Yearly"),
          ),
        ],
        onChange: (value) {
          setState(() {
            this.value = value;
          });
        },
      ),
      AntdButton(
        child: const Text("选择第3个"),
        onTap: () {
          setState(() {
            value = "3";
          });
        },
      ),
      AntdButton(
          child: const Text("取消"),
          onTap: () {
            setState(() {
              value = null;
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
      AntdSegmented(items: [
        AntdSegmentedItem(
          value: '1',
          child: Text("Daily"),
        ),
        AntdSegmentedItem(
          value: '2',
          disabled: true,
          child: Text("Weekly"),
        ),
        AntdSegmentedItem(
          value: '3',
          child: Text("Monthly"),
        ),
        AntdSegmentedItem(
          value: '4',
          disabled: true,
          child: Text("Yearly"),
        ),
      ]),
      AntdSegmented(disabled: true, value: "1", items: [
        AntdSegmentedItem(
          value: "1",
          child: Text("Daily"),
        ),
        AntdSegmentedItem(
          disabled: true,
          value: "2",
          child: Text("Weekly"),
        ),
        AntdSegmentedItem(
          value: "3",
          child: Text("Monthly"),
        ),
        AntdSegmentedItem(
          value: "4",
          disabled: true,
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

/// @t 受控的 Segmented,设置manual为true 通过onChange更新
/// @l [AntdSegmented]
class _AntdLoadMoreDemoStateDemo extends State<AntdLoadMoreDemo> {
  String? value;
  var items = <AntdSegmentedItem>[
    const AntdSegmentedItem(
      value: "Daily",
      child: Text("Daily"),
    ),
    const AntdSegmentedItem(
      value: "Weekly",
      child: Text("Weekly"),
    ),
    const AntdSegmentedItem(
      value: "Monthly",
      child: Text("Monthly"),
    ),
  ];

  var items_ = <AntdSegmentedItem>[];
  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdSegmented(value: value, items: [
        const AntdSegmentedItem(
          value: "Yearly",
          child: Text("Yearly"),
        ),
        ...items_
      ]),
      AntdButton(
        child: const Text("加载更多"),
        onTap: () {
          setState(() {
            items_ = [
              ...items,
            ];
            value = "Weekly";
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
      AntdSegmented(value: '1', items: [
        AntdSegmentedItem(
          value: '1',
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
          value: '2',
          child: Text("Weekly"),
        ),
        AntdSegmentedItem(
          value: '3',
          child: Text("Monthly"),
        ),
        AntdSegmentedItem(
          value: '4',
          child: Text("Yearly"),
        )
      ]),
      AntdSegmented(value: 'add', items: [
        AntdSegmentedItem(
          value: 'add',
          child: AntdIcon(
            icon: AntdIcons.add,
          ),
        ),
        AntdSegmentedItem(
          value: 'appstore',
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
      AntdSegmented(value: 'avr', items: [
        AntdSegmentedItem(
          value: "avr",
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
          value: "Weekly",
          child: Text("Weekly"),
        ),
        const AntdSegmentedItem(
          value: "Monthly",
          child: Text("Monthly"),
        ),
        const AntdSegmentedItem(
          value: "Yearly",
          child: Text("Yearly"),
        )
      ]),
    ]);
  }
}
