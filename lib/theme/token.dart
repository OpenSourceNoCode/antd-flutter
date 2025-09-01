import 'package:antd_flutter/extensions/color.dart';
import 'package:flutter/material.dart';

class AntdOpacityDefine {
  final double colorFill;
  final double colorFillSecondary;
  final double colorFillTertiary;
  final double colorFillQuaternary;
  final double colorText;
  final double colorTextSecondary;
  final double colorTextTertiary;
  final double colorTextQuaternary;
  final double colorBorder;

  const AntdOpacityDefine(
      {this.colorFill = 0.15,
      this.colorFillSecondary = 0.06,
      this.colorFillTertiary = 0.043,
      this.colorFillQuaternary = 0.02,
      this.colorText = 0.88,
      this.colorTextSecondary = 0.66,
      this.colorTextTertiary = 0.44,
      this.colorTextQuaternary = 0.25,
      this.colorBorder = 0.073});

  AntdOpacityDefine copyWith({
    double? colorFill,
    double? colorFillSecondary,
    double? colorFillTertiary,
    double? colorFillQuaternary,
    double? colorText,
    double? colorTextSecondary,
    double? colorTextTertiary,
    double? colorTextQuaternary,
    double? colorBorder,
  }) {
    return AntdOpacityDefine(
      colorFill: colorFill ?? this.colorFill,
      colorFillSecondary: colorFillSecondary ?? this.colorFillSecondary,
      colorFillTertiary: colorFillTertiary ?? this.colorFillTertiary,
      colorFillQuaternary: colorFillQuaternary ?? this.colorFillQuaternary,
      colorText: colorText ?? this.colorText,
      colorTextSecondary: colorTextSecondary ?? this.colorTextSecondary,
      colorTextTertiary: colorTextTertiary ?? this.colorTextTertiary,
      colorTextQuaternary: colorTextQuaternary ?? this.colorTextQuaternary,
      colorBorder: colorBorder ?? this.colorBorder,
    );
  }
}

class AntdBaseToken {
  /// 基础组件的圆角大小，例如按钮、输入框、卡片等
  final int radiusSize;

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
  final Color colorTextBase;

  ///基础的背景色,用来派生许多其他的颜色
  final Color colorBgBase;

  ///设计系统中使用最广泛的字体大小，文本梯度也将基于该字号进行派生。
  final double fontSize;

  ///用于控制组件边框、分割线等的样式，默认是实线
  final String lineType;

  ///用于控制组件边框、分割线等的宽度
  final double lineWidth;

  ///用于控制组件尺寸的基础步长，尺寸步长结合尺寸变化单位，
  ///就可以派生各种尺寸梯度。通过调整步长即可得到不同的布局模式，
  ///例如 V5 紧凑模式下的尺寸步长为 2
  final int sizeStep;

  ///用于控制组件尺寸的变化单位，
  ///在 Ant Design 中我们的基础单位为 4 ，便于更加细致地控制尺寸梯度
  final int sizeUnit;

  ///用于派生颜色时使用的透明度，一般不需要动
  final AntdOpacityDefine opacityDefine;

  ///默认的文本样式
  final TextStyle defaultTextStyle;

  const AntdBaseToken(
      {required this.radiusSize,
      required this.colorInfo,
      required this.colorLink,
      required this.colorPrimary,
      required this.colorSuccess,
      required this.colorWarning,
      required this.colorError,
      required this.colorTextBase,
      required this.colorBgBase,
      required this.fontSize,
      required this.lineType,
      required this.lineWidth,
      required this.sizeStep,
      required this.sizeUnit,
      this.opacityDefine = const AntdOpacityDefine(),
      this.defaultTextStyle = const TextStyle()});

  AntdBaseToken copyWith(
      {int? radiusSize,
      Color? colorInfo,
      Color? colorLink,
      Color? colorPrimary,
      Color? colorSuccess,
      Color? colorWarning,
      Color? colorError,
      Color? colorBgBase,
      Color? colorTextBase,
      double? fontSize,
      String? lineType,
      double? lineWidth,
      int? sizeStep,
      int? sizeUnit,
      AntdOpacityDefine? opacityDefine}) {
    return AntdBaseToken(
        radiusSize: radiusSize ?? this.radiusSize,
        colorInfo: colorInfo ?? this.colorInfo,
        colorLink: colorLink ?? this.colorLink,
        colorPrimary: colorPrimary ?? this.colorPrimary,
        colorSuccess: colorSuccess ?? this.colorSuccess,
        colorWarning: colorWarning ?? this.colorWarning,
        colorError: colorError ?? this.colorError,
        colorBgBase: colorBgBase ?? this.colorBgBase,
        colorTextBase: colorTextBase ?? this.colorTextBase,
        fontSize: fontSize ?? this.fontSize,
        lineType: lineType ?? this.lineType,
        lineWidth: lineWidth ?? this.lineWidth,
        sizeStep: sizeStep ?? this.sizeStep,
        sizeUnit: sizeUnit ?? this.sizeUnit,
        opacityDefine: opacityDefine ?? this.opacityDefine);
  }
}

class AntdRadiusDefine {
  final int default_;
  final int lg;
  final int md;
  final int ms;
  final int sm;
  final int xl;
  final int xs;
  final int xxl;
  final int xxs;

  const AntdRadiusDefine({
    required this.default_,
    required this.lg,
    required this.md,
    required this.ms,
    required this.sm,
    required this.xl,
    required this.xs,
    required this.xxl,
    required this.xxs,
  });

  const AntdRadiusDefine.default_({
    required this.default_,
    this.lg = 0,
    this.md = 0,
    this.ms = 0,
    this.sm = 0,
    this.xl = 0,
    this.xs = 0,
    this.xxl = 0,
    this.xxs = 0,
  });

  AntdRadiusDefine copyWith({
    int? default_,
    int? lg,
    int? md,
    int? ms,
    int? sm,
    int? xl,
    int? xs,
    int? xxl,
    int? xxs,
  }) {
    return AntdRadiusDefine(
      default_: default_ ?? this.default_,
      lg: lg ?? this.lg,
      md: md ?? this.md,
      ms: ms ?? this.ms,
      sm: sm ?? this.sm,
      xl: xl ?? this.xl,
      xs: xs ?? this.xs,
      xxl: xxl ?? this.xxl,
      xxs: xxs ?? this.xxs,
    );
  }
}

class AntdSizeDefine {
  /// 默认尺寸: 2 * 4 = 8
  final int default_;

  /// 大尺寸: 2 * (4 + 2) = 12
  final int lg;

  /// 中尺寸: 2 * (4 + 1) = 10
  final int md;

  /// 中等尺寸: 2 * 4 = 8
  final int ms;

  /// 小尺寸: 2 * (4 - 1) = 6
  final int sm;

  /// 超大尺寸: 2 * (4 + 4) = 16
  final int xl;

  /// 超小尺寸: 2 * (4 - 2) = 4
  final int xs;

  /// 特大尺寸: 2 * (4 + 8) = 24
  final int xxl;

  /// 最小尺寸: 2 * (4 - 3) = 2
  final int xxs;

