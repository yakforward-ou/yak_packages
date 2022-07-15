import '../all.dart';

/// `ResultUnaryAsync` takes as argument a `UnaryAsync`
/// and return a `ResultUnaryAsync`
/// e.g: see `ResultUnaryAsyncX`
ResultUnaryAsync<T, S> runUnaryAsync<T, S>(UnaryAsync<T, S> function) =>
    (S arg) async {
      try {
        return Success(await function(arg));
      } on Error catch (e) {
        return Failure(reason: e, stackTrace: e.stackTrace);
      } on Exception catch (e, s) {
        return Failure(reason: e, stackTrace: s);
      }
    };
