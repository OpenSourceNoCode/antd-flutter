import 'package:antd_flutter_mobile/components/bar/index/controller.dart';
import 'package:antd_flutter_mobile/components/box/index.dart';
import 'package:antd_flutter_mobile/components/widgets/list/controller.dart';
import 'package:flutter/cupertino.dart';

import 'index.dart';

class AntdIndexBarFloatBar<T extends AntdSectionProvider>
    extends StatefulWidget {
  const AntdIndexBarFloatBar(
      {super.key,
      required this.controller,
      this.indexBuilder,
      this.onIndexChange,
      this.onDragEnd,
      required this.style});
  final AntdIndexBarController<T> controller;
  final AntdIndexBarIndexBuilder? indexBuilder;
  final AntdIndexBarOnIndexChange? onIndexChange;
  final void Function()? onDragEnd;
  final AntdIndexBarStyle style;

  @override
  State<StatefulWidget> createState() {
    return _AntdIndexBarFloatBarState();
  }
}

class _AntdIndexBarFloatBarState extends State<AntdIndexBarFloatBar> {
  double _dragOffset = 0;
  int _initSectionIndex = -1;
  double _sectionHeight = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.indexBuilder == null) {
      return const AntdBox();
    }

    var controller = widget.controller;
    var columnList = <Widget>[];
    var sectionPositions = controller.sectionPositions;
    var keys = sectionPositions.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      var section = keys[i];
      var index = sectionPositions[section]!;
      columnList.add(GestureDetector(
        onVerticalDragStart: (details) {
          _initSectionIndex = i;
          controller.isDrag = true;
          widget.controller.toIndex(index);
        },
        onVerticalDragUpdate: (DragUpdateDetails details) {
          _dragOffset += details.delta.dy;
          final slotCount = (_dragOffset / _sectionHeight).round();

          final newIndex = _initSectionIndex + slotCount;
          final clampedIndex = newIndex.clamp(0, sectionPositions.length - 1);

          final targetIndex = sectionPositions[keys[clampedIndex]];
          if (targetIndex == null ||
              targetIndex == controller.activeIndexBarIndex.value) {
            return;
          }

          controller.toIndex(targetIndex,
              config: const AntdScrollToIndexConfig(set: true));
          controller.activeSectionIndex.value = targetIndex;
          controller.activeIndexBarIndex.value = targetIndex;
          widget.onIndexChange?.call(context, keys[clampedIndex], targetIndex,
              AntdIndexBarIndexChangeSource.drag);
        },
        onVerticalDragEnd: (details) {
          widget.onDragEnd?.call();
          controller.isDrag = false;
          _initSectionIndex = -1;
          _dragOffset = 0;
        },
        onTap: () {
          widget.controller.toIndex(index);
          controller.activeIndexBarIndex.value = index;
          widget.onIndexChange?.call(
              context, section, index, AntdIndexBarIndexChangeSource.tap);
        },
        child: ValueListenableBuilder(
            valueListenable: controller.activeIndexBarIndex,
            builder: (context, currentIndex, _) {
              var style = index == currentIndex
                  ? widget.style.activeIndexStyle
                  : widget.style.indexStyle;
              return AntdBox(
                onLayout: (context) {
                  _sectionHeight = context.renderBox.size.height;
                },
                style: style,
                child: widget.indexBuilder!(context, section, index),
              );
            }),
      ));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: columnList,
    );
  }
}
