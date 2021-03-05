/// `void Function(Exception e, StackTrace s)` delegate
mixin HandleExceptionDelegate {
  /// `call` is equivalente to `void Function(Object e, StackTrace s)`
  void call(Exception e, StackTrace s);
}
