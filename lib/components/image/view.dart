import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/widgets.dart';

class AntdImageViewerStyle extends AntdMaskStyle {
  ///顶部内容样式
  final AntdBoxStyle? titleStyle;
  const AntdImageViewerStyle(
      {super.inherit, super.maskColor, super.maskOpacity, this.titleStyle});

  @override
  AntdImageViewerStyle copyFrom(covariant AntdImageViewerStyle? style) {
    return AntdImageViewerStyle(
      titleStyle: titleStyle.merge(style?.titleStyle),
      maskColor: style?.maskColor ?? maskColor,
      maskOpacity: style?.maskOpacity ?? maskOpacity,
    );
  }
}

typedef AntdImageViewerScaleOffsetChange = void Function(
    double scale, Offset offset);

///@t 图片查看器
///@g 信息展示
///@o 87
///@d 通过放大查看图片全貌。
///@u 需要点开图片查看细节，配合缩略图使用。
@Deprecated("")
class AntdImageViewer extends AntdBaseMask<AntdImageViewerStyle,
    AntdImageViewer, _AntdImageViewerState> {
  const AntdImageViewer({
    super.key,
    super.style,
    super.styleBuilder,
    super.onClosed,
    super.onOpened,
    super.onMaskTap,
    super.dismissOnMaskTap,
    super.showMask,
    super.builder,
    super.opacity,
    super.animationDuration,
    required this.images,
    this.footer,
    this.maxZoom = 4,
    this.onIndexChange,
    this.onScaleOffsetChange,
  });

  ///图片列表
  final List<Widget> images;

  ///底部内容
  final Widget? footer;

  ///最大缩放比例
  final double maxZoom;

  ///索引变更事件
  final AntdItemPositionListener<Widget>? onIndexChange;

  ///放大缩小以及移动事件
  final AntdImageViewerScaleOffsetChange? onScaleOffsetChange;

  @override
  State<AntdImageViewer> createState() {
    return _AntdImageViewerState();
  }

  @override
  AntdImageViewerStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdImageViewerStyle(
        maskColor: token.colorBlack,
        maskOpacity: getOpacity(),
        titleStyle: AntdBoxStyle(
            alignment: Alignment.center,
            textStyle: token.font.default_.copyWith(color: token.colorBorder)));
  }

  @override
  AntdImageViewerStyle margeStyle(
      AntdImageViewerStyle defaultStyle, AntdImageViewerStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdImageViewer getWidget(BuildContext context) {
    return this;
  }
}

class _AntdImageViewerState extends AntdMaskBaseState<AntdImageViewerStyle,
    AntdImageViewer, double, _AntdImageViewerState> {
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  final AntdListController<Widget> _sliverListController = AntdListController();

  ValueNotifier<bool> isScale = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _sliverListController.addPositionListener((context) {
      if (!context.isFirstAppear) {
        return;
      }

      currentIndex.value = context.index;
    });
    if (widget.onIndexChange != null) {
      _sliverListController.addPositionListener(widget.onIndexChange!);
    }
  }

  @override
  Tween<double> buildTween() {
    return Tween(begin: 0.0, end: 1.0);
  }

  @override
  Widget buildBuilder() {
    return FadeTransition(
      opacity: contentAnimation,
      child: AntdBox(
        outerSafeArea: AntdPosition.top,
        child: Stack(
          children: [
            ValueListenableBuilder(
                valueListenable: isScale,
                builder: (context, value, _) {
                  return AntdScrollable(
                    vertical: false,
                    physics: value
                        ? const NeverScrollableScrollPhysics()
                        : const PageScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: AntdList(
                            shrinkWrap: true,
                            controller: _sliverListController,
                            fit: AntdScrollItemFit.fill,
                            alignment: AntdEdge.center,
                            itemBuilder: (entity) {
                              return _ZoomableWidget(
                                maxZoom: widget.maxZoom,
                                onChange: (scale, offset) {
                                  isScale.value = scale > 1.0;
                                  widget.onScaleOffsetChange
                                      ?.call(scale, offset);
                                },
                                image: entity.data,
                                onTap: () {
                                  close();
                                },
                              );
                            },
                            items: widget.images),
                      )
                    ],
                  );
                }),
            if (widget.images.length > 1)
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ValueListenableBuilder(
                      valueListenable: currentIndex,
                      builder: (context, value, _) {
                        return AntdBox(
                          style: style.titleStyle,
                          child: Text("${value + 1} / ${widget.images.length}"),
                        );
                      })),
            if (widget.footer != null)
              Positioned(bottom: 0, left: 0, right: 0, child: widget.footer!)
          ],
        ),
      ),
    );
  }

  @override
  _AntdImageViewerState getState() {
    return this;
  }
}

