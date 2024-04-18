import 'package:yak_result/yak_result.dart'
    show VoidResultNullaryAsync, VoidResult;
import 'package:yak_utils/yak_utils.dart' show NullaryFutureOr;

/// takes as argument a [NullaryAsync] returns a [VoidResultNullaryAsync]
VoidResultNullaryAsync nullaryRunVoidAsync<T>(NullaryFutureOr<T> function) =>
    () async {
      try {
        await function();
        return const VoidResult.success();
      } on Error catch (e) {
        return VoidResult.failure(e, e.stackTrace ?? StackTrace.empty);
      } on Exception catch (e, s) {
        return VoidResult.failure(e, s);
      }
    };
