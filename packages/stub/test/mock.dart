import 'package:stub/stub.dart';

class Foo {
  int foo() => 42;
  String bar(int i) => 'hello';
  String baz(int i, String s) => 'world';
  String fizz({required int i, required String s}) => '!';
}

class FooMock implements Foo {
  final fooStub = Stub.nullary<int>();
  final barStub = Stub.unary<String, int>();
  final bazStub = Stub.unary<String, List>();
  final fizzStub = Stub.unary<String, Map>();

  /// this is totally optional
  void reset() {
    fooStub.reset();
    barStub.reset();
    bazStub.reset();
    fizzStub.reset();
  }

  @override
  String bar(int i) => barStub(i);

  @override
  String baz(int i, String s) => bazStub([i, s]);

  @override
  String fizz({required int i, required String s}) =>
      fizzStub({'i': i, 's': s});

  @override
  int foo() => fooStub();
}
