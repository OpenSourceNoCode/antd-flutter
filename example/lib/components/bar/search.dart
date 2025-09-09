import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 获取焦点后显示取消按钮
/// @l [AntdSearchBar]
class AntdSearchBarAutoShowExtraDemo extends StatelessWidget {
  const AntdSearchBarAutoShowExtraDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      AntdSearchBar(
        extra: const Text("取消"),
        onExtraTap: () {
          AntdToast.show("点击了取消");
        },
        placeholder: const Text("请输入内容"),
      ),
    ]);
  }
}

/// @t 取消按钮长显
/// @l [AntdSearchBar]
class AntdSearchBarAutoShowExtraLongProcessDemo extends StatelessWidget {
  const AntdSearchBarAutoShowExtraLongProcessDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdSearchBar(
        showExtra: true,
        extra: Text("取消"),
        placeholder: Text("请输入内容"),
      ),
    ]);
  }
}

/// @t 自定义样式
/// @l [AntdSearchBar]
class AntdSearchBarAutoCustomDemo extends StatelessWidget {
  const AntdSearchBarAutoCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdSearchBar(
        style: AntdSearchBarStyle(
            bodyStyle: AntdBoxStyle(color: token.colorWhite),
            activeBodyStyle: AntdBoxStyle(radius: BorderRadius.circular(0))),
        placeholder: Text("请输入内容"),
      ),
    ]);
  }
}

/// @t 自定义图标
/// @l [AntdSearchBar]
class AntdSearchBarAutoCustomIconDemo extends StatelessWidget {
  const AntdSearchBarAutoCustomIconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdSearchBar(
        prefix: AntdIcon(
          icon: AntdIcons.app,
        ),
        placeholder: Text("请输入内容"),
      ),
    ]);
  }
}

/// @t 延迟激活
/// @l [AntdSearchBar]
class AntdSearchBarLazyDemo extends StatelessWidget {
  const AntdSearchBarLazyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: true, child: [
      AntdSearchBar(
        lazy: true,
        prefix: AntdIcon(
          icon: AntdIcons.app,
        ),
        extra: Text("取消"),
        placeholder: Text("请输入内容"),
      ),
    ]);
  }
}
