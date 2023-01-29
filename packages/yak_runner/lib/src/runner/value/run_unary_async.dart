import 'package:yak_result/yak_result.dart'
    show ResultUnaryAsync, ValueSuccess, Failure;
import 'package:yak_utils/yak_utils.dart' show UnaryFutureOr;

/// takes as argument a [UnaryFutureOr] returns a [ResultUnaryAsync]
ResultUnaryAsync<T, S> unaryRunAsync<T, S>(UnaryFutureOr<T, S> function) =>
    (S arg) async {
      try {
        return ValueSuccess(await function(arg));
      } on Error catch (e) {
        return Failure.fromError(e);
      } on Exception catch (e, s) {
        return Failure(e, s);
      }
    };
