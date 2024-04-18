import 'package:yak_result/yak_result.dart'
    show VoidResultUnaryAsync, VoidResult;
import 'package:yak_utils/yak_utils.dart' show UnaryFutureOr;

/// takes as argument a [UnaryAsync] returns a [VoidResultUnaryAsync]
VoidResultUnaryAsync<S> unaryRunVoidAsync<T, S>(
  UnaryFutureOr<T, S> function,
) =>
    (S arg) async {
      try {
        await function(arg);
        return const VoidResult.success();
      } on Error catch (e) {
        return VoidResult.failure(e, e.stackTrace ?? StackTrace.empty);
      } on Exception catch (e, s) {
        return VoidResult.failure(e, s);
      }
    };
