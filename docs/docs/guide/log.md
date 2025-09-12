---
order: 0
title: 更新日志
timeline: true
tag: 5.0.2-alpha.1
---

## 5.0.0-alpha.1

`2025-09-01`

- 除了试验性组件其他组件均已实现

## 5.0.1-alpha.1

`2025-09-05`

- 为`Toast`,`Mask`,`Popup`,`Dialog`,`Modal`,`ActionSheet`添加了全属性支持的静态方法，并增加了对应的Demo
- 完善了Readme的文档信息
- 样式系统`inherit`属性支持合并
- 修复了`Form`初始值回显不正确的问题
- 完善了`AntdLog`
- 支持`AntdProvider`不包裹根目录使用
- demo完善

## 5.0.2-alpha.1

`2025-09-09`

- 新增了`AntdDropdown`组件
- 完善了`Style.dart`的Test用例
- 优化了`AntdSlider`有min和max时的展示效果
- `AntdSearchBar`的`onCancel`变更为`onExtraTap`
- 为`AntdBox`添加了`feedbackDuration`和`accepter`
- 为可交互的组件添加了可选震动反馈默认开启轻度反馈
- `AntdMaskHole`支持可控的点击测试

## 5.0.3-alpha.1

`2025-09-12`

- `AntdTheme`新增对于`actionSheetStyle`,`dialogActionStyle`,`modalActionStyle`的支持
- `AntdProvider`移除了对于默认额Overlay的支持
- 新增`AntdIconWrap`用来支持`IconData`和`AntdBox`混用时的支持
- 优化了`AntdPopoverStyle`的样式命名
- 为`AntdModal`新增了`AntdModalType`,`AntdDialog`新增`AntdDialogType`,这样就可以在动态样式中制定不同样式
- 修复了`AntdSwitch`默认状态可能回不正确的问题
