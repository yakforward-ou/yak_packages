import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import '../../yak_runner.dart';

abstract class YakFunctionInterface<T,S> {
  T call(S argument);
}

class YakFunction<T, S> {
  final T Function(S argument) function;
  const YakFunction({
    @required this.function,
  }) : assert(function != null);

  Either<Failure,T> call(S argument) {
     T _result;
    try {
      _result = function(argument);
    } catch (_) {
      return Left( FunctionFailure(), );
    }
    if (_result == null) {
      return Left( NullFailure(), ); 
    } else {
      return Right(_result);
    }
  }
}