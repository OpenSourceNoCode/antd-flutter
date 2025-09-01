// import 'package:antd_flutter_mobile/index.dart';
// import 'package:example/widget/demo.dart';
// import 'package:flutter/widgets.dart';
//
// const url =
//     "https://images.unsplash.com/photo-1620476214170-1d8080f65cdb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3150&q=80";
//
// /// @t 单张预览
// /// @l [AntdImageViewer]
// class AntdImageViewerDemo extends StatelessWidget {
//   const AntdImageViewerDemo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DemoWrapper(child: [
//       AntdButton(
//         child: const Text("显示图片"),
//         onTap: () {
//           AntdLayer.open(AntdImageViewer(
//               images: List.generate(
//                   1,
//                   (i) => const AntdImage(
//                         height: 400,
//                         image: AntdResource(url: url),
//                       ))));
//         },
//       )
//     ]);
//   }
// }
//
// /// @t 多张预览
// /// @l [AntdImageViewer]
// class AntdImageViewerMutileDemo extends StatelessWidget {
//   const AntdImageViewerMutileDemo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DemoWrapper(child: [
//       AntdButton(
//         child: const Text("显示图片"),
//         onTap: () {
//           AntdLayer.open(AntdImageViewer(
//               images: List.generate(
//                   2,
//                   (i) => const AntdImage(
//                         height: 400,
//                         image: AntdResource(url: url),
//                       ))));
//         },
//       )
//     ]);
//   }
// }
//
// /// @t 自定义底部内容
// /// @l [AntdImageViewer]
// class AntdImageFooterDemo extends StatelessWidget {
//   const AntdImageFooterDemo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var token = AntdTheme.ofToken(context);
//
//     return DemoWrapper(child: [
//       AntdButton(
//         child: const Text("显示图片"),
//         onTap: () {
//           AntdLayer.open(AntdImageViewer(
//               footer: Center(
//                 child: AntdBox(
//                   style: AntdBoxStyle(
//                       padding: 8.all,
//                       margin: 12.bottom,
//                       color: token.colorFillContent,
//                       radius:
//                           Radius.circular(token.size.xxl.roundToDouble()).all),
//                   child: const Text("查看更多"),
//                 ),
//               ),
//               images: List.generate(
//                   2,
//                   (i) => const AntdImage(
//                         height: 400,
//                         image: AntdResource(url: url),
//                       ))));
//         },
//       )
//     ]);
//   }
// }
