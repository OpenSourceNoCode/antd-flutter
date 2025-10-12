---
order: 0
title: 更新日志
timeline: true
tag: 5.0.6-alpha.1
---

## 5.0.7-alpha.1

`2025-10-12`

### 本次更新主要统一了可输入组件的表单模型，优化了表单性能，并将所有支持值的组件类型改为 dynamic。包含大量示例和文档完善。

✨ 新功能

- 表单自动收集支持：`AntdCascaderView`、`AntdInput`、`AntdTextArea`、`AntdSegmented`、`AntdSlider`、`AntdSwitch`、`AntdCheckList`、`AntdRadio`、`AntdCheckbox`、`AntdSelector`、`AntdRadioGroup` 和 `AntdCheckboxGroup` 现在支持自动表单数据收集
- 动态属性：`AntdRadioGroup` 和 `AntdCheckboxGroup` 均支持动态属性
- 触摸反馈控制：`AntdList` 新增 `feedback` 属性，可直接禁用触摸反馈样式
- 受控加载：`AntdSkeleton` 新增 `spin` 和 `child` 属性，便于控制加载状态
- 滑块增强：`AntdSliderBarItem` 新增 `onActive` 事件和动态 value 属性
- 触感反馈选项：`AntdHapticFeedback` 新增 `none` 属性

⚙️ 改进

- 滚动行为：将 AntdScrollView 中的 edgeThreshold 默认值修复为 0.2
- 动画修复：解决了 AntdSkeleton 动画覆盖圆角的问题

🐛 问题修复

- 滑块定位：修复了 `AntdSliderBar` 滚动视图位置不正确的问题
- 点击优先级：修正了 `AntdTapOptions` 优先级问题
- 导航布局：修复了 `AntdNavBar` 的 `left` 属性展示位置不正确的问题
- 动态更新：解决了 `AntdSegmented` 不能动态更新的问题

## 5.0.6-alpha.1

`2025-09-23`

- 为`AntdIndexBar`添加了`hapticFeedback`反馈选项，支持Style和属性级别设置
- `AntdButton`的默认点击设置修改为不穿透
- `AntdCheckboxStyle`的`defaultIconStyle`名字更改为`iconStyle`,`defaultIcon`名字更改为`icon`
- 修复了`AntdEllipsis`忽略了 '...' 的长度问题
- `AntdForm`的属性简化，移除了`header`和`footer`,实际使用中两个属性意义不大却因为使用了Column而非常麻烦
- `AntdPageIndicatorStyle`的`bodyStyle`更新为`style`
- `AntdInputStyle`移除了默认的`obscureIcon`和`activeObscureIcon`
- 为`AntdList`添加了`headers`和`footers`选项，以便于定制Slivers类型的Widget
- 修复了`AntdPopup`没有使用`AntdTheme`全局样式的问题
- `AntdColor`新增了`fill`选项
- 调整了`Style`的优先级，现在的优先级顺序是 `组件上的styleBuilder` > `组件上的style` > `AntdStyleProvider` > `AntdStyleBuilderProvider`
- 优化了`AntdProvider`的性能问题

## 5.0.5-alpha.1

`2025-09-21`

- `AntdPopover`,`AntdDropdown`,`AntdToast`,`AntdTour`,`AntdMask`,`AntdPopup`,`AntdCascader`,`AntdActionSheet`,`AntdModal`,`AntdDialog`支持通过`animation`属性定制动画
- `AntdMaskHole`支持使用`AntdMaskHoleClipper`裁剪
- 修复了`AntdSwitch`动画性能问题
- 为`AntdDropdown`更新了动画

## 5.0.4-alpha.1

`2025-09-17`

- 全面适配暗黑模式
- 移除了`DoubleExtensions`扩展
- 移除了`AntdSize`和`AntdColor`的`default_`属性
- Example中添加暗黑和高亮切换
- Theme相关的文档的Api完善

## 5.0.3-alpha.1

`2025-09-12`

- `AntdTheme`新增对于`actionSheetStyle`,`dialogActionStyle`,`modalActionStyle`的支持
- `AntdProvider`移除了对于默认额Overlay的支持
- 新增`AntdIconWrap`用来支持`IconData`和`AntdBox`混用时的支持
- 优化了`AntdPopoverStyle`的样式命名
- 为`AntdModal`新增了`AntdModalType`,`AntdDialog`新增`AntdDialogType`,这样就可以在动态样式中制定不同样式
- 修复了`AntdSwitch`默认状态可能回不正确的问题

## 5.0.2-alpha.1

`2025-09-09`

- 新增了`AntdDropdown`组件
- 完善了`Style.dart`的Test用例
- 优化了`AntdSlider`有min和max时的展示效果
- `AntdSearchBar`的`onCancel`变更为`onExtraTap`
- 为`AntdBox`添加了`feedbackDuration`和`accepter`
- 为可交互的组件添加了可选震动反馈默认开启轻度反馈
- `AntdMaskHole`支持可控的点击测试

## 5.0.1-alpha.1

`2025-09-05`

- 为`Toast`,`Mask`,`Popup`,`Dialog`,`Modal`,`ActionSheet`添加了全属性支持的静态方法，并增加了对应的Demo
- 完善了Readme的文档信息
- 样式系统`inherit`属性支持合并
- 修复了`Form`初始值回显不正确的问题
- 完善了`AntdLog`
- 支持`AntdProvider`不包裹根目录使用
- demo完善

## 5.0.0-alpha.1

`2025-09-01`

- 除了试验性组件其他组件均已实现
