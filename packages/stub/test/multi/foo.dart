import 'package:stub/stub.dart';

mixin Foo<T, S> {
  T foo();
  S bar();
}

class FooMultiStub<T, S> extends MultiStub implements Foo<T, S> {
  @override
  T foo() => bind<T>('foo').stub();
  @override
  S bar() => bind<S>('bar').stub();
}
