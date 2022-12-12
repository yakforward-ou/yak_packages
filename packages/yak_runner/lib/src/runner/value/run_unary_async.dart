import 'package:yak_result/yak_result.dart'
    show ResultUnaryAsync, ValueSuccess, Failure;
import 'package:yak_utils/yak_utils.dart' show UnaryAsync;

/// takes as argument a [UnaryAsync] returns a [ResultUnaryAsync]
ResultUnaryAsync<T, S> runUnaryAsync<T, S>(UnaryAsync<T, S> function) =>
    (S arg) async {
      try {
        return ValueSuccess(await function(arg));
      } on Error catch (e) {
        return Failure.fromError(e);
      } on Exception catch (e, s) {
        return Failure(e, s);
      }
    };
