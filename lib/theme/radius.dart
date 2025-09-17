import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/cupertino.dart';

/// theme
class AntdRadiusDefine extends Radius {
  /// 种子圆角，来自 [AntdSeedToken.radius]
  /// 4.0
  final double seed;

  /// LG号圆角，用于组件中的一些大圆角，如 Card、Modal 等一些组件样式。
  /// 6.0
  final Radius lg;

  /// SM号圆角，用于组件小尺寸下的圆角，如 Button、Input、Select 等输入类控件在 small size 下的圆角
  /// 4.0
  final Radius sm;

  /// XS号圆角，用于组件中的一些小圆角，如 Segmented 、Arrow 等一些内部圆角的组件样式中。
  /// 2.0
  final Radius xs;

  /// 外部圆角
  /// 4.0
  final Radius outer;

  AntdRadiusDefine({
    required this.seed,
    required this.lg,
    required this.sm,
    required this.xs,
    required this.outer,
  }) : super.circular(seed);

  factory AntdRadiusDefine.generate(int radius, int sizeStep) {
    final lg = _calculateAdjustedRadius(radius * 1.5, sizeStep, maxValue: 16);

    final sm = _calculateAdjustedRadius(radius * 0.75, sizeStep,
        minValue: sizeStep * 0.5);

    final xs = _calculateAdjustedRadius(sizeStep * 0.5, sizeStep,
        minValue: sizeStep * 0.5, maxValue: sizeStep.toDouble());

    final outer =
        _calculateAdjustedRadius(radius * 1.25, sizeStep, maxValue: radius * 2);

    return AntdRadiusDefine(
      seed: radius.toDouble(),
      lg: Radius.circular(lg),
      sm: Radius.circular(sm),
      xs: Radius.circular(xs),
      outer: Radius.circular(outer),
    );
  }

  static double _calculateAdjustedRadius(
    double value,
    int sizeStep, {
    double minValue = 0,
    double maxValue = double.infinity,
  }) {
    value = value.clamp(minValue, maxValue);

    final steps = (value / sizeStep).roundToDouble();
    return steps * sizeStep;
  }

  AntdRadiusDefine copyFrom(AntdRadiusDefine? source) {
    return AntdRadiusDefine(
      seed: source?.seed ?? seed,
      lg: source?.lg ?? lg,
      sm: source?.sm ?? sm,
      xs: source?.xs ?? xs,
      outer: source?.outer ?? outer,
    );
  }

  @override
  String toString() {
    return 'AntdRadiusDefine(seed: $seed, lg: $lg, sm: $sm, xs: $xs, outer: $outer)';
  }
}
