import '../all.dart';

/// `ResultUnary` takes as argument a `Unary`
/// and return a `ResultUnary`
/// e.g: see `ResultUnaryX`
ResultUnary<T, S> runUnary<T, S>(Unary<T, S> function) => (S arg) {
      try {
        return Success(function(arg));
      } on Error catch (e) {
        return Failure(reason: e, stackTrace: e.stackTrace);
      } on Exception catch (e, s) {
        return Failure(reason: e, stackTrace: s);
      }
    };
