import 'package:yak_result/yak_result.dart' show VoidResultNullary, VoidResult;
import 'package:yak_utils/yak_utils.dart' show Nullary;

/// takes as argument a [Nullary] returns a [VoidResultNullary]
VoidResultNullary nullaryRunVoid<T>(Nullary<T> function) => () {
      try {
        function();
        return const VoidResult.success();
      } on Error catch (e) {
        return VoidResult.failure(e, e.stackTrace ?? StackTrace.empty);
      } on Exception catch (e, s) {
        return VoidResult.failure(e, s);
      }
    };
