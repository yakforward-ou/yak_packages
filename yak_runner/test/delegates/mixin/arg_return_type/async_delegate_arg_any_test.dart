import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`TryAnyRunArgAsync` with `ArgAndReturnTypeMixin`', () {
    final _delegate = TryAnyRunArgAsync<String, int>((_) => throw '');

    test('WHEN `TryAnyRunArgAsync<String,int>` THEN `argType` is `int`', () {
      expect(_delegate.argType, int,
          reason: '`argType must be the ``Type` the function argument');
    });

    test('WHEN `TryAnyRunArgAsync<String,int>` THEN `return` is `String`', () {
      expect(_delegate.retutnType, String,
          reason: '`returnType` must be the `Type` the function result');
    });
  });
}
