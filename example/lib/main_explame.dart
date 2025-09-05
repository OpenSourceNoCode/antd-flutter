import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    builder: (context, child) {
      return const Center(
        child: AntdButton(
          child: Text("Button"),
        ),
      );
    },
  ));
}
