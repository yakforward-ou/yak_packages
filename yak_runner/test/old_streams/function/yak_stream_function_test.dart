// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:yak_runner/src/streams/yak_stream_function.dart';
// import 'package:yak_runner/yak_runner.dart';
// import '../../async/function/yak_async_function_mock.dart';


// void main() {
//   final int _testInt = 1;
//   final int _streamedManyTimes = 10;
//   final Duration _duration200 = Duration(milliseconds: 200);
//   final Duration _duration300  = Duration(milliseconds: 300);
//   Stream<int> stream(int to) async* {
//     for (int i = 1; i <= to; i++) {
//       yield 1;
//     }
//   }
//   YakAsyncFunctionInterface<String,int> _asyncInterface;
//   YakAsyncFunction<String,int> _asyncFunction;
//   YakStreamFunction<String,int> _streamFunction;

//    Future<String> _futureString() => Future.delayed(
//       _duration200, 
//       () => '$_testInt',
//     );

//     Future<String> _futureStringLate() => Future.delayed(
//       _duration200, 
//       () => '$_testInt',
//     );

//   group('[YakStreamFunction] Test with TIMEOUT', () {

//     setUp(() {
//       _asyncInterface = YakAsyncFunctionInterfaceMock<String,int>();
//       _asyncFunction = YakAsyncFunction<String,int>(
//         function: _asyncInterface,
//         timeout: _duration300,
//       );
//       _streamFunction = YakStreamFunction<String,int>(
//         function: _asyncFunction,
//         onFailure: (_) {},
//       );
//     });

//     test('SHOULD return "T" WHEN the result is correct', () async {
//       when(_asyncInterface(1)).thenAnswer((_) => _futureString());

//       int _result;
//       _streamFunction(
//           stream: stream(_streamedManyTimes),
//         ).listen((String data) => ++_result).onDone(() {
//             expect(_result, _streamedManyTimes);
//             verify(_asyncInterface(1));
//       });
//     });

//     test('SHOULD return nothing WHEN the result is "null"', () async {
//       when(_asyncInterface(1)).thenAnswer((_) => null);

//       int _result;
//       _streamFunction(
//           stream: stream(_streamedManyTimes),
//         ).listen((String data) => ++_result).onDone(() {
//           expect(_result, 0);
//           verify(_asyncInterface(1));
//        });
//     });

//     test('SHOULD return nothing WHEN "Exception" is thrown', () async {
//       when(_asyncInterface(1)).thenThrow(Exception);
//       int _result;
//       _streamFunction(
//           stream: stream(_streamedManyTimes),
//         ).listen((String data) => ++_result).onDone(() {
//           expect(_result, 0);
//           verify(_asyncInterface(1));
//        });
//     });

//     test('SHOULD return nothing WHEN timeout',() async {
//       when(_asyncInterface(any)).thenAnswer((_) => _futureStringLate());
//       int _result;
//       _streamFunction(
//           stream: stream(_streamedManyTimes),
//         ).listen((String data) => ++_result).onDone(() {
//           expect(_result, 0);
//           verify(_asyncInterface(1));
//       });
//     });
//   });

//    group('[YakStreamFunction] Test WITHOUT TIMEOUT', () {

//     setUp(() {
//       _asyncInterface = YakAsyncFunctionInterfaceMock<String,int>();
//       _asyncFunction = YakAsyncFunction<String,int>(
//         function: _asyncInterface,
//       );
//       _streamFunction = YakStreamFunction<String,int>(
//         function: _asyncFunction,
//         onFailure: (_) {},
//       );
//     });

//     test('SHOULD return "T" WHEN the result is correct', () async {
//       when(_asyncInterface(1)).thenAnswer((_) => _futureString());
//       int _result;
//       _streamFunction(
//           stream: stream(_streamedManyTimes),
//         ).listen((String data) => ++_result).onDone(() {
//             expect(_result, _streamedManyTimes);
//             verify(_asyncInterface(1));
//       });
//     });

//     test('SHOULD return nothing WHEN the result is "null"', () async {
//       when(_asyncInterface(1)).thenAnswer((_) => null);
//       int _result;
//       _streamFunction(
//           stream: stream(_streamedManyTimes),
//         ).listen((String data) => ++_result).onDone(() {
//           expect(_result, 0);
//           verify(_asyncInterface(1));
//        });
//     });

//     test('SHOULD return nothing WHEN "Exception" is thrown', () async {
//       when(_asyncInterface(1)).thenThrow(Exception);
//       int _result;
//       _streamFunction(
//           stream: stream(_streamedManyTimes),
//         ).listen((String data) => ++_result).onDone(() {
//           expect(_result, 0);
//           verify(_asyncInterface(1));
//        });
//     });
//   });
// }
