import 'all.dart';

/// a mixin that provides
mixin StubFunctionMixin<T> on StubBase<T> {
  @override
  T stub() {
    assert(
      result != null,
      'a `result` must be provided before `stub` is called',
    );
    callCountInternal++;
    return result!();
  }
}
