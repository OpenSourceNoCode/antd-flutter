import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 基础用法
/// @l [AntdBox]
class AntdBoxDemo extends StatelessWidget {
  const AntdBoxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
            style: AntdBoxStyle(
                alignment: Alignment.center,
                size: 100,
                color: token.colorPrimary,
                radius: 40.radius.all,
                border: token.border
                    .copyWith(color: token.colorSuccess, width: 10)
                    .all,
                textStyle: token.font.md.copyWith(color: token.colorWhite)),
            child: const Text(
              "我是文字",
            ),
          ),
        ]);
  }
}

Widget _buildBg(Widget child) {
  return AntdTokenBuilder(builder: (context, token) {
    return AntdBox(
      style: AntdBoxStyle(
          alignment: Alignment.center,
          color: token.colorPrimary,
          height: 200,
          width: double.infinity),
      child: child,
    );
  });
}

/// @t 布局
/// @l [AntdBox]
class AntdLayoutDemo extends StatelessWidget {
  const AntdLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      _buildBg(AntdBox(
        style: AntdBoxStyle(
            height: 100,
            width: 200,
            color: token.colorSuccess,
            textStyle: token.font.md.copyWith(color: token.colorWhite)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "指定宽高",
            ),
            Text(
              "height:100,width: 150",
            )
          ],
        ),
      )),
      _buildBg(AntdBox(
        style: AntdBoxStyle(
            size: 100,
            radius: 100.radius.all,
            alignment: Alignment.center,
            color: token.colorSuccess,
            textStyle: token.font.md.copyWith(color: token.colorWhite)),
        child: const Text(
          "圆角",
        ),
      )),
      _buildBg(AntdBox(
        style: AntdBoxStyle(
            width: 0.6,
            height: 100,
            layoutModes: [
              AntdBoxLayoutMode.factorWidth,
              AntdBoxLayoutMode.fixedHeight
            ],
            color: token.colorSuccess,
            alignment: Alignment.center,
            textStyle: token.font.md.copyWith(color: token.colorWhite)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "宽度百分比高度固定",
            ),
            Text(
              "width: 0.6,height: 100",
            )
          ],
        ),
      )),
      _buildBg(AntdBox(
        style: AntdBoxStyle(
            height: 0.6,
            width: 200,
            color: token.colorSuccess,
            layoutModes: [
              AntdBoxLayoutMode.factorHeight,
              AntdBoxLayoutMode.fixedWidth
            ],
            alignment: Alignment.center,
            textStyle: token.font.md.copyWith(color: token.colorWhite)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "高度百分比宽度固定",
            ),
            Text(
              "height: 0.6,width: 200,",
            )
          ],
        ),
      )),
      _buildBg(AntdBox(
        style: AntdBoxStyle(
            height: 0.8,
            width: 0.8,
            color: token.colorSuccess,
            layoutModes: [
              AntdBoxLayoutMode.factorHeight,
              AntdBoxLayoutMode.factorWidth
            ],
            alignment: Alignment.center,
            textStyle: token.font.md.copyWith(color: token.colorWhite)),
        child: const Text(
          "宽高百分比,height: 0.8,width: 0.8",
        ),
      )),
      _buildBg(AntdBox(
        style: AntdBoxStyle(
            color: token.colorSuccess,
            textStyle: token.font.md.copyWith(color: token.colorWhite)),
        child: const Text(
          "内容自适应",
        ),
      )),
      _buildBg(AntdBox(
        style: AntdBoxStyle(
            height: 9,
            width: 16,
            layoutModes: [AntdBoxLayoutMode.aspectRatio],
            color: token.colorSuccess,
            alignment: Alignment.center,
            textStyle: token.font.md.copyWith(color: token.colorWhite)),
        child: const Text(
          "16:9宽高比",
        ),
      )),
      _buildBg(AntdBox(
        style: AntdBoxStyle(
            height: 3,
            width: 4,
            layoutModes: [AntdBoxLayoutMode.aspectRatio],
            color: token.colorSuccess,
            textStyle: token.font.md.copyWith(color: token.colorWhite)),
        child: const Text(
          "4:3宽高比",
        ),
      ))
    ]);
  }
}

