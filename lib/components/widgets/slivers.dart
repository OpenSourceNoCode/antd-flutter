import 'package:antd_flutter/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AntdPositionList<T> extends AntdScrollPositionedBase<T, AntdStyle,
    AntdPositionList<T>, AntdScrollPositionController<T>> {
  const AntdPositionList(
      {super.key,
      super.headers,
      super.footers,
      required super.items,
      required super.itemBuilder,
      super.shrinkWrap,
      super.virtual = false,
      super.controller,
      super.fit = AntdScrollItemFit.child,
      super.alignment,
      super.onItemPosition,
      super.vertical = true,
      super.reversed,
      super.physics = const BouncingScrollPhysics(),
      super.dragStartBehavior = DragStartBehavior.start,
      super.scrollBehavior,
      super.cacheExtent = 1.5,
      super.cacheExtentStyle = CacheExtentStyle.viewport,
      super.throttle,
      super.edgeThreshold,
      super.onEdgeReached,
      super.gridDelegate,
      super.viewportOffset});

  @override
  State<StatefulWidget> createState() {
    return _AntdPositionListState<T>();
  }

  @override
  AntdStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return const AntdStyle();
  }

  @override
  AntdPositionList<T> getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdStyle margeStyle(AntdStyle defaultStyle, AntdStyle? style) {
    return defaultStyle;
  }
}

class _AntdPositionListState<T> extends AntdScrollPositionedBaseState<T,
    AntdStyle, AntdScrollPositionController<T>, AntdPositionList<T>> {
  @override
  AntdScrollPositionController<T> createController() {
    return AntdScrollPositionController<T>();
  }
}

typedef AntdPersistentHeaderHeightChange = void Function(double? height);

class AntdPersistentHeader extends StatefulWidget {
  final Widget child;
  final bool pinned;
  final bool floating;
  final AntdPersistentHeaderHeightChange? onHeightChange;

  const AntdPersistentHeader(
      {super.key,
      required this.child,
      this.pinned = false,
      this.floating = false,
      this.onHeightChange});

  @override
  State<StatefulWidget> createState() => _AntdPersistentHeaderState();
}

class _AntdPersistentHeaderState extends State<AntdPersistentHeader> {
  double? _height;

  @override
  void didUpdateWidget(covariant AntdPersistentHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.child != widget.child) {
      _height = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var child = AntdBox(
      child: widget.child,
      onLayout: (context) {
        if (_height == null || context.hasSizeChange) {
          if (context.renderBox.size.height == 0) {
            return;
          }

          setState(() {
            _height = context.renderBox.size.height;
            widget.onHeightChange?.call(_height);
          });
        }
      },
    );
    return _height == null
        ? SliverToBoxAdapter(
            child: child,
          )
        : SliverPersistentHeader(
            floating: widget.floating,
            pinned: widget.pinned,
            delegate: _HeaderDelegate(height: _height!, child: widget.child));
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  _HeaderDelegate({
    required this.height,
    required this.child,
  });

  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  bool shouldRebuild(_HeaderDelegate oldDelegate) {
    return true;
  }
}
