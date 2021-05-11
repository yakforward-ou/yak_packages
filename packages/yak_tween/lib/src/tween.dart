import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// an `Tween` that allows `const` constructor

class YakTween<T extends dynamic> extends Animatable<T> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakTween({
    required this.begin,
    required this.end,
  });

  /// `begin` represent the value at lerp `0`
  final T begin;

  /// `end` represent the value at lerp `1`
  final T end;

  /// `lerp` return a value between `begin` and `end`
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
