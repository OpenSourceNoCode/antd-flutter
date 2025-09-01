import 'package:antd_flutter/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

Widget getBox(bool top) {
  return AntdBox(
    style: AntdBoxStyle(
        height: top ? 300 : double.infinity,
        width: top ? double.infinity : 300,
        alignment: Alignment.center,
        color: Colors.white),
    child: AntdButton(
      child: const Text("点我关闭所有"),
      onTap: () {
        AntdLayer.closeAll();
      },
    ),
  );
}

/// @t 弹出方向
/// @d 上下左右四个方向
/// @l [AntdPopup]
class AntdPopupDemo extends StatelessWidget {
  const AntdPopupDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("底部打开"),
        onTap: () async {
          AntdLayer.open(AntdPopup(
            position: AntdPosition.bottom,
            builder: (close, ctx) {
              return getBox(true);
            },
          ));
        },
      ),
      AntdButton(
        child: const Text("顶部打开"),
        onTap: () {
          AntdLayer.open(AntdPopup(
            position: AntdPosition.top,
            builder: (close, ctx) {
              return getBox(true);
            },
          ));
        },
      ),
      AntdButton(
        child: const Text("左侧打开"),
        onTap: () {
          AntdLayer.open(AntdPopup(
            position: AntdPosition.left,
            builder: (close, ctx) {
              return getBox(false);
            },
          ));
        },
      ),
      AntdButton(
        child: const Text("右侧打开"),
        onTap: () {
          AntdLayer.open(AntdPopup(
            position: AntdPosition.right,
            builder: (close, ctx) {
              return getBox(false);
            },
          ));
        },
      )
    ]);
  }
}

/// @t 关闭按钮
/// @d 左右两侧已经默认做了安全区域处理
/// @l [AntdPopup]
class AntdPopupCloseDemo extends StatelessWidget {
  const AntdPopupCloseDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("左侧打开"),
        onTap: () {
          AntdLayer.open(AntdPopup(
            closeIcon: const AntdIcon(
              icon: AntdIcons.close,
            ),
            position: AntdPosition.left,
            builder: (close, ctx) {
              return getBox(false);
            },
          ));
        },
      ),
      AntdButton(
        child: const Text("顶部打开"),
        onTap: () {
          AntdLayer.open(AntdPopup(
            closeIcon: const AntdIcon(
              icon: AntdIcons.close,
            ),
            position: AntdPosition.top,
            builder: (close, ctx) {
              return getBox(true);
            },
          ));
        },
      ),
    ]);
  }
}

/// @t 自定义样式
/// @d 通过style覆盖样式
/// @l [AntdPopup]
class AntdPopupStyleDemo extends StatelessWidget {
  const AntdPopupStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdButton(
        child: const Text("圆角"),
        onTap: () {
          AntdLayer.open(AntdPopup(
            style: AntdPopupStyle(
                bodyStyle: AntdBoxStyle(radius: token.radius.lg.radius.top)),
            closeIcon: const AntdIcon(
              icon: AntdIcons.close,
            ),
            position: AntdPosition.bottom,
            builder: (close, ctx) {
              return getBox(true);
            },
          ));
        },
      ),
    ]);
  }
}

/// @t 嵌套弹出层
/// @d 支持多重嵌套
/// @l [AntdPopup]
class AntdPopupNestedDemo extends StatelessWidget {
  const AntdPopupNestedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdPopup(
              position: AntdPosition.left,
              builder: (close, ctx) {
                return AntdBox(
                  style: const AntdBoxStyle(alignment: Alignment.center),
                  child: AntdButton(
                    child: const Text("点我打开第二个"),
                    onTap: () {
                      AntdLayer.open(AntdPopup(
                        builder: (close, ctx) {
                          return getBox(false);
                        },
                      ));
                    },
                  ),
                );
              },
            ));
          },
          child: const Text("点我打开第一个")),
    ]);
  }
}

/// @t 事件
/// @l [AntdPopup]
class AntdPopupEventDemo extends StatelessWidget {
  const AntdPopupEventDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdPopup(
              onClosed: () {
                AntdToast.show("关闭了弹出层");
              },
              onOpened: () {
                AntdToast.show("打开了弹出层");
              },
              onMaskTap: () {
                AntdToast.show("点击了弹出层");
              },
              builder: (close, ctx) {
                return getBox(true);
              },
            ));
          },
          child: const Text("事件")),
    ]);
  }
}

/// @t 等待弹窗完成
/// @l [AntdPopup]
class AntdPopupWaitDemo extends StatelessWidget {
  const AntdPopupWaitDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () async {
            await AntdLayer.open(AntdPopup(
              builder: (close, ctx) {
                return getBox(true);
              },
            ));
            AntdToast.show(
              "弹出层关闭了我才出现的",
              duration: Duration(seconds: 0),
            );
          },
          child: const Text("等待完成")),
    ]);
  }
}

/// @t 避开键盘
/// @l [AntdPopup]
class AntdPopupAvoidKeyboardDemo extends StatelessWidget {
  const AntdPopupAvoidKeyboardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdButton(
          onTap: () async {
            AntdPopup(
              avoidKeyboard: true,
              builder: (close, ctx) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AntdInput(
                      placeholder: const Text("输入搜索内容"),
                      style: AntdInputStyle(
                          bodyStyle: AntdBoxStyle(
                              margin: token.size.md.all,
                              color: token.colorFillContent,
                              radius: token.radius.md.radius.all,
                              padding: token.size.md.all)),
                    ),
                    getBox(true)
                  ],
                );
              },
            ).open();
          },
          child: const Text("避开键盘")),
    ]);
  }
}
