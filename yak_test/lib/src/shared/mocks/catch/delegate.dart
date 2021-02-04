/// a delegate for ` void Function(Object, StackTrace)`

mixin CatchDelegate {
  void call(Object e, StackTrace s);
}
