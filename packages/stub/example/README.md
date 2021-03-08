# Example

```dart
import 'package:stub/stub.dart';
import 'package:test/test.dart';

mixin Foo<T> {
  T foo();
}

mixin Bar<T,S> {
  T bar();
  S baz();
}

class FooStub<T> extends Stub<T> implements Foo<T> {
  @override
  T foo() => stub();
}

class BarStub<T,S> extends Multistub implements Bar<T,S> {
  BarStub() {
    bind<T>('bar');
    bind<S>('baz');
  }

  @override
  T bar() => this['bar'].stub();

    @override
  S baz() => this['baz'].stub();
}


void main() {
  group('`Foo` test', () {
      final foo = FooStub<int>();
      const data = 1;
    test(
        'GIVEN `stub != null`'
        'WHEN Foo.foo is called '
        'THEN returns `result`', () {
      foo.reset;
      foo.stub = () => data;
      expect(
        foo.foo(),
        data,
        reason: '`Foo.foo` should match `data`',
      );
      expect(
        foo.callCount,
        1,
        reason: '`foo` should be called once',
      );
    });
  });
  group('`Bar` test', () {
      final bar = BarStub<int,String>();
      const data = 1;

    test(
        'GIVEN `stub != null`'
        'WHEN Foo.foo is called '
        'THEN returns `result`', () {
      fooStub.reset;
      bar['bar'].stub = () => data;
      bar['baz'].stub = () => '$data';
      expect(
        bar.bar(),
        data,
        reason: '`Foo.foo` should match `data`',
      );
       expect(
        bar['bar'].callCount,
        1,
        reason: '`bar` should be called once',
      );
       expect(
        bar['baz'].callCount,
        0,
        reason: '`baz` should not be called',
      );
    });
  });
}
```
you may directly look at the tests for a more comprehensive example