  const AntdSizeDefine({
    required this.default_,
    required this.lg,
    required this.md,
    required this.ms,
    required this.sm,
    required this.xl,
    required this.xs,
    required this.xxl,
    required this.xxs,
  });

  AntdSizeDefine copyWith({
    int? default_,
    int? lg,
    int? md,
    int? ms,
    int? sm,
    int? xl,
    int? xs,
    int? xxl,
    int? xxs,
  }) {
    return AntdSizeDefine(
      default_: default_ ?? this.default_,
      lg: lg ?? this.lg,
      md: md ?? this.md,
      ms: ms ?? this.ms,
      sm: sm ?? this.sm,
      xl: xl ?? this.xl,
      xs: xs ?? this.xs,
      xxl: xxl ?? this.xxl,
      xxs: xxs ?? this.xxs,
    );
  }
}

class AntdFontDefine {
  final TextStyle default_;

  ///18
  final TextStyle xxl;

  ///17
  final TextStyle xl;

  ///16
  final TextStyle lg;

  ///15
  final TextStyle md;

  ///14
  final TextStyle ms;

  ///13
  final TextStyle sm;

  ///12
  final TextStyle xs;

  ///11
  final TextStyle xxs;

  const AntdFontDefine({
    required this.default_,
    required this.lg,
    required this.md,
    required this.ms,
    required this.sm,
    required this.xl,
    required this.xs,
    required this.xxl,
    required this.xxs,
  });

  AntdFontDefine copyWith({
    TextStyle? default_,
    TextStyle? lg,
    TextStyle? md,
    TextStyle? ms,
    TextStyle? sm,
    TextStyle? xl,
    TextStyle? xs,
    TextStyle? xxl,
    TextStyle? xxs,
  }) {
    return AntdFontDefine(
      default_: default_ ?? this.default_,
      lg: lg ?? this.lg,
      md: md ?? this.md,
      ms: ms ?? this.ms,
      sm: sm ?? this.sm,
      xl: xl ?? this.xl,
      xs: xs ?? this.xs,
      xxl: xxl ?? this.xxl,
      xxs: xxs ?? this.xxs,
    );
  }
}

class AntdSeedToken extends AntdBaseToken {
  ///Ant Design 中按钮和输入框等基础控件的高度
  final int controlHeight;

  ///Ant Design 的字体家族中优先使用系统默认的界面字体，
  ///同时提供了一套利于屏显的备用字体库，来维护在不同平台以及浏览器的显示下，
  ///字体始终保持良好的易读性和可读性，体现了友好、稳定和专业的特性。
  final String? fontFamily;

  ///组件箭头的尺寸
  final int sizePopupArrow;

  const AntdSeedToken({
    required super.radiusSize,
    required super.colorInfo,
    required super.colorLink,
    required super.colorPrimary,
    required super.colorSuccess,
    required super.colorWarning,
    required super.colorError,
    required super.colorBgBase,
    required super.colorTextBase,
    required super.fontSize,
    required super.lineType,
    required super.lineWidth,
    required super.sizeStep,
    required super.sizeUnit,
    super.opacityDefine,
    required this.controlHeight,
    this.fontFamily,
    required this.sizePopupArrow,
  });
}

class AntdMapToken extends AntdSeedToken {
  ///最深的文本色。为了符合W3C标准，默认的文本颜色使用了该色，同时这个颜色也是最深的中性色。
  final Color colorText;

  ///控制毛玻璃容器的背景色，通常为透明色。
  final Color colorBgBlur;

  ///组件的容器背景色，例如：默认按钮、输入框等。务必不要将其与 `colorBgElevated` 混淆。
  final Color colorBgContainer;

  ///浮层容器背景色，
  ///在暗色模式下该 token 的色值会比 `colorBgContainer` 要亮一些。
  ///例如：模态框、弹出框、菜单等。
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

  ///实心的背景颜色悬浮态，目前只用在默认实心按钮的 hover 效果。
  final Color colorBgSolidHover;

  ///该色用于引起用户强烈关注注意的背景色，目前只用在 Tooltip 的背景色上。
  final Color colorBgSpotlight;

  ///第四级文本色是最浅的文本色，例如表单的输入提示文本、禁用色文本等。
  final Color colorTextQuaternary;

  ///作为第二梯度的文本色，一般用在不那么需要强化文本颜色的场景，例如 Label 文本、Menu 的文本选中态等场景。
  final Color colorTextSecondary;

  ///	第三级文本色一般用于描述性文本，例如表单的中的补充说明文本、列表的描述性文本等场景。
  final Color colorTextTertiary;

  ///最深的填充色，用于拉开与二、三级填充色的区分度，目前只用在 Slider 的 hover 效果。
  final Color colorFill;

  ///最弱一级的填充色，适用于不易引起注意的色块，例如斑马纹、区分边界的色块等。
  final Color colorFillQuaternary;

  ///二级填充色可以较为明显地勾勒出元素形体，
  ///如 Rate、Skeleton 等。也可以作为三级填充色的 Hover 状态，如 Table 等。
  final Color colorFillSecondary;

  ///三级填充色用于勾勒出元素形体的场景，
  ///如 Slider、Segmented 等。如无强调需求的情况下，建议使用三级填色作为默认填色。
  final Color colorFillTertiary;

  ///默认使用的边框颜色, 用于分割不同的元素，例如：表单的分割线、卡片的分割线等。
  final Color colorBorder;

  BorderSide get borderSide => BorderSide(
      color: colorBorder, width: lineWidth, style: BorderStyle.solid);

  BorderSide get borderBoldSide => BorderSide(
      color: colorBorder, width: lineWidthBold, style: BorderStyle.solid);

  ///比默认使用的边框色要浅一级，此颜色和 colorSplit 的颜色一致。使用的是实色。
  final Color colorBorderSecondary;

  ///	错误色的深色激活态
  final Color colorErrorActive;

  ///	错误色的浅色背景颜色
  final Color colorErrorBg;

  ///	错误色的浅色背景色激活态
  final Color colorErrorBgActive;

  ///错误色的浅色填充背景色悬浮态，目前只用在危险填充按钮的 hover 效果。
  final Color colorErrorBgFilledHover;

  ///错误色的浅色背景色悬浮态
  final Color colorErrorBgHover;

  ///错误色的描边色
  final Color colorErrorBorder;

  ///错误色的描边色悬浮态
  final Color colorErrorBorderHover;

  ///错误色的深色悬浮态
  final Color colorErrorHover;

  ///错误色的文本默认态
  final Color colorErrorText;

  ///错误色的文本激活态
  final Color colorErrorTextActive;

  ///错误色的文本悬浮态
  final Color colorErrorTextHover;

  final Color colorInfoActive;
  final Color colorInfoBg;
  final Color colorInfoBgActive;
  final Color colorInfoBgFilledHover;
  final Color colorInfoBgHover;
  final Color colorInfoBorder;
  final Color colorInfoBorderHover;
  final Color colorInfoHover;
  final Color colorInfoText;
  final Color colorInfoTextActive;
  final Color colorInfoTextHover;

  final Color colorLinkBg;
  final Color colorLinkActive;
  final Color colorLinkHover;
  final Color colorLinkBorder;

