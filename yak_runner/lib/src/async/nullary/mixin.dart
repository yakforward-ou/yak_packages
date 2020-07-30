import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'interfaces.dart';

/// [YakNullarySafetyMixin] is meant to asychronously catch failures
/// for the provided function and calling [onFailure] callback on that occurrence

mixin YakAsyncNullarySafetyMixin<T>
    implements YakAsyncNullarySafetyInterface<T> {
  @protected
  @override
  Future<Either<Failure, T>> safe({
    @required Future<T> Function() function,
    void Function() onFunctionFailure,
  }) async {
    try {
      return Right(
        await function(),
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
