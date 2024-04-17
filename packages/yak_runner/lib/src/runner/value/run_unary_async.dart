import 'package:yak_result/yak_result.dart' show ResultUnaryAsync, Result;

import 'package:yak_utils/yak_utils.dart' show UnaryFutureOr;

/// takes as argument a [UnaryFutureOr] returns a [ResultUnaryAsync]
ResultUnaryAsync<T, S> unaryRunAsync<T extends Object, S>(
        UnaryFutureOr<T, S> function) =>
    (S arg) async {
      try {
        return Result.success(await function(arg));
      } on Error catch (e) {
        return Result.failure(e, e.stackTrace ?? StackTrace.empty);
      } on Exception catch (e, s) {
        return Result.failure(e, s);
      }
    };
