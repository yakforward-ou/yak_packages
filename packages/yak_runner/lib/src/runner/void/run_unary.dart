import 'package:yak_result/yak_result.dart'
    show VoidResultUnary, VoidSuccess, Failure;
import 'package:yak_utils/yak_utils.dart' show Unary;

/// takes as argument a [Unary] returns a [VoidResultUnary]
VoidResultUnary<S> unaryRunVoid<T, S>(Unary<T, S> function) => (S arg) {
      try {
        function(arg);
        return const VoidSuccess<void>();
      } on Error catch (e) {
        return Failure.fromError(e);
      } on Exception catch (e, s) {
        return Failure(e, s);
      }
    };
