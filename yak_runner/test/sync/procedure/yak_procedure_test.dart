import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';
import 'yak_function_mock.dart';

void main() {
  final int _testInt = 1;
  YakProcedure<String,int> _logic;
  YakFunctionInterface<String,int> _function;

  setUp(() {
    _function = YakFunctionInterfaceMock<String,int>();
    _logic = YakProcedure<String,int>(function: _function);
  });

  group('[YakProcedure] Synchronous Test', () {
    test('SHOULD return "Right" WHEN the result is correct',() {
      when(_function(_testInt)).thenAnswer((_) => '$_testInt' );

      final Either<Failure,String> _result = _logic(_testInt);
      expect(_result, Right('$_testInt'));

      verify(_function(_testInt));
      verifyNoMoreInteractions(_function); 
    });

    test('SHOULD return "Left" WHEN the result is "null"',() {
      when(_function(_testInt)).thenAnswer((_) => null);

      final Either<Failure,String> _result = _logic(_testInt);
      expect(_result, equals(Left(NullFailure())), );

      verify(_function(_testInt));
      verifyNoMoreInteractions(_function); 
    });

    test('SHOULD return "Left" WHEN "Exception" thrown',() {
      when(_function(_testInt)).thenThrow(Exception);

      final Either<Failure,String> _result = _logic(_testInt);
      expect(_result, equals(Left(FunctionFailure())), );

      verify(_function(_testInt));
      verifyNoMoreInteractions(_function); 
    });
  });
}