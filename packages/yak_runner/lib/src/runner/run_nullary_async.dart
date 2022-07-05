import '../all.dart';

/// `runNullaryAsync` takes as argument a `NullaryAsync`
/// and return a `RunNullaryAsync`
/// e.g: see `RunNullaryAsyncX`
RunNullaryAsync<T> runNullaryAsync<T>(NullaryAsync<T> function) => () async {
      try {
        return Success(await function());
      } on Error catch (e) {
        return Failure(reason: e, stackTrace: e.stackTrace);
      } on Exception catch (e, s) {
        return Failure(reason: e, stackTrace: s);
      }
    };
