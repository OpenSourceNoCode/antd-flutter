import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    navigatorObservers: [AntdLayer.observer],
    home: AntdTokenBuilder(builder: (context, token) {
      return AntdBox(
        style: AntdBoxStyle(
            color: token.colorFillTertiary, alignment: Alignment.center),
        child: AntdButton(
          onTap: () {
            AntdToast.show(
              "Toast",
              position: AntdToastPosition.top,
            );
          },
          child: const Text("Button"),
        ),
      );
    }),
  ));
}
