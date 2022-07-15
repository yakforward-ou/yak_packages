/// a class that holds a counter that can only be increased or reset
class Counter {
  /// store the count privately
  var _count = 0;

  /// exposes the count
  int get count => _count;

  /// increses the count by one, it's meant for internal use
  void increase() => _count++;

  /// set the count to `0`
  void reset() => _count = 0;
}
