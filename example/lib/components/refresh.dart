import 'dart:math';

import 'package:antd_flutter/index.dart';
import 'package:example/components/bar/slider.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

class AntdPullToRefreshDemo extends StatefulWidget {
  const AntdPullToRefreshDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdPullToRefreshDemoStateDemo();
  }
}

var style = AntdBoxStyle(
    alignment: Alignment.center,
    width: double.infinity,
    color: defaultToken.colorPrimary);

final random = Random();
int min = 40;
int max = 90;

int getHeight() {
  return min + random.nextInt(max - min + 1);
}

/// @t 基础用法
/// @l [AntdPullToRefresh]
class _AntdPullToRefreshDemoStateDemo extends State<AntdPullToRefreshDemo> {
  List<int> data = List.generate(10, (i) => i);

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(outline: true, child: [
      DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: AntdPullToRefresh(
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 200));
              setState(() {
                data = [...data, ...List.generate(10, (i) => i)];
              });
            },
            onChange: (status) {
              AntdToast.show("$status");
            },
            initialDelay: const Duration(seconds: 2),
            initialPrompt: AntdBox(
              style: style.copyWith(height: getHeight().toDouble()),
              child: const Text("我是初始展示的内容"),
            ),
            releasePrompt: AntdBox(
              style: style.copyWith(height: getHeight().toDouble()),
              child: const Text("现在释放立即刷新"),
            ),
            completionPrompt: AntdBox(
              style: style.copyWith(height: getHeight().toDouble()),
              child: const Text("刷新完成了"),
            ),
            pullingPrompt: AntdBox(
              style: style.copyWith(height: getHeight().toDouble()),
              child: const Text("用力下拉刷新"),
            ),
            refreshingPrompt: AntdBox(
              style: style.copyWith(height: getHeight().toDouble()),
              child: const AntdLoading(
                spinning: true,
                circular: true,
                style: AntdLoadingStyle(size: 24),
                text: Text("正在刷新中"),
              ),
            ),
            child: SizedBox(
              height: 300,
              child: AntdList(
                physics: const ClampingScrollPhysics(),
                items: data.map((value) {
                  return Text(
                    style: const TextStyle(color: Colors.black),
                    generateRandomString(5),
                  );
                }).toList(),
              ),
            ),
          ))
    ]);
  }
}

class AntdPullToRefreshMixDemo extends StatefulWidget {
  const AntdPullToRefreshMixDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdPullToRefreshMixDemoStateDemo();
  }
}

/// @t 混合内容
/// @l [AntdPullToRefresh]
class _AntdPullToRefreshMixDemoStateDemo
    extends State<AntdPullToRefreshMixDemo> {
  List<int> data = List.generate(10, (i) => i);

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdPullToRefresh(
        releasePrompt: AntdBox(
          style: style.copyWith(height: 40),
          child: const Text("松开刷新"),
        ),
        refreshingPrompt: AntdBox(
          style: style.copyWith(height: 60),
          child: const Text("玩命加载中..."),
        ),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            data = [...data, ...List.generate(10, (i) => i)];
          });
        },
        child: Column(
          children: [
            AntdBox(
              style: AntdBoxStyle(
                  alignment: Alignment.center,
                  color: token.colorWhite,
                  padding: token.size.md.all,
                  border: token.borderSide.bottom),
              child: const Text("我是内容1"),
            ),
            AntdBox(
              style: AntdBoxStyle(
                  alignment: Alignment.center,
                  color: token.colorWhite,
                  padding: token.size.md.all,
                  border: token.borderSide.bottom),
              child: const Text("我是内容2"),
            ),
            AntdTabs(tabs: [
              AntdTab(
                  title: const Text("面板A"),
                  value: "A",
                  child: SizedBox(
                    height: 300,
                    child: AntdList(
                      physics: const ClampingScrollPhysics(),
                      items: data.map((value) {
                        return Text(
                          generateRandomString(5),
                        );
                      }).toList(),
                    ),
                  )),
              AntdTab(
                  title: const Text("面板B"),
                  value: "B",
                  child: SizedBox(
                    height: 300,
                    child: AntdList(
                      physics: const ClampingScrollPhysics(),
                      items: data.map((value) {
                        return Text(
                          generateRandomString(5),
                        );
                      }).toList(),
                    ),
                  ))
            ])
          ],
        ),
      )
    ]);
  }
}
