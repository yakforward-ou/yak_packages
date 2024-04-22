import 'package:flutter/widgets.dart';

import 'scalable_widget.dart';

@immutable
abstract class ScalableEdgePositioned extends Positioned {
  final EdgeInsets padding;
  final double dimension;
  final double scale;
  ScalableEdgePositioned({
    required child,
    required this.dimension,
    required this.padding,
    required this.scale,
    super.key,
  }) : super(
          child: ScalebleWidget(
            scale: scale,
            child: child,
          ),
        );

  factory ScalableEdgePositioned.top({
    required Widget child,
    double dimension,
    double scale,
    EdgeInsets padding,
    Key key,
  }) = _EdgePositioneTop;

  factory ScalableEdgePositioned.bottom({
    required Widget child,
    double dimension,
    double scale,
    EdgeInsets padding,
    Key key,
  }) = _EdgePositioneBottom;

  factory ScalableEdgePositioned.left({
    required Widget child,
    double dimension,
    double scale,
    EdgeInsets padding,
    Key key,
  }) = _EdgePositioneLeft;

  factory ScalableEdgePositioned.right({
    required Widget child,
    double dimension,
    double scale,
    EdgeInsets padding,
    Key key,
  }) = _EdgePositioneRight;
}

@immutable
class _EdgePositioneBottom extends ScalableEdgePositioned {
  _EdgePositioneBottom({
    required super.child,
    super.dimension = 0,
    super.scale = 1,
    super.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  double get left => padding.left * scale;
  @override
  double get right => padding.right * scale;
  @override
  double get bottom => padding.bottom * scale;
  @override
  double get height => (dimension - padding.vertical) * scale;
}

@immutable
class _EdgePositioneTop extends ScalableEdgePositioned {
  _EdgePositioneTop({
    required super.child,
    super.dimension = 0,
    super.scale = 1,
    super.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  double get left => padding.left * scale;
  @override
  double get right => padding.right * scale;
  @override
  double get top => padding.top * scale;
  @override
  double get height => (dimension - padding.vertical) * scale;
}

@immutable
class _EdgePositioneLeft extends ScalableEdgePositioned {
  _EdgePositioneLeft({
    required super.child,
    super.dimension = 0,
    super.scale = 1,
    super.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  double get left => padding.left * scale;
  @override
  double get top => padding.top * scale;
  @override
  double get bottom => padding.bottom * scale;
  @override
  double get width => (dimension - padding.horizontal) * scale;
}

@immutable
class _EdgePositioneRight extends ScalableEdgePositioned {
  _EdgePositioneRight({
    required super.child,
    super.dimension = 0,
    super.scale = 1,
    super.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  double get right => padding.right * scale;
  @override
  double get top => padding.top * scale;
  @override
  double get bottom => padding.bottom * scale;
  @override
  double get width => (dimension - padding.horizontal) * scale;
}
