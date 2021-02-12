/// `void Function(Object e, StackTrace s)` delegate

mixin CatchDelegate {
  /// `call` is equivalente to `void Function(Object e, StackTrace s)`
  void call(Object e, StackTrace s);
}
