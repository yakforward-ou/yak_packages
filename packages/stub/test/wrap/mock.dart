import 'package:stub/stub.dart';

// ignore_for_file: invalid_use_of_internal_member

class Foo {
  int foo() => 42;
  String bar(int i) => '$i';
  String baz(int i, String s) => '$i$s';
  String fizz({required int i, required String s}) => '$i$s';
}

class FooMock implements Foo {
  final fooStub = nullaryStub<int>();
  final barStub = unaryStub<String, int>();
  final bazStub = unaryStub<String, List>();
  final fizzStub = unaryStub<String, Map>();

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
