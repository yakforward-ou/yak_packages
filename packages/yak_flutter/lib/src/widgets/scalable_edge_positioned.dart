import 'package:flutter/widgets.dart';

@immutable
abstract class ScalableEdgePositioned extends Positioned {
  final EdgeInsets padding;
  final double dimension;
  final double scale;
  const ScalableEdgePositioned({
    required super.child,
    required this.dimension,
    required this.padding,
    required this.scale,
    super.key,
  });

  const factory ScalableEdgePositioned.top({
    required Widget child,
    double dimension,
    double scale,
    EdgeInsets padding,
    Key key,
  }) = _EdgePositionedTop;

  const factory ScalableEdgePositioned.bottom({
    required Widget child,
    double dimension,
    double scale,
    EdgeInsets padding,
    Key key,
  }) = _EdgePositionedBottom;

  const factory ScalableEdgePositioned.left({
    required Widget child,
    double dimension,
    double scale,
    EdgeInsets padding,
    Key key,
  }) = _EdgePositionedLeft;

  const factory ScalableEdgePositioned.right({
    required Widget child,
    double dimension,
    double scale,
    EdgeInsets padding,
    Key key,
  }) = _EdgePositionedRight;
}

@immutable
class _EdgePositionedBottom extends ScalableEdgePositioned {
  const _EdgePositionedBottom({
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
class _EdgePositionedTop extends ScalableEdgePositioned {
  const _EdgePositionedTop({
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
class _EdgePositionedLeft extends ScalableEdgePositioned {
  const _EdgePositionedLeft({
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
class _EdgePositionedRight extends ScalableEdgePositioned {
  const _EdgePositionedRight({
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
