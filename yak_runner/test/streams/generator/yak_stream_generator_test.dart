import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/src/streams/yak_stream_generator.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../async/generator/yak_async_generator_mock.dart';
import 'yak_stream_sample.dart';

void main() {
  final int _testInt = 1;
  YakAsyncGeneratorInterface<int> _asyncInterface;
  YakAsyncGenerator<int> _asyncGenerator;
  YakStreamGenerator<int> _streamGenerator;
  setUp(() {
    _asyncInterface = YakAsyncGeneratorInterfaceMock<int>();
    _asyncGenerator = YakAsyncGenerator<int>(
      function: _asyncInterface,
    );
    _streamGenerator = YakStreamGenerator<int>(
      generator: _asyncGenerator,
      onFailure: (_) {},
    );
  });

  group('[YakStreamGenerator] Test', () {
    test('SHOULD return "T" WHEN the result is correct', () async {
      when(_asyncInterface()).thenAnswer((_) => _testInt);

      final _streamedManyTimes = 10;
      final int _result = await TestStream.result(
        _streamGenerator(
          stream: TestStream.outbound(_streamedManyTimes),
        ),
      );

      expect(_result, _streamedManyTimes);

      verify(_asyncInterface());
    });

    test('SHOULD return nothing WHEN the result is "null"', () async {
      when(_asyncInterface()).thenAnswer((_) => null);

      final _streamedManyTimes = 10;
      final int _result = await TestStream.result(
        _streamGenerator(
          stream: TestStream.outbound(_streamedManyTimes),
        ),
      );

      expect(_result, 0);

      verify(_asyncInterface());
    });

    test('SHOULD return nothing WHEN "Exception" is thrown', () async {
      when(_asyncInterface()).thenThrow(Exception);

      final _streamedManyTimes = 10;
      final int _result = await TestStream.result(
        _streamGenerator(
          stream: TestStream.outbound(_streamedManyTimes),
        ),
      );

      expect(_result, 0);

      verify(_asyncInterface());
    });
   });
 }