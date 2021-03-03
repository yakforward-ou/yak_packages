import '../../stub.dart';
import 'all.dart';
// ignore_for_file: avoid_catching_errors

/// a mixin that provides
mixin StubFunctionMixin<T> on StubBase<T> {
  @override
  StubResult<T> get stub {
    assert(
      result != null,
      'a `result` must be provided before `stub` is called',
    );
    callCountInternal++;
    try {
      return StubResult.success(result!());
    } on Error catch (e) {
      return StubResult.error(e);
    } on Exception catch (e, _) {
      return StubResult.exception(e);
    }
  }
}
