import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`TryAnyRun` with `ReturnTypeMixin`', () {
    final _delegate = TryAnyRun<int>(() => throw '');

    test('WHEN `TryAnyRunArgAsync<int>` THEN `return` is `int`', () {
      expect(_delegate.retutnType, int,
          reason: '`returnType` must be the `Type` the function result');
    });
  });
}