/// @t 毛玻璃
/// @l [AntdBox]
class AntdBackdropFilterDemo extends StatelessWidget {
  const AntdBackdropFilterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
            style: AntdBoxStyle(
              alignment: Alignment.center,
              size: 100,
              backdropFilter: 25,
              color: token.colorSuccess.withValues(alpha: 0.8),
            ),
            child: const Text("我是文字"),
          )
        ]);
  }
}

/// @t 阴影和渐变
/// @l [AntdBox]
class AntdShadowsGradientDemo extends StatelessWidget {
  const AntdShadowsGradientDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
            style: AntdBoxStyle(
                size: 100,
                alignment: Alignment.center,
                color: token.colorPrimary,
                radius: 6.radius.all,
                textStyle: TextStyle(color: token.colorWhite),
                gradient: LinearGradient(
                    colors: [token.colorSuccess, token.colorBlack]),
                shadows: [
                  BoxShadow(
                      color: token.colorError,
                      offset: const Offset(-20, -20),
                      spreadRadius: 20,
                      blurRadius: 20)
                ]),
            child: const Text("我是文字"),
          )
        ]);
  }
}

class AntdVisibilityDemo extends StatefulWidget {
  const AntdVisibilityDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdVisibilityDemoStateDemo();
  }
}

/// @t 隐藏和可见
/// @l [AntdBox]
class _AntdVisibilityDemoStateDemo extends State<AntdVisibilityDemo> {
  String? value;

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          Column(
            children: [
              AntdSegmented(
                  value: value,
                  onChange: (value) {
                    setState(() {
                      this.value = value;
                    });
                  },
                  items: [
                    AntdSegmentedItem(
                      value: AntdVisibility.hidden.name,
                      child: const Text("hidden(不占空间)"),
                    ),
                    AntdSegmentedItem(
                      value: AntdVisibility.visible.name,
                      child: const Text("visible(空间不变)"),
                    )
                  ]),
              AntdBox(
                style: AntdBoxStyle(
                  size: 100,
                  visibility: AntdVisibility.values
                      .where((data) => data.name == value)
                      .firstOrNull,
                ),
                child: const Text("完全隐藏"),
              ),
            ],
          )
        ]);
  }
}

/// @t 对齐模式
/// @l [AntdBox]
class AntdAlignmentDemo extends StatelessWidget {
  const AntdAlignmentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: <Alignment>[
          Alignment.center,
          Alignment.centerLeft,
          Alignment.centerRight,
          Alignment.topCenter,
          Alignment.topLeft,
          Alignment.topRight,
          Alignment.bottomCenter,
          Alignment.bottomLeft,
          Alignment.bottomRight,
        ].map((v) {
          return AntdBox(
            style: AntdBoxStyle(
                size: 100,
                color: token.colorPrimary,
                alignment: v,
                textStyle: TextStyle(color: token.colorWhite)),
            child: Text(v.toString().replaceAll("Alignment.", "")),
          );
        }).toList());
  }
}

/// @t 安全区 会自动合并margin和padding
/// @l [AntdBox]
class AntdSafeAreaDemo extends StatelessWidget {
  const AntdSafeAreaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
            style: AntdBoxStyle(color: token.colorError),
            child: AntdBox(
              outerSafeArea: AntdPosition.bottom,
              style: AntdBoxStyle(
                size: 100,
                padding: 30.bottom,
                textStyle: TextStyle(color: token.colorWhite),
                color: token.colorPrimary,
              ),
              child: const Text("底部外安全区"),
            ),
          ),
          AntdBox(
            child: AntdBox(
              innerSafeArea: AntdPosition.top,
              style: AntdBoxStyle(
                size: 100,
                color: token.colorError,
                padding: 30.top,
                textStyle: TextStyle(color: token.colorWhite),
              ),
              child: AntdBox(
                style: AntdBoxStyle(color: token.colorPrimary),
                child: const Text("顶部内安全区"),
              ),
            ),
          )
        ]);
  }
}

/// @t style直接render一个Widget
/// @l [AntdBox]
class AntdStyleRenderDemo extends StatelessWidget {
  const AntdStyleRenderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdKitStyle(
                  height: 50,
                  width: 50,
                  color: token.colorError,
                  alignment: Alignment.center)
              .render(),
          AntdKitStyle(
                  height: 50,
                  width: 50,
                  color: token.colorPrimary,
                  alignment: Alignment.center)
              .render(Text(
            "Render",
            style: token.font.ms.copyWith(color: token.colorWhite),
          )),
        ]);
  }
}

