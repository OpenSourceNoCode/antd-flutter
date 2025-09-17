import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const packageName = "antd_flutter_mobile";

typedef FutureVoidCallback = Future<void> Function();

enum AntdColor {
  primary,
  success,
  warning,
  danger,
  info,
  link;

  Color getColor(AntdMapToken token) {
    switch (this) {
      case primary:
        return token.colorPrimary;
      case success:
        return token.colorSuccess;
      case warning:
        return token.colorWarning;
      case danger:
        return token.colorError;
      case info:
        return token.colorInfo;
      case link:
        return token.colorLink;
    }
  }

  Color getActiveColor(AntdMapToken token) {
    switch (this) {
      case primary:
        return token.colorPrimary.active;
      case success:
        return token.colorSuccess.active;
      case warning:
        return token.colorWarning.active;
      case danger:
        return token.colorError.active;
      case info:
        return token.colorInfo.active;
      case link:
        return token.colorLink.active;
    }
  }

  Color getBgColor(AntdMapToken token) {
    switch (this) {
      case primary:
        return token.colorPrimary.bg;
      case success:
        return token.colorSuccess.bg;
      case warning:
        return token.colorWarning.bg;
      case danger:
        return token.colorError.bg;
      case info:
        return token.colorInfo.bg;
      case link:
        return token.colorLink.bg;
    }
  }

  Color getBorderColor(AntdMapToken token) {
    switch (this) {
      case primary:
        return token.colorPrimary.border;
      case success:
        return token.colorSuccess.border;
      case warning:
        return token.colorWarning.border;
      case danger:
        return token.colorError.border;
      case info:
        return token.colorInfo.border;
      case link:
        return token.colorLink.border;
    }
  }
}

enum AntdSize {
  mini,
  small,
  middle,
  large;

  int size(AntdMapToken token) {
    switch (this) {
      case mini:
        return token.size.xs;
      case small:
        return token.size.sm;
      case middle:
        return token.size.md;
      case large:
        return token.size.lg;
    }
  }

  int padding(AntdMapToken token) {
    switch (this) {
      case mini:
        return token.size.xxs;
      case small:
        return token.size.sm;
      case middle:
        return token.size.md;
      case large:
        return token.size.lg;
    }
  }

  int margin(AntdMapToken token) {
    switch (this) {
      case mini:
        return token.size.xxs;
      case small:
        return token.size.sm;
      case middle:
        return token.size.md;
      case large:
        return token.size.lg;
    }
  }
}

enum AntdPosition {
  top(isHorizontal: false),
  bottom(isHorizontal: false),
  left(isHorizontal: true),
  right(isHorizontal: true),
  horizontal(isHorizontal: true),
  vertical(isHorizontal: false),
  all(isHorizontal: true);

  final bool isHorizontal;

  const AntdPosition({required this.isHorizontal});
}

enum AntdPlacement {
  top(
    horizontal: false,
    before: false,
  ),
  topLeft(horizontal: false, before: false),
  topRight(horizontal: false, before: false),
  bottom(horizontal: false, before: true),
  bottomLeft(horizontal: false, before: true),
  bottomRight(horizontal: false, before: true),
  left(horizontal: true, before: false),
  leftTop(horizontal: true, before: false),
  leftBottom(horizontal: true, before: false),
  right(horizontal: true, before: true),
  rightTop(horizontal: true, before: true),
  rightBottom(horizontal: true, before: true);

  final bool horizontal;
  final bool before;

  const AntdPlacement({required this.horizontal, required this.before});
}

abstract class AntdComponent<Style extends AntdStyle, WidgetType>
    extends StatelessWidget with AntdStyleMixin<Style, WidgetType> {
  ///样式
  final Style? style;

  ///动态样式
  final AntdStyleBuilder<Style, WidgetType>? styleBuilder;

  const AntdComponent({super.key, this.style, this.styleBuilder});

  @override
  Style? getInputStyle(BuildContext context) {
    return style;
  }

  @override
  AntdStyleBuilder<Style, WidgetType>? getStyleBuilder(BuildContext context) {
    return styleBuilder;
  }

  @override
  Widget build(BuildContext context) {
    var style = getStyle(context);
    return AntdStyleUse<Style>(style: style, child: render(context, style));
  }

  Widget render(BuildContext context, Style style);
}

abstract class AntdStateComponent<Style extends AntdStyle, WidgetType>
    extends StatefulWidget with AntdStyleMixin<Style, WidgetType> {
  ///样式
  final Style? style;

  ///动态样式
  final AntdStyleBuilder<Style, WidgetType>? styleBuilder;

  const AntdStateComponent({super.key, this.style, this.styleBuilder});

  @override
  Style? getInputStyle(BuildContext context) {
    return style;
  }

  @override
  AntdStyleBuilder<Style, WidgetType>? getStyleBuilder(BuildContext context) {
    return styleBuilder;
  }
}

