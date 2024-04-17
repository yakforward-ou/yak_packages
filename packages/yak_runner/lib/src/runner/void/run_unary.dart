import 'package:yak_result/yak_result.dart' show VoidResultUnary, VoidResult;
import 'package:yak_utils/yak_utils.dart' show Unary;

/// takes as argument a [Unary] returns a [VoidResultUnary]
VoidResultUnary<S> unaryRunVoid<T, S>(Unary<T, S> function) => (S arg) {
      try {
        function(arg);
        return const VoidResult.success();
      } on Error catch (e) {
        return VoidResult.failure(e, e.stackTrace ?? StackTrace.empty);
      } on Exception catch (e, s) {
        return VoidResult.failure(e, s);
      }
    };
