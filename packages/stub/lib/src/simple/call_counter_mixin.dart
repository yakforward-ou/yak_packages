/// a mixin that counts `call`
mixin CallCounterMixin {
  /// increase by one the call `callCount`
  void get increaseCallCount;

  /// set `callCount` to `0`
  void get resetCallCount;

  /// return the `callCount`
  int get callCount;
}
