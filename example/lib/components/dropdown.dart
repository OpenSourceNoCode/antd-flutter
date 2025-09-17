import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

/// @t 基础
/// @l [AntdDropdown]
class AntdDropdownDemo extends StatelessWidget {
  const AntdDropdownDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdDropdown(items: [
        AntdDropdownItem(
          item: (close, state) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AntdRadio(
                  extra: Text("综合排序"),
                ),
                AntdRadio(
                  extra: Text("距离最近"),
                ),
                AntdRadio(
                  extra: Text("排序最好"),
                )
              ],
            );
          },
          child: (open) {
            return const AntdBox(
              child: Text("排序"),
            );
          },
        ),
      ]),
    ]);
  }
}

/// @t 多列
/// @l [AntdDropdown]
class AntdDropdownColumnDemo extends StatelessWidget {
  const AntdDropdownColumnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdDropdown(items: [
        AntdDropdownItem(
          item: (close, state) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AntdRadio(
                  extra: Text("综合排序"),
                ),
                AntdRadio(
                  extra: Text("距离最近"),
                ),
                AntdRadio(
                  extra: Text("排序最好"),
                )
              ],
            );
          },
          child: (open) {
            return const AntdBox(
              child: Text("排序"),
            );
          },
        ),
        AntdDropdownItem(
          item: (close, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AntdBox(
                      child: Text(
                        "配送距离",
                        style: token.font.ms
                            .copyWith(color: token.colorText.secondary),
                      ),
                    ),
                    const AntdSlider(
                      ticks: true,
                      step: 10,
                    )
                  ],
                ),
              ],
            );
          },
          child: (open) {
            return const AntdBox(
              child: Text("筛选"),
            );
          },
        ),
      ]),
    ]);
  }
}

/// @t 内部关闭
/// @l [AntdDropdown]
class AntdDropdownCloseDemo extends StatelessWidget {
  const AntdDropdownCloseDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 200),
      child: DemoWrapper(child: [
        AntdDropdown(
          dismissOnMaskTap: false,
          items: [
            AntdDropdownItem(
              item: (close, state) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AntdRadio(
                      extra: Text("综合排序"),
                    ),
                    AntdRadio(
                      extra: Text("距离最近"),
                    ),
                    AntdRadio(
                      extra: Text("排序最好"),
                    )
                  ],
                );
              },
              child: (open) {
                return const AntdBox(
                  child: Text("排序"),
                );
              },
            ),
            AntdDropdownItem(
              item: (close, state) {
                return const AntdSlider(
                  ticks: true,
                  step: 10,
                );
              },
              child: (open) {
                return const AntdBox(
                  child: Text("筛选"),
                );
              },
            ),
          ],
          extra: (close, _) {
            return AntdButton(
              onTap: () {
                close();
              },
              child: Text("确定"),
            );
          },
        ),
      ]),
    );
  }
}
