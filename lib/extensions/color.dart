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
  String get toHex {
    if (a == 1.0) {
      return '#${toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
    } else {
      return '#${toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase()}';
    }
  }

  Color getOriginalColor(double knownAlpha) {
    final inverseAlpha = 1.0 - knownAlpha;

    final originalR = ((r * 255.0) - inverseAlpha * 255) / knownAlpha;
    final originalG = ((g * 255.0) - inverseAlpha * 255) / knownAlpha;
    final originalB = ((b * 255.0) - inverseAlpha * 255) / knownAlpha;

    return Color.fromARGB(
      (a * 255.0).round(),
      originalR.round().clamp(0, 255),
      originalG.round().clamp(0, 255),
      originalB.round().clamp(0, 255),
    );
  }

  Color mix(double alpha, Color color) {
    if (alpha == 1.0) {
      return this;
    }

    int blendColorComponent(
        double foreground, double background, double alpha) {
      final result = (foreground * alpha + background * (1 - alpha)) * 255.0;
      return result.round().clamp(0, 255);
    }

    final mixedR = blendColorComponent(r, color.r, alpha);
    final mixedG = blendColorComponent(g, color.g, alpha);
    final mixedB = blendColorComponent(b, color.b, alpha);

    return Color.fromRGBO(mixedR, mixedG, mixedB, 1.0);
  }

  Color lightness([double amount = 10, bool dark = true]) {
    final clampedAmount = amount.clamp(0, 100) / 100;

    final hsl = _rgbToHsl((r * 255.0).round() & 0xff,
        (g * 255.0).round() & 0xff, (b * 255.0).round() & 0xff);
    double h = hsl[0], s = hsl[1], l = hsl[2];

    l = dark
        ? (l + clampedAmount).clamp(0.0, 1.0)
        : (l - clampedAmount).clamp(0.0, 1.0);

    return _hslToRgb(h, s, l).withValues(alpha: a.toDouble());
  }

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

  double getHue(HSVColor hsv, int i, [bool isLight = false]) {
    double hue;
    if (hsv.hue.round() >= 60 && hsv.hue.round() <= 240) {
      hue = isLight ? hsv.hue - hueStep * i : hsv.hue + hueStep * i;
    } else {
      hue = isLight ? hsv.hue + hueStep * i : hsv.hue - hueStep * i;
    }

    return hue % 360.0; // 确保色调在 0.0 到 360.0 之间
  }

  double getSaturation(HSVColor hsv, int i, [bool isLight = false]) {
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

    saturation = saturation.clamp(0.0, 1.0);

    if (isLight && i == lightColorCount && saturation > 0.1) {
      saturation = 0.1;
    }
    if (saturation < 0.06) {
      saturation = 0.06;
    }
    return saturation.clamp(0.0, 1.0);
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
      [bool dark = false, Color backgroundColor = const Color(0xFF141414)]) {
    final patterns = <Color>[];
    final hsv = HSVColor.fromColor(this);

    for (var i = lightColorCount; i > 0; i--) {
      patterns.add(HSVColor.fromAHSV(1, getHue(hsv, i, true),
              getSaturation(hsv, i, true), getValue(hsv, i, true))
          .toColor());
    }

    patterns.add(this);

    for (var i = 1; i <= darkColorCount; i++) {
      patterns.add(HSVColor.fromAHSV(
              1, getHue(hsv, i), getSaturation(hsv, i), getValue(hsv, i))
          .toColor());
    }

    if (dark) {
      return _toMap(darkColorMap.map((entry) {
        return Color.lerp(
            backgroundColor, patterns[entry.index], entry.amount / 100)!;
      }).toList());
    }

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
