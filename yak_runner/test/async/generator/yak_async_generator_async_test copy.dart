import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';
import 'yak_async_yield_mock.dart';


void main() {

  final Duration _duration200 = Duration(milliseconds: 200);
  final Duration _duration300  = Duration(milliseconds: 300);
  final int _testInt = 1;
  
  YakAsyncGenerator<int> _logic;
  YakAsyncYieldInterfaceMock<int> _yield;

  setUp(() {
    _yield = YakAsyncYieldInterfaceMock<int>();
    _logic = YakAsyncGenerator<int>(
      function: _yield,
      timeout: _duration300,
    );
  });

  group('[YakAsyncGenerator] Test with async labdas', () {

    test('SHOULD return "Right" WHEN the result is correct && duration < timeout',() async {

      Future<int> _futureInt() => Future.delayed(
        _duration200, 
        () => _testInt,
      );

      when(_yield()).thenAnswer((_) => _futureInt() );

      final Either<Failure,int> _result = await _logic();
      expect(_result, Right(_testInt));

      verify(_yield());
      verifyNoMoreInteractions(_yield); 
    });

    test('SHOULD return "Left" WHEN timeout',() async {

      Future<int> _futureInt() => Future.delayed(
        _duration300 + _duration200, 
        () => _testInt,
      );

      when(_yield()).thenAnswer((_) => _futureInt());

      final Either<Failure,int> _result = await _logic();
      expect(_result, equals(Left(TimeOutFailure())), );

      verify(_yield());
      verifyNoMoreInteractions(_yield); 
    });
  });
}