import 'dart:math';

import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

extension ColorContrastExtensions on Color {
  /// 计算颜色的相对亮度（WCAG 2.0 标准）
  double get _luminance {
    final r = red / 255.0;
    final g = green / 255.0;
    final b = blue / 255.0;

    final rs = r <= 0.03928 ? r / 12.92 : pow((r + 0.055) / 1.055, 2.4);
    final gs = g <= 0.03928 ? g / 12.92 : pow((g + 0.055) / 1.055, 2.4);
    final bs = b <= 0.03928 ? b / 12.92 : pow((b + 0.055) / 1.055, 2.4);

    return 0.2126 * rs + 0.7152 * gs + 0.0722 * bs;
  }

  /// 计算两个颜色的对比度
  double contrastRatioWith(Color other) {
    final luminance1 = _luminance;
    final luminance2 = other._luminance;

    final lighter = max(luminance1, luminance2);
    final darker = min(luminance1, luminance2);

    return (lighter + 0.05) / (darker + 0.05);
  }

  /// 返回对比度最强的颜色（从候选颜色中选择）
  Color getMaxContrastColor(
      [List<Color> candidateColors = const [Colors.black, Colors.white]]) {
    Color bestColor = candidateColors.first;
    double maxContrast = 0;

    for (final candidate in candidateColors) {
      final contrast = contrastRatioWith(candidate);
      if (contrast > maxContrast) {
        maxContrast = contrast;
        bestColor = candidate;
      }
    }

    return bestColor;
  }
}

class AntdToken extends StatefulWidget {
  const AntdToken({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdTokenState();
  }
}

String convertToOpaqueHex(Color inputColor, Color backgroundColor) {
  final hasTransparency = inputColor.a < 1.0;

  if (!hasTransparency) {
    // 无透明度：直接转换 RGB
    final r = (inputColor.r * 255.0).round().clamp(0, 255);
    final g = (inputColor.g * 255.0).round().clamp(0, 255);
    final b = (inputColor.b * 255.0).round().clamp(0, 255);

    return '#${r.toRadixString(16).padLeft(2, '0')}'
            '${g.toRadixString(16).padLeft(2, '0')}'
            '${b.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }

  // 有透明度：进行混合计算
  final alpha = inputColor.a;

  // 使用clamp确保值在0-255范围内
  final r =
      ((backgroundColor.r * 255.0 * (1 - alpha) + inputColor.r * 255.0 * alpha)
              .round())
          .clamp(0, 255);
  final g =
      ((backgroundColor.g * 255.0 * (1 - alpha) + inputColor.g * 255.0 * alpha)
              .round())
          .clamp(0, 255);
  final b =
      ((backgroundColor.b * 255.0 * (1 - alpha) + inputColor.b * 255.0 * alpha)
              .round())
          .clamp(0, 255);

  return '#${r.toRadixString(16).padLeft(2, '0')}'
          '${g.toRadixString(16).padLeft(2, '0')}'
          '${b.toRadixString(16).padLeft(2, '0')}'
      .toUpperCase();
}

Widget buildColorBox(
    Color color, Color? backgroundColor, String desc, String title) {
  return AntdBox(
    style: AntdBoxStyle(
        textStyle: TextStyle(color: color.getMaxContrastColor(), height: 1),
        padding: 8.vertical.marge(12.horizontal),
        width: double.infinity,
        color: color),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title$desc '),
        Text(convertToOpaqueHex(color, backgroundColor ?? Colors.white))
      ],
    ),
  );
}

Widget buildSizeBox(int size, String desc, AntdMapToken token) {
  return AntdBox(
    style: AntdBoxStyle(
      padding: 8.vertical.marge(12.horizontal),
    ),
    child: AntdRow(children: [
      AntdBox(
        style: AntdBoxStyle(
            size: size.roundToDouble(),
            color: token.colorPrimary,
            margin: token.size.xs.right),
      ),
      Text('$desc $size')
    ]),
  );
}

