import 'package:stub/stub.dart';

class Foo {
  int foo() => 42;
  String bar(int i) => 'hello';
  String baz(int i, String s) => 'world';
  String fizz({required int i, required String s}) => '!';
}

class FooMock implements Foo {
  final fooStub = nullaryStub<int>();
  final barStub = unaryStub<String, int>();
  final bazStub = unaryStub<String, List>();
  final fizzStub = unaryStub<String, Map>();

  /// this is totally optional
  void get reset {
    fooStub.reset;
    barStub.reset;
    bazStub.reset;
    fizzStub.reset;
  }

  @override
  String bar(int i) => barStub.wrap(i);

  @override
  String baz(int i, String s) => bazStub.wrap([i, s]);

  @override
  String fizz({required int i, required String s}) =>
      fizzStub.wrap({'i': i, 's': s});

  @override
  int foo() => fooStub.wrap();
}
