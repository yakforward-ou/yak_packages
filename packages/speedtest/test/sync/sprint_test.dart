import 'package:speedtest/speedtest.dart';
import 'package:stub/stub.dart';
import 'package:test/test.dart';
// import 'package:yak_test/yak_test.dart';

void main() {
  //const d = Duration(milliseconds: 10);
  const parameter = 10;
  final subject = nullaryStub<void>()..stub = () {};
  Future<Duration?> benchmark() =>
      sprint(subject: subject.wrap, laps: parameter);

  group('SprintTest', () {
    test(
        'GIVEN a `subject` function of duration `d` '
        'WHEN `SprintTest` parameter `n` '
        'THEN call return ~d*n', () async {
      subject.reset;

      expect(
        await benchmark(),
        isNot(isNull),
        reason: 'should be true',
      );
    });
    test(
        'GIVEN a `subject` throws `Exception` '
        'WHEN `SprintTest` '
        'THEN call return null', () async {
      subject.reset;
      subject.stub = () => throw Exception();

      expect(
        await benchmark(),
        isNull,
        reason: 'should be null',
      );
    });

    test(
        'GIVEN a `subject` throws `Error` '
        'WHEN `SprintTest` '
        'THEN call return null', () async {
      subject.reset;
      subject.stub = () => throw Error();

      expect(
        await benchmark(),
        isNull,
        reason: 'should be null',
      );
    });
  });
}
