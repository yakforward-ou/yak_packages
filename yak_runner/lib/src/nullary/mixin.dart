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
    void Function() onFailure,
  }) {
    try {
      return Right(
        function(),
      );
    } catch (_) {
      if(onFailure != null) {
        onFailure();
      }
      return Left(
        FunctionFailure(),
      );
    }
  }
}

/// [YakNullarySafetyMixin] is meant to asychronously catch failures 
/// for the provided function and calling [onFailure] callback on that occurrence

mixin YakNullaryAsyncSafetyMixin<T> implements YakNullarySafetyAsyncInterface<T> {
  @protected
  @override
  Future<Either<Failure, T>> safe({
    @required Future<T> Function() function, 
    void Function() onFailure,
  }) async {
    try {
      return Right(
        await function(),
      );
    } catch (_) {
      if(onFailure != null) {
        onFailure();
      }
      return Left(
        FunctionFailure(),
      );
    }
  }
}