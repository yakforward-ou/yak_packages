import 'dart:math';

import 'package:speedtest/src/sprint.dart';
import 'package:test/test.dart';

void main() {
  const d = Duration(milliseconds: 100);
  const parameter = 100;
  void subject() async => await Future.delayed(d);

  group('SprintTest', () {
    test(
        'GIVEN a `subject` function of duration `d` '
        'WHEN `SprintTest` parameter `n` '
        'THEN call return ~d*n', () {
      final benchmark = SprintTest(subject: subject, parameter: parameter);

      expect(benchmark()!.inMilliseconds/parameter, moreOrLessEquals(d.inMilliseconds));
    });
  });
}
