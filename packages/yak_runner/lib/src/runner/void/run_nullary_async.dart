import 'package:yak_result/yak_result.dart'
    show VoidResultNullaryAsync, VoidSuccess, Failure;
import 'package:yak_utils/yak_utils.dart' show NullaryFutureOr;

/// takes as argument a [NullaryAsync] returns a [VoidResultNullaryAsync]
VoidResultNullaryAsync runCallbackAsync<T>(NullaryFutureOr<T> function) =>
    () async {
      try {
        await function();
        return const VoidSuccess<void>();
      } on Error catch (e) {
        return Failure.fromError(e);
      } on Exception catch (e, s) {
        return Failure(e, s);
      }
    };
