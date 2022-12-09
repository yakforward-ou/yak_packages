import 'package:meta/meta.dart';
import 'package:yak_utils/yak_utils.dart';

import '../all.dart';

/// represent a success of a function
abstract class Success<T> implements Result<T> {
  const Success._();

  factory Success([T? value]) =>
      value == null ? VoidSuccess() : ValueSuccess(value);
}

/// represent a success of a function
class ValueSuccess<T> extends Success<T> implements ValueResult<T> {
  /// has a const constructor
  const ValueSuccess(this.value) : super._();

  /// hold the value from a function
  final T value;

  @override
  @nonVirtual
  bool operator ==(Object other) => hashCode == other.hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, value);

  @override
  @nonVirtual
  Json toJson() => {
        'Result': 'Success',
        'value': '$value',
      };
}

/// a result without returning value
class VoidSuccess<T> extends Success<T> implements VoidResult<T> {
  const VoidSuccess() : super._();

  @override
  @nonVirtual
  bool operator ==(Object other) => hashCode == other.hashCode;

  @override
  @nonVirtual
  int get hashCode => runtimeType.hashCode;

  @override
  @nonVirtual
  Json toJson() => const {'Result': 'Success'};
}
