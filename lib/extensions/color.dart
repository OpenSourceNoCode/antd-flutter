import 'package:flutter/widgets.dart';

// 配置常量
const hueStep = 2; // 色相阶梯
const saturationStep = 0.16; // 饱和度阶梯，浅色部分
const saturationStep2 = 0.05; // 饱和度阶梯，深色部分
const brightnessStep1 = 0.05; // 亮度阶梯，浅色部分
const brightnessStep2 = 0.15; // 亮度阶梯，深色部分
const lightColorCount = 5; // 浅色数量，主色上
const darkColorCount = 4; // 深色数量，主色下

class DarkColor {
  final int index;
  final double amount;

  DarkColor({required this.index, required this.amount});
}

var darkColorMap = [
  DarkColor(index: 7, amount: 15),
  DarkColor(index: 6, amount: 25),
  DarkColor(index: 5, amount: 30),
  DarkColor(index: 5, amount: 45),
  DarkColor(index: 5, amount: 65),
  DarkColor(index: 5, amount: 85),
  DarkColor(index: 4, amount: 90),
  DarkColor(index: 3, amount: 95),
  DarkColor(index: 2, amount: 97),
  DarkColor(index: 1, amount: 98),
];

extension ColorExtensions on Color {
  /// 通过HSL色彩空间降低颜色明度
  /// [amount] 取值范围 0-100（百分比），表示明度降低的绝对值
  /// 示例：amount=10 表示明度值直接减少10%（如从0.8→0.7）
  Color darken([double amount = 10]) {
    // 参数安全校验
    final clampedAmount = amount.clamp(0, 100) / 100;

    // 将RGB转换为HSL色彩空间
    final hsl = _rgbToHsl((r * 255.0).round() & 0xff,
        (g * 255.0).round() & 0xff, (b * 255.0).round() & 0xff);
    double h = hsl[0], s = hsl[1], l = hsl[2];

    // 降低明度并限制范围（类似PWM信号占空比调节原理[1](@ref)）
    l = (l - clampedAmount).clamp(0.0, 1.0);

    // 转换回RGB并保留原始透明度
    return _hslToRgb(h, s, l)
        .withValues(alpha: ((a * 255.0).round() & 0xff).toDouble());
  }

  // RGB转HSL算法（符合CIE 1931色彩标准）
  List<double> _rgbToHsl(int r, int g, int b) {
    final double red = r / 255, green = g / 255, blue = b / 255;
    final double max = [red, green, blue].reduce((a, b) => a > b ? a : b);
    final double min = [red, green, blue].reduce((a, b) => a < b ? a : b);
    double h = 0, s = 0, l = (max + min) / 2;

    if (max != min) {
      final double delta = max - min;
      s = l > 0.5 ? delta / (2 - max - min) : delta / (max + min);
      if (max == red) {
        h = (green - blue) / delta + (green < blue ? 6 : 0);
      } else if (max == green) {
        h = (blue - red) / delta + 2;
      } else {
        h = (red - green) / delta + 4;
      }
      h /= 6;
    }
    return [h, s, l];
  }

  // HSL转RGB算法（支持伽马校正）
  Color _hslToRgb(double h, double s, double l) {
    double r, g, b;

    if (s == 0) {
      r = g = b = l;
    } else {
      final double q = l < 0.5 ? l * (1 + s) : l + s - l * s;
      final double p = 2 * l - q;
      r = _hueToRgb(p, q, h + 1 / 3);
      g = _hueToRgb(p, q, h);
      b = _hueToRgb(p, q, h - 1 / 3);
    }

    return Color.fromARGB(
      ((a * 255.0).round() & 0xff),
      (r * 255).round(),
      (g * 255).round(),
      (b * 255).round(),
    );
  }

  double _hueToRgb(double p, double q, double t) {
    if (t < 0) t += 1;
    if (t > 1) t -= 1;
    if (t < 1 / 6) return p + (q - p) * 6 * t;
    if (t < 1 / 2) return q;
    if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
    return p;
  }

  Color withDoubleAlpha(double alpha) {
    // 公式：最终颜色 = 白色背景 × (1 - alpha) + 黑色前景 × alpha
    final r_ = (255 * (1 - alpha) + ((r * 255.0).round() & 0xff) * alpha)
        .round(); // 255 * 0.96 = 244.8 → 245
    final g_ = (255 * (1 - alpha) + ((g * 255.0).round() & 0xff) * alpha)
        .round(); // 同上
    final b_ = (255 * (1 - alpha) + ((b * 255.0).round() & 0xff) * alpha)
        .round(); // 同上

    return Color.fromRGBO(r_, g_, b_, 1);
  }

