import 'dart:ui';

import 'package:yak_utils/yak_utils.dart';

import '../yak_tween.dart';

/// an `RectTween` that allows `const` constructor
class YakRectTween extends YakTween<Rect> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakRectTween({required super.begin, required super.end});

  @override
  Rect lerp(double t) => Rect.fromLTRB(
        lerpNNDouble(begin.left, end.left, t),
        lerpNNDouble(begin.top, end.top, t),
        lerpNNDouble(begin.right, end.right, t),
        lerpNNDouble(begin.bottom, end.bottom, t),
      );
}
