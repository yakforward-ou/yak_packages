import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

import 'adaptive_data.dart';
import 'origin.dart';
import 'positioned_data.dart';

final class AdaptiveSizedData implements AdaptiveData {
  final Origin origin;
  final Size size;

  const AdaptiveSizedData({
    required this.origin,
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
    switch (origin) {
      case (OriginTopRight origin):
        {
          final scaledOriginPadding = origin.padding.scale(scale, scale);
          return PositionedData(
            EdgeInsets.only(
              top: scaledOriginPadding.dy,
              right: scaledOriginPadding.dx,
              bottom: leftovers.dy - scaledOriginPadding.dy,
              left: leftovers.dx - scaledOriginPadding.dx,
            ),
            scaledSize,
          );
        }
      case (OriginTopLeft origin):
        {
          final scaledOriginPadding = origin.padding.scale(scale, scale);
          return PositionedData(
            EdgeInsets.only(
              top: scaledOriginPadding.dy,
              left: scaledOriginPadding.dx,
              bottom: leftovers.dy - scaledOriginPadding.dy,
              right: leftovers.dx - scaledOriginPadding.dx,
            ),
            scaledSize,
          );
        }
      case (OriginBottomRight origin):
        {
          final scaledOriginPadding = origin.padding.scale(scale, scale);
          return PositionedData(
            EdgeInsets.only(
              bottom: scaledOriginPadding.dy,
              right: scaledOriginPadding.dx,
              top: leftovers.dy - scaledOriginPadding.dy,
              left: leftovers.dx - scaledOriginPadding.dx,
            ),
            scaledSize,
          );
        }
      case (OriginBottomLeft origin):
        {
          final scaledOriginPadding = origin.padding.scale(scale, scale);
          return PositionedData(
            EdgeInsets.only(
              bottom: scaledOriginPadding.dy,
              left: scaledOriginPadding.dx,
              top: leftovers.dy - scaledOriginPadding.dy,
              right: leftovers.dx - scaledOriginPadding.dx,
            ),
            scaledSize,
          );
        }
      case (OriginTopCenter origin):
        {
          final scaledOriginPadding = origin.padding * scale;
          final crossAxisLeftovers = leftovers.dx / 2;
          return PositionedData(
            EdgeInsets.only(
              top: scaledOriginPadding,
              bottom: leftovers.dy - scaledOriginPadding,
              left: crossAxisLeftovers,
              right: crossAxisLeftovers,
            ),
            scaledSize,
          );
        }
      case (OriginBottomCenter origin):
        {
          final scaledOriginPadding = origin.padding * scale;
          final crossAxisLeftovers = leftovers.dx / 2;
          return PositionedData(
            EdgeInsets.only(
              top: scaledOriginPadding,
              bottom: leftovers.dy - scaledOriginPadding,
              left: crossAxisLeftovers,
              right: crossAxisLeftovers,
            ),
            scaledSize,
          );
        }
      case (OriginCenterRight origin):
        {
          final scaledOriginPadding = origin.padding * scale;
          final crossAxisLeftovers = leftovers.dy / 2;
          return PositionedData(
            EdgeInsets.only(
              top: crossAxisLeftovers,
              bottom: crossAxisLeftovers,
              left: leftovers.dx - scaledOriginPadding,
              right: scaledOriginPadding,
            ),
            scaledSize,
          );
        }
      case (OriginCenterLeft origin):
        {
          final scaledOriginPadding = origin.padding * scale;
          final crossAxisLeftovers = leftovers.dy / 2;
          return PositionedData(
            EdgeInsets.only(
              top: crossAxisLeftovers,
              bottom: crossAxisLeftovers,
              right: leftovers.dx - scaledOriginPadding,
              left: scaledOriginPadding,
            ),
            scaledSize,
          );
        }
      case (OriginCenter origin):
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
        throw Exception('undefined Origin');
    }
  }

  @override
  bool operator ==(other) =>
      other is AdaptiveSizedData && other.hashCode == hashCode;

  @override
  int get hashCode => Object.hash(origin, size);
}
