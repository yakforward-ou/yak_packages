import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class YakCurveTween extends Animatable<double> {
  const YakCurveTween({
    @required this.curve,
  }) : assert(curve != null);
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
