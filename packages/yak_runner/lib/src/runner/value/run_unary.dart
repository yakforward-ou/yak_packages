import 'package:yak_result/yak_result.dart' show ResultUnary, Result;
import 'package:yak_utils/yak_utils.dart' show Unary;

/// takes as argument a [Unary] returns a [ResultUnary]
ResultUnary<T, S> unaryRun<T extends Object, S extends Object>(
        Unary<T, S> function) =>
    (S arg) {
      try {
        return Result.success(function(arg));
      } on Error catch (e) {
        return Result.failure(e, e.stackTrace ?? StackTrace.empty);
      } on Exception catch (e, s) {
        return Result.failure(e, s);
      }
    };
