import 'package:antd_flutter/index.dart';
import 'package:flutter/widgets.dart';

enum AntdIndicatorPosition { top, bottom }

enum AntdIndicatorMode { full, fixed }

class AntdIndicatorController<T extends AntdTab> {
  AnimationController? _animationController;
  Animation<double>? _animation;
  double? _fixedWidth;
  AntdIndicatorMode? _indicatorMode;
  AntdScrollPositionController<T>? _sliverListController;

  int? moveIndex;
  double _currentPosition = 0;
  double get currentPosition => _currentPosition;
  AnimationController get animationController => _animationController!;
  Animation<double> get animation => _animation!;

  AntdIndicatorController({
    required TickerProvider vsync,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
  }) {
    _animationController = AnimationController(
      duration: duration,
      vsync: vsync,
    );

    _animation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _animationController!, curve: curve),
    );
  }

  double getIndicatorWidth() {
    if (_sliverListController == null || moveIndex == null) {
      return 0;
    }
    final itemSize = _sliverListController?.getItemLength(moveIndex!) ?? 0;
    var indicatorWidth = itemSize;
    if (_indicatorMode != AntdIndicatorMode.full) {
      indicatorWidth = (_fixedWidth ?? (itemSize / 4));
    }
    return indicatorWidth;
  }

  double getIndicatorOffset(int index) {
    if (_sliverListController == null) {
      return 0;
    }
    if (_indicatorMode != AntdIndicatorMode.full) {
      var length = _sliverListController!.getItemLength(index)!;
      var width = getIndicatorWidth();
      return (length - width) / 2;
    }

    return 0;
  }

  void move(int index) {
    if (_sliverListController == null) {
      return;
    }

    moveIndex = index;
    var offsetCenter = _sliverListController!
        .getItemOffset(index, AntdEdge.center, AntdEdge.center);

    var offset = _sliverListController!.getWindowOffset(
        index: index, viewportAlign: AntdEdge.start, offset: offsetCenter ?? 0);
    if (offset == null) {
      return;
    }

    double newPosition = offset + getIndicatorOffset(index);
    moveOffset(newPosition);
  }

  void moveOffset(double offset) {
    if (_sliverListController == null || _animationController == null) {
      return;
    }
    _animation = Tween<double>(begin: _currentPosition, end: offset).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.ease),
    );

    _animationController!.reset();
    _animationController!.forward();
    _currentPosition = offset;
  }

  void movePercent(int index, double percent) {
    // final offsetTop =
    //     _sliverListController!.getWindowOffset(index, AlignLine.top);
    // var percentOffsetTop = offsetTop * offsetTop;
    // moveOffset(percentOffsetTop);
  }

  void dispose() {
    _animationController?.dispose();
  }
}

class AntdTabsIndicator<T extends AntdTab>
    extends AntdStateComponent<AntdBoxStyle, AntdTabsIndicator<T>> {
  final int defaultIndex;
  final AntdIndicatorPosition indicatorPosition;
  final AntdIndicatorMode? indicatorMode;
  final AntdScrollPositionController<T> sliverListController;
  final AntdIndicatorController<T>? indicatorController;
  final Duration duration;
  const AntdTabsIndicator(
      {super.key,
      super.style,
      super.styleBuilder,
      required this.defaultIndex,
      this.indicatorPosition = AntdIndicatorPosition.bottom,
      this.indicatorMode,
      required this.sliverListController,
      this.indicatorController,
      this.duration = const Duration(microseconds: 300)});

  @override
  State<StatefulWidget> createState() => _AntdTabsIndicatorState<T>();

  @override
  AntdBoxStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return const AntdBoxStyle();
  }

  @override
  AntdTabsIndicator<T> getWidget(BuildContext context) {
    return this;
  }

  @override
  AntdBoxStyle margeStyle(AntdBoxStyle defaultStyle, AntdBoxStyle? style) {
    return defaultStyle.copyFrom(style);
  }
}

class _AntdTabsIndicatorState<T extends AntdTab>
    extends AntdState<AntdBoxStyle, AntdTabsIndicator<T>>
    with TickerProviderStateMixin {
  late final AntdIndicatorController<T> innerIndicatorController =
      widget.indicatorController ??
          AntdIndicatorController<T>(vsync: this, duration: widget.duration);

  @override
  void updateDependentValues(covariant AntdTabsIndicator<T>? oldWidget) {
    super.updateDependentValues(oldWidget);
    innerIndicatorController._indicatorMode = widget.indicatorMode;
    innerIndicatorController._fixedWidth = style.width;
    innerIndicatorController._sliverListController =
        widget.sliverListController;
    if (innerIndicatorController.moveIndex != null) {
      innerIndicatorController.move(innerIndicatorController.moveIndex!);
    }
  }

  @override
  void dispose() {
    innerIndicatorController.dispose();
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    return AnimatedBuilder(
      animation: innerIndicatorController.animationController,
      builder: (context, value) {
        var indicatorWidth = innerIndicatorController.getIndicatorWidth();
        return Positioned(
          bottom: widget.indicatorPosition == AntdIndicatorPosition.bottom
              ? 0
              : null,
          top: widget.indicatorPosition == AntdIndicatorPosition.top ? 0 : null,
          left: innerIndicatorController.animation.value,
          child: AntdBox(
            style: style.copyWith(width: indicatorWidth),
          ),
        );
      },
    );
  }
}
