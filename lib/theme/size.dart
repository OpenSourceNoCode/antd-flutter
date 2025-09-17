/// theme
class AntdSizeDefine {
  ///用于控制组件尺寸的基础步长，尺寸步长结合尺寸变化单位，
  ///就可以派生各种尺寸梯度。通过调整步长即可得到不同的布局模式，
  final int step;

  ///用于控制组件尺寸的变化单位，
  ///在 Ant Design 中我们的基础单位为 4 ，便于更加细致地控制尺寸梯度
  final int unit;

  /// 种子大小 来自step * unit
  final int seed;

  /// 大尺寸: 2 * (4 + 2) = 12
  final int lg;

  /// 中尺寸: 2 * (4 + 1) = 10
  final int md;

  /// 默认尺寸: 2 * 4 = 8
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
    required this.step,
    required this.unit,
    required this.seed,
    required this.lg,
    required this.md,
    required this.ms,
    required this.sm,
    required this.xl,
    required this.xs,
    required this.xxl,
    required this.xxs,
  });

  factory AntdSizeDefine.generate(int sizeUnit, int sizeStep) {
    return AntdSizeDefine(
      step: sizeStep,
      unit: sizeUnit,
      seed: sizeUnit * sizeStep,
      xxs: sizeUnit * (sizeStep - 3),
      xs: sizeUnit * (sizeStep - 2),
      sm: sizeUnit * (sizeStep - 1),
      ms: sizeUnit * sizeStep,
      md: sizeUnit * (sizeStep + 1),
      lg: sizeUnit * (sizeStep + 2),
      xl: sizeUnit * (sizeStep + 4),
      xxl: sizeUnit * (sizeStep + 8),
    );
  }

  AntdSizeDefine copyFrom(AntdSizeDefine? source) {
    return AntdSizeDefine(
      step: source?.step ?? step,
      unit: source?.unit ?? unit,
      seed: source?.seed ?? seed,
      lg: source?.lg ?? lg,
      md: source?.md ?? md,
      ms: source?.ms ?? ms,
      sm: source?.sm ?? sm,
      xl: source?.xl ?? xl,
      xs: source?.xs ?? xs,
      xxl: source?.xxl ?? xxl,
      xxs: source?.xxs ?? xxs,
    );
  }
}
