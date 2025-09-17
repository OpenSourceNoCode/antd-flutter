import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

/// theme
class AntdSeedToken {
  /// 基础组件的圆角大小，例如按钮、输入框、卡片等
  final int radius;

  ///用于表示操作信息的 Token 序列，如 Alert 、Tag、 Progress 等组件都有用到该组梯度变量。
  final Color colorInfo;

  ///	控制超链接的颜色。
  final Color colorLink;

  ///品牌色是体现产品特性和传播理念最直观的视觉元素之一。
  ///在你完成品牌主色的选取之后，我们会自动帮你生成一套完整的色板，并赋予它们有效的设计语义
  final Color colorPrimary;

  ///用于表示操作成功的 Token 序列，如 Result、Progress 等组件会使用该组梯度变量。
  final Color colorSuccess;

  ///用于表示操作警告的 Token 序列，
  ///如 Notification、 Alert等警告类组件或 Input 输入类等组件会使用该组梯度变量。
  final Color colorWarning;

  ///用于表示操作失败的 Token 序列，如失败按钮、错误状态提示（Result）组件等。
  final Color colorError;

  ///用于派生文本色梯度的基础变量
  final Color colorText;

  ///基础的背景色,用来派生许多其他的颜色
  final Color colorBgBase;

  ///设计系统中使用最广泛的字体大小，文本梯度也将基于该字号进行派生。
  final double fontSize;

  ///用于控制组件边框、分割线等的宽度
  final double lineWidth;

  ///用于控制组件尺寸的基础步长，尺寸步长结合尺寸变化单位，
  ///就可以派生各种尺寸梯度。通过调整步长即可得到不同的布局模式
  final int sizeStep;

  ///用于控制组件尺寸的变化单位，
  ///在 Ant Design 中我们的基础单位为 4 ，便于更加细致地控制尺寸梯度
  final int sizeUnit;

  ///用于派生颜色时使用的透明度，一般不需要动
  final AntdOpacityDefine opacityDefine;

  ///默认的文本样式
  final TextStyle defaultTextStyle;

  ///组件箭头的尺寸
  final Size arrow;

  const AntdSeedToken(
      {required this.radius,
      required this.colorInfo,
      required this.colorLink,
      required this.colorPrimary,
      required this.colorSuccess,
      required this.colorWarning,
      required this.colorError,
      required this.colorText,
      required this.colorBgBase,
      required this.fontSize,
      required this.lineWidth,
      required this.sizeStep,
      required this.sizeUnit,
      this.opacityDefine = const AntdOpacityDefine(),
      this.defaultTextStyle = const TextStyle(),
      required this.arrow});

  AntdSeedToken copyFrom(AntdSeedToken? other) {
    if (other == null) return this;

    return AntdSeedToken(
      radius: other.radius,
      colorInfo: other.colorInfo,
      colorLink: other.colorLink,
      colorPrimary: other.colorPrimary,
      colorSuccess: other.colorSuccess,
      colorWarning: other.colorWarning,
      colorError: other.colorError,
      colorText: other.colorText,
      colorBgBase: other.colorBgBase,
      fontSize: other.fontSize,
      lineWidth: other.lineWidth,
      sizeStep: other.sizeStep,
      sizeUnit: other.sizeUnit,
      opacityDefine: other.opacityDefine,
      defaultTextStyle: other.defaultTextStyle,
      arrow: other.arrow,
    );
  }
}

/// theme
class AntdMapToken {
  ///大小
  final AntdSizeDefine size;

  /// 已经生成的圆角大小，例如按钮、输入框、卡片等
  final AntdRadiusDefine radius;

  ///用于表示操作信息的 Token 序列，如 Alert 、Tag、 Progress 等组件都有用到该组梯度变量。
  final AntdColorDefine colorInfo;

  ///	控制超链接的颜色。
  final AntdColorDefine colorLink;

  ///品牌色是体现产品特性和传播理念最直观的视觉元素之一。
  ///在你完成品牌主色的选取之后，我们会自动帮你生成一套完整的色板，并赋予它们有效的设计语义
  final AntdColorDefine colorPrimary;

  ///用于表示操作成功的 Token 序列，如 Result、Progress 等组件会使用该组梯度变量。
  final AntdColorDefine colorSuccess;

  ///用于表示操作警告的 Token 序列，
  ///如 Notification、 Alert等警告类组件或 Input 输入类等组件会使用该组梯度变量。
  final AntdColorDefine colorWarning;

  ///用于表示操作失败的 Token 序列，如失败按钮、错误状态提示（Result）组件等。
  final AntdColorDefine colorError;

  ///文本色
  final AntdTextColorDefine colorText;

  ///字体
  final AntdFontDefine font;

  ///填充色
  final AntdFillColorDefine colorFill;

  ///控制毛玻璃容器的背景色，通常为透明色。
  final Color colorBgBlur;

  ///组件的容器背景色，例如：默认按钮、输入框等。务必不要将其与 `colorBgElevated` 混淆。
  final Color colorBgContainer;

  ///浮层容器背景色，
  ///在暗色模式下该 token 的色值会比 `colorBgContainer` 要亮一些。
  final Color colorBgElevated;

  ///该色用于页面整体布局的背景色，
  ///只有需要在页面中处于 B1 的视觉层级时才会使用该 token，其他用法都是错误的
  final Color colorBgLayout;

  ///浮层的背景蒙层颜色，用于遮罩浮层下面的内容，Modal、Drawer 等组件的蒙层使用的是该 token
  final Color colorBgMask;

  ///实心的背景颜色，目前只用在默认实心按钮背景色上。
  final Color colorBgSolid;

  ///实心的背景颜色激活态，目前只用在默认实心按钮的 active 效果。
  final Color colorBgSolidActive;

  ///该色用于引起用户强烈关注注意的背景色，目前只用在 Tooltip 的背景色上。
  final Color colorBgSpotlight;

  ///默认使用的边框, 用于分割不同的元素，例如：表单的分割线、卡片的分割线等。
  final BorderSide border;

  ///比默认使用的边框色要浅一级，此颜色和 colorSplit 的颜色一致。使用的是实色。
  final BorderSide borderSecondary;

  ///用于控制组件边框、分割线等的宽度
  final double lineWidth;

  ///白色 尽量不要使用 不会随主题动态变化 推荐优先使用 colorBgContainer
  final Color colorWhite;

  ///透明色
  final Color colorTransparent;

  ///黑色 尽量不要使用 不会随主题动态变化 推荐优先使用 colorBgContainer
  final Color colorBlack;

  ///控制标题类组件选中项的字体粗细。
  final FontWeight fontWeightStrong;

  ///阴影
  final AntdShadowDefine shadow;

  const AntdMapToken(
      {required this.size,
      required this.radius,
      required this.colorInfo,
      required this.colorLink,
      required this.colorPrimary,
      required this.colorSuccess,
      required this.colorWarning,
      required this.colorError,
      required this.colorText,
      required this.font,
      required this.colorFill,
      required this.colorBgBlur,
      required this.colorBgContainer,
      required this.colorBgElevated,
      required this.colorBgLayout,
      required this.colorBgMask,
      required this.colorBgSolid,
      required this.colorBgSolidActive,
      required this.colorBgSpotlight,
      required this.border,
      required this.borderSecondary,
      required this.lineWidth,
      required this.colorWhite,
      required this.colorTransparent,
      required this.colorBlack,
      this.fontWeightStrong = FontWeight.w600,
      required this.shadow});
}
