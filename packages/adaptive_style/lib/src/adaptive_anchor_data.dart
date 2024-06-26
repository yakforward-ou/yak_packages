import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

import 'adaptive_data.dart';
import 'anchor_edges.dart';
import 'positioned_data.dart';

final class AdaptiveAnchorData implements AdaptiveData {
  final AnchorEdges anchor;
  final double dimension;

  const AdaptiveAnchorData({
    required this.anchor,
    required this.dimension,
  });

  @override
  @nonVirtual
  PositionedData positioned({
    double scale = 0,
    required Size parentSize,
  }) {
    final scaledEdges = anchor.scale(scale);
    final scaledDimension = dimension * scale;
    switch (scaledEdges) {
      case (AnchorEdgesTop topEdge):
        return PositionedData(
          EdgeInsets.only(
            bottom: parentSize.height - scaledDimension - topEdge.top,
            top: topEdge.top,
            left: topEdge.left,
            right: topEdge.right,
          ),
          Size(
            parentSize.width - topEdge.left - topEdge.right,
            scaledDimension,
          ),
        );
      case (AnchorEdgesBottom bottomEdge):
        return PositionedData(
          EdgeInsets.only(
            top: parentSize.height - scaledDimension - bottomEdge.bottom,
            bottom: bottomEdge.bottom,
            left: bottomEdge.left,
            right: bottomEdge.right,
          ),
          Size(
            parentSize.width - bottomEdge.left - bottomEdge.right,
            scaledDimension,
          ),
        );

      case (AnchorEdgesLeft leftEdge):
        return PositionedData(
          EdgeInsets.only(
            top: leftEdge.top,
            bottom: leftEdge.bottom,
            left: leftEdge.left,
            right: parentSize.width - scaledDimension - leftEdge.left,
          ),
          Size(
            scaledDimension,
            parentSize.height - leftEdge.top - leftEdge.bottom,
          ),
        );
      case (AnchorEdgesRight rightEdge):
        return PositionedData(
          EdgeInsets.only(
            top: rightEdge.top,
            bottom: rightEdge.bottom,
            left: parentSize.width - scaledDimension - rightEdge.right,
            right: rightEdge.right,
          ),
          Size(
            scaledDimension,
            parentSize.height - rightEdge.top - rightEdge.bottom,
          ),
        );

      default:
        throw Exception('undefined AnchorEdges');
    }
  }

  @override
  bool operator ==(other) =>
      other is AdaptiveAnchorData && other.hashCode == hashCode;

  @override
  int get hashCode => Object.hashAll([anchor, dimension]);
}
