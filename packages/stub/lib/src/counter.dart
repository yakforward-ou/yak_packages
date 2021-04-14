import 'package:meta/meta.dart';
import 'method.dart';

/// a mixin on `Stub` that implements the count method
mixin Counter<Z> on Stub<Z> {
  int _count = 0;
  int get count => _count;

  /// increses the count by one, it's meant for internal use
  @internal
  void increase() => _count++;

  void get reset => _count = 0;
}
