import 'dart:ui';
import '../../yak_math.dart';

/// an `RectTween` that allows `const` constructor
class YakRectTween extends YakTween<Rect> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakRectTween({
    required Rect begin,
    required Rect end,
  }) : super(begin: begin, end: end); // coverage:ignore-line

  @override
  Rect lerp(double t) => Rect.fromLTRB(
        lerpNNDouble(begin.left, end.left, t),
        lerpNNDouble(begin.top, end.top, t),
        lerpNNDouble(begin.right, end.right, t),
        lerpNNDouble(begin.bottom, end.bottom, t),
      );
}
