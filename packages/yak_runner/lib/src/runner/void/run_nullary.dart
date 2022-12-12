import 'package:yak_result/yak_result.dart'
    show VoidResultNullary, VoidSuccess, Failure;
import 'package:yak_utils/yak_utils.dart' show Nullary;

/// takes as argument a [Nullary] returns a [VoidResultNullary]
VoidResultNullary runCallback<T>(Nullary<T> function) => () {
      try {
        function();
        return const VoidSuccess<void>();
      } on Error catch (e) {
        return Failure.fromError(e);
      } on Exception catch (e, s) {
        return Failure(e, s);
      }
    };
