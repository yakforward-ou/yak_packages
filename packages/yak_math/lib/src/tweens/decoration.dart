import 'package:flutter/painting.dart';
import 'tween.dart';
// ignore_for_file: invalid_use_of_protected_member

/// an `DecorationTween` that allows `const` constructor
class YakDecorationTween extends YakTween<Decoration> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakDecorationTween({
    required Decoration begin,
    required Decoration end,
  })
// coverage:ignore-line
  : super(
          begin: begin,
          end: end,
        );
  @override
  Decoration lerp(double t) => t == 0.0
      ? begin
      : t == 1.0
          ? end
          : end.lerpFrom(begin, t) ??
              begin.lerpTo(end, t) ??
              (t < 0.5
                  ? (begin.lerpTo(null, t * 2.0) ?? begin)
                  : (end.lerpFrom(null, (t - 0.5) * 2.0) ?? end));
}
