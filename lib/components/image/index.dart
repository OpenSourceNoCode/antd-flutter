import 'dart:math';

import 'package:antd_flutter/index.dart';
import 'package:flutter/widgets.dart';

///图片样式
///@l [AntdImage],[AntdAvatar]
class AntdImageStyle extends AntdStyle {
  ///外层的样式
  final AntdBoxStyle? bodyStyle;

  ///每一帧占位
  final ImageFrameBuilder? frameBuilder;

  ///加载失败时触发
  final ImageErrorWidgetBuilder? errorBuild;

  ///	图片加载完时触发
  final ImageLoadingBuilder? loadBuild;

  const AntdImageStyle(
      {super.inherit,
      this.bodyStyle,
      this.frameBuilder,
      this.errorBuild,
      this.loadBuild});

  AntdImageStyle copyWith({
    bool? inherit,
    AntdBoxStyle? bodyStyle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuild,
    ImageLoadingBuilder? loadBuild,
  }) {
    return AntdImageStyle(
      inherit: inherit ?? this.inherit,
      bodyStyle: this.bodyStyle?.copyFrom(bodyStyle),
      frameBuilder: frameBuilder ?? this.frameBuilder,
      errorBuild: errorBuild ?? this.errorBuild,
      loadBuild: loadBuild ?? this.loadBuild,
    );
  }

  @override
  AntdImageStyle copyFrom(covariant AntdImageStyle? style) {
    return AntdImageStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      frameBuilder: style?.frameBuilder ?? frameBuilder,
      errorBuild: style?.errorBuild ?? errorBuild,
      loadBuild: style?.loadBuild ?? loadBuild,
    );
  }
}

///@t 图片
///@g 信息展示
///@o 88
///@d 可预览的图片。
///@u 需要展示图片时使用。加载大图时显示 loading 或加载失败时容错处理。
class AntdImage extends AntdComponent<AntdImageStyle, AntdImage> {
  const AntdImage({
    super.key,
    super.style,
    super.styleBuilder,
    this.height,
    this.width,
    required this.image,
    this.fit,
    this.scale = 1.0,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.filterQuality = FilterQuality.medium,
  });

  ///高度
  final double? height;

  ///宽度
  final double? width;

  ///图片
  final AntdResource image;

  ///	图片填充模式
  final BoxFit? fit;

  ///缩放
  final double scale;

  ///对齐方式
  final AlignmentGeometry alignment;

  ///重复方式
  final ImageRepeat repeat;

  ///过滤质量
  final FilterQuality filterQuality;

  @override
  AntdImageStyle margeStyle(
      AntdImageStyle defaultStyle, AntdImageStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdImageStyle getFinalStyle(
      BuildContext context, AntdImageStyle style, AntdAliasToken token) {
    var size = getSize(style);

    if (style.errorBuild == null) {
      style = style.copyWith(errorBuild: (context, error, stackTrace) {
        return AntdIcon(
          icon: AntdIcons.pictureWrong,
          style: AntdIconStyle(
              color: token.colorTextQuaternary,
              bodyStyle: style.bodyStyle?.copyFrom(AntdBoxStyle(
                  height: size.height,
                  width: size.width,
                  color: token.colorFillContent))),
        );
      });
    }
    if (style.loadBuild == null) {
      style = style.copyWith(loadBuild: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        double calculateLoadingSize(double? height, double? width) {
          const minSize = 0.0;
          const maxSize = 24.0;
          const ratio = 0.4;

          final validHeight = height ?? double.infinity;
          final validWidth = width ?? double.infinity;
          final containerSize = min(validHeight, validWidth);

          if (containerSize.isInfinite) return minSize;

          return (containerSize * ratio).clamp(minSize, maxSize);
        }

        final loadingSize = calculateLoadingSize(size.height, size.width);

        return AntdBox(
          style: style.bodyStyle?.copyFrom(AntdBoxStyle(
            height: size.height,
            width: size.width,
            color: token.colorFillContent,
          )),
          child: Center(
            child: AntdLoading(
              circular: true,
              style: AntdLoadingStyle(size: loadingSize),
              spinning: true,
            ),
          ),
        );
      });
    }
    return style;
  }

  @override
  AntdImageStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return const AntdImageStyle(
      bodyStyle: AntdBoxStyle(),
    );
  }

  @override
  AntdStyleBuilder<AntdImageStyle, AntdImage>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.imageStyle;
  }

  Size getSize(AntdImageStyle? style) {
    var size = style?.bodyStyle?.margeSize;
    return Size(width ?? size?.width ?? 0, height ?? size?.height ?? 0);
  }

  @override
  Widget render(BuildContext context, AntdImageStyle style) {
    var size = getSize(style);

    return AntdBox(
      style: style.bodyStyle,
      child: Transform.scale(
        scale: scale,
        child: Image(
          height: size.height,
          width: size.width,
          frameBuilder: style.frameBuilder,
          errorBuilder: style.errorBuild,
          loadingBuilder: style.loadBuild,
          fit: fit,
          alignment: alignment,
          repeat: repeat,
          filterQuality: filterQuality,
          image: image.toImage()!,
        ),
      ),
    );
  }

  @override
  AntdImage getWidget(BuildContext context) {
    return this;
  }
}