  final Color colorPrimaryActive;
  final Color colorPrimaryBg;
  final Color colorPrimaryBgActive;
  final Color colorPrimaryBgFilledHover;
  final Color colorPrimaryBgHover;
  final Color colorPrimaryBorder;
  final Color colorPrimaryBorderHover;
  final Color colorPrimaryHover;
  final Color colorPrimaryText;
  final Color colorPrimaryTextActive;
  final Color colorPrimaryTextHover;

  final Color colorSuccessActive;
  final Color colorSuccessBg;
  final Color colorSuccessBgActive;
  final Color colorSuccessBgFilledHover;
  final Color colorSuccessBgHover;
  final Color colorSuccessBorder;
  final Color colorSuccessBorderHover;
  final Color colorSuccessHover;
  final Color colorSuccessText;
  final Color colorSuccessTextActive;
  final Color colorSuccessTextHover;

  final Color colorWarningActive;
  final Color colorWarningBg;
  final Color colorWarningBgActive;
  final Color colorWarningBgFilledHover;
  final Color colorWarningBgHover;
  final Color colorWarningBorder;
  final Color colorWarningBorderHover;
  final Color colorWarningHover;
  final Color colorWarningText;
  final Color colorWarningTextActive;
  final Color colorWarningTextHover;

  final Color colorWhite;

  final Color colorTransparent;

  final Color colorBlack;

  ///较高的组件高度
  final double controlHeightLG;

  ///较小的组件高度
  final double controlHeightSM;

  ///更小的组件高度
  final double controlHeightXS;

  ///	描边类组件的默认线宽，如 Button、Input、Select 等输入类控件
  final double lineWidthBold;

  ///字体
  final AntdFontDefine font;

  ///大小
  final AntdSizeDefine size;

  ///圆角
  final AntdRadiusDefine radius;

  const AntdMapToken({
    required super.radiusSize,
    required super.colorInfo,
    required super.colorLink,
    required super.colorPrimary,
    required super.colorSuccess,
    required super.colorWarning,
    required super.colorError,
    required super.colorTextBase,
    required this.colorText,
    required super.fontSize,
    required super.lineType,
    required super.lineWidth,
    required super.sizeStep,
    required super.sizeUnit,
    super.opacityDefine,
    required super.colorBgBase,
    required super.controlHeight,
    required super.fontFamily,
    required super.sizePopupArrow,
    required this.colorBgBlur,
    required this.colorBgContainer,
    required this.colorBgElevated,
    required this.colorBgLayout,
    required this.colorBgMask,
    required this.colorBgSolid,
    required this.colorBgSolidActive,
    required this.colorBgSolidHover,
    required this.colorBgSpotlight,
    required this.colorTextQuaternary,
    required this.colorTextSecondary,
    required this.colorTextTertiary,
    required this.colorFill,
    required this.colorFillQuaternary,
    required this.colorFillSecondary,
    required this.colorFillTertiary,
    required this.colorBorder,
    required this.colorBorderSecondary,
    required this.colorErrorActive,
    required this.colorErrorBg,
    required this.colorErrorBgActive,
    required this.colorErrorBgFilledHover,
    required this.colorErrorBgHover,
    required this.colorErrorBorder,
    required this.colorErrorBorderHover,
    required this.colorErrorHover,
    required this.colorErrorText,
    required this.colorErrorTextActive,
    required this.colorErrorTextHover,
    required this.colorInfoActive,
    required this.colorInfoBg,
    required this.colorInfoBgActive,
    required this.colorInfoBgFilledHover,
    required this.colorInfoBgHover,
    required this.colorInfoBorder,
    required this.colorInfoBorderHover,
    required this.colorInfoHover,
    required this.colorInfoText,
    required this.colorInfoTextActive,
    required this.colorInfoTextHover,
    required this.colorLinkBg,
    required this.colorLinkActive,
    required this.colorLinkHover,
    required this.colorLinkBorder,
    required this.colorPrimaryActive,
    required this.colorPrimaryBg,
    required this.colorPrimaryBgActive,
    required this.colorPrimaryBgFilledHover,
    required this.colorPrimaryBgHover,
    required this.colorPrimaryBorder,
    required this.colorPrimaryBorderHover,
    required this.colorPrimaryHover,
    required this.colorPrimaryText,
    required this.colorPrimaryTextActive,
    required this.colorPrimaryTextHover,
    required this.colorSuccessActive,
    required this.colorSuccessBg,
    required this.colorSuccessBgActive,
    required this.colorSuccessBgFilledHover,
    required this.colorSuccessBgHover,
    required this.colorSuccessBorder,
    required this.colorSuccessBorderHover,
    required this.colorSuccessHover,
    required this.colorSuccessText,
    required this.colorSuccessTextActive,
    required this.colorSuccessTextHover,
    required this.colorWarningActive,
    required this.colorWarningBg,
    required this.colorWarningBgActive,
    required this.colorWarningBgFilledHover,
    required this.colorWarningBgHover,
    required this.colorWarningBorder,
    required this.colorWarningBorderHover,
    required this.colorWarningHover,
    required this.colorWarningText,
    required this.colorWarningTextActive,
    required this.colorWarningTextHover,
    required this.colorWhite,
    required this.colorTransparent,
    required this.colorBlack,
    required this.controlHeightLG,
    required this.controlHeightSM,
    required this.controlHeightXS,
    required this.lineWidthBold,
    required this.font,
    required this.size,
    required this.radius,
  });
}

class AntdAliasToken extends AntdMapToken {
  final List<BoxShadow> boxShadow;
  final List<BoxShadow> boxShadowSecondary;
  final List<BoxShadow> boxShadowTertiary;

  ///	控制容器在禁用状态下的背景色。
  final Color colorBgContainerDisabled;

  ///	控制元素背景边框的颜色。
  final Color colorBorderBg;

  ///控制元素替代背景色。
  final Color colorFillAlter;

  ///控制内容区域的背景色。
  final Color colorFillContent;

  ///控制内容区域背景色在鼠标悬停时的样式。
  final Color colorFillContentHover;

  ///控制页面元素高亮时的颜色。
  final Color colorHighlight;

  ///控制弱操作图标的颜色，例如 allowClear 或 Alert 关闭按钮。 *
  final Color colorIcon;

  ///控制弱操作图标在悬浮状态下的颜色，例如 allowClear 或 Alert 关闭按钮。
  final Color colorIconHover;

  ///用于作为分割线的颜色，此颜色和 colorBorderSecondary 的颜色一致，但是用的是透明色。
  final Color colorSplit;

  ///控制文本描述字体颜色。
  final Color colorTextDescription;

  ///	控制禁用状态下的字体颜色。
  final Color colorTextDisabled;

  ///控制标题字体颜色。
  final Color colorTextHeading;

  ///控制文本标签字体颜色。
  final Color colorTextLabel;

  ///控制带背景色的文本，例如 Primary Button 组件中的文本高亮颜色。
  final Color colorTextLightSolid;

  ///控制占位文本的颜色。
  final Color colorTextPlaceholder;

  ///控制文本在激活状态下的背景色。
  final Color colorBgTextActive;

  ///控制文本在悬停状态下的背景色。
  final Color colorBgTextHover;

  ///控制输入组件警告状态下的外轮廓线颜色。
  final Color colorWarningOutline;

