import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';
import 'yak_generator_mock.dart';

void main() {
  final int _testInt = 1;
  YakGenerator<int> _logic;
  YakGeneratorInterface<int> _yield;

  setUp(() {
    _yield = YakGeneratorInterfaceMock<int>();
    _logic = YakGenerator<int>(function: _yield);
  });

  group('[YakGenerator] Synchronous Test', () {
    test('SHOULD return "Right" WHEN the result is correct',() {
      when(_yield()).thenAnswer((_) => _testInt );

      final Either<Failure,int> _result = _logic();
      expect(_result, Right(_testInt));

      verify(_yield());
      verifyNoMoreInteractions(_yield); 
    });

    test('SHOULD return "Left" WHEN the result is "null"',() {
      when(_yield()).thenAnswer((_) => null);

      final Either<Failure,int> _result = _logic();
      expect(_result, equals(Left(NullFailure())), );

      verify(_yield());
      verifyNoMoreInteractions(_yield); 
    });

  test('SHOULD return "Left" WHEN "Exception" thrown',() {
      when(_yield()).thenThrow(Exception);

      final Either<Failure,int> _result = _logic();
      expect(_result, equals(Left(FunctionFailure())), );

      verify(_yield());
      verifyNoMoreInteractions(_yield); 
    });
  });
}