import 'package:yak_result/yak_result.dart'
    show VoidResultUnaryAsync, VoidSuccess, Failure;
import 'package:yak_utils/yak_utils.dart' show UnaryAsync;

/// takes as argument a [UnaryAsync] returns a [VoidResultUnaryAsync]
VoidResultUnaryAsync<S> runUnaryCallbackAsync<T, S>(
  UnaryAsync<T, S> function,
) =>
    (S arg) async {
      try {
        await function(arg);
        return const VoidSuccess<void>();
      } on Error catch (e) {
        return Failure.fromError(e);
      } on Exception catch (e, s) {
        return Failure(e, s);
      }
    };
