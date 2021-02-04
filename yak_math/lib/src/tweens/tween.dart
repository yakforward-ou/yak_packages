import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

/// an `Tween` that allows `const` constructor

class YakTween<T extends dynamic> extends Animatable<T> {
  const YakTween({
    this.begin,
    this.end,
  })  : assert(begin != null),
        assert(end != null);
  final T begin;
  final T end;

  @protected
  T lerp(double t) => begin + (end - begin) * t as T;

  @override
  T transform(double t) => t == 0.0
      ? begin
      : t == 1.0
          ? end
          : lerp(t);

  @override
  String toString() =>
      '${objectRuntimeType(this, 'Animatable')}($begin \u2192 $end)';
}