  ///控制输入组件错误状态下的外轮廓线颜色。
  final Color colorErrorOutline;

  ///	控制组件的交互大小。
  final double controlInteractiveSize;

  ///控制组件项在激活状态下的背景颜色。
  final Color controlItemBgActive;

  ///控制组件项在禁用状态下的激活背景颜色。
  final Color controlItemBgActiveDisabled;

  ///	控制组件项在鼠标悬浮且激活状态下的背景颜色
  final Color controlItemBgActiveHover;

  ///	控制组件项在鼠标悬浮时的背景颜色。
  final Color controlItemBgHover;

  ///控制输入组件的外轮廓线颜色。
  final Color controlOutline;

  ///	控制输入组件的外轮廓线宽度。
  final double controlOutlineWidth;

  ///	控制元素水平内间距。
  final double controlPaddingHorizontal;

  ///控制元素中小尺寸水平内间距。
  final double controlPaddingHorizontalSM;

  ///控制选择器、级联选择器等中的操作图标字体大小。正常情况下与 fontSizeSM 相同。
  final double fontSizeIcon;

  ///控制标题类组件（如 h1、h2、h3）或选中项的字体粗细。
  final FontWeight fontWeightStrong;

  ///控制线条的宽度，当组件处于聚焦态时。
  final double lineWidthFocus;

  ///控制加载状态的透明度。
  final double opacityLoading;

  const AntdAliasToken({
    required super.radiusSize,
    required super.colorInfo,
    required super.colorLink,
    required super.colorPrimary,
    required super.colorSuccess,
    required super.colorWarning,
    required super.colorError,
    required super.colorTextBase,
    required super.fontSize,
    required super.lineType,
    required super.lineWidth,
    required super.sizeStep,
    required super.sizeUnit,
    super.opacityDefine,
    required super.colorBgBase,
    required super.controlHeight,
    super.fontFamily,
    required super.sizePopupArrow,
    required super.colorBgBlur,
    required super.colorBgContainer,
    required super.colorBgElevated,
    required super.colorBgLayout,
    required super.colorBgMask,
    required super.colorBgSolid,
    required super.colorBgSolidActive,
    required super.colorBgSolidHover,
    required super.colorBgSpotlight,
    required super.colorText,
    required super.colorTextQuaternary,
    required super.colorTextSecondary,
    required super.colorTextTertiary,
    required super.colorFill,
    required super.colorFillQuaternary,
    required super.colorFillSecondary,
    required super.colorFillTertiary,
    required super.colorBorder,
    required super.colorBorderSecondary,
    required super.colorErrorActive,
    required super.colorErrorBg,
    required super.colorErrorBgActive,
    required super.colorErrorBgFilledHover,
    required super.colorErrorBgHover,
    required super.colorErrorBorder,
    required super.colorErrorBorderHover,
    required super.colorErrorHover,
    required super.colorErrorText,
    required super.colorErrorTextActive,
    required super.colorErrorTextHover,
    required super.colorInfoActive,
    required super.colorInfoBg,
    required super.colorInfoBgActive,
    required super.colorInfoBgFilledHover,
    required super.colorInfoBgHover,
    required super.colorInfoBorder,
    required super.colorInfoBorderHover,
    required super.colorInfoHover,
    required super.colorInfoText,
    required super.colorInfoTextActive,
    required super.colorInfoTextHover,
    required super.colorLinkBg,
    required super.colorLinkActive,
    required super.colorLinkHover,
    required super.colorLinkBorder,
    required super.colorPrimaryActive,
    required super.colorPrimaryBg,
    required super.colorPrimaryBgActive,
    required super.colorPrimaryBgFilledHover,
    required super.colorPrimaryBgHover,
    required super.colorPrimaryBorder,
    required super.colorPrimaryBorderHover,
    required super.colorPrimaryHover,
    required super.colorPrimaryText,
    required super.colorPrimaryTextActive,
    required super.colorPrimaryTextHover,
    required super.colorSuccessActive,
    required super.colorSuccessBg,
    required super.colorSuccessBgActive,
    required super.colorSuccessBgFilledHover,
    required super.colorSuccessBgHover,
    required super.colorSuccessBorder,
    required super.colorSuccessBorderHover,
    required super.colorSuccessHover,
    required super.colorSuccessText,
    required super.colorSuccessTextActive,
    required super.colorSuccessTextHover,
    required super.colorWarningActive,
    required super.colorWarningBg,
    required super.colorWarningBgActive,
    required super.colorWarningBgFilledHover,
    required super.colorWarningBgHover,
    required super.colorWarningBorder,
    required super.colorWarningBorderHover,
    required super.colorWarningHover,
    required super.colorWarningText,
    required super.colorWarningTextActive,
    required super.colorWarningTextHover,
    required super.controlHeightLG,
    required super.controlHeightSM,
    required super.controlHeightXS,
    required super.lineWidthBold,
    required super.font,
    required super.size,
    required super.radius,
    required this.boxShadow,
    required this.boxShadowSecondary,
    required this.boxShadowTertiary,
    required this.colorBgContainerDisabled,
    required this.colorBorderBg,
    required this.colorFillAlter,
    required this.colorFillContent,
    required this.colorFillContentHover,
    required this.colorHighlight,
    required this.colorIcon,
    required this.colorIconHover,
    required this.colorSplit,
    required this.colorTextDescription,
    required this.colorTextDisabled,
    required this.colorTextHeading,
    required this.colorTextLabel,
    required this.colorTextLightSolid,
    required this.colorTextPlaceholder,
    required this.colorBgTextActive,
    required this.colorBgTextHover,
    required this.colorWarningOutline,
    required this.colorErrorOutline,
    required this.controlInteractiveSize,
    required this.controlItemBgActive,
    required this.controlItemBgActiveDisabled,
    required this.controlItemBgActiveHover,
    required this.controlItemBgHover,
    required this.controlOutline,
    required this.controlOutlineWidth,
    required this.controlPaddingHorizontal,
    required this.controlPaddingHorizontalSM,
    required this.fontSizeIcon,
    required this.fontWeightStrong,
    required this.lineWidthFocus,
    required this.opacityLoading,
    super.colorWhite = const Color(0xffffffff),
    super.colorTransparent = const Color(0x00000000),
    super.colorBlack = const Color(0xff000000),
  });

