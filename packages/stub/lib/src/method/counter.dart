import 'package:meta/meta.dart';

import 'stub.dart';

/// a mixin on `Stub` that implements the count method
mixin Counter<Z> on StubMethod<Z> {
  int _count = 0;
  int get count => _count;

  /// increses the count by one, it's meant for internal use
  @internal
  void increase() => _count++;

  void get reset => _count = 0;
}
