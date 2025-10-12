import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    navigatorObservers: [AntdLayer.observer],
    home: AntdStyleBuilderProvider<AntdBoxStyle, AntdBox>(

        /// 1
        builder: (
          context,
          box,
          style,
          token,
        ) {
          return AntdBoxStyle(
              color: token.colorPrimary,
              size: 100,
              textStyle: token.font.md.copyWith(color: token.colorSuccess),
              alignment: Alignment.center);
        },
        child: Row(
          children: [
            AntdStyleProvider<AntdBoxStyle>(

                /// 2
                style: const AntdBoxStyle(size: 50),
                child: AntdBox(
                  /// 4
                  style: AntdBoxStyle(
                      radius: 10.radius.all,
                      textStyle: const TextStyle(color: Colors.white)),

                  /// 3
                  styleBuilder: (
                    context,
                    box,
                    style,
                    token,
                  ) {
                    return AntdBoxStyle(
                        border: token.border
                            .copyWith(color: token.colorSuccess, width: 3)
                            .all);
                  },
                  child: const Text("box1"),
                )),
            AntdBox(
              style: AntdBoxStyle(margin: 10.left),
              child: const Text("box2"),
            )
          ],
        )),
  ));
}

void mainStyleBuilder() async {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    ///style和styleBuilder任选其一即可,当同时存在时，style优先级更高
    return AntdStyleProvider<AntdButtonStyle>(
        style:
            const AntdButtonStyle(buttonStyle: AntdBoxStyle(color: Colors.red)),
        child: AntdStyleBuilderProvider<AntdButtonStyle, AntdButton>(
            builder: (context, button, style, token) {
              if (button.size == AntdSize.large) {
                return AntdButtonStyle(
                    buttonStyle: AntdBoxStyle(color: token.colorPrimary));
              }
              return AntdButtonStyle(
                  buttonStyle: AntdBoxStyle(color: token.colorError));
            },
            child: const AntdButton(
              child: Text("我是一个按钮"),
            )));
  }
}

// void main_demo() async {
//   runApp(const App());
// }
//
// class App extends StatefulWidget {
//   const App({super.key});
//
//   @override
//   State<StatefulWidget> createState() {
//     return _AppState();
//   }
// }
//
// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return AntdProvider(
//         theme: AntdTheme(buttonStyle: (context, button, style, token) {
//       /// 1 主题动态构建的样式
//       return AntdButtonStyle(
//           buttonStyle: AntdBoxStyle(radius: token.radius.lg.all));
//     }), builder: (context, theme) {
//       return AntdStyleProvider<AntdButtonStyle>(
//
//           /// 2 局部静态样式
//           style: const AntdButtonStyle(
//               buttonStyle: AntdBoxStyle(color: Colors.red)),
//
//           /// 3 局部动态样式
//           child: AntdStyleBuilderProvider<AntdButtonStyle, AntdButton>(
//               builder: (context, button, style, token) {
//                 if (button.size == AntdSize.large) {
//                   return AntdButtonStyle(
//                       buttonStyle: AntdBoxStyle(color: token.colorPrimary));
//                 }
//                 return AntdButtonStyle(
//                     buttonStyle: AntdBoxStyle(color: token.colorError));
//               },
//               child: AntdButton(
//                 /// 4 组件静态样式
//                 style: AntdButtonStyle(
//                   buttonStyle: AntdBoxStyle(
//                       textStyle: const TextStyle(fontSize: 15),
//                       radius: 15.radius.all),
//                 ),
//                 child: const Text("我是一个按钮"),
//               )));
//     });
//   }
// }