  @override
  AntdAliasToken copyWith({
    int? radiusSize,
    Color? colorInfo,
    Color? colorLink,
    Color? colorPrimary,
    Color? colorSuccess,
    Color? colorWarning,
    Color? colorError,
    Color? colorTextBase,
    double? fontSize,
    String? lineType,
    double? lineWidth,
    int? sizeStep,
    int? sizeUnit,
    AntdOpacityDefine? opacityDefine,
    Color? colorBgBase,
    int? controlHeight,
    String? fontFamily,
    int? sizePopupArrow,
    Color? colorBgBlur,
    Color? colorBgContainer,
    Color? colorBgElevated,
    Color? colorBgLayout,
    Color? colorBgMask,
    Color? colorBgSolid,
    Color? colorBgSolidActive,
    Color? colorBgSolidHover,
    Color? colorBgSpotlight,
    Color? colorText,
    Color? colorTextQuaternary,
    Color? colorTextSecondary,
    Color? colorTextTertiary,
    Color? colorFill,
    Color? colorFillQuaternary,
    Color? colorFillSecondary,
    Color? colorFillTertiary,
    Color? colorBorder,
    Color? colorBorderSecondary,
    Color? colorErrorActive,
    Color? colorErrorBg,
    Color? colorErrorBgActive,
    Color? colorErrorBgFilledHover,
    Color? colorErrorBgHover,
    Color? colorErrorBorder,
    Color? colorErrorBorderHover,
    Color? colorErrorHover,
    Color? colorErrorText,
    Color? colorErrorTextActive,
    Color? colorErrorTextHover,
    Color? colorInfoActive,
    Color? colorInfoBg,
    Color? colorInfoBgActive,
    Color? colorInfoBgFilledHover,
    Color? colorInfoBgHover,
    Color? colorInfoBorder,
    Color? colorInfoBorderHover,
    Color? colorInfoHover,
    Color? colorInfoText,
    Color? colorInfoTextActive,
    Color? colorInfoTextHover,
    Color? colorLinkBg,
    Color? colorLinkActive,
    Color? colorLinkHover,
    Color? colorLinkBorder,
    Color? colorPrimaryActive,
    Color? colorPrimaryBg,
    Color? colorPrimaryBgActive,
    Color? colorPrimaryBgFilledHover,
    Color? colorPrimaryBgHover,
    Color? colorPrimaryBorder,
    Color? colorPrimaryBorderHover,
    Color? colorPrimaryHover,
    Color? colorPrimaryText,
    Color? colorPrimaryTextActive,
    Color? colorPrimaryTextHover,
    Color? colorSuccessActive,
    Color? colorSuccessBg,
    Color? colorSuccessBgActive,
    Color? colorSuccessBgFilledHover,
    Color? colorSuccessBgHover,
    Color? colorSuccessBorder,
    Color? colorSuccessBorderHover,
    Color? colorSuccessHover,
    Color? colorSuccessText,
    Color? colorSuccessTextActive,
    Color? colorSuccessTextHover,
    Color? colorWarningActive,
    Color? colorWarningBg,
    Color? colorWarningBgActive,
    Color? colorWarningBgFilledHover,
    Color? colorWarningBgHover,
    Color? colorWarningBorder,
    Color? colorWarningBorderHover,
    Color? colorWarningHover,
    Color? colorWarningText,
    Color? colorWarningTextActive,
    Color? colorWarningTextHover,
    Color? colorWhite,
    Color? colorTransparent,
    Color? colorBlack,
    double? controlHeightLG,
    double? controlHeightSM,
    double? controlHeightXS,
    double? lineWidthBold,
    AntdFontDefine? font,
    AntdSizeDefine? size,
    AntdRadiusDefine? radius,
    List<BoxShadow>? boxShadow,
    List<BoxShadow>? boxShadowSecondary,
    List<BoxShadow>? boxShadowTertiary,
    Color? colorBgContainerDisabled,
    Color? colorBorderBg,
    Color? colorFillAlter,
    Color? colorFillContent,
    Color? colorFillContentHover,
    Color? colorHighlight,
    Color? colorIcon,
    Color? colorIconHover,
    Color? colorSplit,
    Color? colorTextDescription,
    Color? colorTextDisabled,
    Color? colorTextHeading,
    Color? colorTextLabel,
    Color? colorTextLightSolid,
    Color? colorTextPlaceholder,
    Color? colorBgTextActive,
    Color? colorBgTextHover,
    Color? colorWarningOutline,
    Color? colorErrorOutline,
    double? controlInteractiveSize,
    Color? controlItemBgActive,
    Color? controlItemBgActiveDisabled,
    Color? controlItemBgActiveHover,
    Color? controlItemBgHover,
    Color? controlOutline,
    double? controlOutlineWidth,
    double? controlPaddingHorizontal,
    double? controlPaddingHorizontalSM,
    double? fontSizeIcon,
    FontWeight? fontWeightStrong,
    double? lineWidthFocus,
    double? opacityLoading,
  }) {
    return AntdAliasToken(
      radiusSize: radiusSize ?? this.radiusSize,
      colorInfo: colorInfo ?? this.colorInfo,
      colorLink: colorLink ?? this.colorLink,
      colorPrimary: colorPrimary ?? this.colorPrimary,
      colorSuccess: colorSuccess ?? this.colorSuccess,
      colorWarning: colorWarning ?? this.colorWarning,
      colorError: colorError ?? this.colorError,
      colorTextBase: colorTextBase ?? this.colorTextBase,
      fontSize: fontSize ?? this.fontSize,
      lineType: lineType ?? this.lineType,
      lineWidth: lineWidth ?? this.lineWidth,
      sizeStep: sizeStep ?? this.sizeStep,
      sizeUnit: sizeUnit ?? this.sizeUnit,
      opacityDefine: opacityDefine ?? this.opacityDefine,
      colorBgBase: colorBgBase ?? this.colorBgBase,
      controlHeight: controlHeight ?? this.controlHeight,
      fontFamily: fontFamily ?? this.fontFamily,
      sizePopupArrow: sizePopupArrow ?? this.sizePopupArrow,
      colorBgBlur: colorBgBlur ?? this.colorBgBlur,
      colorBgContainer: colorBgContainer ?? this.colorBgContainer,
      colorBgElevated: colorBgElevated ?? this.colorBgElevated,
      colorBgLayout: colorBgLayout ?? this.colorBgLayout,
      colorBgMask: colorBgMask ?? this.colorBgMask,
      colorBgSolid: colorBgSolid ?? this.colorBgSolid,
      colorBgSolidActive: colorBgSolidActive ?? this.colorBgSolidActive,
      colorBgSolidHover: colorBgSolidHover ?? this.colorBgSolidHover,
      colorBgSpotlight: colorBgSpotlight ?? this.colorBgSpotlight,
      colorText: colorText ?? this.colorText,
      colorTextQuaternary: colorTextQuaternary ?? this.colorTextQuaternary,
      colorTextSecondary: colorTextSecondary ?? this.colorTextSecondary,
      colorTextTertiary: colorTextTertiary ?? this.colorTextTertiary,
      colorFill: colorFill ?? this.colorFill,
      colorFillQuaternary: colorFillQuaternary ?? this.colorFillQuaternary,
      colorFillSecondary: colorFillSecondary ?? this.colorFillSecondary,
      colorFillTertiary: colorFillTertiary ?? this.colorFillTertiary,
      colorBorder: colorBorder ?? this.colorBorder,
      colorBorderSecondary: colorBorderSecondary ?? this.colorBorderSecondary,
      colorErrorActive: colorErrorActive ?? this.colorErrorActive,
      colorErrorBg: colorErrorBg ?? this.colorErrorBg,
      colorErrorBgActive: colorErrorBgActive ?? this.colorErrorBgActive,
      colorErrorBgFilledHover:
          colorErrorBgFilledHover ?? this.colorErrorBgFilledHover,
      colorErrorBgHover: colorErrorBgHover ?? this.colorErrorBgHover,
      colorErrorBorder: colorErrorBorder ?? this.colorErrorBorder,
      colorErrorBorderHover:
          colorErrorBorderHover ?? this.colorErrorBorderHover,
      colorErrorHover: colorErrorHover ?? this.colorErrorHover,
      colorErrorText: colorErrorText ?? this.colorErrorText,
      colorErrorTextActive: colorErrorTextActive ?? this.colorErrorTextActive,
      colorErrorTextHover: colorErrorTextHover ?? this.colorErrorTextHover,
      colorInfoActive: colorInfoActive ?? this.colorInfoActive,
      colorInfoBg: colorInfoBg ?? this.colorInfoBg,
      colorInfoBgActive: colorInfoBgActive ?? this.colorInfoBgActive,
      colorInfoBgFilledHover:
          colorInfoBgFilledHover ?? this.colorInfoBgFilledHover,
      colorInfoBgHover: colorInfoBgHover ?? this.colorInfoBgHover,
      colorInfoBorder: colorInfoBorder ?? this.colorInfoBorder,
      colorInfoBorderHover: colorInfoBorderHover ?? this.colorInfoBorderHover,
      colorInfoHover: colorInfoHover ?? this.colorInfoHover,
      colorInfoText: colorInfoText ?? this.colorInfoText,
      colorInfoTextActive: colorInfoTextActive ?? this.colorInfoTextActive,
      colorInfoTextHover: colorInfoTextHover ?? this.colorInfoTextHover,
      colorLinkBg: colorLinkBg ?? this.colorLinkBg,
      colorLinkActive: colorLinkActive ?? this.colorLinkActive,
      colorLinkHover: colorLinkHover ?? this.colorLinkHover,
      colorLinkBorder: colorLinkBorder ?? this.colorLinkBorder,
      colorPrimaryActive: colorPrimaryActive ?? this.colorPrimaryActive,
      colorPrimaryBg: colorPrimaryBg ?? this.colorPrimaryBg,
      colorPrimaryBgActive: colorPrimaryBgActive ?? this.colorPrimaryBgActive,
      colorPrimaryBgFilledHover:
          colorPrimaryBgFilledHover ?? this.colorPrimaryBgFilledHover,
      colorPrimaryBgHover: colorPrimaryBgHover ?? this.colorPrimaryBgHover,
      colorPrimaryBorder: colorPrimaryBorder ?? this.colorPrimaryBorder,
      colorPrimaryBorderHover:
          colorPrimaryBorderHover ?? this.colorPrimaryBorderHover,
      colorPrimaryHover: colorPrimaryHover ?? this.colorPrimaryHover,
      colorPrimaryText: colorPrimaryText ?? this.colorPrimaryText,
      colorPrimaryTextActive:
          colorPrimaryTextActive ?? this.colorPrimaryTextActive,
      colorPrimaryTextHover:
          colorPrimaryTextHover ?? this.colorPrimaryTextHover,
      colorSuccessActive: colorSuccessActive ?? this.colorSuccessActive,
      colorSuccessBg: colorSuccessBg ?? this.colorSuccessBg,
      colorSuccessBgActive: colorSuccessBgActive ?? this.colorSuccessBgActive,
      colorSuccessBgFilledHover:
          colorSuccessBgFilledHover ?? this.colorSuccessBgFilledHover,
      colorSuccessBgHover: colorSuccessBgHover ?? this.colorSuccessBgHover,
      colorSuccessBorder: colorSuccessBorder ?? this.colorSuccessBorder,
      colorSuccessBorderHover:
          colorSuccessBorderHover ?? this.colorSuccessBorderHover,
      colorSuccessHover: colorSuccessHover ?? this.colorSuccessHover,
      colorSuccessText: colorSuccessText ?? this.colorSuccessText,
      colorSuccessTextActive:
          colorSuccessTextActive ?? this.colorSuccessTextActive,
      colorSuccessTextHover:
          colorSuccessTextHover ?? this.colorSuccessTextHover,
      colorWarningActive: colorWarningActive ?? this.colorWarningActive,
      colorWarningBg: colorWarningBg ?? this.colorWarningBg,
      colorWarningBgActive: colorWarningBgActive ?? this.colorWarningBgActive,
      colorWarningBgFilledHover:
          colorWarningBgFilledHover ?? this.colorWarningBgFilledHover,
      colorWarningBgHover: colorWarningBgHover ?? this.colorWarningBgHover,
      colorWarningBorder: colorWarningBorder ?? this.colorWarningBorder,
      colorWarningBorderHover:
          colorWarningBorderHover ?? this.colorWarningBorderHover,
      colorWarningHover: colorWarningHover ?? this.colorWarningHover,
      colorWarningText: colorWarningText ?? this.colorWarningText,
      colorWarningTextActive:
          colorWarningTextActive ?? this.colorWarningTextActive,
      colorWarningTextHover:
          colorWarningTextHover ?? this.colorWarningTextHover,
      controlHeightLG: controlHeightLG ?? this.controlHeightLG,
      controlHeightSM: controlHeightSM ?? this.controlHeightSM,
      controlHeightXS: controlHeightXS ?? this.controlHeightXS,
      lineWidthBold: lineWidthBold ?? this.lineWidthBold,
      font: font ?? this.font,
      size: size ?? this.size,
      radius: radius ?? this.radius,
      boxShadow: boxShadow ?? this.boxShadow,
      boxShadowSecondary: boxShadowSecondary ?? this.boxShadowSecondary,
      boxShadowTertiary: boxShadowTertiary ?? this.boxShadowTertiary,
      colorBgContainerDisabled:
          colorBgContainerDisabled ?? this.colorBgContainerDisabled,
      colorBorderBg: colorBorderBg ?? this.colorBorderBg,
      colorFillAlter: colorFillAlter ?? this.colorFillAlter,
      colorFillContent: colorFillContent ?? this.colorFillContent,
      colorFillContentHover:
          colorFillContentHover ?? this.colorFillContentHover,
      colorHighlight: colorHighlight ?? this.colorHighlight,
      colorIcon: colorIcon ?? this.colorIcon,
      colorIconHover: colorIconHover ?? this.colorIconHover,
      colorSplit: colorSplit ?? this.colorSplit,
      colorTextDescription: colorTextDescription ?? this.colorTextDescription,
      colorTextDisabled: colorTextDisabled ?? this.colorTextDisabled,
      colorTextHeading: colorTextHeading ?? this.colorTextHeading,
      colorTextLabel: colorTextLabel ?? this.colorTextLabel,
      colorTextLightSolid: colorTextLightSolid ?? this.colorTextLightSolid,
      colorTextPlaceholder: colorTextPlaceholder ?? this.colorTextPlaceholder,
      colorBgTextActive: colorBgTextActive ?? this.colorBgTextActive,
      colorBgTextHover: colorBgTextHover ?? this.colorBgTextHover,
      colorWarningOutline: colorWarningOutline ?? this.colorWarningOutline,
      colorErrorOutline: colorErrorOutline ?? this.colorErrorOutline,
      controlInteractiveSize:
          controlInteractiveSize ?? this.controlInteractiveSize,
      controlItemBgActive: controlItemBgActive ?? this.controlItemBgActive,
      controlItemBgActiveDisabled:
          controlItemBgActiveDisabled ?? this.controlItemBgActiveDisabled,
      controlItemBgActiveHover:
          controlItemBgActiveHover ?? this.controlItemBgActiveHover,
      controlItemBgHover: controlItemBgHover ?? this.controlItemBgHover,
      controlOutline: controlOutline ?? this.controlOutline,
      controlOutlineWidth: controlOutlineWidth ?? this.controlOutlineWidth,
      controlPaddingHorizontal:
          controlPaddingHorizontal ?? this.controlPaddingHorizontal,
      controlPaddingHorizontalSM:
          controlPaddingHorizontalSM ?? this.controlPaddingHorizontalSM,
      fontSizeIcon: fontSizeIcon ?? this.fontSizeIcon,
      fontWeightStrong: fontWeightStrong ?? this.fontWeightStrong,
      lineWidthFocus: lineWidthFocus ?? this.lineWidthFocus,
      opacityLoading: opacityLoading ?? this.opacityLoading,
    );
  }
}

