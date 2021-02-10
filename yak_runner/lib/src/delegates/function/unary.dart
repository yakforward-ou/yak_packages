/// a delegate for a unaary function
mixin UnaryDelegate<T, S> {
  /// `call` represent `T Function(S)`
  T call(S arg);
}
