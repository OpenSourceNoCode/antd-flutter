import 'package:antd_flutter/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 自定义样式
/// @l [AntdNavBar]
class AntdNavBarIconDemo extends StatelessWidget {
  const AntdNavBarIconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
      outline: true,
      child: [
        AntdNavBar(
          style: AntdNavBarStyle(
            titleStyle: AntdBoxStyle(
              textStyle:
                  token.font.lg.copyWith(color: token.colorWhite, fontSize: 32),
            ),
            bodyStyle: AntdBoxStyle(
                color: token.colorPrimary,
                textStyle: token.font.lg.copyWith(color: token.colorWhite),
                height: 60,
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 1))),
          ),
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

/// @t 事件
/// @d 触发整体触发OnTap，触摸返回区域触发OnBack
/// @l [AntdNavBar]
class AntdNavBarEventDemo extends StatelessWidget {
  const AntdNavBarEventDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
      outline: true,
      child: [
        AntdNavBar(
          onTap: () {
            AntdToast.show("触发了OnTap事件");
          },
          onBack: () {
            AntdToast.show("触发了onBack事件");
          },
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

/// @t 标题超长
/// @d 所有的字组件都是widget,你可以完全控制他们的行为
/// @l [AntdNavBar]
class AntdNavBarTitleEllipsisDemo extends StatelessWidget {
  const AntdNavBarTitleEllipsisDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      outline: true,
      child: [
        AntdNavBar(
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
        ),
        AntdNavBar(
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
        )
      ],
    );
  }
}