class _ZoomableWidget extends StatefulWidget {
  final Widget image;
  final double maxZoom;
  final GestureTapCallback? onTap;
  final AntdImageViewerScaleOffsetChange? onChange;
  const _ZoomableWidget(
      {required this.image, required this.maxZoom, this.onTap, this.onChange});

  @override
  State<StatefulWidget> createState() => _ZoomableWidgetState();
}

class _ZoomableWidgetState extends State<_ZoomableWidget>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> _scale = ValueNotifier(1.0);
  double _previousScale = 1.0;

  final ValueNotifier<Offset> _offset = ValueNotifier(Offset.zero);

  int _pointerCount = 0;
  Offset _lastPointerPosition = Offset.zero;

  void reset() {
    _scale.value = 1.0;
    _previousScale = 1.0;
    _offset.value = Offset.zero;
    _lastPointerPosition = Offset.zero;
    widget.onChange?.call(_scale.value, _offset.value);
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _previousScale = _scale.value;
    _pointerCount = details.pointerCount;
    _lastPointerPosition = details.focalPoint;
  }

  void _handleScaleUpdate(ScaleUpdateDetails details) {
    // Update the scale with clamping between 0.5 and 4.0
    _scale.value = (_previousScale * details.scale).clamp(0.5, widget.maxZoom);

    widget.onChange?.call(_scale.value, _offset.value);
  }

  void _handleScaleEnd(ScaleEndDetails details) {
    // If scale is less than 1.0, animate back to original size
    if (_scale.value < 1.0) {
      reset();
    }
    _pointerCount = 0;
  }

  void _handlePointerMove(PointerMoveEvent event) {
    if (_pointerCount == 1 && _scale.value > 1.0) {
      // Calculate how much the finger has moved
      final Offset delta = event.position - _lastPointerPosition;
      _lastPointerPosition = event.position;

      // Update the offset based on finger movement
      _offset.value = _offset.value + delta;
      widget.onChange?.call(_scale.value, _offset.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        _pointerCount++;
        _lastPointerPosition = event.position;
      },
      onPointerUp: (event) {
        _pointerCount--;
        if (_pointerCount == 0 && _scale.value < 1.0) {
          reset();
        }
      },
      onPointerMove: _handlePointerMove,
      child: GestureDetector(
        onTap: widget.onTap,
        onScaleStart: _handleScaleStart,
        onScaleUpdate: _handleScaleUpdate,
        onScaleEnd: _handleScaleEnd,
        onDoubleTap: () {
          // Double tap to zoom in/out
          if (_scale.value > 1.5) {
            reset();
          } else {
            _scale.value = 2.0;
            widget.onChange?.call(_scale.value, _offset.value);
          }
        },
        child: ValueListenableBuilder(
            valueListenable: _offset,
            builder: (context, offset, _) {
              return ValueListenableBuilder(
                  valueListenable: _scale,
                  builder: (context, scale, _) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..translate(offset.dx, offset.dy)
                        ..scale(scale),
                      alignment: Alignment.center,
                      child: widget.image,
                    );
                  });
            }),
      ),
    );
  }
}
