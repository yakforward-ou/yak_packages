# Example

```dart
import 'package:stub/stub.dart';
import 'package:test/test.dart';

mixin Foo<T> {
  T foo();
  T baz();
  T bar();
}

class FooStub<T> extends Stub<T> implements Foo<T> {
  @override
  T bar() => throw UnimplementedError();
  @override
  T baz() => throw UnimplementedError();
  @override
  T foo() => stub();
}

void main() {
  group('`Stub` test', () {
      final fooStub = FooStub<int>();
      const data = 1;
    test(
        'GIVEN `stub != null`'
        'WHEN Foo.foo is called '
        'THEN returns `result`', () {
      fooStub.reset;
      fooStub.result = () => data;
      expect(
        fooStub.foo(),
        data,
        reason: '`Foo.foo` should match `data`',
      );
    });
  });
}
```
you may directly look at the tests for a more comprehensive example
