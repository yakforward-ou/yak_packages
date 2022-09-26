import 'package:test/test.dart';
import 'package:yak_test/yak_test.dart';
import 'package:yak_utils/yak_utils.dart';

void main() {
  group('Union', () {
    equalityTest(
      () => Union('hello', 42),
      () => Union('world', 0),
    );
  });
}
