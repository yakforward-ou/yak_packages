import 'package:flutter/foundation.dart';
import 'tween.dart';

/// an `ConstantTween` that allows `const` constructor
class YakConstantTween<T> extends YakTween<T> {
  /// has a parameter `value`
  const YakConstantTween(T value)
      : super(
          begin: value,
          end: value,
        );

  @override
  T lerp(_) => begin;

  @override
  String toString() =>
      '${objectRuntimeType(this, 'YakConstantTween')}(value: $begin)';
}
