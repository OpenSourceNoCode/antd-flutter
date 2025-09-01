import 'package:antd_flutter/components/image/index.dart';
import 'package:antd_flutter/extensions/int.dart';
import 'package:antd_flutter/extensions/radius.dart';
import 'package:antd_flutter/theme/theme.dart';
import 'package:antd_flutter/theme/token.dart';
import 'package:flutter/widgets.dart';

///@t 头像
///@g 信息展示
///@o 92
///@d 用来代表用户或事物。
///@u 需要更加直观的展现人物或事物特征。
class AntdAvatar extends AntdImage {
  const AntdAvatar({
    super.key,
    super.style,
    super.styleBuilder,
    required super.image,
    super.fit,
    super.scale = 1.0,
    super.alignment = Alignment.center,
    super.repeat = ImageRepeat.noRepeat,
    super.filterQuality = FilterQuality.medium,
    this.size = 45.0,
    this.radius,
  }) : super(height: size, width: size);

  ///大小
  final double? size;

  ///圆角
  final double? radius;

  @override
  AntdImageStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    var style = super.getDefaultStyle(context, theme, token);
    var radiusFinal = radius ?? token.radiusSize.roundToDouble();
    style = style.copyWith(
        bodyStyle: style.bodyStyle?.copyWith(radius: radiusFinal.radius.all));
    style =
        margeStyle(style, theme.avatarStyle?.call(context, this, style, token));
    return style;
  }
}
