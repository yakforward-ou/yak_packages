import 'package:flutter/rendering.dart';
import '../../yak_math.dart';

/// an `BoxConstraintsTween` that allows `const` constructor
class YakBoxConstraintsTween extends YakTween<BoxConstraints> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakBoxConstraintsTween({
    required BoxConstraints begin,
    required BoxConstraints end,
  }) : super(begin: begin, end: end); // coverage:ignore-line

  @override
  BoxConstraints lerp(double t) {
    assert(begin.debugAssertIsValid());
    assert(end.debugAssertIsValid());
    assert(
      (begin.minWidth.isFinite && end.minWidth.isFinite) ||
          (begin.minWidth == double.infinity &&
              end.minWidth == double.infinity),
      'Cannot interpolate '
      'between finite constraints and unbounded constraints.',
    );
    assert(
      (begin.maxWidth.isFinite && end.maxWidth.isFinite) ||
          (begin.maxWidth == double.infinity &&
              end.maxWidth == double.infinity),
      'Cannot interpolate '
      'between finite constraints and unbounded constraints.',
    );
    assert(
      (begin.minHeight.isFinite && end.minHeight.isFinite) ||
          (begin.minHeight == double.infinity &&
              end.minHeight == double.infinity),
      'Cannot interpolate '
      'between finite constraints and unbounded constraints.',
    );
    assert(
      (begin.maxHeight.isFinite && end.maxHeight.isFinite) ||
          (begin.maxHeight == double.infinity &&
              end.maxHeight == double.infinity),
      'Cannot interpolate '
      'between finite constraints and unbounded constraints.',
    );
    return BoxConstraints(
      minWidth: begin.minWidth.isFinite
          ? lerpNNDouble(begin.minWidth, end.minWidth, t)
          : double.infinity,
      maxWidth: begin.maxWidth.isFinite
          ? lerpNNDouble(begin.maxWidth, end.maxWidth, t)
          : double.infinity,
      minHeight: begin.minHeight.isFinite
          ? lerpNNDouble(begin.minHeight, end.minHeight, t)
          : double.infinity,
      maxHeight: begin.maxHeight.isFinite
          ? lerpNNDouble(begin.maxHeight, end.maxHeight, t)
          : double.infinity,
    );
  }
}
