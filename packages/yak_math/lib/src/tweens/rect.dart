import 'dart:ui';
import 'tween.dart';

/// an `RectTween` that allows `const` constructor
class YakRectTween extends YakTween<Rect> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakRectTween({
    Rect begin,
    Rect end,
  })
  // coverage:ignore-line to ignore one line.

  : super(
          begin: begin,
          end: end,
        );
  @override
  Rect lerp(double t) => Rect.lerp(begin, end, t);
}