abstract class AntdState<Style extends AntdStyle,
    S extends AntdStateComponent<Style, S>> extends State<S> {
  @protected
  late Style style;
  @protected
  late AntdTheme theme;
  @protected
  late AntdMapToken token;

  @override
  @protected
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateDependentValues(null);
  }

  @override
  @protected
  @mustCallSuper
  void didUpdateWidget(covariant S oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateDependentValues(oldWidget);
  }

  @protected
  @protected
  @mustCallSuper
  void updateDependentValues(covariant S? oldWidget) {
    style = widget.getStyle(context);
    theme = AntdTheme.of(context);
    token = AntdTheme.ofToken(context);
  }

  @override
  @protected
  @mustCallSuper
  Widget build(BuildContext context) {
    return render(context);
  }

  @protected
  Widget render(BuildContext context);
}

class AntdTokenBuilder extends StatelessWidget {
  const AntdTokenBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, AntdMapToken token) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, AntdTheme.ofToken(context));
  }
}

enum AntdLogLevel {
  verbose(0, 'Verbose'),
  debug(1, 'Debug'),
  info(2, 'Info'),
  warning(3, 'Warning'),
  error(4, 'Error'),
  none(5, 'None');

  final int level;
  final String name;
  const AntdLogLevel(this.level, this.name);
}

class AntdLogs {
  static const String _root = "https://antd-flutter.vercel.app";

  static AntdLogLevel _currentLevel =
      kDebugMode ? AntdLogLevel.debug : AntdLogLevel.info;

  static bool _enableStackTrace = kDebugMode;

  static set logLevel(AntdLogLevel level) {
    _currentLevel = level;
  }

  static set enableStackTrace(bool enabled) {
    _enableStackTrace = enabled;
  }

  static void v({String? biz, required String msg, String? docUrl}) {
    if (_shouldLog(AntdLogLevel.verbose)) {
      _printLog('Verbose', biz, msg, docUrl);
    }
  }

  static void d({String? biz, required String msg, String? docUrl}) {
    if (_shouldLog(AntdLogLevel.debug)) {
      _printLog('Debug', biz, msg, docUrl);
      if (_enableStackTrace) {
        debugPrint("[Antd Logs][Debug]:以下是该模块的堆栈");
        debugPrintStack();
      }
    }
  }

  static void i({String? biz, required String msg, String? docUrl}) {
    if (_shouldLog(AntdLogLevel.info)) {
      _printLog('Info', biz, msg, docUrl);
    }
  }

  static void w(
      {String? biz, required String msg, String? docUrl, Object? error}) {
    if (_shouldLog(AntdLogLevel.warning)) {
      _printLog('Warning', biz,
          '$msg${error != null ? ' - Error: $error' : ''}', docUrl);
    }
  }

  static void e(
      {String? biz,
      required String msg,
      String? docUrl,
      Object? error,
      StackTrace? stackTrace}) {
    if (_shouldLog(AntdLogLevel.error)) {
      _printLog('Error', biz, '$msg${error != null ? ' - Error: $error' : ''}',
          docUrl);

      if (stackTrace != null) {
        debugPrint("[Antd Logs][Error]:堆栈跟踪:");
        debugPrint(stackTrace.toString());
      } else if (_enableStackTrace) {
        debugPrint("[Antd Logs][Error]:以下是该模块的堆栈");
        debugPrintStack();
      }
    }
  }

  static bool _shouldLog(AntdLogLevel level) {
    return kDebugMode && level.level >= _currentLevel.level;
  }

  static void _printLog(String level, String? biz, String msg, String? docUrl) {
    final buffer = StringBuffer();
    buffer.write('[Antd] $level ');
    if (biz != null) {
      buffer.write('$biz ');
    }
    buffer.write('---$msg');

    if (docUrl != null) {
      buffer.write('\n📖 Docs $_root/$docUrl');
    }

    debugPrint(buffer.toString());
  }

  static void configure({
    AntdLogLevel level = AntdLogLevel.debug,
    bool enableStackTrace = true,
  }) {
    _currentLevel = level;
    _enableStackTrace = enableStackTrace;

    if (kDebugMode) {
      debugPrint(
          '[Antd Logs] 配置完成 - 级别: ${level.name}, 堆栈跟踪: ${enableStackTrace ? "启用" : "禁用"}');
    }
  }
}
