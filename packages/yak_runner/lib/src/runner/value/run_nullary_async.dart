import 'package:yak_result/yak_result.dart'
    show ResultNullaryAsync, ValueSuccess, Failure;
import 'package:yak_utils/yak_utils.dart' show NullaryFutureOr;

/// takes as argument a [NullaryFutureOr] returns a [ResultNullaryAsync]
ResultNullaryAsync<T> nullaryRunAsync<T>(NullaryFutureOr<T> function) =>
    () async {
      try {
        return ValueSuccess(await function());
      } on Error catch (e) {
        return Failure.fromError(e);
      } on Exception catch (e, s) {
        return Failure(e, s);
      }
    };
