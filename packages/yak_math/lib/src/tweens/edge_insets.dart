import 'package:flutter/painting.dart';
import 'tween.dart';

/// an `EdgeInsetsTween` that allows `const` constructor
class YakEdgeInsetsTween extends YakTween<EdgeInsets> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakEdgeInsetsTween({
    EdgeInsets begin,
    EdgeInsets end,
  }) : super(
          begin: begin,
          end: end,
        );
  @override
  EdgeInsets lerp(double t) => EdgeInsets.lerp(begin, end, t);
}
