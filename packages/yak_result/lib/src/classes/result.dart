import 'package:meta/meta.dart';
import 'package:yak_utils/yak_utils.dart';

/// represent the outcome of a function
abstract class Result<T> {
  /// allows a const constructor
  const Result();

  @override
  @nonVirtual
  String toString() => '${toJson()}';

  /// allow compatibility with [dart:convert]
  Json toJson();
}

/// a result returning value
abstract class ValueResult<T> extends Result<T> {
  const ValueResult();
}

/// a result without returning value
abstract class VoidResult<T> extends Result<T> {
  const VoidResult();
}
