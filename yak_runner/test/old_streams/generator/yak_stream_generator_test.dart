// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:yak_runner/src/streams/yak_stream_generator.dart';
// import 'package:yak_runner/yak_runner.dart';
// import '../../async/generator/yak_async_generator_mock.dart';

// void main() {
//   final int _testInt = 1;
//   final int _streamedManyTimes = 10;
//   final Duration _duration200 = Duration(milliseconds: 200);
//   final Duration _duration300  = Duration(milliseconds: 300);
//   Stream<int> stream(int to) async* {
//     for (int i = 1; i <= to; i++) {
//       yield i;
//     }
//   }

//   YakAsyncGeneratorInterface<int> _asyncInterface;
//   YakAsyncGenerator<int> _asyncGenerator;
//   YakStreamGenerator<int> _streamGenerator;

//   group('[YakStreamGenerator] Test with TIMEOUT', () {

//      setUp(() {
//       _asyncInterface = YakAsyncGeneratorInterfaceMock<int>();
//       _asyncGenerator = YakAsyncGenerator<int>(
//         function: _asyncInterface,
//         timeout: _duration300,
//       );
//       _streamGenerator = YakStreamGenerator<int>(
//         generator: _asyncGenerator,
//         onFailure: (_) {},
//       );
//     });

//     test('SHOULD return "T" WHEN the result is correct', () async {

//       Future<int> _futureInt() => Future.delayed(
//         _duration200, 
//         () => _testInt,
//       );
      
//       when(_asyncInterface()).thenAnswer((_) => _futureInt());

//       int _result;
//       _streamGenerator(
//           stream: stream(_streamedManyTimes),
//         ).listen((int data) => ++_result).onDone(() {
//           expect(_result, _streamedManyTimes);
//           verify(_asyncInterface());
//        });
//     });

//     test('SHOULD return nothing WHEN the result is "null"', () async {
//       when(_asyncInterface()).thenAnswer((_) => null);

//       int _result;
//       _streamGenerator(
//           stream: stream(_streamedManyTimes),
//         ).listen((int data) => ++_result).onDone(() {
//           expect(_result, 0);
//           verify(_asyncInterface());
//        });
//     });

//     test('SHOULD return nothing WHEN "Exception" is thrown', () async {
//       when(_asyncInterface()).thenThrow(Exception);

//       int _result;
//       _streamGenerator(
//           stream: stream(_streamedManyTimes),
//         ).listen((int data) => ++_result).onDone(() {
//           expect(_result, 0);
//           verify(_asyncInterface());
//        });
//    });

//     test('SHOULD return nothing WHEN timeout',() async {

//       Future<int> _futureInt() => Future.delayed(
//         _duration300 + _duration200, 
//         () => _testInt,
//       );

//       when(_asyncInterface()).thenAnswer((_) => _futureInt());

//       int _result;
//       _streamGenerator(
//           stream: stream(_streamedManyTimes),
//         ).listen((int data) => ++_result).onDone(() {
//           expect(_result, 0);
//           verify(_asyncInterface());
//        });
//     });
//   });

//     group('[YakStreamGenerator] Test WITHOUT TIMEOUT', () {

//      setUp(() {
//       _asyncInterface = YakAsyncGeneratorInterfaceMock<int>();
//       _asyncGenerator = YakAsyncGenerator<int>(
//         function: _asyncInterface,
//       );
//       _streamGenerator = YakStreamGenerator<int>(
//         generator: _asyncGenerator,
//         onFailure: (_) {},
//       );
//     });

//     test('SHOULD return "T" WHEN the result is correct', () async {

//       Future<int> _futureInt() async => _testInt;
      
//       when(_asyncInterface()).thenAnswer((_) => _futureInt());

//       int _result;
//       _streamGenerator(
//           stream: stream(_streamedManyTimes),
//         ).listen((int data) => ++_result).onDone(() {
//           expect(_result, _streamedManyTimes);
//           verify(_asyncInterface());
//        });
//     });

//     test('SHOULD return nothing WHEN the result is "null"', () async {
//       when(_asyncInterface()).thenAnswer((_) => null);

//       int _result;
//       _streamGenerator(
//           stream: stream(_streamedManyTimes),
//         ).listen((int data) => ++_result).onDone(() {
//           expect(_result, 0);
//           verify(_asyncInterface());
//        });
//     });

//     test('SHOULD return nothing WHEN "Exception" is thrown', () async {
//       when(_asyncInterface()).thenThrow(Exception);

//       int _result;
//       _streamGenerator(
//           stream: stream(_streamedManyTimes),
//         ).listen((int data) => ++_result).onDone(() {
//           expect(_result, 0);
//           verify(_asyncInterface());
//        });
//    });
//   });
// }