  bool isStableColor(int color) {
    return color >= 0 && color <= 255;
  }

  /// 计算前景色在背景色上的最终显示颜色
  Color getAlphaColor(Color color) {
    final fR = (r * 255.0).round() & 0xff;
    final fG = (g * 255.0).round() & 0xff;
    final fB = (b * 255.0).round() & 0xff;
    final originAlpha = ((a * 255.0).round() & 0xff) / 255; // 转换为 0-1 范围

    // 如果前景色本身有透明度，直接返回原始颜色
    if (originAlpha < 1) {
      return this;
    }

    // 解析背景色
    final bR = (r * 255.0).round() & 0xff;
    final bG = (g * 255.0).round() & 0xff;
    final bB = (b * 255.0).round() & 0xff;

    // 遍历 alpha 值（从 0.01 到 1，步长 0.01）
    for (double fA = 0.01; fA <= 1; fA += 0.01) {
      // 计算混合后的 RGB 值
      final r = (fR - bR * (1 - fA)).round();
      final g = (fG - bG * (1 - fA)).round();
      final b = (fB - bB * (1 - fA)).round();

      // 检查计算结果是否在有效范围内
      if (isStableColor(r) && isStableColor(g) && isStableColor(b)) {
        // 返回最终颜色（alpha 保留两位小数）
        return Color.fromARGB(
          (fA * 255).round(), // alpha 转换为 0-255
          r,
          g,
          b,
        );
      }
    }

    // 如果没有找到有效颜色，返回前景色的不透明版本
    return Color.fromARGB(255, fR, fG, fB);
  }

  double getHue(HSVColor hsv, int i, [bool isLight = false]) {
    double hue;
    // 根据色相不同，色相转向不同
    if (hsv.hue.round() >= 60 && hsv.hue.round() <= 240) {
      hue = isLight ? hsv.hue - hueStep * i : hsv.hue + hueStep * i;
    } else {
      hue = isLight ? hsv.hue + hueStep * i : hsv.hue - hueStep * i;
    }

    return hue % 360.0; // 确保色调在 0.0 到 360.0 之间
  }

  double getSaturation(HSVColor hsv, int i, [bool isLight = false]) {
    // 灰色不改变饱和度
    if (hsv.hue == 0 && hsv.saturation == 0) {
      return hsv.saturation;
    }

    double saturation;
    if (isLight) {
      saturation = hsv.saturation - saturationStep * i;
    } else if (i == darkColorCount) {
      saturation = hsv.saturation + saturationStep;
    } else {
      saturation = hsv.saturation + saturationStep2 * i;
    }

    // 边界值修正
    saturation = saturation.clamp(0.0, 1.0);

    // 第一格的 s 限制在 0.06-0.1 之间
    if (isLight && i == lightColorCount && saturation > 0.1) {
      saturation = 0.1;
    }
    if (saturation < 0.06) {
      saturation = 0.06;
    }
    return saturation.clamp(0.0, 1.0); // 确保饱和度在 0.0 到 1.0 之间
  }

  double getValue(HSVColor hsv, int i, [bool isLight = false]) {
    double value;
    if (isLight) {
      value = hsv.value + brightnessStep1 * i;
    } else {
      value = hsv.value - brightnessStep2 * i;
    }

    return value.clamp(0.0, 1.0); // 确保亮度在 0.0 到 1.0 之间
  }

  Map<int, Color> generate(
      [bool dark = false, Color color = const Color(0xff141414)]) {
    final patterns = <Color>[];
    final hsv = HSVColor.fromColor(this);

    // Generate light colors
    for (var i = lightColorCount; i > 0; i--) {
      patterns.add(HSVColor.fromAHSV(1, getHue(hsv, i, true),
              getSaturation(hsv, i, true), getValue(hsv, i, true))
          .toColor());
    }

    // Add base color
    patterns.add(this);

    // Generate dark colors
    for (var i = 1; i <= darkColorCount; i++) {
      patterns.add(HSVColor.fromAHSV(
              1, getHue(hsv, i), getSaturation(hsv, i), getValue(hsv, i))
          .toColor());
    }

    // Dark theme adjustments
    if (dark) {
      return _toMap(darkColorMap.map((entry) {
        return Color.lerp(this, patterns[entry.index], entry.amount)!;
      }).toList());
    }

    // Default light theme
    return _toMap(patterns);
  }

  Map<int, Color> _toMap(List<Color> patterns) {
    return {
      1: patterns[0],
      2: patterns[1],
      3: patterns[2],
      4: patterns[3],
      5: patterns[4],
      6: patterns[5],
      7: patterns[6],
      8: patterns[4],
      9: patterns[5],
      10: patterns[6],
    };
  }
}
