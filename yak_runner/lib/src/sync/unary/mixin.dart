import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'interfaces.dart';

/// [YakUnarySafetyMixin] is meant to catch failures for the provided function
/// and calling [onFailure] callback on that occurrence

mixin YakUnarySafetyMixin<T, S> implements YakUnarySafetyInterface<T, S> {
  @protected
  @override
  Either<Failure, T> safe({
    @required T Function(S arg) function,
    @required S arg,
    void Function() onFunctionFailure,
  }) {
    try {
      return Right(
        function(arg),
      );
    } catch (_) {
      if (onFunctionFailure != null) {
        onFunctionFailure();
      }
      return Left(
        const FunctionFailure(),
      );
    }
  }
}
