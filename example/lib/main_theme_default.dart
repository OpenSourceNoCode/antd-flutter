import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AntdProvider(
      theme: const AntdTheme(
        /// 亮色 或者 暗色两个枚举
        mode: AntdThemeMode.light,
      ),
      builder: (context, theme) {
        return MaterialApp(
          builder: (context, child) {
            return const AntdButton(
              size: AntdSize.large,
              child: Text("Waining Button"),
            );
          },
        );
      }));
}

void mainCustomer() {
  runApp(AntdProvider(
      theme: const AntdTheme(

          /// 亮色 或者 暗色两个枚举
          mode: AntdThemeMode.light,

          /// 传入你的Token 比如主色，文字色
          //token: AntdSeedToken(),

          /// 一般不需要你实现算法 使用mode 即可
          algorithms: []),
      builder: (context, theme) {
        return MaterialApp(
          builder: (context, child) {
            return const AntdButton(
              size: AntdSize.large,
              child: Text("Waining Button"),
            );
          },
        );
      }));
}
