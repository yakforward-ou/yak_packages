import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// an `CurveTween` that allows `const` constructor
class YakCurveTween extends Animatable<double> {
  /// has a parameter `curve`
  const YakCurveTween({
    required this.curve,
  });

  /// has a parameter `curve` of type `Curve`
  final Curve curve;

  @override
  double transform(double t) {
    if (t == 0.0 || t == 1.0) {
      assert(curve.transform(t).round() == t);
      return t;
    }
    return curve.transform(t);
  }

  @override
  String toString() =>
      '${objectRuntimeType(this, 'YakCurveTween')}(curve: $curve)';
}