Widget buildRadiusBox(Radius radius, String desc, AntdMapToken token) {
  return AntdBox(
    style: AntdBoxStyle(
        padding: 4.vertical.marge(12.horizontal),
        radius: radius.all,
        color: token.colorPrimary,
        width: double.infinity,
        textStyle: token.font.ms.copyWith(color: token.colorWhite)),
    child: Text("$desc ${radius.y}"),
  );
}

Widget buildFontBox(TextStyle style, String desc, AntdMapToken token) {
  return AntdBox(
    style: AntdBoxStyle(
        padding: 4.vertical.marge(12.horizontal),
        color: token.colorPrimary,
        width: double.infinity,
        textStyle: style.copyWith(color: token.colorWhite)),
    child: Text(
        "$desc 字号:${style.fontSize} 行高:${style.height?.toStringAsFixed(2)}"),
  );
}

Widget buildShadowBox(
    List<BoxShadow> shadows, String desc, AntdMapToken token) {
  return AntdBox(
    style: AntdBoxStyle(
        padding: 4.vertical.marge(12.horizontal),
        shadows: shadows,
        color: token.colorPrimary,
        width: double.infinity,
        textStyle: token.font.ms.copyWith(color: token.colorWhite)),
    child: Text("$desc "),
  );
}

class _ColorBox extends StatelessWidget {
  final String title;
  final AntdColorDefine define;

  const _ColorBox({super.key, required this.title, required this.define});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.of(context).token;
    return Column(
      children: [
        buildColorBox(define.color, token?.colorBgBase, "", title),
        buildColorBox(define.active, token?.colorBgBase, "激活色", title),
        buildColorBox(define.bg, token?.colorBgBase, "背景色", title),
        buildColorBox(define.bgActive, token?.colorBgBase, "背景激活色", title),
        buildColorBox(
            define.bgFilledActive, token?.colorBgBase, "填充背景激活色", title),
        buildColorBox(define.border, token?.colorBgBase, "边框色", title),
        buildColorBox(define.borderActive, token?.colorBgBase, "边框激活色", title),
        buildColorBox(define.text, token?.colorBgBase, "文本色", title),
        buildColorBox(define.textActive, token?.colorBgBase, "文本激活色", title),
      ],
    );
  }
}

