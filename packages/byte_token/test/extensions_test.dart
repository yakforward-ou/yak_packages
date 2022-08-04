import 'package:byte_token/byte_token.dart';
import 'package:test/test.dart';

void main() {
  group('PayloadExpiredX', () {
    test(
        'GIVEN Payload expirationTime in the past '
        'WHEN Payload.isExpired '
        'THEN returns true', () {
      const oneDay = Duration(days: 1);
      const millenimumBug = 946677600;
      final yesterday =
          DateTime.now().toUtc().add(-oneDay).millisecondsSinceEpoch;

      final tester = Payload(
        email: 'yakforward@gmail.com',
        emailVerified: true,
        issuedAt: millenimumBug,
        expirationTime: yesterday,
      );

      expect(
        tester.isExpired,
        isTrue,
        reason: 'should return "true"',
      );
    });
    test(
        'GIVEN Payload expirationTime in the future '
        'WHEN Payload.isExpired '
        'THEN returns false', () {
      const oneDay = Duration(days: 1);
      const millenimumBug = 946677600;

      final yesterday =
          DateTime.now().toUtc().add(oneDay).millisecondsSinceEpoch;

      final tester = Payload(
        email: 'yakforward@gmail.com',
        emailVerified: true,
        issuedAt: millenimumBug,
        expirationTime: yesterday,
      );

      expect(
        tester.isExpired,
        isFalse,
        reason: 'should return "false"',
      );
    });
  });
  group('IterableEqualityX', () {
    final list = [for (var i = 0; i < 100; ++i) i];
    final list2 = [for (var i = 1; i <= 100; ++i) i];

    test(
        'GIVEN an Iterable list '
        'WHEN list.equals(list) '
        'THEN returns true', () {
      expect(
        list.equals(list),
        isTrue,
        reason: 'should return "true"',
      );
    });
    test(
        'GIVEN an Iterable list '
        'WHEN list.equals(list2) '
        'THEN returns false', () {
      expect(
        list.equals(list2),
        isFalse,
        reason: 'should return "false"',
      );
    });
  });
}
