import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/rendering.dart';
import 'tween.dart';

/// an `Matrix4Tween` that allows `const` constructor
class YakMatrix4Tween extends YakTween<Matrix4> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakMatrix4Tween({
    Matrix4 begin,
    Matrix4 end,
  }) : super(
          begin: begin,
          end: end,
        );
  @override
  Matrix4 lerp(double t) {
    assert(begin != null);
    assert(end != null);
    final beginTranslation = Vector3.zero();
    final endTranslation = Vector3.zero();
    final beginRotation = Quaternion.identity();
    final endRotation = Quaternion.identity();
    final beginScale = Vector3.zero();
    final endScale = Vector3.zero();
    begin.decompose(beginTranslation, beginRotation, beginScale);
    end.decompose(endTranslation, endRotation, endScale);
    final lerpTranslation = beginTranslation * (1.0 - t) + endTranslation * t;
    final lerpRotation =
        (beginRotation.scaled(1.0 - t) + endRotation.scaled(t)).normalized();
    final lerpScale = beginScale * (1.0 - t) + endScale * t;
    return Matrix4.compose(lerpTranslation, lerpRotation, lerpScale);
  }
}
