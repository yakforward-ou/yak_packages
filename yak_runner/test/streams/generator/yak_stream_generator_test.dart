import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/src/streams/yak_stream_generator.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../async/generator/yak_async_generator_mock.dart';
import '../../sync/generator/yak_generator_mock.dart';
import 'yak_stream_sample.dart';

void main() {
  final int _testInt = 1;
  YakGeneratorInterface<int> _syncInterface;
  //YakAsyncGeneratorInterface<int> _asyncInterface;
  YakGenerator<int> _syncGenerator;
  //YakAsyncGenerator<int> _asyncGenerator;
  

  setUp(() {
    _syncInterface = YakGeneratorInterfaceMock<int>();
    //_asyncInterface = YakAsyncGeneratorInterfaceMock<int>();
    _syncGenerator = YakGenerator(function: _syncInterface);
    //_asyncGenerator = YakAsyncGenerator(function: _asyncInterface);
  });

  group('[YakStreamGenerator] Synchronous Test', () {

    final YakStreamGenerator<int> _streamGenerator = YakStreamGenerator(
      function: _syncGenerator,
    );

    test('SHOULD return "int" WHEN the result is correct',() async {

      when(_syncInterface()).thenAnswer((_) => _testInt );

      final _streamedManyTimes = 10;
      final int _result = await TestStream.result(
        _streamGenerator(
          inbound: TestStream.outbound(_streamedManyTimes),
        ),
      );

      expect(_result,_streamedManyTimes);

      verify(_syncInterface());
    });

    // test('SHOULD return nothing WHEN the result is "null"',() async {
      
    //   when(_syncInterface()).thenAnswer((_) => null );

    //   final _streamedManyTimes = 10;
    //   final int _result = await TestStream.result(
    //     _streamGenerator(
    //       inbound: TestStream.outbound(_streamedManyTimes),
    //     ),
    //   );

    //   expect(_result,0);

    //   verify(_syncInterface());
    // });

    // test('SHOULD return nothing WHEN "Exception" thrown',() async {

    //   when(_syncInterface()).thenThrow(Exception);
      
    //   final _streamedManyTimes = 10;
    //   final int _result = await TestStream.result(
    //     _streamGenerator(
    //       inbound: TestStream.outbound(_streamedManyTimes),
    //     ),
    //   );

    //   expect(_result,0);

    //   verify(_syncInterface());
    // });
  });
}