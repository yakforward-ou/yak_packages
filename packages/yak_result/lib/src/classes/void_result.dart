import 'package:meta/meta.dart';

import 'exceptions.dart';
import 'failure.dart';

@immutable
abstract class VoidResult {
  const VoidResult();

  bool get isSuccess;

  @nonVirtual
  bool get isFailure => !isSuccess;

  Failure<void> get asFailure;

  const factory VoidResult.success() = VoidSuccess;
  const factory VoidResult.failure([Object reason, StackTrace stackTrace]) =
      VoidFailure;

  @override
  @nonVirtual
  bool operator ==(Object other) =>
      other is VoidResult && hashCode == other.hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(isSuccess, asFailure);
}

@immutable
final class VoidSuccess extends VoidResult {
  const VoidSuccess();

  @override
  final isSuccess = true;

  @override
  Failure<void> get asFailure => throw ResultExceptions.notFailureException;
}

@immutable
final class VoidFailure extends VoidResult implements Failure<void> {
  const VoidFailure([
    this.reason = const Object(),
    this.stackTrace = StackTrace.empty,
  ]);
  @override
  final Object reason;
  @override
  final StackTrace stackTrace;

  @override
  final isSuccess = false;

  @override
  Failure<void> get asFailure => this;
}
