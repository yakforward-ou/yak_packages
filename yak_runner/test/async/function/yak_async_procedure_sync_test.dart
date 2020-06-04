import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';
import 'yak_async_function_mock.dart';

void main() {
  
  final int _testInt = 1;
  YakAsyncFunction<String,int> _logic;
  YakAsyncFunctionInterfaceMock<String,int> _function;

  setUp(() {
    _function = YakAsyncFunctionInterfaceMock<String,int>();
    _logic = YakAsyncFunction<String,int>(function: _function);
  });

  group('[YakAsyncProcedure] Test with synchronous labdas', () {

 test('SHOULD return "Right" WHEN the result is correct',() async {
      when(_function(_testInt)).thenAnswer((_) => '$_testInt' );

      final Either<Failure,String> _result = await _logic(_testInt);
      expect(_result, Right('$_testInt'));

      verify(_function(_testInt));
      verifyNoMoreInteractions(_function); 
    });

    test('SHOULD return "Left" WHEN the result is "null"',() async {
      when(_function(_testInt)).thenAnswer((_) => null);

      final Either<Failure,String> _result = await _logic(_testInt);
      expect(_result, equals(Left(NullFailure())), );

      verify(_function(_testInt));
      verifyNoMoreInteractions(_function); 
    });

    test('SHOULD return "Left" WHEN "Exception" thrown',() async {
      when(_function(_testInt)).thenThrow(Exception);

      final Either<Failure,String> _result = await _logic(_testInt);
      expect(_result, equals(Left(FunctionFailure())), );

      verify(_function(_testInt));
      verifyNoMoreInteractions(_function); 
    });
  });
}