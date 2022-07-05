import 'package:yak_result/yak_result.dart';

import '../all.dart';

/// `runUnarySync` takes as argument a `Unary`
/// and return a `RunUnarySync`
/// e.g: see `RunUnarySyncX`
RunUnarySync<T, S> runUnarySync<T, S>(Unary<T, S> function) => (S arg) {
      try {
        return Success(function(arg));
      } on Error catch (e) {
        return Failure(reason: e, stackTrace: e.stackTrace);
      } on Exception catch (e, s) {
        return Failure(reason: e, stackTrace: s);
      }
    };