class _AntdTokenState extends State<AntdToken> {
  @override
  Widget build(BuildContext context) {
    var seedToken = AntdTheme.of(context).token;
    var token = AntdTheme.ofToken(context);

    return Blocks(
      items: [
        DemoBlock(
            title: const Text("主色"),
            child: _ColorBox(title: "主色", define: token.colorPrimary)),
        DemoBlock(
            title: const Text("成功色"),
            child: _ColorBox(title: "成功色", define: token.colorSuccess)),
        DemoBlock(
            title: const Text("警告色"),
            child: _ColorBox(title: "警告色", define: token.colorWarning)),
        DemoBlock(
            title: const Text("错误色"),
            child: _ColorBox(title: "错误色", define: token.colorError)),
        DemoBlock(
            title: const Text("信息色"),
            child: _ColorBox(title: "信息色", define: token.colorInfo)),
        DemoBlock(
            title: const Text("链接色"),
            child: _ColorBox(title: "链接色", define: token.colorLink)),
        DemoBlock(
            title: const Text("文本色"),
            child: Column(
              children: [
                buildColorBox(
                    token.colorText, seedToken?.colorBgBase, "主文本色", ""),
                buildColorBox(token.colorText.secondary, seedToken?.colorBgBase,
                    "二级文本色", ""),
                buildColorBox(token.colorText.tertiary, seedToken?.colorBgBase,
                    "三级文本色", ""),
                buildColorBox(token.colorText.quaternary,
                    seedToken?.colorBgBase, "四级文本色", "")
              ],
            )),
        DemoBlock(
            title: const Text("填充色"),
            child: Column(
              children: [
                buildColorBox(
                    token.colorFill, seedToken?.colorBgBase, "填充色", ""),
                buildColorBox(token.colorFill.secondary, seedToken?.colorBgBase,
                    "二级填充色", ""),
                buildColorBox(token.colorFill.tertiary, seedToken?.colorBgBase,
                    "三级填充色", ""),
                buildColorBox(token.colorFill.quaternary,
                    seedToken?.colorBgBase, "四级填充色", "")
              ],
            )),
        DemoBlock(
            title: const Text("背景色"),
            child: Column(
              children: [
                buildColorBox(
                    token.colorBgBlur, seedToken?.colorBgBase, "毛玻璃背景色", ""),
                buildColorBox(token.colorBgContainer, seedToken?.colorBgBase,
                    "容器背景色", ""),
                buildColorBox(token.colorBgElevated, seedToken?.colorBgBase,
                    "浮层容器背景色", ""),
                buildColorBox(
                    token.colorBgLayout, seedToken?.colorBgBase, "布局背景色", ""),
                buildColorBox(
                    token.colorBgMask, seedToken?.colorBgBase, "背景蒙层颜色", ""),
                buildColorBox(
                    token.colorBgSolid, seedToken?.colorBgBase, "实心的背景颜色", ""),
                buildColorBox(token.colorBgSolidActive, seedToken?.colorBgBase,
                    "实心的背景激活颜色", ""),
                buildColorBox(token.colorBgSpotlight, seedToken?.colorBgBase,
                    "反差背景色", ""),
              ],
            )),
        DemoBlock(
            title: const Text("边框色"),
            child: Column(
              children: [
                buildColorBox(
                    token.border.color, seedToken?.colorBgBase, "边框色", ""),
                buildColorBox(token.borderSecondary.color,
                    seedToken?.colorBgBase, "二级边框色", ""),
              ],
            )),
        DemoBlock(
            title: const Text("工具色"),
            child: Column(
              children: [
                buildColorBox(
                    token.colorWhite, seedToken?.colorBgBase, "白色", ""),
                buildColorBox(
                    token.colorTransparent, seedToken?.colorBgBase, "透明", ""),
                buildColorBox(
                    token.colorBlack, seedToken?.colorBgBase, "黑色", ""),
              ],
            )),
        DemoBlock(
            title: const Text("大小"),
            child: Column(
              children: [
                buildSizeBox(token.size.xxs, "最小尺寸 ", token),
                buildSizeBox(token.size.xs, "超小尺寸 ", token),
                buildSizeBox(token.size.ms, "默认尺寸 ", token),
                buildSizeBox(token.size.md, "中等尺寸 ", token),
                buildSizeBox(token.size.lg, "大等尺寸 ", token),
                buildSizeBox(token.size.xl, "超大尺寸 ", token),
                buildSizeBox(token.size.xl, "超大尺寸 ", token),
                buildSizeBox(token.size.xxl, "特大尺寸 ", token),
              ],
            )),
        DemoBlock(
            title: const Text("圆角"),
            child: Row(
              children: [
                Expanded(
                    child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    buildRadiusBox(token.radius, "默认圆角 ", token),
                    buildRadiusBox(token.radius.xs, "小号圆角 ", token),
                    buildRadiusBox(token.radius.sm, "中号圆角 ", token),
                    buildRadiusBox(token.radius.lg, "大号圆角 ", token),
                    buildRadiusBox(token.radius.outer, "外部圆角 ", token),
                  ],
                ))
              ],
            )),
        DemoBlock(
            title: const Text("字体"),
            child: Row(
              children: [
                Expanded(
                    child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    buildFontBox(token.font.xxs, "最小尺寸 ", token),
                    buildFontBox(token.font.xs, "超小尺寸 ", token),
                    buildFontBox(token.font.ms, "默认尺寸 ", token),
                    buildFontBox(token.font.md, "中等尺寸 ", token),
                    buildFontBox(token.font.lg, "大等尺寸 ", token),
                    buildFontBox(token.font.xl, "超大尺寸 ", token),
                    buildFontBox(token.font.xl, "超大尺寸 ", token),
                    buildFontBox(token.font.xxl, "特大尺寸 ", token),
                  ],
                ))
              ],
            )),
      ],
      axis: Axis.horizontal,
      title: "AntdMapToken",
      description: "所有的Token展示,来自Antd Design 5.0并针对移动端进行了优化和剔除",
    );
  }
}
