import 'package:meta/meta.dart';
import 'package:yak_utils/yak_utils.dart';

/// represent the outcome of a functionf
abstract class Result<T> {
  /// allows a const constructor
  const Result();

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

  @override
  int get hashCode => Object.hash(runtimeType, T.runtimeType);

  @override
  @nonVirtual
  String toString() => '${toJson()}';

  /// allow compatibility with [dart:convert]
  Json toJson();
}
