import 'package:stub/stub.dart';

mixin Foo<T, S> {
  T foo(S s);
  T baz();
  T bar();
}

class UnaryFooStub<T, S> extends UnaryStub<T, S> implements Foo<T, S> {
  @override
  T bar() => throw UnimplementedError();
  @override
  T baz() => throw UnimplementedError();
  @override
  T foo(S s) => stub(s);
}
