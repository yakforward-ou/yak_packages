import 'package:yak_result/yak_result.dart'
    show ResultNullaryAsync, ValueSuccess, Failure;
import 'package:yak_utils/yak_utils.dart' show NullaryAsync;

/// takes as argument a [NullaryAsync] returns a [ResultNullaryAsync]
ResultNullaryAsync<T> runNullaryAsync<T>(NullaryAsync<T> function) => () async {
      try {
        return ValueSuccess(await function());
      } on Error catch (e) {
        return Failure.fromError(e);
      } on Exception catch (e, s) {
        return Failure(e, s);
      }
    };
