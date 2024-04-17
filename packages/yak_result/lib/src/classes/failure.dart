import 'package:meta/meta.dart';

/// represent a failure of a function
class Failure<T> {
  final Object reason;
  final StackTrace stackTrace;

  const Failure(this.reason, this.stackTrace);
  const factory Failure.empty() = _EmptyFailure;

  @override
  @nonVirtual
  bool operator ==(Object other) =>
      other is Failure<T> && hashCode == other.hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(reason, stackTrace);
}

final class _EmptyFailure<T> implements Failure<T> {
  const _EmptyFailure();

  @override
  final reason = const Object();

  @override
  final stackTrace = StackTrace.empty;
}
