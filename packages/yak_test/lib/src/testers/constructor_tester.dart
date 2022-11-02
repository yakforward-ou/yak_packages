import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

/// ensure coverage of a class contructor
//**
//eg:
//```dart
//class Foo {
//   const Foo();
// }
// void main() => constructorTester(Foo.new);
// ```
// */
void constructorTester<T>(Nullary<T> tester) => test(
      'GIVEN Nullary<$T> tester'
      'WHEN tester() '
      'THEN should be of type $T',
      () => expect(
        tester(),
        isA<T>(),
        reason: 'type should match',
      ),
    );
