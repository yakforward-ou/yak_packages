import '../all.dart';

/// represent a failure of a function
class Failure<T> implements Result<T> {
  /// has a const constructor
  const Failure({this.reason, this.stackTrace, this.message});

  /// may hold an `object`
  final Object? reason;

  /// may hold an `stackTrace`
  final StackTrace? stackTrace;

  /// may hold an `objmessageect`
  final String? message;
}
