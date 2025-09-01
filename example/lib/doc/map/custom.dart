import 'dart:convert';

import 'package:antd_flutter_mobile/index.dart';
import 'package:example/components/bar/index.dart';
import 'package:example/components/image/image.dart';
import 'package:example/components/tab/tabs.dart';
import 'package:flutter/material.dart';

import '../../components/avatar.dart';
import '../../components/cascader/view.dart';
import '../../components/ellipsis.dart';

Map<String, dynamic> customFull = {
  "AntdButton-onTap": () {
    AntdToast.show("触发点击");
  },
  "AntdTabs-tabs": List.generate(
      15,
      (i) => AntdTab(
          title: Text("Tab$i"),
          value: "$i",
          child: Text("我是Tab$i的Child"),
          disabled: i % 4 == 0)),
  "AntdCapsuleTabs-tabs": List.generate(
      15,
      (i) => AntdTab(
          title: Text("Tab$i"),
          value: "$i",
          child: Text("我是Tab$i的Child"),
          disabled: i % 4 == 0)),
  "AntdJumboTabs-tabs": List.generate(
      15,
      (i) => AntdJumboTab(
          title: Text("Tab$i"),
          desc: Text("Tab$i的描述"),
          value: "$i",
          child: Text("我是Tab$i的Child"),
          disabled: i % 4 == 0)),
  "AntdNavBar-title": const Text("我是标题"),
  "AntdTabBar-items": const [
    AntdTabBarItem(
        icon: AntdIcon(
          icon: AntdIcons.app,
        ),
        title: Text("应用")),
    AntdTabBarItem(
        icon: AntdIcon(
          icon: AntdIcons.unorderedList,
        ),
        title: Text("消息")),
    AntdTabBarItem(
        icon: AntdIcon(
          icon: AntdIcons.send,
        ),
        title: Text("发送")),
    AntdTabBarItem(
        icon: AntdIcon(
          icon: AntdIcons.user,
        ),
        title: Text("用户"))
  ],
  "AntdIndexBar-items": getDemos(100),
  "AntdIndexBar-headerBuilder": (context, group, index) {
    return Text("$group-$index");
  },
  "AntdIndexBar-indexBuilder": (context, group, index) {
    return Text(group);
  },
  "AntdIndexBar-itemBuilder": (entity) {
    return Text(entity.data.text);
  },
  "AntdSliderBar-items": List.generate(
    100,
    (i) => AntdSliderBarItem(
        value: "$i",
        disabled: i % 4 == 0,
        content: AntdBox(
          style: AntdBoxStyle(
              color: getRandomColor(), alignment: Alignment.center),
          child: Text(
            "选项$i ${i % 3 == 0 ? '($i)' : ''}",
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: i % 5 == 0
            ? AntdBadge(
                badge: Text('$i'),
                child: Text("我是选项$i的内容"),
              )
            : Text("我是选项$i的内容")),
  ),
  "AntdAvatar-image": AntdResource(url: demoAvatarImages[0]),
  "AntdImage-image": AntdResource(url: url),
  "AntdCollapse-items": List.generate(
    50,
    (i) => AntdCollapseItem(
      title: Text("第$i项"),
      content: Text("第$i项的内容"),
      disabled: i % 4 == 0,
    ),
  ),
  "AntdEllipsis-content": ellipsisText,
  "AntdFloatingPanel-content":
      AntdList(items: List.generate(10, (i) => Text("$i"))),
  "AntdFloatingPanel-child": AntdBox(
    onTap: () {
      AntdToast.show("背景点击事件");
    },
    child: Text("我是背景内容，我可以被正常点击"),
    style: AntdBoxStyle(width: double.infinity, height: 500),
  ),
  "AntdList-items": List.generate(100, (i) => Text("$i")),
  "AntdSteps-steps": List.generate(
      3,
      (i) => AntdStep(
          description: Text("我是步骤$i的描述"),
          title: Text("我是步骤$i的标题"),
          icon: AntdBox(
            child: Text("$i"),
          ))),
  "AntdSwiper-items": List.generate(5, (i) => Text("$i")),
  "AntdActionSheet-actions": const [
    AntdAction(
      title: Text("辅助"),
    ),
    AntdAction(
      title: Text("修改"),
    ),
    AntdAction(
      title: Text("保存"),
    )
  ],
  "AntdDialog-actions": const [
    AntdDialogAction(
      title: Text("对话框示例"),
    ),
  ],
  "AntdModal-actions": const [
    AntdModalAction(title: Text("弹窗示例"), primary: true),
    AntdModalAction(
      title: Text("弹窗示例"),
    ),
  ],
  "AntdPullToRefresh-child": SizedBox(
    height: 300,
    child: AntdList(
      items: List.generate(10, (i) => Text("$i")),
    ),
  ),
  "AntdPopover-child": const AntdBox(
    child: Text('气泡'),
  ),
  "AntdSelector-options": const [
    AntdSelectorOption(
      label: Text("选项1"),
      value: "1",
    ),
    AntdSelectorOption(
      label: Text("选项2"),
      value: "2",
    ),
    AntdSelectorOption(
        label: Text("选项3"), value: "3", description: Text("选项1的描述"))
  ],
  "AntdForm-builder": (controller) {
    return Column(
      children: [
        ListenableBuilder(
          listenable: controller,
          builder: (BuildContext context, Widget? child) {
            return AntdBox(
              style: AntdBoxStyle(
                  color: Colors.white, padding: 12.all, width: double.infinity),
              child: Text(jsonEncode(controller.getFieldsValue())),
            );
          },
        ),
        AntdList(
          shrinkWrap: true,
          items: [
            AntdFormItem(
              required: true,
              label: Text("姓名"),
              name: "name",
              rules: [AntdFormRule(len: 5)],
              builder: (ctx) {
                return AntdInput(
                  placeholder: Text("请输入姓名"),
                );
              },
            ),
            AntdFormItem(
              required: true,
              label: Text("喜爱的水果"),
              name: "apple",
              builder: (ctx) {
                return AntdSelector(options: [
                  AntdSelectorOption(label: Text("苹果"), value: "ap"),
                  AntdSelectorOption(label: Text("橘子"), value: "or"),
                  AntdSelectorOption(label: Text("香蕉"), value: "ba")
                ]);
              },
            ),
          ],
        ),
        AntdButton(
          block: true,
          child: const Text("提交"),
          onTap: () {
            controller.submit();
          },
        )
      ],
    );
  },
  "AntdFormItem-helpIcon": const AntdIcon(
    icon: AntdIcons.questionCircle,
  ),
  "AntdFormItem-name": "name",
  "AntdFormItem-builder": (ctx) {
    return AntdList(shrinkWrap: true, items: [
      const AntdInput(
        placeholder: Text("请输入名字"),
      )
    ]);
  },
  "AntdCheckList-items": List.generate(5, (i) {
    return AntdCheckItem(
      child: Text("$i"),
    );
  }),
  "AntdCascaderView-placeholder": Text("请选择"),
  "AntdCascaderView-options": cascaderOptions,
  "AntdSwipeAction-child": AntdBox(
    style: AntdBoxStyle(padding: 16.all, width: double.infinity),
    child: const Text("左右滑动,中间点击复位"),
  ),
  "AntdCascader-cascaderView": AntdCascaderView(
    options: cascaderOptions,
  ),
  "AntdSegmented-items": [
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
  "AntdTour-child": AntdBox()
};
