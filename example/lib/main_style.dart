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
                        border: token.borderSide
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
