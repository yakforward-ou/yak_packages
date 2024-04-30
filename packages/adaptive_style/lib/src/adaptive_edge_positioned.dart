import 'package:flutter/widgets.dart';

import 'adaptive_widget.dart';
import 'adaptive_widget_builder.dart';

enum Edge { top, bottom, left, right }

class AdaptiveEdgePositioned extends AdaptiveWidget {
  final EdgeInsets padding;
  final double dimension;
  final AdaptiveWidgetBuilder _builder;
  final Edge edge;
  const AdaptiveEdgePositioned({
    super.key,
    this.padding = EdgeInsets.zero,
    required AdaptiveWidgetBuilder builder,
    required this.dimension,
    required this.edge,
    required this.parentSize,
  }) : _builder = builder;

  @override
  Widget builder(context, scaleRef, parentSize) =>

      /// TODO should calculate parent data
      ScalableEdgePositioned(
        edge: edge,
        dimension: dimension,
        scale: scaleRef.scale.min,
        child: _builder(context, scaleRef, parentSize),
      );

  @override
  final Size parentSize;
}

class ScalableEdgePositioned extends Positioned {
  final EdgeInsets padding;
  final double dimension;
  final double scale;
  final Edge edge;
  const ScalableEdgePositioned({
    required this.edge,
    required super.child,
    required this.dimension,
    this.padding = EdgeInsets.zero,
    required this.scale,
    super.key,
  });

  @override
  @protected
  @visibleForTesting
  double? get left {
    return switch (edge) {
      (Edge.right) => null,
      _ => padding.left * scale,
    };
  }

  @override
  @protected
  @visibleForTesting
  double? get right {
    return switch (edge) {
      (Edge.left) => null,
      _ => padding.right * scale,
    };
  }

  @override
  @protected
  @visibleForTesting
  double? get bottom {
    return switch (edge) {
      (Edge.top) => null,
      _ => padding.bottom * scale,
    };
  }

  @override
  @protected
  @visibleForTesting
  double? get top {
    return switch (edge) {
      (Edge.bottom) => null,
      _ => padding.top * scale,
    };
  }

  @override
  double? get height {
    return switch (edge) {
      (Edge.bottom || Edge.top) => (dimension - padding.vertical) * scale,
      _ => null,
    };
  }

  @override
  double? get width {
    return switch (edge) {
      (Edge.left || Edge.right) => (dimension - padding.horizontal) * scale,
      _ => null,
    };
  }
}
