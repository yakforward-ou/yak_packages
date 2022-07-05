import 'package:flutter/painting.dart';
import 'package:yak_utils/yak_utils.dart';

import '../yak_tween.dart';

/// an `EdgeInsetsTween` that allows `const` constructor
class YakEdgeInsetsTween extends YakTween<EdgeInsets> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakEdgeInsetsTween({required super.begin, required super.end});

  @override
  EdgeInsets lerp(double t) => EdgeInsets.fromLTRB(
        lerpNNDouble(begin.left, end.left, t),
        lerpNNDouble(begin.top, end.top, t),
        lerpNNDouble(begin.right, end.right, t),
        lerpNNDouble(begin.bottom, end.bottom, t),
      );
}
