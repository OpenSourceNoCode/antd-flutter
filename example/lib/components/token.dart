// import 'package:antd_flutter_mobile/components/widgets/box/index.dart';import 'package:antd_flutter_mobile/components/widgets/box/style.dart';
// import 'package:antd_flutter_mobile/index.dart';
// import 'package:example/block.dart';
// import 'package:flutter/material.dart';
//
// class _ColorBox extends StatelessWidget {
//   final Color color;
//   final String text;
//
//   const _ColorBox({super.key, required this.color, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(text),
//         AntdBox(
//           alignment: Alignment.center,
//           style: AntdBoxStyle(
//             height: 80,
//             width: 80,
//             textStyle: const TextStyle(color: Colors.white),
//             color: color,
//           ),
//           child: Text(color.value.toRadixString(16)),
//         )
//       ],
//     );
//   }
// }
//
// class TokenDemo extends StatelessWidget {
//   const TokenDemo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var token = AntdTheme.ofToken(context);
//     return DemoPage(title: "Token", demos: [
//       Block(title: "主色", child: [
//         _ColorBox(
//           color: token.colorPrimary,
//           text: "品牌色",
//         ),
//         _ColorBox(
//           color: token.colorSuccess,
//           text: "成功色",
//         ),
//         _ColorBox(
//           color: token.colorError,
//           text: "错误色",
//         ),
//         _ColorBox(
//           color: token.colorInfo,
//           text: "信息色",
//         ),
//         _ColorBox(
//           color: token.colorLink,
//           text: "链接色",
//         ),
//         _ColorBox(
//           color: token.colorWarning,
//           text: "警告色",
//         ),
//         _ColorBox(
//           color: token.colorText,
//           text: "字体色",
//         ),
//       ]),
//       Block(
//         title: "主色色盘",
//         child: [
//           _ColorBox(
//             color: token.colorPrimaryActive,
//             text: "激活色",
//           ),
//           _ColorBox(
//             color: token.colorPrimaryBg,
//             text: "背景色",
//           ),
//           _ColorBox(
//             color: token.colorPrimaryBgActive,
//             text: "激活背景色",
//           ),
//           _ColorBox(
//             color: token.colorPrimaryBgFilledHover,
//             text: "背景填充悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorPrimaryBgHover,
//             text: "背景悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorPrimaryBorder,
//             text: "边框色",
//           ),
//           _ColorBox(
//             color: token.colorPrimaryBorderHover,
//             text: "边框悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorPrimaryHover,
//             text: "悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorPrimaryText,
//             text: "文本色",
//           ),
//           _ColorBox(
//             color: token.colorPrimaryTextActive,
//             text: "文本激活色",
//           ),
//           _ColorBox(
//             color: token.colorPrimaryTextHover,
//             text: "文本悬浮色",
//           ),
//         ],
//       ),
//       Block(
//         title: "错误色色盘",
//         child: [
//           _ColorBox(
//             color: token.colorErrorActive,
//             text: "激活色",
//           ),
//           _ColorBox(
//             color: token.colorErrorBg,
//             text: "背景色",
//           ),
//           _ColorBox(
//             color: token.colorErrorBgActive,
//             text: "激活背景色",
//           ),
//           _ColorBox(
//             color: token.colorErrorBgFilledHover,
//             text: "背景填充悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorErrorBgHover,
//             text: "背景悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorErrorBorder,
//             text: "边框色",
//           ),
//           _ColorBox(
//             color: token.colorWarningBorderHover,
//             text: "边框悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorErrorHover,
//             text: "悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorErrorText,
//             text: "文本色",
//           ),
//           _ColorBox(
//             color: token.colorErrorTextActive,
//             text: "文本激活色",
//           ),
//           _ColorBox(
//             color: token.colorErrorTextHover,
//             text: "文本悬浮色",
//           ),
//         ],
//       ),
//       Block(
//         title: "信息色色盘",
//         child: [
//           _ColorBox(
//             color: token.colorInfoActive,
//             text: "激活色",
//           ),
//           _ColorBox(
//             color: token.colorInfoBg,
//             text: "背景色",
//           ),
//           _ColorBox(
//             color: token.colorInfoBgActive,
//             text: "激活背景色",
//           ),
//           _ColorBox(
//             color: token.colorInfoBgFilledHover,
//             text: "背景填充悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorInfoBgHover,
//             text: "背景悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorInfoBorder,
//             text: "边框色",
//           ),
//           _ColorBox(
//             color: token.colorInfoBorderHover,
//             text: "边框悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorInfoHover,
//             text: "悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorInfoText,
//             text: "文本色",
//           ),
//           _ColorBox(
//             color: token.colorInfoTextActive,
//             text: "文本激活色",
//           ),
//           _ColorBox(
//             color: token.colorInfoTextHover,
//             text: "文本悬浮色",
//           ),
//         ],
//       ),
//       Block(
//         title: "警告色色盘",
//         child: [
//           _ColorBox(
//             color: token.colorWarningActive,
//             text: "激活色",
//           ),
//           _ColorBox(
//             color: token.colorWarningBg,
//             text: "背景色",
//           ),
//           _ColorBox(
//             color: token.colorWarningBgActive,
//             text: "激活背景色",
//           ),
//           _ColorBox(
//             color: token.colorWarningBgFilledHover,
//             text: "背景填充悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorWarningBgHover,
//             text: "背景悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorWarningBorder,
//             text: "边框色",
//           ),
//           _ColorBox(
//             color: token.colorWarningBorderHover,
//             text: "边框悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorWarningHover,
//             text: "悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorWarningText,
//             text: "文本色",
//           ),
//           _ColorBox(
//             color: token.colorWarningTextActive,
//             text: "文本激活色",
//           ),
//           _ColorBox(
//             color: token.colorWarningTextHover,
//             text: "文本悬浮色",
//           ),
//         ],
//       ),
//       Block(
//         title: "链接色色盘",
//         child: [
//           _ColorBox(
//             color: token.colorLinkActive,
//             text: "激活色",
//           ),
//           _ColorBox(
//             color: token.colorLinkBg,
//             text: "背景色",
//           ),
//           _ColorBox(
//             color: token.colorLinkBorder,
//             text: "边框色",
//           ),
//           _ColorBox(
//             color: token.colorLinkHover,
//             text: "悬浮色",
//           ),
//         ],
//       ),
//       Block(
//         title: "成功色色盘",
//         child: [
//           _ColorBox(
//             color: token.colorSuccessActive,
//             text: "激活色",
//           ),
//           _ColorBox(
//             color: token.colorSuccessBg,
//             text: "背景色",
//           ),
//           _ColorBox(
//             color: token.colorSuccessBgActive,
//             text: "激活背景色",
//           ),
//           _ColorBox(
//             color: token.colorSuccessBgFilledHover,
//             text: "背景填充悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorSuccessBgHover,
//             text: "背景悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorSuccessBorder,
//             text: "边框色",
//           ),
//           _ColorBox(
//             color: token.colorSuccessBorderHover,
//             text: "边框悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorSuccessHover,
//             text: "悬浮色",
//           ),
//           _ColorBox(
//             color: token.colorSuccessText,
//             text: "文本色",
//           ),
//           _ColorBox(
//             color: token.colorSuccessTextActive,
//             text: "文本激活色",
//           ),
//           _ColorBox(
//             color: token.colorSuccessTextHover,
//             text: "文本悬浮色",
//           ),
//         ],
//       ),
//       Block(title: "排版", column: true, child: [
//         Text(
//           "特大号字体:${token.fontSizeXXL},${token.lineHeightXXL}",
//           style: token.font.xxl,
//         ),
//         Text(
//           "超大号字体:${token.fontSizeXL},${token.lineHeightXL}",
//           style: token.xlTextStyle,
//         ),
//         Text(
//           "大号字体:${token.fontSizeLG},${token.lineHeightLG}",
//           style: token.lgTextStyle,
//         ),
//         Text(
//           "中等字体:${token.fontSizeMD},${token.lineHeightMD}",
//           style: token.font.md,
//         ),
//         Text(
//           "正常字体:${token.fontSize},${token.lineHeight}",
//           style: token.textStyle,
//         ),
//         Text(
//           "小号字体:${token.fontsize.sm},${token.lineHeightSM}",
//           style: token.font.sm,
//         ),
//         Text(
//           "超小号字体:${token.fontSizeXS},${token.lineHeightXS}",
//           style: token.font.xs,
//         ),
//         Text(
//           "特小号字体:${token.fontSizeXXS},${token.lineHeightXXS}",
//           style: token.xxsTextStyle,
//         )
//       ]),
//       Block(title: "尺寸", child: [
//         Column(
//           children: [
//             Text("XXS:${token.size.xxs.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.size.xxs.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("XS:${token.sizeXS.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.sizeXS.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("SM:${token.size.sm.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.size.sm.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("MS:${token.size.ms.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.size.ms.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("size:${token.size.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.size.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("MD:${token.sizeMD.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.sizeMD.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("LG:${token.sizeLG.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.sizeLG.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("XL:${token.sizeXL.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.sizeXL.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("XXL:${token.size.xxl.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.size.xxl.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//       ]),
//       Block(title: "内边距", child: [
//         Column(
//           children: [
//             Text("XXS:${token.paddingXXS.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.paddingXXS.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("XS:${token.size.xs.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.size.xs.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("SM:${token.size.sm.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.size.sm.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("padding:${token.padding.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.padding.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("MD:${token.size.md.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.size.md.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("LG:${token.size.lg.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.size.lg.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("XL:${token.paddingXL.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.paddingXL.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//       ]),
//       Block(title: "外边距", child: [
//         Column(
//           children: [
//             Text("XXS:${token.marginXXS.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.marginXXS.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("XS:${token.size.xs.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.size.xs.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("SM:${token.marginSM.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.marginSM.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("margin:${token.margin.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.margin.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("MD:${token.marginMD.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.marginMD.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("LG:${token.size.lg.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.size.lg.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("XL:${token.size.xl.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.size.xl.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("XXL:${token.marginXXL.roundToDouble().toString()}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: token.size.xxl.roundToDouble(),
//                   color: token.colorPrimary),
//             )
//           ],
//         ),
//       ]),
//       Block(title: '圆角', child: [
//         Column(
//           children: [
//             Text("XS圆角:${token.borderRadiusXS}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: 30,
//                   color: token.colorPrimary,
//                   radius: BorderRadius.circular(
//                       token.borderRadiusXS.roundToDouble())),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("SM圆角:${token.borderRadiusSM}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: 30,
//                   color: token.colorPrimary,
//                   radius: BorderRadius.circular(
//                       token.borderRadiusSM.roundToDouble())),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("基础圆角:${token.borderRadius}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: 30,
//                   color: token.colorPrimary,
//                   radius: BorderRadius.circular(
//                       token.borderRadius.roundToDouble())),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text("LG圆角:${token.borderRadiusLG}"),
//             AntdBox(
//               style: AntdBoxStyle(
//                   size: 30,
//                   color: token.colorPrimary,
//                   radius: BorderRadius.circular(
//                       token.borderRadiusLG.roundToDouble())),
//             )
//           ],
//         ),
//       ]),
//       Block(title: "背景色", child: [
//         _ColorBox(
//           color: token.colorBgBlur,
//           text: "毛玻璃背景色",
//         ),
//         _ColorBox(
//           color: token.colorBgContainer,
//           text: "容器背景色",
//         ),
//         _ColorBox(
//           color: token.colorBgElevated,
//           text: "浮层容器背景色",
//         ),
//         _ColorBox(
//           color: token.colorBgLayout,
//           text: "布局背景色",
//         ),
//         _ColorBox(
//           color: token.colorBgMask,
//           text: "蒙层背景色",
//         ),
//         _ColorBox(
//           color: token.colorBgSolid,
//           text: "实心背景色",
//         ),
//         _ColorBox(
//           color: token.colorBgSolidActive,
//           text: "实心激活背景色",
//         ),
//         _ColorBox(
//           color: token.colorBgSolidHover,
//           text: "实心悬浮背景色",
//         ),
//         _ColorBox(
//           color: token.colorBgSpotlight,
//           text: "反差背景色",
//         ),
//         _ColorBox(
//           color: token.colorBgContainerDisabled,
//           text: "禁用状态背景色",
//         ),
//         _ColorBox(
//           color: token.colorBorderBg,
//           text: "边框背景色",
//         ),
//       ]),
//       Block(title: "字体颜色", child: [
//         _ColorBox(
//           color: token.colorText,
//           text: "文本色",
//         ),
//         _ColorBox(
//           color: token.colorTextSecondary,
//           text: "二级文本色",
//         ),
//         _ColorBox(
//           color: token.colorTextTertiary,
//           text: "三级文本色",
//         ),
//         _ColorBox(
//           color: token.colorTextQuaternary,
//           text: "四级文本色",
//         ),
//         _ColorBox(
//           color: token.colorTextDescription,
//           text: "描述文本色",
//         ),
//         _ColorBox(
//           color: token.colorTextDisabled,
//           text: "禁用文本色",
//         ),
//         _ColorBox(
//           color: token.colorTextHeading,
//           text: "标题文本色",
//         ),
//         _ColorBox(
//           color: token.colorTextLabel,
//           text: "标签文本色",
//         ),
//         _ColorBox(
//           color: token.colorTextPlaceholder,
//           text: "占位文本色",
//         ),
//         _ColorBox(
//           color: token.colorTextLightSolid,
//           text: "背景文本色",
//         ),
//         _ColorBox(
//           color: token.colorBgTextActive,
//           text: "激活文本色",
//         ),
//         _ColorBox(
//           color: token.colorBgTextHover,
//           text: "悬停文本色",
//         ),
//       ]),
//       Block(title: "填充颜色", child: [
//         _ColorBox(
//           color: token.colorFill,
//           text: "填充色",
//         ),
//         _ColorBox(
//           color: token.colorFillQuaternary,
//           text: "一级填充色",
//         ),
//         _ColorBox(
//           color: token.colorFillSecondary,
//           text: "二级填充色",
//         ),
//         _ColorBox(
//           color: token.colorFillTertiary,
//           text: "三级填充色",
//         ),
//         _ColorBox(
//           color: token.colorFillAlter,
//           text: "替代填充色",
//         ),
//         _ColorBox(
//           color: token.colorFillContent,
//           text: "内容填充色",
//         ),
//         _ColorBox(
//           color: token.colorFillContentHover,
//           text: "内容悬停填充色",
//         ),
//         _ColorBox(
//           color: token.colorBorder,
//           text: "边框色",
//         ),
//       ]),
//       Block(title: "图标颜色", child: [
//         _ColorBox(
//           color: token.colorIcon,
//           text: "图标颜色",
//         ),
//         _ColorBox(
//           color: token.colorIconHover,
//           text: "图标悬浮颜色",
//         ),
//       ]),
//       Block(title: "阴影", child: [
//         AntdBox(
//           style: AntdBoxStyle(
//               size: 80,
//               shadows: token.boxShadow,
//               color: Colors.white),
//         ),
//         AntdBox(
//           style: AntdBoxStyle(
//               size: 80,
//               shadows: token.boxShadowSecondary,
//               color: Colors.red),
//         ),
//         AntdBox(
//           style: AntdBoxStyle(
//               size: 60,
//               shadows: token.boxShadowTertiary,
//               color: Colors.white),
//         )
//       ])
//     ]);
//   }
// }