List<TextStyle> getFontSizes(
    double base, Color textColor, TextStyle textStyle) {
  var fontSizes = List.generate(10, (index) {
    if (index < 5) {
      return base - (5 - index);
    }
    if (index == 5) {
      return base;
    }
    return base + (index - 5);
  }).toList();

  return fontSizes.map((value) {
    return textStyle.merge(TextStyle(fontSize: value, color: textColor));
  }).toList();
}

AntdAliasToken generateToken(AntdBaseToken token) {
  var primaryColors = token.colorPrimary.generate();
  var colorPrimaryBg = primaryColors[1]!;
  var colorPrimaryBgHover = primaryColors[2]!;
  var successColors = token.colorSuccess.generate();
  var errorColors = token.colorError.generate();
  var colorErrorBg = errorColors[1]!;
  var warningColors = token.colorWarning.generate();
  var colorWarningBg = warningColors[1]!;
  var infoColors = token.colorInfo.generate();
  var linkColors = token.colorLink.generate();
  var colorBgBase = token.colorBgBase;
  var controlHeight = 32;
  var colorBgContainer = colorBgBase.darken(0);
  var colorBorderSecondary = colorBgBase.darken(6);
  var colorTextBase = token.colorTextBase;
  var colorFill = colorTextBase.withDoubleAlpha(token.opacityDefine.colorFill);
  var colorFillSecondary =
      colorTextBase.withDoubleAlpha(token.opacityDefine.colorFillSecondary);
  var colorFillTertiary =
      colorTextBase.withDoubleAlpha(token.opacityDefine.colorFillTertiary);
  var colorFillQuaternary =
      colorTextBase.withDoubleAlpha(token.opacityDefine.colorFillQuaternary);

  var colorText = colorTextBase.withDoubleAlpha(token.opacityDefine.colorText);
  var fontSizePairs =
      getFontSizes(token.fontSize, colorText, token.defaultTextStyle);

  var colorTextSecondary =
      colorTextBase.withDoubleAlpha(token.opacityDefine.colorTextSecondary);
  var colorTextTertiary =
      colorTextBase.withDoubleAlpha(token.opacityDefine.colorTextTertiary);
  var colorTextQuaternary =
      colorTextBase.withDoubleAlpha(token.opacityDefine.colorTextQuaternary);
  var lineWidthBold = token.lineWidth * 2;

  return AntdAliasToken(
    radiusSize: token.radiusSize,
    colorInfo: token.colorInfo,
    colorLink: token.colorLink,
    colorPrimary: token.colorPrimary,
    colorSuccess: token.colorSuccess,
    colorWarning: token.colorWarning,
    colorError: token.colorError,
    colorTextBase: colorTextBase,
    fontSize: token.fontSize,
    lineType: token.lineType,
    lineWidth: token.lineWidth,
    sizeStep: token.sizeStep,
    sizeUnit: token.sizeUnit,
    colorBgBase: colorBgBase,
    controlHeight: controlHeight,
    sizePopupArrow: 16,
    colorBgBlur: const Color(0x00000000),
    colorBgContainer: colorBgContainer,
    colorBgElevated: colorBgBase.darken(0),
    colorBgLayout: colorBgBase.darken(4),
    colorBgMask: const Color(0x00000000).withDoubleAlpha(0.45),
    colorBgSolid: colorTextBase.withDoubleAlpha(1),
    colorBgSolidActive: colorTextBase.withDoubleAlpha(0.95),
    colorBgSolidHover: colorTextBase.withDoubleAlpha(0.75),
    colorBgSpotlight: colorTextBase.withDoubleAlpha(0.85),
    colorText: colorText,
    colorTextQuaternary: colorTextQuaternary,
    colorTextSecondary: colorTextSecondary,
    colorTextTertiary: colorTextTertiary,
    colorFill: colorFill,
    colorFillQuaternary: colorFillQuaternary,
    colorFillSecondary: colorFillSecondary,
    colorFillTertiary: colorFillTertiary,
    colorBorder: colorTextBase.withDoubleAlpha(token.opacityDefine.colorBorder),
    colorBorderSecondary: colorBorderSecondary,
    colorErrorActive: errorColors[7]!,
    colorErrorBg: colorErrorBg,
    colorErrorBgActive: errorColors[3]!,
    colorErrorBgFilledHover: Color.lerp(errorColors[1]!, errorColors[3]!, 0.5)!,
    colorErrorBgHover: errorColors[2]!,
    colorErrorBorder: errorColors[3]!,
    colorErrorBorderHover: errorColors[4]!,
    colorErrorHover: errorColors[5]!,
    colorErrorText: errorColors[9]!,
    colorErrorTextActive: errorColors[10]!,
    colorErrorTextHover: errorColors[8]!,
    colorInfoActive: infoColors[7]!,
    colorInfoBg: infoColors[1]!,
    colorInfoBgActive: infoColors[3]!,
    colorInfoBgFilledHover: Color.lerp(infoColors[1]!, infoColors[3]!, 0.5)!,
    colorInfoBgHover: infoColors[2]!,
    colorInfoBorder: infoColors[3]!,
    colorInfoBorderHover: infoColors[4]!,
    colorInfoHover: infoColors[5]!,
    colorInfoText: infoColors[9]!,
    colorInfoTextActive: infoColors[10]!,
    colorInfoTextHover: infoColors[8]!,
    colorLinkBg: linkColors[1]!,
    colorLinkActive: linkColors[7]!,
    colorLinkHover: linkColors[4]!,
    colorLinkBorder: linkColors[3]!,
    colorPrimaryActive: primaryColors[7]!,
    colorPrimaryBg: colorPrimaryBg,
    colorPrimaryBgActive: primaryColors[3]!,
    colorPrimaryBgFilledHover:
        Color.lerp(primaryColors[1]!, primaryColors[3]!, 0.5)!,
    colorPrimaryBgHover: colorPrimaryBgHover,
    colorPrimaryBorder: primaryColors[3]!,
    colorPrimaryBorderHover: primaryColors[4]!,
    colorPrimaryHover: primaryColors[5]!,
    colorPrimaryText: primaryColors[9]!,
    colorPrimaryTextActive: primaryColors[10]!,
    colorPrimaryTextHover: primaryColors[8]!,
    colorSuccessActive: successColors[7]!,
    colorSuccessBg: successColors[1]!,
    colorSuccessBgActive: successColors[3]!,
    colorSuccessBgFilledHover:
        Color.lerp(successColors[1]!, successColors[3]!, 0.5)!,
    colorSuccessBgHover: successColors[2]!,
    colorSuccessBorder: successColors[3]!,
    colorSuccessBorderHover: successColors[4]!,
    colorSuccessHover: successColors[5]!,
    colorSuccessText: successColors[9]!,
    colorSuccessTextActive: successColors[10]!,
    colorSuccessTextHover: successColors[8]!,
    colorWarningActive: warningColors[7]!,
    colorWarningBg: warningColors[1]!,
    colorWarningBgActive: warningColors[3]!,
    colorWarningBgFilledHover:
        Color.lerp(warningColors[1]!, warningColors[3]!, 0.5)!,
    colorWarningBgHover: warningColors[2]!,
    colorWarningBorder: warningColors[3]!,
    colorWarningBorderHover: warningColors[4]!,
    colorWarningHover: warningColors[5]!,
    colorWarningText: warningColors[9]!,
    colorWarningTextActive: warningColors[10]!,
    colorWarningTextHover: warningColors[8]!,
    controlHeightLG: controlHeight * 1.25,
    controlHeightSM: controlHeight * 0.75,
    controlHeightXS: controlHeight * 0.5,
    lineWidthBold: lineWidthBold,
    font: AntdFontDefine(
      xxs: fontSizePairs[2],
      xs: fontSizePairs[3],
      sm: fontSizePairs[4],
      ms: fontSizePairs[5],
      default_: fontSizePairs[5],
      md: fontSizePairs[6],
      lg: fontSizePairs[7],
      xl: fontSizePairs[8],
      xxl: fontSizePairs[9],
    ),
    size: AntdSizeDefine(
      default_: token.sizeUnit * token.sizeStep,
      lg: token.sizeUnit * (token.sizeStep + 2),
      md: token.sizeUnit * (token.sizeStep + 1),
      ms: token.sizeUnit * token.sizeStep,
      sm: token.sizeUnit * (token.sizeStep - 1),
      xl: token.sizeUnit * (token.sizeStep + 4),
      xs: token.sizeUnit * (token.sizeStep - 2),
      xxl: token.sizeUnit * (token.sizeStep + 8),
      xxs: token.sizeUnit * (token.sizeStep - 3),
    ),
    radius: AntdRadiusDefine(
      // 基础圆角（默认值）
      default_: token.radiusSize,

      // 微小圆角（用于紧凑场景）
      xxs: token.radiusSize * 3,
      xs: token.radiusSize * 2,

      // 常规小圆角
      sm: token.radiusSize * 1,

      // 中等圆角（默认相近尺寸）
      ms: token.radiusSize,
      md: token.radiusSize * 1,

      // 大圆角
      lg: token.radiusSize * 2,
      xl: token.radiusSize * 4,

      // 装饰性大圆角
      xxl: token.radiusSize * 8,
    ),
    boxShadow: [
      const BoxShadow(
        offset: Offset(0, 6), // 阴影偏移量 (x, y)
        blurRadius: 16, // 模糊半径
        spreadRadius: 0, // 扩展半径
        color: Color(0x14000000), // 阴影颜色 (rgba(0, 0, 0, 0.08))
      ),
      // 第二个阴影
      const BoxShadow(
        offset: Offset(0, 3),
        blurRadius: 6,
        spreadRadius: -4, // 负值表示阴影向内收缩
        color: Color(0x1E000000), // rgba(0, 0, 0, 0.12)
      ),
      // 第三个阴影
      const BoxShadow(
        offset: Offset(0, 9),
        blurRadius: 28,
        spreadRadius: 8,
        color: Color(0x0E000000), // rgba(0, 0, 0, 0.05)
      ),
    ],
    boxShadowSecondary: [
      const BoxShadow(
        offset: Offset(0, 6),
        // 阴影偏移量 (x, y)
        blurRadius: 16,
        // 模糊半径
        spreadRadius: 0,
        // 扩展半径
        blurStyle: BlurStyle.outer,
        color: Color(0x14000000), // 阴影颜色 (rgba(0, 0, 0, 0.08))
      ),
      const BoxShadow(
        offset: Offset(0, 3),
        blurRadius: 6,
        spreadRadius: -4,
        // 负值表示阴影向内收缩
        blurStyle: BlurStyle.outer,
        color: Color(0x1E000000), // rgba(0, 0, 0, 0.12)
      ),
      const BoxShadow(
        offset: Offset(0, 9),
        blurRadius: 28,
        spreadRadius: 8,
        blurStyle: BlurStyle.outer,
        color: Color(0x0E000000), // rgba(0, 0, 0, 0.05)
      ),
    ],
    boxShadowTertiary: [
      const BoxShadow(
        offset: Offset(0, 1), // 阴影偏移量 (x, y)
        blurRadius: 2, // 模糊半径
        spreadRadius: 0, // 扩展

        color: Color(0x08000000), // 阴影颜色 (rgba(0, 0, 0, 0.03))
      ),
      const BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 6,
        spreadRadius: -1, // 负值表示阴影向内收缩
        color: Color(0x05000000), // rgba(0, 0, 0, 0.02)
      ),
      const BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        spreadRadius: 0,
        color: Color(0x05000000), // rgba(0, 0, 0, 0.02)
      ),
    ],
    colorBgContainerDisabled: colorFillTertiary,
    colorBorderBg: colorBgContainer,
    colorFillAlter: colorFillQuaternary,
    colorFillContent: colorFillSecondary,
    colorFillContentHover: colorFill,
    colorHighlight: token.colorError,
    colorIcon: colorTextTertiary,
    colorIconHover: colorTextBase,
    colorSplit: colorBorderSecondary.getAlphaColor(colorBgContainer),
    colorTextDescription: colorTextTertiary,
    colorTextDisabled: colorTextQuaternary,
    colorTextHeading: colorText,
    colorTextLabel: colorTextSecondary,
    colorTextLightSolid: const Color(0xffffffff),
    colorTextPlaceholder: colorTextQuaternary,
    colorBgTextActive: colorFill,
    colorBgTextHover: colorFillSecondary,
    colorWarningOutline: colorWarningBg.getAlphaColor(colorBgContainer),
    colorErrorOutline: colorErrorBg.getAlphaColor(colorBgContainer),
    controlInteractiveSize: controlHeight / 2,
    controlItemBgActive: colorPrimaryBg,
    controlItemBgActiveDisabled: colorFill,
    controlItemBgActiveHover: colorPrimaryBgHover,
    controlItemBgHover: colorFillTertiary,
    controlOutline: colorPrimaryBg.getAlphaColor(colorBgContainer),
    controlOutlineWidth: token.lineWidth,
    controlPaddingHorizontal: 12,
    controlPaddingHorizontalSM: 8,
    fontSizeIcon: token.fontSize,
    fontWeightStrong: FontWeight.w700,
    lineWidthFocus: token.lineWidth,
    opacityLoading: 0.65,
  );
}
