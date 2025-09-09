import 'package:antd_flutter_mobile/index.dart';
import 'package:example/components/image/image.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

/// @t 基础用法
/// @d 支持左侧选项右侧选项
/// @l [AntdSwipeAction]
class AntdSwipeActionDemo extends StatelessWidget {
  const AntdSwipeActionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      AntdSwipeAction(
        closeOnAction: true,
        items: [
          AntdSwipeItem(
            left: true,
            style: AntdSwipeItemStyle(
                style: AntdBoxStyle(color: token.colorError)),
            content: const Text("取消关注"),
            confirmContent: const Text(
              "确定取消关注",
              overflow: TextOverflow.ellipsis,
            ),
          ),
          AntdSwipeItem(
            left: true,
            style: AntdSwipeItemStyle(
                style: AntdBoxStyle(color: token.colorPrimary)),
            content: const Text("置顶"),
            confirmContent: const Text("确定置顶"),
          ),
          AntdSwipeItem(
            style: AntdSwipeItemStyle(
                style: AntdBoxStyle(color: token.colorPrimary)),
            content: const Text("取消关注"),
            confirmContent: const Text(
              "确定取消关注",
              overflow: TextOverflow.ellipsis,
            ),
          ),
          AntdSwipeItem(
            style: AntdSwipeItemStyle(
                style: AntdBoxStyle(color: token.colorError)),
            content: const Text("免打扰"),
            confirmContent: const Text(
              "确定免打扰",
              overflow: TextOverflow.ellipsis,
            ),
          ),
          AntdSwipeItem(
            style: AntdSwipeItemStyle(
                style: AntdBoxStyle(color: token.colorSuccess)),
            content: const Text("删除"),
            confirmContent: const Text(
              "确定删除",
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
        child: AntdBox(
          style: AntdBoxStyle(
              padding: 16.all,
              width: double.infinity,
              color: token.colorTransparent),
          child: const Text("左右滑动"),
        ),
      ),
    ]);
  }
}

/// @t 搭配图片使用
/// @d 双击时自动展开，再次双击自动关闭
/// @l [AntdSwipeAction]
class AntdSwipeActionImageDemo extends StatelessWidget {
  const AntdSwipeActionImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdSwipeAction(
        items: [
          AntdSwipeItem(
            content: Text("删除"),
            confirmContent: Text("确定删除"),
          ),
          AntdSwipeItem(content: Text("收藏"), confirmContent: Text("确定收藏")),
        ],
        child: AntdImage(
          image: NetworkImage(url),
        ),
      ),
    ]);
  }
}

/// @t 排他
/// @d 通过controller手动控制
/// @l [AntdSwipeAction]
class AntdSwipeActionControllerDemo extends StatefulWidget {
  const AntdSwipeActionControllerDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AntdSwipeActionControllerDemoStateDemo();
  }
}

class _AntdSwipeActionControllerDemoStateDemo
    extends State<AntdSwipeActionControllerDemo> {
  AntdSwipeActionController controller = AntdSwipeActionController();

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(outline: true, child: [
      ...List.generate(3, (i) {
        return AntdSwipeAction(
          key: ValueKey(i),
          controller: controller,
          closeOnAction: true,
          onChange: (status) {
            if (status != AntdSwipeStatus.close) {
              controller.closeAll([ValueKey(i)]);
            }
          },
          items: [
            AntdSwipeItem(
              left: true,
              style: AntdSwipeItemStyle(
                  style: AntdBoxStyle(color: token.colorPrimary)),
              content: const Text("取消关注left"),
              confirmContent: const Text(
                "确定取消关注",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            AntdSwipeItem(
              left: true,
              style: AntdSwipeItemStyle(
                  style: AntdBoxStyle(color: token.colorWhite)),
              content: const Text("免打扰left"),
              confirmContent: const Text(
                "确定免打扰",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            AntdSwipeItem(
              left: true,
              style: AntdSwipeItemStyle(
                  style: AntdBoxStyle(color: token.colorError)),
              content: const Text("删除left"),
              confirmContent: const Text(
                "确定删除",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            AntdSwipeItem(
              left: true,
              style: AntdSwipeItemStyle(
                  style: AntdBoxStyle(color: token.colorSuccess)),
              content: const Text("删除2left"),
              confirmContent: const Text(
                "确定删除2",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            AntdSwipeItem(
              style: AntdSwipeItemStyle(
                  style: AntdBoxStyle(color: token.colorPrimary)),
              content: const Text("取消关注"),
              confirmContent: const Text(
                "确定取消关注",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            AntdSwipeItem(
              style: AntdSwipeItemStyle(
                  style: AntdBoxStyle(color: token.colorWhite)),
              content: Text("免打扰"),
              confirmContent: const Text(
                "确定免打扰",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            AntdSwipeItem(
              style: AntdSwipeItemStyle(
                  style: AntdBoxStyle(color: token.colorError)),
              content: Text("删除"),
              confirmContent: const Text(
                "确定删除",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            AntdSwipeItem(
              style: AntdSwipeItemStyle(
                  style: AntdBoxStyle(color: token.colorSuccess)),
              content: const Text("删除2"),
              confirmContent: const Text(
                "确定删除2",
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
          child: AntdBox(
            style: AntdBoxStyle(
                padding: 16.all,
                width: double.infinity,
                color: token.colorTransparent),
            child: const Text("左右滑动"),
          ),
        );
      })
    ]);
  }
}
