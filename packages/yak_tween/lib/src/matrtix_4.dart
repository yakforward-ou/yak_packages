import 'package:vector_math/vector_math_64.dart';
import '../yak_tween.dart';

const _oneDouble = 1.0;

/// an `Matrix4Tween` that allows `const` constructor
class YakMatrix4Tween extends YakTween<Matrix4> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakMatrix4Tween({required super.begin, required super.end});

  @override
  Matrix4 lerp(double t) {
    final beginTranslation = Vector3.zero();
    final endTranslation = Vector3.zero();
    final beginRotation = Quaternion.identity();
    final endRotation = Quaternion.identity();
    final beginScale = Vector3.zero();
    final endScale = Vector3.zero();
    begin.decompose(beginTranslation, beginRotation, beginScale);
    end.decompose(endTranslation, endRotation, endScale);
    final lerpTranslation =
        beginTranslation * (_oneDouble - t) + endTranslation * t;
    final lerpRotation =
        (beginRotation.scaled(_oneDouble - t) + endRotation.scaled(t))
            .normalized();
    final lerpScale = beginScale * (_oneDouble - t) + endScale * t;
    return Matrix4.compose(lerpTranslation, lerpRotation, lerpScale);
  }
}
