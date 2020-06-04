import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import '../../yak_runner.dart';


class YakGenerator<T> {
  final T Function() function;
  const YakGenerator({
    @required this.function,
  }) : assert(function != null);

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
