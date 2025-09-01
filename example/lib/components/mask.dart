import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 事件
/// @l [AntdMask]
class AntdMaskDemo extends StatelessWidget {
  const AntdMaskDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdMask(
              onClosed: () {
                AntdToast.show("关闭了蒙层");
              },
              onOpened: () {
                AntdToast.show("打开了蒙层");
              },
              onMaskTap: () {
                AntdToast.show("点击了蒙层");
              },
            ));
          },
          child: const Text("显示背景蒙层"))
    ]);
  }
}

/// @t 不同的透明度
/// @d 可以通过Style覆盖
/// @l [AntdMask]
class AntdMaskOpacityDemo extends StatelessWidget {
  const AntdMaskOpacityDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(const AntdMask(
              opacity: AntdMaskOpacity.thin,
            ));
          },
          child: const Text("显示浅一些的背景蒙层")),
      AntdButton(
          onTap: () {
            AntdLayer.open(const AntdMask(
              opacity: AntdMaskOpacity.thick,
            ));
          },
          child: const Text("显示深一些的背景蒙层")),
      AntdButton(
          onTap: () {
            AntdLayer.open(const AntdMask(
              style: AntdMaskStyle(maskOpacity: 1),
            ));
          },
          child: const Text("显示自定义的背景蒙层"))
    ]);
  }
}

/// @t 蒙层颜色
/// @d 可以通过Style覆盖
/// @l [AntdMask]
class AntdMaskColorDemo extends StatelessWidget {
  const AntdMaskColorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(const AntdMask(
              style: AntdMaskStyle(maskColor: Colors.white),
            ));
          },
          child: const Text("显示白色的背景蒙层")),
      AntdButton(
          onTap: () {
            AntdLayer.open(const AntdMask(
              style: AntdMaskStyle(maskColor: Colors.red),
            ));
          },
          child: const Text("显示红色的背景蒙层")),
    ]);
  }
}

/// @t 嵌套蒙层
/// @d 支持多重嵌套
/// @l [AntdMask]
class AntdMaskNestedDemo extends StatelessWidget {
  const AntdMaskNestedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdMask(
              builder: (controller, ctx) {
                return Center(
                  child: AntdButton(
                    child: const Text("点我打开第二个"),
                    onTap: () {
                      AntdLayer.open(AntdMask(
                        builder: (controller, ctx) {
                          return Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "我是第二个的内容",
                                  style: TextStyle(color: Colors.white),
                                ),
                                AntdButton(
                                  child: const Text("点我关闭所有"),
                                  onTap: () {
                                    AntdLayer.closeAll();
                                  },
                                )
                              ],
                            ),
                          );
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

/// @t 没有蒙层
/// @d 没有蒙层，所有和蒙层相关的属性消息，并且点击能穿透下层
/// @l [AntdMask]
class AntdMaskHiddenDemo extends StatelessWidget {
  const AntdMaskHiddenDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdMask(
              showMask: false,
              style: const AntdMaskStyle(maskColor: Colors.white),
              builder: (close, ctx) {
                return Center(
                  child: AntdButton(
                    child: const Text("点我关闭"),
                    onTap: () {
                      close();
                    },
                  ),
                );
              },
            ));
          },
          child: const Text("显示白色的背景蒙层")),

      ///如果要外部关闭可以指定一个key
      AntdButton(
          onTap: () {
            AntdLayer.open(AntdMask(
              key: ValueKey("out-close"),
              showMask: false,
              style: const AntdMaskStyle(maskColor: Colors.white),
              builder: (close, ctx) {
                return Center(
                  child: AntdButton(
                    child: const Text("我打开了"),
                  ),
                );
              },
            ));
          },
          child: const Text("外部关闭")),
      AntdButton(
        child: Text("我来关闭刚才打开的蒙层"),
        onTap: () {
          AntdLayer.closeByKey(ValueKey("out-close"));
        },
      )
    ]);
  }
}

/// @t 等待蒙层关闭
/// @l [AntdMask]
class AntdMaskWaitDemo extends StatelessWidget {
  const AntdMaskWaitDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdButton(
          onTap: () async {
            await AntdLayer.open(const AntdMask());
            AntdToast.show("蒙层关闭了");
          },
          child: const Text("打开后等待关闭")),
    ]);
  }
}
