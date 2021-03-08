import '../all.dart';

/// a mixin that holds a `type`
mixin TypeMixin<T> on StubBase<T> {
  /// type is the `Type` of the `stub`
  final type = T;
}
