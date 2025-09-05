import 'package:antd_flutter_mobile/theme/theme.dart';
import 'package:antd_flutter_mobile/theme/token.dart';
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
    AntdAliasToken token);

class AntdStyleProvider<Style extends AntdStyle> extends InheritedWidget {
  final Style? style;

  const AntdStyleProvider({super.key, required super.child, this.style});

  @override
  bool updateShouldNotify(covariant AntdStyleProvider<Style> oldWidget) {
    return oldWidget.style != style;
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
    final token = theme.token;

    final widget = getWidget(context);
    Style style = getDefaultStyle(context, theme, token);
    var themeStyle =
        getThemeStyle(context, theme)?.call(context, widget, style, token);

    style = margeStyle(style, themeStyle);
    final inputStyle = getInputStyle(context);
    if (inputStyle != null) {
      if (inputStyle.inherit != true) {
        return getFinalStyle(context, margeStyle(style, inputStyle), token);
      }
    }

    final styleBuilder = getStyleBuilder(context);
    final buildStyle = styleBuilder?.call(context, widget, style, token);
    if (buildStyle != null) {
      if (buildStyle.inherit != true) {
        return getFinalStyle(context,
            margeStyle(margeStyle(style, buildStyle), inputStyle), token);
      }
    }

    final styleProviderStyle = context
        .dependOnInheritedWidgetOfExactType<AntdStyleProvider<Style>>()
        ?.style;
    if (styleProviderStyle != null) {
      if (styleProviderStyle.inherit != true) {
        return getFinalStyle(
            context,
            margeStyle(
                margeStyle(margeStyle(style, styleProviderStyle), buildStyle),
                inputStyle),
            token);
      }
    }

    final styleBuildProviderStyle = context
        .dependOnInheritedWidgetOfExactType<
            AntdStyleBuilderProvider<Style, WidgetType>>()
        ?.builder
        ?.call(context, widget, style, token);

    style = margeStyle(
        margeStyle(
            margeStyle(
                margeStyle(
                  style,
                  styleBuildProviderStyle,
                ),
                styleProviderStyle),
            buildStyle),
        inputStyle);

    return getFinalStyle(context, style, token);
  }

  Style? getInputStyle(BuildContext context);

  AntdStyleBuilder<Style, WidgetType>? getStyleBuilder(BuildContext context);

  AntdStyleBuilder<Style, WidgetType>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return null;
  }

  Style getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token);

  Style getFinalStyle(BuildContext context, Style style, AntdAliasToken token) {
    return style;
  }

  Style margeStyle(Style defaultStyle, Style? style);

  WidgetType getWidget(BuildContext context);
}
