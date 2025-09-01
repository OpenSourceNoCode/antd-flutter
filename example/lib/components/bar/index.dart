import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

const az = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

class AntdIndexBarDemoData extends AntdSectionProvider {
  final String group;
  final String text;

  AntdIndexBarDemoData({required this.group, required this.text});

  @override
  String get section => group;
}

List<AntdIndexBarDemoData> getDemos(int number) {
  List<AntdIndexBarDemoData> dataList = [];
  var count = 1;
  for (var value in az) {
    List.generate(5, (sh) {
      dataList.add(
          AntdIndexBarDemoData(group: value, text: "$value-$sh-${count++}"));
    });
  }
  return dataList;
}

/// @t 事件，列表索引改变
/// @l [AntdIndexBar]
class AntdIndexBarDemo extends StatelessWidget {
  const AntdIndexBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      SizedBox(
        height: 500,
        child: AntdIndexBar<AntdIndexBarDemoData>(
            items: getDemos(10),
            onIndexChange: (context, group, index) {
              AntdToast.show("当前索引:$group,$index");
            },
            headerBuilder: (context, group, index) {
              return Text("$group-$index");
            },
            indexBuilder: (context, group, index) {
              return Text(group);
            },
            itemBuilder: (entity) {
              return Text(entity.data.text);
            }),
      )
    ]);
  }
}

/// @t 超多数据
/// @d 超大数据量，默认虚拟滚动
/// @l [AntdIndexBar]
class AntdIndexBarBigDataDemo extends StatelessWidget {
  const AntdIndexBarBigDataDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      SizedBox(
        height: 500,
        child: AntdIndexBar<AntdIndexBarDemoData>(
            items: getDemos(1000000),
            virtual: true,
            headerBuilder: (context, group, index) {
              return Text("$group-$index");
            },
            indexBuilder: (context, group, index) {
              return Text(group);
            },
            itemBuilder: (entity) {
              return Text(entity.data.text);
            }),
      )
    ]);
  }
}
