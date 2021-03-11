import 'package:flutter/painting.dart';
import '../../yak_math.dart';

/// an `FractionalOffsetTween` that allows `const` constructor
class YakFractionalOffsetTween extends YakTween<FractionalOffset> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakFractionalOffsetTween({
    required FractionalOffset begin,
    required FractionalOffset end,
  }) : super(begin: begin, end: end); // coverage:ignore-line

  @override
  FractionalOffset lerp(double t) => FractionalOffset(
        lerpNNDouble(begin.dx, end.dx, t),
        lerpNNDouble(begin.dy, end.dy, t),
      );
}
