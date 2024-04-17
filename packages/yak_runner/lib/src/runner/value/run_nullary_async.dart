import 'package:yak_result/yak_result.dart' show ResultNullaryAsync, Result;
import 'package:yak_utils/yak_utils.dart' show NullaryFutureOr;

/// takes as argument a [NullaryFutureOr] returns a [ResultNullaryAsync]
ResultNullaryAsync<T> nullaryRunAsync<T extends Object>(
        NullaryFutureOr<T> function) =>
    () async {
      try {
        return Result.success(await function());
      } on Error catch (e) {
        return Result.failure(e, e.stackTrace ?? StackTrace.empty);
      } on Exception catch (e, s) {
        return Result.failure(e, s);
      }
    };
