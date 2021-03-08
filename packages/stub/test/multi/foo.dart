import 'package:stub/stub.dart';

mixin Foo<T, S> {
  T foo();
  S bar();
}

class FooMultiStub<T, S> extends MultiStub implements Foo<T, S> {
  FooMultiStub() {
    bind<T>('foo');
    bind<S>('bar');
  }

  @override
  T foo() => this['foo'].stub();
  @override
  S bar() => this['bar'].stub();
}
