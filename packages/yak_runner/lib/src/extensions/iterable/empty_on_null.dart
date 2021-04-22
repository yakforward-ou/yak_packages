//! copy from `yak_math`
// see issue `https://github.com/iapicca/yak_packages/issues/106`

/// an extension on  nullable `Iterable<T>`
extension EmptyOnNullX<T> on Iterable<T>? {
  /// if the `Iterable<T>?` is `null` returns an empty one
  /// useful with `...` operator and such
  Iterable<T> get emptyOnNull => this != null ? this! : Iterable<T>.empty();
}
