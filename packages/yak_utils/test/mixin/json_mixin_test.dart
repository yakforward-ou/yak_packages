import 'dart:convert';

import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

const json = {'test': 42};

class ClassWithJsonMixin with JsonMixin {
  const ClassWithJsonMixin();
  @override
  Json toJson() => json;
}

const tester = ClassWithJsonMixin();
void main() {
  group('JsonMixin', () {
    test(
        'GIVEN a class with JsonMixin '
        'WHEN toJson() '
        'THEN result is predictable', () {
      expect(
        tester.toJson(),
        equals(json),
        reason: 'result should be predictable',
      );
    });
    test(
        'GIVEN a class with JsonMixin '
        'WHEN toString() '
        'THEN result is predictable', () {
      expect(
        tester.toString(),
        equals(jsonEncode(json)),
        reason: 'result should be predictable',
      );
    });

    test(
        'GIVEN a class with JsonMixin '
        'WHEN used inside a json '
        'THEN dart:convert calls toJson by default', () {
      final complexJson = {
        'hello': 'world',
        'tester': tester,
      };
      expect(
        jsonEncode(complexJson),
        isA<String>(),
        reason: 'shoudl not throw',
      );

      final jsonified = {
        'hello': 'world',
        'tester': tester.toJson(),
      };
      expect(
        jsonDecode(jsonEncode(complexJson)),
        equals(jsonified),
        reason: 'result should be predictable',
      );
    });
  });
}
