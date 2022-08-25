import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';

/// `ResultNullary` takes as argument a `Nullary`
/// and return a `ResultNullary`
/// e.g: see `ResultNullaryX`
ResultNullary<T> runNullary<T>(Nullary<T> function) => () {
      try {
        return Success(function());
      } on Error catch (e) {
        return Failure(reason: e, stackTrace: e.stackTrace);
      } on Exception catch (e, s) {
        return Failure(reason: e, stackTrace: s);
      }
    };
