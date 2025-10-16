import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

typedef AntdThemeAlgorithm = AntdMapToken Function(
    AntdSeedToken seedToken, AntdMapToken? token);

AntdThemeAlgorithm light = (seedToken, token) {
  var colorTextBase =
      seedToken.colorText.getOriginalColor(seedToken.opacityDefine.colorText);
  var colorText =
      AntdTextColorDefine.generate(colorTextBase, seedToken.opacityDefine);
  return AntdMapToken(
      size: AntdSizeDefine.generate(seedToken.sizeUnit, seedToken.sizeStep),
      radius: AntdRadiusDefine.generate(seedToken.radius, seedToken.sizeStep),
      colorInfo: AntdColorDefine.generate(seedToken.colorInfo),
      colorLink: AntdColorDefine.generate(seedToken.colorLink),
      colorPrimary: AntdColorDefine.generate(seedToken.colorPrimary),
      colorSuccess: AntdColorDefine.generate(seedToken.colorSuccess),
      colorWarning: AntdColorDefine.generate(seedToken.colorWarning),
      colorError: AntdColorDefine.generate(seedToken.colorError),
      colorText: colorText,
      font: AntdFontDefine.generate(
          seedToken.fontSize, colorText, seedToken.defaultTextStyle),
      colorFill: AntdFillColorDefine.generate(
          colorTextBase, seedToken.colorBgBase, seedToken.opacityDefine),
      colorBgBlur: const Color(0x00000000),
      colorBgContainer: seedToken.colorBgBase.lightness(0, false),
      colorBgElevated: seedToken.colorBgBase.lightness(0, false),
      colorBgLayout: seedToken.colorBgBase.lightness(4, false),
      colorBgMask: const Color(0x00000000).mix(0.45, seedToken.colorBgBase),
      colorBgSolid: colorTextBase.mix(1, seedToken.colorBgBase),
      colorBgSolidActive: colorTextBase.mix(0.95, seedToken.colorBgBase),
      colorBgSpotlight: colorTextBase.mix(0.85, seedToken.colorBgBase),
      border: BorderSide(
          color: seedToken.colorBgBase
              .lightness(seedToken.opacityDefine.colorBorder, false),
          width: seedToken.lineWidth),
      borderSecondary: BorderSide(
          color: seedToken.colorBgBase
              .lightness(seedToken.opacityDefine.colorBorderSecondary, false),
          width: seedToken.lineWidth),
      lineWidth: seedToken.lineWidth,
      colorWhite: const Color(0xffffffff),
      colorTransparent: const Color(0x00000000),
      colorBlack: const Color(0xff000000),
      shadow: AntdShadowDefine.generate());
};

AntdThemeAlgorithm dark = (seedToken, token) {
  var colorTextBase =
      seedToken.colorText.getOriginalColor(seedToken.opacityDefine.colorText);
  var colorText =
      AntdTextColorDefine.generate(colorTextBase, seedToken.opacityDefine);
  return AntdMapToken(
      size: AntdSizeDefine.generate(seedToken.sizeUnit, seedToken.sizeStep),
      radius: AntdRadiusDefine.generate(seedToken.radius, seedToken.sizeStep),
      colorInfo: AntdColorDefine.generate(
          seedToken.colorInfo, true, seedToken.colorBgBase),
      colorLink: AntdColorDefine.generate(
          seedToken.colorLink, true, seedToken.colorBgBase),
      colorPrimary: AntdColorDefine.generate(
          seedToken.colorPrimary, true, seedToken.colorBgBase),
      colorSuccess: AntdColorDefine.generate(
          seedToken.colorSuccess, true, seedToken.colorBgBase),
      colorWarning: AntdColorDefine.generate(
          seedToken.colorWarning, true, seedToken.colorBgBase),
      colorError: AntdColorDefine.generate(
          seedToken.colorError, true, seedToken.colorBgBase),
      colorText: colorText,
      font: AntdFontDefine.generate(
          seedToken.fontSize, colorText, seedToken.defaultTextStyle),
      colorFill: AntdFillColorDefine.generate(
          colorTextBase, seedToken.colorBgBase, seedToken.opacityDefine),
      colorBgBlur: colorTextBase.mix(0.04, seedToken.colorBgBase),
      colorBgContainer: seedToken.colorBgBase.lightness(5, true),
      colorBgElevated: seedToken.colorBgBase.lightness(9, true),
      colorBgLayout: seedToken.colorBgBase.lightness(0, true),
      colorBgMask: const Color(0x00000000).mix(0.45, seedToken.colorBgBase),
      colorBgSolid: colorTextBase.mix(0.95, seedToken.colorBgBase),
      colorBgSolidActive: colorTextBase.mix(0.9, seedToken.colorBgBase),
      colorBgSpotlight: seedToken.colorBgBase.lightness(26, true),
      border: BorderSide(
          color: seedToken.colorBgBase
              .lightness(seedToken.opacityDefine.colorBorder, true),
          width: seedToken.lineWidth),
      borderSecondary: BorderSide(
          color: seedToken.colorBgBase
              .lightness(seedToken.opacityDefine.colorBorderSecondary, true),
          width: seedToken.lineWidth),
      lineWidth: seedToken.lineWidth,
      colorWhite: const Color(0xffffffff),
      colorTransparent: const Color(0x00000000),
      colorBlack: const Color(0xff000000),
      shadow: AntdShadowDefine.generate());
};
