import 'package:flutter/painting.dart';
import '../../yak_math.dart';

/// an `BorderRadiusTween` that allows `const` constructor

class YakBorderRadiusTween extends YakTween<BorderRadius> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakBorderRadiusTween({
    required BorderRadius begin,
    required BorderRadius end,
  }) : super(begin: begin, end: end); // coverage:ignore-line

  @override
  BorderRadius lerp(double t) => BorderRadius.only(
        topLeft: radiusNNLerp(begin.topLeft, end.topLeft, t),
        topRight: radiusNNLerp(begin.topRight, end.topRight, t),
        bottomLeft: radiusNNLerp(begin.bottomLeft, end.bottomLeft, t),
        bottomRight: radiusNNLerp(begin.bottomRight, end.bottomRight, t),
      );
}
