import '../all.dart';

/// represent a failure of a function
class Failure<T> extends Error implements Result<T> {
  /// has a const constructor
  Failure({this.reason, this.stackTrace});

  /// may hold an `object`
  final Object? reason;

  /// may hold an `stackTrace`
  @override
  final StackTrace? stackTrace;

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

  @override
  int get hashCode => Object.hashAll([runtimeType, reason, stackTrace]);

  @override
  String toString() => reason == null
      ? '$runtimeType'
      : '$runtimeType: ${Error.safeToString(reason)}';
}
