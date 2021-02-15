import 'package:flutter/painting.dart';
import 'tween.dart';

/// an `FractionalOffsetTween` that allows `const` constructor
class YakFractionalOffsetTween extends YakTween<FractionalOffset> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakFractionalOffsetTween({
    FractionalOffset begin,
    FractionalOffset end,
  })
  // coverage:ignore-line to ignore one line.

  : super(
          begin: begin,
          end: end,
        );
  @override
  FractionalOffset lerp(double t) => FractionalOffset.lerp(begin, end, t);
}
