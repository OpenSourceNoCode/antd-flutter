import 'package:antd_flutter_mobile/theme/theme.dart';
import 'package:antd_flutter_mobile/theme/token.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AntdStyle {
  ///是否继承样式,如果为false则不会向上合并其他的样式
  final bool inherit;

  const AntdStyle({this.inherit = true});

  AntdStyle copyFrom(covariant AntdStyle? style) {
    return this;
  }
}

typedef AntdStyleBuilder<Style extends AntdStyle, WidgetType> = Style Function(
    BuildContext context,
    WidgetType widget,
    Style defaultStyle,
    AntdMapToken token);

class AntdStyleProvider<Style extends AntdStyle> extends InheritedWidget {
  final Style? style;

  const AntdStyleProvider({super.key, required super.child, this.style});

  @override
  bool updateShouldNotify(covariant AntdStyleProvider<Style> oldWidget) {
    return oldWidget.style != style;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Style>('style', style));
  }
}

class AntdStyleBuilderProvider<Style extends AntdStyle, WidgetType>
    extends InheritedWidget {
  ///build的style
  final AntdStyleBuilder<Style, WidgetType>? builder;

  const AntdStyleBuilderProvider(
      {super.key, required super.child, this.builder});

  @override
  bool updateShouldNotify(
      covariant AntdStyleBuilderProvider<Style, WidgetType> oldWidget) {
    return oldWidget.builder != builder;
  }
}

class AntdStyleUse<Style extends AntdStyle> extends InheritedWidget {
  final Style? style;

  const AntdStyleUse({super.key, required super.child, this.style});

  @override
  bool updateShouldNotify(covariant AntdStyleUse<Style> oldWidget) {
    return oldWidget.style != style;
  }

  static Style? maybeOf<Style extends AntdStyle>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AntdStyleUse<Style>>()
        ?.style;
  }
}

abstract mixin class AntdStyleMixin<Style extends AntdStyle, WidgetType> {
  Style getStyle(BuildContext context) {
    final theme = AntdTheme.of(context);
    final token = AntdTheme.ofToken(context);

    final widget = getWidget(context);
    Style style = getDefaultStyle(context, theme, token);
    var themeStyle =
        getThemeStyle(context, theme)?.call(context, widget, style, token);

    style = margeStyle(style, themeStyle);

    final styleBuilder = getStyleBuilder(context);
    final buildStyle = styleBuilder?.call(context, widget, style, token);
    if (buildStyle != null) {
      if (buildStyle.inherit != true) {
        return getFinalStyle(context, margeStyle(style, buildStyle), token);
      }
    }

    final inputStyle = getInputStyle(context);
    if (inputStyle != null) {
      if (inputStyle.inherit != true) {
        return getFinalStyle(context,
            _margeStyle(style, buildStyle, inputStyle, null, null), token);
      }
    }

    final styleBuildProviderStyle = context
        .dependOnInheritedWidgetOfExactType<
            AntdStyleBuilderProvider<Style, WidgetType>>()
        ?.builder
        ?.call(context, widget, style, token);

    if (styleBuildProviderStyle != null) {
      if (styleBuildProviderStyle.inherit != true) {
        return getFinalStyle(
            context,
            _margeStyle(
                style, buildStyle, inputStyle, styleBuildProviderStyle, null),
            token);
      }
    }

    final styleProviderStyle = context
        .dependOnInheritedWidgetOfExactType<AntdStyleProvider<Style>>()
        ?.style;

    style = _margeStyle(style, buildStyle, inputStyle, styleBuildProviderStyle,
        styleProviderStyle);

    return getFinalStyle(context, style, token);
  }

  Style? getInputStyle(BuildContext context);

  AntdStyleBuilder<Style, WidgetType>? getStyleBuilder(BuildContext context);

  AntdStyleBuilder<Style, WidgetType>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return null;
  }

  Style getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token);

  Style getFinalStyle(BuildContext context, Style style, AntdMapToken token) {
    return style;
  }

  Style margeStyle(Style defaultStyle, Style? style);

  Style _margeStyle(Style defaultStyle, Style? buildStyle, Style? inputStyle,
      Style? styleBuildProviderStyle, Style? styleProviderStyle) {
    var style1 = margeStyle(
      defaultStyle,
      styleProviderStyle,
    );
    var style2 = margeStyle(style1, styleBuildProviderStyle);
    var style3 = margeStyle(style2, inputStyle);
    var style4 = margeStyle(style3, buildStyle);
    return style4;
  }

  WidgetType getWidget(BuildContext context);
}
