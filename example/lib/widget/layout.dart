import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
        "https://gw.alipayobjects.com/zos/rmsportal/KDpgvguMpGfqaHPjicRK.svg",
        height: 32,
        width: 32);
  }
}

class Layout extends StatefulWidget {
  final String title;

  final List<Menu> menus;

  final Map<String, Widget> child;

  const Layout(
      {super.key,
      required this.title,
      required this.menus,
      required this.child});

  @override
  State<StatefulWidget> createState() {
    return _LayoutState();
  }
}

class _LayoutState extends State<Layout> {
  Axis axis = Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    // 获取初始路由
    final initialRoute = Uri.base.queryParameters;

    return Navigator(
      initialRoute: initialRoute.containsKey('target')
          ? initialRoute['target']
          : widget.menus.where((value) => value.group == false).first.path,
      observers: [AntdLayer.observer],
      onGenerateRoute: (setting) {
        return MaterialPageRoute(
          builder: (context) {
            Widget child = const AntdBox();
            if (setting.name != null &&
                widget.child.containsKey(setting.name)) {
              child = widget.child[setting.name]!;
            }

            return AntdBox(
              style: AntdBoxStyle(color: token.colorFillTertiary),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AntdBox(
                    innerSafeArea: AntdPosition.top,
                    style: AntdBoxStyle(
                        padding: token.size.lg.all,
                        color: token.colorWhite,
                        border: token.borderSide.bottom),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AntdBox(
                                  style: AntdBoxStyle(
                                      padding: token.size.lg.right),
                                  child: const Logo(),
                                ),
                                Text(
                                  widget.title,
                                  style: token.font.xl
                                      .copyWith(fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            MenuPopup(
                                menus: widget.menus,
                                child: Text(
                                  "组件",
                                  style: token.font.lg
                                      .copyWith(color: token.colorLink),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: child)
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class Menu {
  final bool group;

  final String title;

  final String? path;

  const Menu({required this.group, required this.title, this.path});
}

class MenuPopup extends StatelessWidget {
  final Widget child;
  final List<Menu> menus;

  const MenuPopup({super.key, required this.child, required this.menus});

  Widget buildMenu(Menu menu, BuildContext context, AntdLayerClose close) {
    var token = AntdTheme.ofToken(context);

    return AntdBox(
      onTap: () async {
        if (menu.path != null) {
          await close();
          Navigator.pushNamed(context, menu.path!);
        }
      },
      style: AntdBoxStyle(
          border: menu.group ? token.borderSide.bottom : null,
          margin: token.size.lg.left,
          padding:
              (menu.group ? token.size.default_.vertical : token.size.lg.top)
                  .marge(token.size.lg.right),
          textStyle: menu.group
              ? token.font.xs.copyWith(color: token.colorTextQuaternary)
              : token.font.default_),
      child: Text(menu.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    return AntdBox(
      child: child,
      onTap: () {
        AntdLayer.open(AntdPopup(
          position: AntdPosition.right,
          style: AntdPopupStyle(
              bodyStyle: AntdBoxStyle(width: 0.4 * mediaQueryData.size.width)),
          dismissOnMaskTap: true,
          showMask: true,
          builder: (close, ctx) {
            return AntdBox(
              child: AntdPositionList(
                  fit: AntdScrollItemFit.child,
                  items: menus,
                  itemBuilder: (entity) {
                    return AntdBox(
                      outerSafeArea:
                          entity.position == AntdScrollItemPosition.first
                              ? AntdPosition.top
                              : (entity.position == AntdScrollItemPosition.last
                                  ? AntdPosition.bottom
                                  : null),
                      child: buildMenu(entity.data, context, close),
                    );
                  }),
            );
          },
        ));
      },
    );
  }
}
