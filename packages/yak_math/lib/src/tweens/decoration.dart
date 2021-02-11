import 'package:flutter/painting.dart';
import 'tween.dart';

/// an `DecorationTween` that allows `const` constructor
class YakDecorationTween extends YakTween<Decoration> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakDecorationTween({
    Decoration begin,
    Decoration end,
  }) : super(
          begin: begin,
          end: end,
        );
  @override
  Decoration lerp(double t) => Decoration.lerp(begin, end, t);
}