/// @t 事件
/// @l [AntdBox]
class AntdEventDemo extends StatelessWidget {
  const AntdEventDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var style = AntdBoxStyle(
        size: 100,
        alignment: Alignment.center,
        textStyle: TextStyle(color: token.colorWhite),
        color: token.colorPrimary);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
            style: style,
            onTap: () {
              AntdToast.show("触发了单击");
            },
            child: const Text("单机"),
          ),
          AntdBox(
            style: style,
            onDoubleTap: () {
              AntdToast.show("触发了双击");
            },
            child: const Text("双击"),
          ),
          AntdBox(
            style: style,
            onLongPress: () {
              AntdToast.show("触发了长按");
            },
            child: const Text("长按"),
          ),
          AntdBox(
            style: style,
            onTap: () {
              AntdToast.show("单击");
            },
            onDoubleTap: () {
              AntdToast.show("双击");
            },
            onLongPress: () {
              AntdToast.show("长按");
            },
            child: const Text("同时存在"),
          ),
          AntdBox(
            style: style,
            disabled: true,
            onTap: () {
              AntdToast.show("单击");
            },
            onDoubleTap: () {
              AntdToast.show("双击");
            },
            onLongPress: () {
              AntdToast.show("长按");
            },
            options: const AntdTapOptions(alwaysTriggerTap: true),
            child: const Text("禁用"),
          ),
          AntdBox(
            style: AntdBoxStyle(
                size: 100,
                alignment: Alignment.center,
                textStyle: TextStyle(color: token.colorWhite),
                color: token.colorPrimary),
            onTap: () {
              AntdToast.show("虽然移动了 但还是触发了单击");
            },
            options: const AntdTapOptions(allowOffset: true),
            child: const Text("移动后触发"),
          ),
          AntdBox(
            style: style,
            onTap: () {
              AntdToast.show("触发后500毫秒才执行单击");
            },
            onDoubleTap: () {
              AntdToast.show("触发后500毫秒才执行双击");
            },
            onLongPress: () {
              AntdToast.show("触发后500毫秒才执行长按");
            },
            options:
                const AntdTapOptions(debounce: Duration(milliseconds: 500)),
            child: const Text("防抖 500毫秒"),
          ),
          AntdBox(
            style: style,
            onTap: () {
              AntdToast.show("1s内执行一次单击");
            },
            onDoubleTap: () {
              AntdToast.show("1s内执行一次双击");
            },
            onLongPress: () {
              AntdToast.show("1s内执行一次长按");
            },
            options:
                const AntdTapOptions(debounce: Duration(milliseconds: 1000)),
            child: const Text("节流 1s"),
          ),
          AntdBox(
            style: style,
            onTap: () {
              AntdToast.show("触发单击");
            },
            onDoubleTap: () {
              AntdToast.show("触发双击");
            },
            onLongPress: () {
              AntdToast.show("触发长按");
            },
            options: const AntdTapOptions(alwaysTriggerTap: true),
            child: const Text("一直触发单击"),
          ),
        ]);
  }
}

/// @t 穿透
/// @d 蓝色会接收到所有事件,绿色和红色则不会
/// @l [AntdBox]
class AntdListenerDemo extends StatelessWidget {
  const AntdListenerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var style = AntdBoxStyle(
        size: 300,
        alignment: Alignment.center,
        textStyle: TextStyle(color: token.colorWhite),
        color: token.colorPrimary);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
            style: style,
            onTap: () {
              AntdToast.show("触发蓝色单击");
            },
            onDoubleTap: () {
              AntdToast.show("触发蓝色双击");
            },
            onLongPress: () {
              AntdToast.show("触发蓝色长按");
            },
            options: const AntdTapOptions(alwaysReceiveTap: true),
            child: AntdBox(
              onTap: () {
                AntdToast.show("触发红色单击");
              },
              onDoubleTap: () {
                AntdToast.show("触发红色双击");
              },
              onLongPress: () {
                AntdToast.show("触发红色长按");
              },
              style: style
                  .copyFrom(const AntdBoxStyle(size: 200, color: Colors.red)),
              child: AntdBox(
                onTap: () {
                  AntdToast.show("触发绿色单击");
                },
                onDoubleTap: () {
                  AntdToast.show("触发绿色双击");
                },
                onLongPress: () {
                  AntdToast.show("触发绿色长按");
                },
                style: style.copyFrom(
                    const AntdBoxStyle(size: 100, color: Colors.green)),
                child: const Text("允许穿透"),
              ),
            ),
          ),
        ]);
  }
}

