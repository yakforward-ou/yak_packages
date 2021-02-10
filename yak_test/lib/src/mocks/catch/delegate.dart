/// a delegate for `void Function(Object, StackTrace)`

mixin CatchDelegate {
  /// `call` is a `void Function(Object, StackTrace)`
  void call(Object e, StackTrace s);
}
