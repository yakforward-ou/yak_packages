import 'package:flutter/widgets.dart';

/// a positioned widget that "starts" from one of the edges of the screen
/// inspired by `https://gist.github.com/aoatmon/ee4a35747b6826b73aa02aee34963f10`

abstract class EdgePositioned extends Positioned {
  final EdgeInsets padding;
  final double dimension;
  const EdgePositioned({
    required super.child,
    required this.dimension,
    required this.padding,
    super.key,
  });

  const factory EdgePositioned.top({
    required Widget child,
    double dimension,
    EdgeInsets padding,
    Key key,
  }) = _EdgePositioneTop;

  const factory EdgePositioned.bottom({
    required Widget child,
    double dimension,
    EdgeInsets padding,
    Key key,
  }) = _EdgePositioneBottom;

  const factory EdgePositioned.left({
    required Widget child,
    double dimension,
    EdgeInsets padding,
    Key key,
  }) = _EdgePositioneLeft;

  const factory EdgePositioned.right({
    required Widget child,
    double dimension,
    EdgeInsets padding,
    Key key,
  }) = _EdgePositioneRight;
}

class _EdgePositioneBottom extends EdgePositioned {
  const _EdgePositioneBottom({
    required super.child,
    super.dimension = 0,
    super.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  double get left => padding.left;
  @override
  double get right => padding.right;
  @override
  double get bottom => padding.bottom;
  @override
  double get height => dimension - padding.vertical;
}

class _EdgePositioneTop extends EdgePositioned {
  const _EdgePositioneTop({
    required super.child,
    super.dimension = 0,
    super.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  double get left => padding.left;
  @override
  double get right => padding.right;
  @override
  double get top => padding.top;
  @override
  double get height => dimension - padding.vertical;
}

class _EdgePositioneLeft extends EdgePositioned {
  const _EdgePositioneLeft({
    required super.child,
    super.dimension = 0,
    super.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  double get left => padding.left;
  @override
  double get top => padding.top;
  @override
  double get bottom => padding.bottom;
  @override
  double get width => dimension - padding.horizontal;
}

class _EdgePositioneRight extends EdgePositioned {
  const _EdgePositioneRight({
    required super.child,
    super.dimension = 0,
    super.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  double get right => padding.right;
  @override
  double get top => padding.top;
  @override
  double get bottom => padding.bottom;
  @override
  double get width => dimension - padding.horizontal;
}
