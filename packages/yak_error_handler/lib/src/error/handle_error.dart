/// `void Function(Error e)` delegate
mixin HandleErrorDelegate<T> {
  /// `call` is equivalente to `void Function(Error e)`
  T? call(Error e);
}
