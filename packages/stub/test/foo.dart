import 'package:stub/src/result/all.dart';
import 'package:stub/stub.dart';

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
  T foo() => stub.result;
}