/// @t 按下时反馈
/// @d 通过feedbackStyle完全自定义样式
/// @l [AntdBox]
class AntdFeedbackStyleDemo extends StatelessWidget {
  const AntdFeedbackStyleDemo({super.key});
  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var style = AntdBoxStyle(
        height: 200,
        width: double.infinity,
        alignment: Alignment.center,
        textStyle: TextStyle(color: token.colorWhite),
        border: token.border.copyWith(color: token.colorError).all,
        color: token.colorPrimary,
        feedbackStyle: AntdBoxStyle(
            textStyle: TextStyle(color: token.colorPrimary),
            border:
                token.border.copyWith(width: 2, color: token.colorPrimary).all,
            color: token.colorSuccess));
    return DemoWrapper(child: [
      AntdBox(
        style: style,
        child: const Text("按下时反馈"),
      ),
      AntdBox(
        style: style,
        options: const AntdTapOptions(feedbackDuration: Duration(seconds: 2)),
        child: const Text("自定义反馈时长"),
      )
    ]);
  }
}

/// @t 自定义样式
/// @l [AntdBox]
class AntdStylCustomDemo extends StatelessWidget {
  const AntdStylCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(
        outline: true,
        style: const AntdBoxStyle(alignment: Alignment.center),
        child: [
          AntdBox(
            style: AntdBoxStyle(
                height: 200,
                alignment: Alignment.center,
                textStyle: token.font.lg.copyWith(color: token.colorWhite),
                width: double.infinity,
                color: token.colorPrimary,
                border: token.border
                    .copyWith(color: token.colorSuccess, width: 2)
                    .all),
            child: const Text("通过style设置样式"),
          ),
          AntdBox(
            styleBuilder: (context, box, style, token) {
              return AntdBoxStyle(
                  height: 200,
                  alignment: Alignment.center,
                  textStyle: token.font.lg.copyWith(color: token.colorWhite),
                  width: double.infinity,
                  color: token.colorSuccess,
                  border: token.border
                      .copyWith(color: token.colorError, width: 2)
                      .all);
            },
            child: const Text("通过styleBuilder设置样式"),
          ),
          AntdStyleProvider(
              style: AntdBoxStyle(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  textStyle: token.font.lg.copyWith(color: token.colorWhite),
                  color: token.colorPrimary),
              child: Column(
                children: [
                  AntdBox(
                    child: Text("通过AntdStyleProvider统一设置"),
                  ),
                  AntdBox(
                    style: AntdBoxStyle(margin: 10.top),
                    child: Text("通过AntdStyleProvider统一设置"),
                  ),
                ],
              )),
          AntdStyleBuilderProvider<AntdBoxStyle, AntdBox>(
              builder: (context, box, style, token) {
                return AntdBoxStyle(
                    height: 100,
                    width: double.infinity,
                    alignment: Alignment.center,
                    textStyle: token.font.lg.copyWith(color: token.colorWhite),
                    color: token.colorSuccess);
              },
              child: Column(
                children: [
                  const AntdBox(
                    child: Text("通过AntdStyleBuilderProvider统一设置"),
                  ),
                  AntdBox(
                    style: AntdBoxStyle(margin: 10.top),
                    child: const Text("通过AntdStyleBuilderProvider统一设置"),
                  ),
                ],
              )),
          AntdBox(
            disabled: true,
            style: AntdBoxStyle(
                height: 200,
                width: double.infinity,
                color: Colors.green,
                disabledStyle: AntdBoxStyle(
                    size: 100,
                    color: token.colorError,
                    alignment: Alignment.center,
                    textStyle: token.font.lg.copyWith(color: token.colorWhite),
                    border: token.border
                        .copyWith(color: token.colorPrimary, width: 3)
                        .all)),
            child: const Text("禁用样式"),
          ),
        ]);
  }
}
