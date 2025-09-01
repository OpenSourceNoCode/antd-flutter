import 'dart:io';

import 'package:antd_flutter/index.dart';
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
  final AntdTheme? theme;

  const AntdProvider({super.key, required this.builder, this.theme});

  @override
  State<AntdProvider> createState() => _AntdAntdProviderState();
}

var defaultToken = generateToken(AntdBaseToken(
    radiusSize: 4,
    colorError: const Color(0xffff3141),
    colorInfo: const Color(0xff1677ff),
    colorLink: const Color(0xff1677ff),
    colorPrimary: const Color(0xff1677ff),
    colorSuccess: const Color(0xff00b578),
    colorTextBase: const Color(0xff171717),
    colorBgBase: const Color(0xffffffff),
    colorWarning: const Color(0xffff8f1f),
    fontSize: 14,
    lineType: '',
    lineWidth: 1,
    sizeStep: 4,
    sizeUnit: 2,
    defaultTextStyle: TextStyle(
      fontFamily: Platform.isIOS ? 'PingFang SC' : null,
    )));

class _AntdAntdProviderState extends State<AntdProvider> {
  AntdTheme? theme;

  @override
  void initState() {
    super.initState();
    theme = widget.theme ?? AntdTheme(token: defaultToken);
  }

  @override
  void didUpdateWidget(covariant AntdProvider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.theme != widget.theme) {
      theme = widget.theme;
    }
  }

  @override
  Widget build(BuildContext context) {
    final child = widget.builder(context, theme!);
    final overlay = Overlay.maybeOf(context);

    Widget wrappedChild = overlay != null
        ? child
        : Overlay(
            initialEntries: [
              OverlayEntry(builder: (context) => child),
            ],
          );

    return AntdThemeProvider(
      theme: theme!,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: DefaultTextStyle(
          style: theme!.token.font.default_,
          child: wrappedChild,
        ),
      ),
    );
  }
}
