import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 返回区域
/// @l [AntdNavBar]
class AntdNavBarBackDemo extends StatelessWidget {
  const AntdNavBarBackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(outline: false, child: [
      DemoTitle(
          outline: false,
          title: "仅文字描述",
          child: AntdNavBar(
            back: Text("我是back"),
            title: Text("导航"),
          )),
      DemoTitle(
          outline: false,
          title: "带图标",
          child: AntdNavBar(
            title: Text("导航"),
            back: Text("我是back"),
            backIcon: AntdIcon(
              icon: AntdIcons.app,
            ),
          )),
      DemoTitle(
          outline: false,
          title: "backIcon 可以是任意Widget",
          child: AntdNavBar(
            title: Text("导航"),
            back: Text("我是back"),
            backIcon: AntdBox(
              style: AntdBoxStyle(size: 24, color: Colors.red),
            ),
          )),
      DemoTitle(
          outline: false,
          title: "在back区域左侧放置widget",
          child: AntdNavBar(
            title: Text("导航"),
            back: Text("back"),
            left: AntdIcon(
              icon: AntdIcons.left,
            ),
            backIcon: AntdBox(
              style: AntdBoxStyle(size: 24, color: Colors.red),
            ),
          ))
    ]);
  }
}

/// @t 标题和子标题
/// @l [AntdNavBar]
class AntdNavBarTitleDemo extends StatelessWidget {
  const AntdNavBarTitleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      outline: false,
      child: [
        DemoTitle(
            outline: false,
            title: '特别长的标题',
            child: AntdNavBar(
              title: Text("标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题"),
              subTitle: Text("111"),
              left: Text("关闭"),
              right: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    AntdIcons.search,
                    size: 24,
                  ),
                  Icon(
                    AntdIcons.more,
                    size: 24,
                  )
                ],
              ),
            )),
        DemoTitle(
            outline: false,
            title: '特别长时省略',
            child: AntdNavBar(
              title: Text(
                "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题",
                overflow: TextOverflow.ellipsis,
              ),
              subTitle: Text("111"),
              left: Text("关闭"),
              right: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    AntdIcons.search,
                    size: 24,
                  ),
                  Icon(
                    AntdIcons.more,
                    size: 24,
                  )
                ],
              ),
            )),
        DemoTitle(
            outline: false,
            title: '特别长尽量展示完',
            child: AntdNavBar(
              style: AntdNavBarStyle(
                  rightExpanded: false,
                  backRowStyle: AntdFlexStyle(expanded: false)),
              title: Text(
                "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题",
              ),
              subTitle: Text("111"),
              left: Text("关闭"),
              right: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    AntdIcons.search,
                    size: 24,
                  ),
                  Icon(
                    AntdIcons.more,
                    size: 24,
                  )
                ],
              ),
            ))
      ],
    );
  }
}

/// @t 事件
/// @d 触发整体触发OnTap，触摸返回区域触发OnBack
/// @l [AntdNavBar]
class AntdNavBarEventDemo extends StatelessWidget {
  const AntdNavBarEventDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
      outline: false,
      child: [
        DemoTitle(
            outline: false,
            title: "同时存在onTap和onBack，一起触发",
            child: AntdNavBar(
              onTap: () {
                AntdToast.show("触发了OnTap事件", position: AntdToastPosition.top);
              },
              onBack: () {
                AntdToast.show("触发了onBack事件", position: AntdToastPosition.top);
              },
              backIcon: const AntdIcon(
                icon: AntdIcons.link,
              ),
              back: const Text("返回"),
              title: const Text("标题"),
            )),
        DemoTitle(
            outline: false,
            title: "同时存在onTap和onBack，阻止onBack事件穿透",
            child: AntdNavBar(
              style: const AntdNavBarStyle(
                  bodyStyle: AntdBoxStyle(
                      options: AntdTapOptions(alwaysReceiveTap: false))),
              onTap: () {
                AntdToast.show("触发了OnTap事件", position: AntdToastPosition.top);
              },
              onBack: () {
                AntdToast.show("触发了onBack事件", position: AntdToastPosition.top);
              },
              backIcon: const AntdIcon(
                icon: AntdIcons.link,
              ),
              back: const Text("返回"),
              title: const Text("标题"),
            ))
      ],
    );
  }
}

/// @t 安全区
/// @l [AntdNavBar]
class AntdNavBarSafeAreaDemo extends StatelessWidget {
  const AntdNavBarSafeAreaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      outline: false,
      child: [
        AntdNavBar(
          safeArea: AntdPosition.top,
          backIcon: AntdIcon(
            icon: AntdIcons.link,
          ),
          back: Text("返回"),
          title: Text("标题"),
        )
      ],
    );
  }
}

/// @t 自定义样式
/// @l [AntdNavBar]
class AntdNavBarIconDemo extends StatelessWidget {
  const AntdNavBarIconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
      outline: false,
      child: [
        AntdNavBar(
          style: AntdNavBarStyle(
            titleStyle: AntdBoxStyle(
              textStyle:
                  token.font.lg.copyWith(color: token.colorWhite, fontSize: 32),
            ),
            backIconStyle: AntdIconStyle(color: token.colorPrimary),
            bodyStyle: AntdBoxStyle(
                color: token.colorWarning,
                textStyle: token.font.lg.copyWith(color: token.colorWhite),
                height: 60,
                border: Border(
                    bottom: BorderSide(color: token.colorSuccess, width: 2))),
          ),
          backIcon: const AntdIcon(
            icon: AntdIcons.link,
          ),
          back: const Text("返回"),
          title: const Text("标题"),
        )
      ],
    );
  }
}
