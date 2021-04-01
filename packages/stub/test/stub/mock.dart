import 'package:stub/stub.dart';

class Foo {
  int foo() => 42;
  String bar(int i) => '$i';
  String baz(int i, String s) => '$i$s';
  String fizz({required int i, required String s}) => '$i$s';
}

class FooMock extends Stub implements Foo {
  FooMock() {
    nullary<int>('foo');
    unary<String, int>('bar');
    unary<String, List>('baz');
    unary<String, Map>('fizz');
  }

  @override
  String bar(int i) => this['bar'].stub(i);

  @override
  String baz(int i, String s) => this['baz'].stub([i, s]);

  @override
  String fizz({required int i, required String s}) {
    return this['fizz'].stub({'i': i, 's': s});
  }

  @override
  int foo() => this['foo'].stub();
}
