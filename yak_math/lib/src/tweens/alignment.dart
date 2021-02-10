import 'package:flutter/painting.dart';
import 'tween.dart';

/// an `AlignmentTween` that allows `const` constructor

class YakAlignmentTween extends YakTween<Alignment> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakAlignmentTween({
    Alignment begin,
    Alignment end,
  }) : super(
          begin: begin,
          end: end,
        );
  @override
  Alignment lerp(double t) => Alignment.lerp(begin, end, t);
}
