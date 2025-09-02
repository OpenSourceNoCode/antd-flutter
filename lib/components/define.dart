import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const packageName = "antd_flutter_mobile";

typedef FutureVoidCallback = Future<void> Function();

enum AntdColor {
  default_,
  primary,
  success,
  warning,
  danger,
  info,
  link;

  Color getColor(AntdAliasToken token) {
    switch (this) {
      case default_:
        return token.colorFill;
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

  Color getActiveColor(AntdAliasToken token) {
    switch (this) {
      case default_:
        return token.colorFill;
      case primary:
        return token.colorPrimaryActive;
      case success:
        return token.colorSuccessActive;
      case warning:
        return token.colorWarningActive;
      case danger:
        return token.colorErrorActive;
      case info:
        return token.colorInfoActive;
      case link:
        return token.colorLinkActive;
    }
  }

  Color getBgColor(AntdAliasToken token) {
    switch (this) {
      case default_:
        return token.colorFill;
      case primary:
        return token.colorPrimaryBg;
      case success:
        return token.colorSuccessBg;
      case warning:
        return token.colorWarningBg;
      case danger:
        return token.colorErrorBg;
      case info:
        return token.colorInfoBg;
      case link:
        return token.colorLinkBg;
    }
  }

  Color getBorderColor(AntdAliasToken token) {
    switch (this) {
      case default_:
        return token.colorFill;
      case primary:
        return token.colorPrimaryBorder;
      case success:
        return token.colorSuccessBorder;
      case warning:
        return token.colorWarningBorder;
      case danger:
        return token.colorErrorBorder;
      case info:
        return token.colorInfoBorder;
      case link:
        return token.colorLinkBorder;
    }
  }
}

enum AntdSize {
  default_,
  mini,
  small,
  middle,
  large;

  int size(AntdAliasToken token) {
    switch (this) {
      case default_:
        return token.size.default_;
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

  TextStyle text(AntdAliasToken token) {
    switch (this) {
      case default_:
        return token.font.xl;
      case mini:
        return token.font.sm;
      case small:
        return token.font.md;
      case middle:
        return token.font.xl;
      case large:
        return token.font.xxl;
    }
  }

  int padding(AntdAliasToken token) {
    switch (this) {
      case default_:
        return token.size.default_;
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

  int margin(AntdAliasToken token) {
    switch (this) {
      case default_:
        return token.size.default_;
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
  late AntdAliasToken token;

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
    token = theme.token;
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

  final Widget Function(BuildContext context, AntdAliasToken token) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, AntdTheme.ofToken(context));
  }
}

class AntdLogs {
  static void d({final String? biz, required final String msg}) {
    if (kDebugMode) {
      debugPrint("[Antd Logs]:Model:[$biz]---$msg");
      debugPrint("[Antd Logs]:以下是该模块的堆栈");
      debugPrintStack();
    }
  }
}
