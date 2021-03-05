/// `HandleExactError` delegate
mixin HandleExactErrorDelegate<T extends Error> {
  /// `call` is equivalente to `HandleExactError`
  void call(T e);
}
