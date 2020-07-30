import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'interfaces.dart';

/// [YakNullarySafetyMixin] is meant to catch failures for the provided function
/// and calling [onFailure] callback on that occurrence

mixin YakNullarySafetyMixin<T> implements YakNullarySafetyInterface<T> {
  @protected
  @override
  Either<Failure, T> safe({
    @required T Function() function,
    void Function() onFunctionFailure,
  }) {
    try {
      return Right(
        function(),
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
