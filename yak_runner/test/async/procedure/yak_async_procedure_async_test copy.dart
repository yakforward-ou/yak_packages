import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';
import 'yak_async_function_mock.dart';

void main() {

  final Duration _duration200 = Duration(milliseconds: 200);
  final Duration _duration300  = Duration(milliseconds: 300);
  final int _testInt = 1;
  
  YakAsyncProcedure<String,int> _logic;
  YakAsyncFunctionInterfaceMock<String,int> _function;

  setUp(() {
    _function = YakAsyncFunctionInterfaceMock<String,int>();
    _logic = YakAsyncProcedure<String,int>(
      function: _function,
      timeout: _duration300,
    );
  });

  group('[YakAsyncProcedure] Test with async labdas', () {

    test('SHOULD return "Right" WHEN the result is correct && duration < timeout',() async {

      Future<String> _futureString() => Future.delayed(
        _duration200, 
        () => '$_testInt',
      );

      when(_function(_testInt)).thenAnswer((_) => _futureString() );

      final Either<Failure,String> _result = await _logic(_testInt);
      expect(_result, Right('$_testInt'));

      verify(_function(_testInt));
      verifyNoMoreInteractions(_function); 
    });

    test('SHOULD return "Left" WHEN timeout',() async {

     Future<String> _futureString() => Future.delayed(
        _duration200 + _duration300, 
        () => '$_testInt',
      );

      when(_function(_testInt)).thenAnswer((_) => _futureString());

      final Either<Failure,String> _result = await _logic(_testInt);
      expect(_result, equals(Left(TimeOutFailure())), );

      verify(_function(_testInt));
      verifyNoMoreInteractions(_function); 
    });

  });
}