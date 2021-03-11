import 'package:flutter/painting.dart';
import '../../yak_math.dart';

/// an `EdgeInsetsTween` that allows `const` constructor
class YakEdgeInsetsTween extends YakTween<EdgeInsets> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakEdgeInsetsTween({
    required EdgeInsets begin,
    required EdgeInsets end,
  }) : super(begin: begin, end: end); // coverage:ignore-line

  @override
  EdgeInsets lerp(double t) => EdgeInsets.fromLTRB(
        lerpNNDouble(begin.left, end.left, t),
        lerpNNDouble(begin.top, end.top, t),
        lerpNNDouble(begin.right, end.right, t),
        lerpNNDouble(begin.bottom, end.bottom, t),
      );
}
