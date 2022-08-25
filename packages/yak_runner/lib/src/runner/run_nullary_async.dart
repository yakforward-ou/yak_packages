import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';

/// `ResultNullaryAsync` takes as argument a `NullaryAsync`
/// and return a `ResultNullaryAsync`
/// e.g: see `ResultNullaryAsyncX`
ResultNullaryAsync<T> runNullaryAsync<T>(NullaryAsync<T> function) => () async {
      try {
        return Success(await function());
      } on Error catch (e) {
        return Failure(reason: e, stackTrace: e.stackTrace);
      } on Exception catch (e, s) {
        return Failure(reason: e, stackTrace: s);
      }
    };
