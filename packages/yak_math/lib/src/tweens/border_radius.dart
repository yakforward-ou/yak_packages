import 'package:flutter/painting.dart';
import 'tween.dart';

/// an `BorderRadiusTween` that allows `const` constructor

class YakBorderRadiusTween extends YakTween<BorderRadius> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakBorderRadiusTween({
    BorderRadius begin,
    BorderRadius end,
  })
  // coverage:ignore-line
  : super(
          begin: begin,
          end: end,
        );
  @override
  BorderRadius lerp(double t) => BorderRadius.lerp(begin, end, t);
}
