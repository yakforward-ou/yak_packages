import 'all.dart';

/// the base `Stub`, `abstract` as it is not meant to be used as `stand-alone`
abstract class Stub<T> extends StubBase<T>
    with StubResetMixin<T>
    implements CallCounterMixin {
  int _count;

  /// initialize the `callCount`
  Stub() : _count = 0;

  @override
  void get increaseCallCount => _count++;

  @override
  void get resetCallCount => _count = 0;

  @override
  int get callCount => _count;
}
