import 'package:yak_result/yak_result.dart'
    show ResultNullary, ValueSuccess, Failure;
import 'package:yak_utils/yak_utils.dart' show Nullary;

/// takes as argument a [Nullary] returns a [ResultNullary]
ResultNullary<T> runNullary<T>(Nullary<T> function) => () {
      try {
        return ValueSuccess(function());
      } on Error catch (e) {
        return Failure.fromError(e);
      } on Exception catch (e, s) {
        return Failure(e, s);
      }
    };
