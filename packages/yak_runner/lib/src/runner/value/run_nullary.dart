import 'package:yak_result/yak_result.dart' show ResultNullary, Result;
import 'package:yak_utils/yak_utils.dart' show Nullary;

/// takes as argument a [Nullary] returns a [ResultNullary]
ResultNullary<T> nullaryRun<T extends Object>(Nullary<T> function) => () {
      try {
        return Result.success(function());
      } on Error catch (e) {
        return Result.failure(e, e.stackTrace ?? StackTrace.empty);
      } on Exception catch (e, s) {
        return Result.failure(e, s);
      }
    };
