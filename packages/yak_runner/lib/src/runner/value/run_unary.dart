import 'package:yak_result/yak_result.dart'
    show ResultUnary, ValueSuccess, Failure;
import 'package:yak_utils/yak_utils.dart' show Unary;

/// takes as argument a [Unary] returns a [ResultUnary]
ResultUnary<T, S> unaryRun<T, S>(Unary<T, S> function) => (S arg) {
      try {
        return ValueSuccess(function(arg));
      } on Error catch (e) {
        return Failure.fromError(e);
      } on Exception catch (e, s) {
        return Failure(e, s);
      }
    };
