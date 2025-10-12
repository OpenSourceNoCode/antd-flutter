import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 自定义构建
/// @l [AntdTabBar]
class AntdTabBarBadgeDemo extends StatelessWidget {
  const AntdTabBarBadgeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
      outline: true,
      child: [
        DemoTitle(
            title: "使用builder完全控制自定义",
            child: AntdTabBar(
              items: [
                const AntdTabBarItem(
                  icon: AntdBadge(
                    badge: Text("15"),
                    child: AntdIcon(
                      icon: AntdIcons.appstore,
                    ),
                  ),
                  title: Text("首页"),
                ),
                AntdTabBarItem(
                  icon: const AntdIcon(
                    icon: AntdIcons.unorderedList,
                  ),
                  builder: (child, index, active) {
                    return AntdBox(
                      style: const AntdBoxStyle(color: Colors.green),
                      child: child,
                    );
                  },
                  title: const Text("待办"),
                ),
                const AntdTabBarItem(
                  icon: AntdIcon(
                    icon: AntdIcons.send,
                  ),
                  title: AntdBadge(
                    badge: Text("6"),
                    child: Text("消息"),
                  ),
                ),
                const AntdTabBarItem(
                  icon: AntdIcon(
                    icon: AntdIcons.user,
                  ),
                  title: Text("我的"),
                )
              ],
              activeIndex: 1,
            ))
      ],
    );
  }
}

/// @t 仅图标/标题
/// @l [AntdTabBar]
class AntdTabBarIconDemo extends StatelessWidget {
  const AntdTabBarIconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(
      outline: true,
      child: [
        DemoTitle(
            title: "仅图标",
            child: AntdTabBar(
              items: [
                AntdTabBarItem(
                  icon: AntdIcon(
                    icon: AntdIcons.app,
                  ),
                ),
                AntdTabBarItem(
                  icon: AntdIcon(
                    icon: AntdIcons.unorderedList,
                  ),
                ),
                AntdTabBarItem(
                  icon: AntdIcon(
                    icon: AntdIcons.send,
                  ),
                ),
                AntdTabBarItem(
                  icon: AntdIcon(
                    icon: AntdIcons.user,
                  ),
                )
              ],
              activeIndex: 1,
            )),
        DemoTitle(
            title: "仅标题",
            child: AntdTabBar(
              items: [
                AntdTabBarItem(
                  title: Text("首页"),
                ),
                AntdTabBarItem(
                  title: Text("待办"),
                ),
                AntdTabBarItem(
                  title: Text("消息"),
                ),
                AntdTabBarItem(
                  title: Text("我的"),
                )
              ],
              activeIndex: 1,
            ))
      ],
    );
  }
}

/// @t 自定义样式
/// @l [AntdTabBar]
class AntdTabBarTitleDemo extends StatelessWidget {
  const AntdTabBarTitleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
      outline: true,
      child: [
        AntdTabBar(
          style: AntdTabBarStyle(
              bodyStyle: AntdBoxStyle(
                  textStyle: token.font.xl.copyWith(color: token.colorWhite),
                  color: token.colorPrimary.withValues(alpha: 0.5),
                  backdropFilter: 32),
              activeIconStyle: const AntdIconStyle(size: 53),
              iconStyle: const AntdIconStyle(size: 32)),
          items: const [
            AntdTabBarItem(
              icon: AntdIcon(
                icon: AntdIcons.app,
              ),
              title: Text("首页"),
            ),
            AntdTabBarItem(
              icon: AntdIcon(
                icon: AntdIcons.app,
              ),
              title: Text("待办"),
            ),
            AntdTabBarItem(
              icon: AntdIcon(
                icon: AntdIcons.app,
              ),
              title: Text("消息"),
            ),
            AntdTabBarItem(
              icon: AntdIcon(
                icon: AntdIcons.app,
              ),
              title: Text("我的"),
            )
          ],
          activeIndex: 1,
        )
      ],
    );
  }
}

/// @t 事件
/// @l [AntdTabBar]
class AntdTabBarSafeAreaDemo extends StatefulWidget {
  const AntdTabBarSafeAreaDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdTabBarSafeAreaDemoStateDemo();
  }
}

class _AntdTabBarSafeAreaDemoStateDemo extends State<AntdTabBarSafeAreaDemo> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
      outline: true,
      child: [
        DemoTitle(
            title: "AntdTabBar的OnChange事件",
            child: AntdTabBar(
              activeIndex: index,
              onChange: (index) {
                AntdToast.show("当前是:$index");
                setState(() {
                  this.index = index;
                });
              },
              items: const [
                AntdTabBarItem(
                  icon: AntdIcon(
                    icon: AntdIcons.app,
                  ),
                  title: Text("首页"),
                ),
                AntdTabBarItem(
                  icon: AntdIcon(
                    icon: AntdIcons.unorderedList,
                  ),
                  title: Text("待办"),
                ),
                AntdTabBarItem(
                  icon: AntdIcon(
                    icon: AntdIcons.send,
                  ),
                  title: Text("消息"),
                ),
                AntdTabBarItem(
                  icon: AntdIcon(
                    icon: AntdIcons.user,
                  ),
                  title: Text("我的"),
                )
              ],
            )),
        DemoTitle(
            title: "AntdTabBarItem的onActive事件",
            child: AntdTabBar(
              activeIndex: index,
              onChange: (index) {
                setState(() {
                  this.index = index;
                });
              },
              items: [
                AntdTabBarItem(
                  onActive: () {
                    AntdToast.show("首页被激活了");
                  },
                  icon: const AntdIcon(
                    icon: AntdIcons.app,
                  ),
                  title: const Text("首页"),
                ),
                const AntdTabBarItem(
                  icon: AntdIcon(
                    icon: AntdIcons.unorderedList,
                  ),
                  title: Text("待办"),
                ),
                const AntdTabBarItem(
                  icon: AntdIcon(
                    icon: AntdIcons.send,
                  ),
                  title: Text("消息"),
                ),
                const AntdTabBarItem(
                  icon: AntdIcon(
                    icon: AntdIcons.user,
                  ),
                  title: Text("我的"),
                )
              ],
            ))
      ],
    );
  }
}
