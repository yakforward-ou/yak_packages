import 'package:flutter/painting.dart';
import 'tween.dart';

/// an `AlignmentGeometryTween` that allows `const` constructor

class YakAlignmentGeometryTween extends YakTween<AlignmentGeometry> {
  /// like most `Tween`s has parameters `begin` and `end`

  const YakAlignmentGeometryTween({
    AlignmentGeometry begin,
    AlignmentGeometry end,
  })
  // coverage:ignore-line to ignore one line.
  : super(
          begin: begin,
          end: end,
        );
  @override
  AlignmentGeometry lerp(double t) => AlignmentGeometry.lerp(begin, end, t);
}
