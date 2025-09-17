import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

Size getFullScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

Size getAvailableSize(BuildContext context) {
  var fullScreenSize = MediaQuery.of(context).size;

  var view = View.of(context);
  var padding = EdgeInsets.fromViewPadding(
    view.viewInsets,
    view.devicePixelRatio,
  );
  return Size(fullScreenSize.width - (padding.left + padding.right),
      fullScreenSize.height - (padding.top + padding.bottom));
}

class AntdProvider extends StatefulWidget {
  final Widget Function(BuildContext context, AntdTheme theme) builder;

  final AntdTheme theme;

  const AntdProvider(
      {super.key, required this.builder, this.theme = defaultLightTheme});

  @override
  State<AntdProvider> createState() => _AntdAntdProviderState();
}

class _AntdAntdProviderState extends State<AntdProvider> {
  late AntdTheme theme = widget.theme;

  @override
  void didUpdateWidget(covariant AntdProvider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.theme != widget.theme) {
      theme = widget.theme;
    }
  }

  AntdSeedToken _getSeedToken(AntdSeedToken? token, AntdThemeMode mode) {
    return token ??
        switch (mode) {
          AntdThemeMode.light => defaultLightToken,
          AntdThemeMode.dark => defaultDartToken,
        };
  }

  @override
  Widget build(BuildContext context) {
    var algorithms = [
      switch (theme.mode) {
        AntdThemeMode.light => light,
        AntdThemeMode.dark => dark,
      },
      ...theme.algorithms
    ];

    AntdSeedToken seedToken = _getSeedToken(theme.token, theme.mode);
    AntdMapToken? token;
    for (var algorithm in algorithms) {
      token = algorithm(seedToken, token);
    }

    void configure(
      AntdThemeMode mode, {
      List<AntdThemeAlgorithm>? algorithms,
      AntdSeedToken? seedToken,
    }) {
      setState(() {
        theme = theme.copyWith(
          mode: mode,
          token: _getSeedToken(seedToken, mode),
          algorithms: algorithms ?? theme.algorithms,
        );
      });
      return;
    }

    return AntdThemeProvider(
      theme: theme,
      configure: configure,
      child: AntdMapTokenProvider(
          mapToken: token!,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: DefaultTextStyle(
              style: token.font.sm,
              child: Builder(builder: (context) {
                return widget.builder(context, theme);
              }),
            ),
          )),
    );
  }
}
