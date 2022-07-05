import '../all.dart';

/// `runNullarySync` takes as argument a `Nullary`
/// and return a `RunNullarySync`
/// e.g: see `RunNullarySyncX`
RunNullarySync<T> runNullarySync<T>(Nullary<T> function) => () {
      try {
        return Success(function());
      } on Error catch (e) {
        return Failure(reason: e, stackTrace: e.stackTrace);
      } on Exception catch (e, s) {
        return Failure(reason: e, stackTrace: s);
      }
    };
