import 'package:flutter/painting.dart';
import '../yak_tween.dart';

/// an `BorderTwee` that allows `const` constructor

class YakBorderTween extends YakTween<Border> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakBorderTween({
    required Border begin,
    required Border end,
  }) : super(begin: begin, end: end); // coverage:ignore-line

  @override
  Border lerp(double t) => Border(
        top: BorderSide.lerp(begin.top, end.top, t),
        right: BorderSide.lerp(begin.right, end.right, t),
        bottom: BorderSide.lerp(begin.bottom, end.bottom, t),
        left: BorderSide.lerp(begin.left, end.left, t),
      );
}
