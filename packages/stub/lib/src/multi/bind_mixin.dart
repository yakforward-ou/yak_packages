import '../all.dart';

/// implements the `bind` method for `MultiStubBase`
mixin MultiStubBindMixin on MultiStubBase {
  @override
  StubElement<T> bind<T>(String name) {
    print('################### BEFORE ${map.entries}');
    final e = map.putIfAbsent(name, () => StubElement<T>());
    print('################### AFTER ${map.entries}');
    return e as StubElement<T>;
  }
}
