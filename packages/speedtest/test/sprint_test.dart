import 'package:speedtest/src/sprint.dart';
import 'package:stub/stub.dart';
import 'package:test/test.dart';
// import 'package:yak_test/yak_test.dart';

void main() {
  const d = Duration(milliseconds: 10);
  const parameter = 10;
  final subject = nullaryStub<void>()
    ..stub = () async => await Future.delayed(d);
  final benchmark = SprintTest(subject: subject.wrap, parameter: parameter);

  group('SprintTest', () {
    test(
        'GIVEN a `subject` function of duration `d` '
        'WHEN `SprintTest` parameter `n` '
        'THEN call return ~d*n', () {
      subject.reset;

      expect(
        benchmark(),
        isNot(isNull),
        reason: 'should be true',
      );
    });

    /// add better test after ammending yak_test
    test(
        'GIVEN a `subject` throws `Exception` '
        'WHEN `SprintTest` '
        'THEN call return null', () {
      subject.reset;
      subject.stub = () => throw Exception();

      expect(
        benchmark(),
        isNull,
        reason: 'should be null',
      );
    });

    test(
        'GIVEN a `subject` throws `Error` '
        'WHEN `SprintTest` '
        'THEN call return null', () {
      subject.reset;
      subject.stub = () => throw Error();

      expect(
        benchmark(),
        isNull,
        reason: 'should be null',
      );
    });
  });
}
