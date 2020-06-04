import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import '../../yak_runner.dart';

abstract class YakGeneratorInterface<T> {
  T call();
}

class YakGenerator<T> {
  const YakGenerator({
    @required this.function,
  }) : assert(function != null);
  final T Function() function;

  Either<Failure,T> call() {
    T _result;
    try {
      _result = function();
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
