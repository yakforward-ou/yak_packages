/// a delegate for `yak_runer` typedef `HandleException`

mixin ExceptionHandler {
  /// implements yak_runer`'s `HandleException`
  void call(Exception e, StackTrace s);
}