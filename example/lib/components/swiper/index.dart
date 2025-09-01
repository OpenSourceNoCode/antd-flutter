import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

class AntdSwiperControllerDemo extends StatefulWidget {
  const AntdSwiperControllerDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdSwiperControllerDemoStateDemo();
  }
}

/// @t 手动控制
/// @l [AntdSwiper]
class _AntdSwiperControllerDemoStateDemo
    extends State<AntdSwiperControllerDemo> {
  AntdSwiperController controller = AntdSwiperController();

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var colors = [
      token.colorPrimaryActive,
      token.colorWarningActive,
      token.colorSuccessActive,
      token.colorErrorActive
    ];
    var intdex = 1;
    return DemoWrapper(child: [
      Column(
        children: [
          SizedBox(
            height: 200,
            child: AntdSwiper(
                onChange: (index) {
                  AntdToast.show("当前是index:$index");
                },
                shrinkWrap: false,
                loop: true,
                controller: controller,
                items: colors.map((value) {
                  return AntdBox(
                    style: AntdBoxStyle(height: 200, color: value),
                    child: Text("${intdex++}"),
                  );
                }).toList()),
          ),
          Row(
            children: [
              AntdButton(
                onTap: () {
                  controller.previous();
                },
                child: Text("上一张"),
              ),
              AntdButton(
                onTap: () {
                  controller.next();
                },
                child: Text("下一张"),
              )
            ],
          )
        ],
      )
    ]);
  }
}

/// @t 自定义样式
/// @l [AntdSwiper]
class AntdSwiperStyleDemo extends StatelessWidget {
  const AntdSwiperStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var colors = [
      token.colorPrimaryActive,
      token.colorWarningActive,
      token.colorSuccessActive,
      token.colorErrorActive
    ];
    return DemoWrapper(child: [
      SizedBox(
        height: 200,
        child: AntdSwiper(
            loop: true,
            items: colors.map((value) {
              return AntdBox(
                style: AntdBoxStyle(height: 200, color: value),
              );
            }).toList()),
      ),
    ]);
  }
}

/// @t 自定义指示器
/// @l [AntdSwiper]
class AntdSwiperCustomIndicatorDemo extends StatelessWidget {
  const AntdSwiperCustomIndicatorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var colors = [
      token.colorPrimaryActive,
      token.colorWarningActive,
      token.colorSuccessActive,
      token.colorErrorActive
    ];
    return DemoWrapper(child: [
      SizedBox(
        height: 200,
        child: AntdSwiper(
            loop: true,
            indicatorBuilder: (index, total) {
              return Positioned(
                  top: 6,
                  right: 0,
                  child: Center(
                    child: AntdBox(
                      style: AntdBoxStyle(
                          padding: 2.all,
                          color: Colors.black.withValues(alpha: 0.4)),
                      child: Text(
                        "$index/$total",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ));
            },
            items: colors.map((value) {
              return AntdBox(
                style: AntdBoxStyle(height: 200, color: value),
              );
            }).toList()),
      ),
    ]);
  }
}

/// @t 无指示器
/// @l [AntdSwiper]
class AntdSwiperNoneIndicatorDemo extends StatelessWidget {
  const AntdSwiperNoneIndicatorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var colors = [
      token.colorPrimaryActive,
      token.colorWarningActive,
      token.colorSuccessActive,
      token.colorErrorActive
    ];
    return DemoWrapper(child: [
      SizedBox(
        height: 200,
        child: AntdSwiper(
            loop: true,
            indicatorBuilder: (index, total) {
              return const AntdBox();
            },
            items: colors.map((value) {
              return AntdBox(
                style: AntdBoxStyle(height: 200, color: value),
              );
            }).toList()),
      ),
    ]);
  }
}

/// @t 全屏引导
/// @l [AntdSwiper]
class AntdSwiperFullPageDemo extends StatelessWidget {
  const AntdSwiperFullPageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var colors = [
      token.colorPrimaryActive,
      token.colorWarningActive,
      token.colorSuccessActive,
      token.colorErrorActive
    ];
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("全屏展示"),
        onTap: () {
          AntdLayer.open(AntdPopup(
            style: const AntdPopupStyle(bodyStyle: AntdBoxStyle(height: 1)),
            builder: (controller, ctx) {
              return AntdSwiper(
                  indicatorBuilder: (index, total) {
                    return const AntdBox();
                  },
                  items: colors.map((value) {
                    return AntdBox(
                      style: AntdBoxStyle(color: value),
                    );
                  }).toList());
            },
          ));
        },
      )
    ]);
  }
}
