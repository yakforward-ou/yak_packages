import 'tween.dart';
import 'package:flutter/foundation.dart';

class YakConstantTween<T> extends YakTween<T> {
  const YakConstantTween(T value) : super(begin: value, end: value);
  @override
  T lerp(double t) => begin;
  @override
  String toString() =>
      '${objectRuntimeType(this, 'YakConstantTween')}(value: $begin)';
}
