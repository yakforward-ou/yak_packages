import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:speedtest/speedtest.dart';

void main() {
  final stub = nullaryStub<void>();
  final subject = stub.wrap;
  group('SpeedTestX', () {
    test(
        'GIVEN subject throws '
        'WHEN subject.speedtest'
        'THEN subjet called only once', () {
      stub.stub = () => throw Exception();
      subject.speedTest();
      expect(stub.count, 1, reason: 'subject should be called only once');
    });
  });
}
