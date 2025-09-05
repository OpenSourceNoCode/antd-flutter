import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AntdProvider(
      theme: AntdTheme(
          buttonStyle: (context, button, style, token) {
            if (button.size == AntdSize.large) {
              return AntdButtonStyle(
                  buttonStyle: AntdBoxStyle(color: token.colorWarning));
            }
            return style;
          },
          token: generateToken(
            const AntdBaseToken(
              radiusSize: 6,
              colorError: Color(0xffff3141),
              colorInfo: Color(0xff1677ff),
              colorLink: Color(0xff1677ff),
              colorPrimary: Color(0xffad05ef),
              colorSuccess: Color(0xff00b578),
              colorTextBase: Color(0xff171717),
              colorBgBase: Color(0xffffffff),
              colorWarning: Color(0xffff8f1f),
              fontSize: 14,
              lineType: '',
              lineWidth: 2,
              sizeStep: 4,
              sizeUnit: 2,
            ),
          )),
      builder: (context, theme) {
        return MaterialApp(
          builder: (context, child) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AntdButton(
                  child: Text("Pick Button"),
                ),
                AntdButton(
                  size: AntdSize.large,
                  child: Text("Waining Button"),
                )
              ],
            );
          },
        );
      }));
}
