import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

import 'adaptive_alignment.dart';
import 'adaptive_data.dart';
import 'positioned_data.dart';

final class AdaptiveAlignmentData implements AdaptiveData {
  final AdaptiveAlignment alignment;
  final Size size;

  const AdaptiveAlignmentData({
    required this.alignment,
    required this.size,
  });

  @override
  @nonVirtual
  PositionedData positioned({
    double scale = 0,
    required Size parentSize,
  }) {
    final scaledSize = size * scale;
    final leftovers = (parentSize - scaledSize) as Offset;
    switch (AdaptiveAlignment) {
      case (AdaptiveAlignmentTopRight alignment):
        {
          final scaledAdaptiveAlignmentPadding =
              alignment.padding.scale(scale, scale);
          return PositionedData(
            EdgeInsets.only(
              top: scaledAdaptiveAlignmentPadding.dy,
              right: scaledAdaptiveAlignmentPadding.dx,
              bottom: leftovers.dy - scaledAdaptiveAlignmentPadding.dy,
              left: leftovers.dx - scaledAdaptiveAlignmentPadding.dx,
            ),
            scaledSize,
          );
        }
      case (AdaptiveAlignmentTopLeft alignment):
        {
          final scaledAdaptiveAlignmentPadding =
              alignment.padding.scale(scale, scale);
          return PositionedData(
            EdgeInsets.only(
              top: scaledAdaptiveAlignmentPadding.dy,
              left: scaledAdaptiveAlignmentPadding.dx,
              bottom: leftovers.dy - scaledAdaptiveAlignmentPadding.dy,
              right: leftovers.dx - scaledAdaptiveAlignmentPadding.dx,
            ),
            scaledSize,
          );
        }
      case (AdaptiveAlignmentBottomRight alignment):
        {
          final scaledAdaptiveAlignmentPadding =
              alignment.padding.scale(scale, scale);
          return PositionedData(
            EdgeInsets.only(
              bottom: scaledAdaptiveAlignmentPadding.dy,
              right: scaledAdaptiveAlignmentPadding.dx,
              top: leftovers.dy - scaledAdaptiveAlignmentPadding.dy,
              left: leftovers.dx - scaledAdaptiveAlignmentPadding.dx,
            ),
            scaledSize,
          );
        }
      case (AdaptiveAlignmentBottomLeft alignment):
        {
          final scaledAdaptiveAlignmentPadding =
              alignment.padding.scale(scale, scale);
          return PositionedData(
            EdgeInsets.only(
              bottom: scaledAdaptiveAlignmentPadding.dy,
              left: scaledAdaptiveAlignmentPadding.dx,
              top: leftovers.dy - scaledAdaptiveAlignmentPadding.dy,
              right: leftovers.dx - scaledAdaptiveAlignmentPadding.dx,
            ),
            scaledSize,
          );
        }
      case (AdaptiveAlignmentTopCenter alignment):
        {
          final scaledAdaptiveAlignmentPadding = alignment.padding * scale;
          final crossAxisLeftovers = leftovers.dx / 2;
          return PositionedData(
            EdgeInsets.only(
              top: scaledAdaptiveAlignmentPadding,
              bottom: leftovers.dy - scaledAdaptiveAlignmentPadding,
              left: crossAxisLeftovers,
              right: crossAxisLeftovers,
            ),
            scaledSize,
          );
        }
      case (AdaptiveAlignmentBottomCenter alignment):
        {
          final scaledAdaptiveAlignmentPadding = alignment.padding * scale;
          final crossAxisLeftovers = leftovers.dx / 2;
          return PositionedData(
            EdgeInsets.only(
              top: scaledAdaptiveAlignmentPadding,
              bottom: leftovers.dy - scaledAdaptiveAlignmentPadding,
              left: crossAxisLeftovers,
              right: crossAxisLeftovers,
            ),
            scaledSize,
          );
        }
      case (AdaptiveAlignmentCenterRight alignment):
        {
          final scaledAdaptiveAlignmentPadding = alignment.padding * scale;
          final crossAxisLeftovers = leftovers.dy / 2;
          return PositionedData(
            EdgeInsets.only(
              top: crossAxisLeftovers,
              bottom: crossAxisLeftovers,
              left: leftovers.dx - scaledAdaptiveAlignmentPadding,
              right: scaledAdaptiveAlignmentPadding,
            ),
            scaledSize,
          );
        }
      case (AdaptiveAlignmentCenterLeft alignment):
        {
          final scaledAdaptiveAlignmentPadding = alignment.padding * scale;
          final crossAxisLeftovers = leftovers.dy / 2;
          return PositionedData(
            EdgeInsets.only(
              top: crossAxisLeftovers,
              bottom: crossAxisLeftovers,
              right: leftovers.dx - scaledAdaptiveAlignmentPadding,
              left: scaledAdaptiveAlignmentPadding,
            ),
            scaledSize,
          );
        }
      case (AdaptiveAlignmentCenter _):
        {
          final verticalLeftovers = leftovers.dy / 2;
          final horizontalsLeftovers = leftovers.dx / 2;
          return PositionedData(
            EdgeInsets.only(
              top: verticalLeftovers,
              bottom: verticalLeftovers,
              right: horizontalsLeftovers,
              left: horizontalsLeftovers,
            ),
            scaledSize,
          );
        }
      default:
        throw Exception('undefined AdaptiveAlignment');
    }
  }

  @override
  bool operator ==(other) =>
      other is AdaptiveAlignmentData && other.hashCode == hashCode;

  @override
  int get hashCode => Object.hash(alignment, size);
}
