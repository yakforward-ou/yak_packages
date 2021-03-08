import '../all.dart';

/// a mixin that implements `bind` method for `MultiStubBase`
mixin MultiStubBindMixin on MultiStubBase {
  void bind<T>(String name) => map.putIfAbsent(name, () => StubElement<T>());
}
