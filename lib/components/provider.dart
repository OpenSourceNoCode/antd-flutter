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
  final AntdTheme? theme;

  const AntdProvider({super.key, required this.builder, this.theme});

  @override
  State<AntdProvider> createState() => _AntdAntdProviderState();
}

final defaultToken = generateToken(const AntdBaseToken(
  radiusSize: 4,
  colorError: Color(0xffff3141),
  colorInfo: Color(0xff1677ff),
  colorLink: Color(0xff1677ff),
  colorPrimary: Color(0xff1677ff),
  colorSuccess: Color(0xff00b578),
  colorTextBase: Color(0xff171717),
  colorBgBase: Color(0xffffffff),
  colorWarning: Color(0xffff8f1f),
  fontSize: 14,
  lineType: '',
  lineWidth: 1,
  sizeStep: 4,
  sizeUnit: 2,
));

final defaultTheme = AntdTheme(token: defaultToken);

class _AntdAntdProviderState extends State<AntdProvider> {
  AntdTheme? theme;

  @override
  void initState() {
    super.initState();
    theme = widget.theme ?? defaultTheme;
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

    return AntdThemeProvider(
      theme: theme!,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: DefaultTextStyle(
          style: theme!.token.font.default_,
          child: child,
        ),
      ),
    );
  }
}
