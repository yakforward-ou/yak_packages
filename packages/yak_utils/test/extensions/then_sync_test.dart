import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

void main() {
  group('ThenSyncX', () {
    test(
        'GIVEN a S target and a Unary<T,S> function '
        'WHEN target.then(function) '
        'THEN returns T', () {
      const target = 0;
      String function(int i) => '$i';
      expect(
        target.then(function),
        isA<String>(),
        reason: 'return type should be predictable',
      );
      expect(
        target.then(function) == function(target),
        isTrue,
        reason: 'return value should be unchanged',
      );
    });
  });
}
