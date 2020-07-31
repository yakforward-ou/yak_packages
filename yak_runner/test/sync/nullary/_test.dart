import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/src/sync/nullary/implementation.dart';
import 'package:yak_runner/src/utils/failure.dart';

import '../../mock/yak_yield_mock.dart';

void main() {
  final int _testInt = 1;

  YakYieldInterfaceMock<int> _function;

  setUp(() {
    _function = YakYieldInterfaceMock<int>();
  });

  group('[YakNullary]', () {
    test('SHOULD return "Right" WHEN the result is correct', () {
      bool _failed = false;
      bool _valid = true;
      when(_function()).thenAnswer(
        (_) => _testInt,
      );
      final YakNullary _run = YakNullary<int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        conditions: [
          MapEntry((int i) => i > 0, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      Either<Failure, int> _result = _run();
      verify(_function());
      verifyNoMoreInteractions(_function);

      /// it is expected to pass all the checks
      expect(_result, Right(_testInt));
      expect(_failed, false);
      expect(_valid, true);
    });

    test('SHOULD return "Left" WHEN "Exception" thrown', () {
      bool _failed = false;
      bool _valid = true;
      when(_function()).thenThrow(Exception);
      final YakNullary _run = YakNullary<int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        conditions: [
          MapEntry((int i) => i > 0, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      Either<Failure, int> _result = _run();
      verify(_function());
      verifyNoMoreInteractions(_function);

      /// it's supposed to fail the safety check
      expect(_result, Left(FunctionFailure()));

      /// the [onFailure] callback is expected to trigger
      expect(_failed, true);
      expect(_valid, true);
    });

    test('SHOULD return "Left" WHEN FAIL VALIDATION', () {
      bool _failed = false;
      bool _valid = true;
      when(_function()).thenAnswer(
        (_) => _testInt,
      );
      final YakNullary _run = YakNullary<int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        conditions: [
          MapEntry((int i) => i < 0, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      Either<Failure, int> _result = _run();
      verify(_function());
      verifyNoMoreInteractions(_function);

      /// it is expected to fail the validation check [1 < 0 == false]
      expect(_result, Left(ValidationFailure()));

      /// is supposed to pass the safety check
      expect(_failed, false);

      /// the [onValidationFailure] is supposed to triggered
      expect(_valid, false);
    });

    test('SHOULD return "Left" WHEN return null', () {
      bool _failed = false;
      bool _valid = true;
      when(_function()).thenAnswer(
        (_) => null,
      );
      final YakNullary _run = YakNullary<int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        conditions: [
          MapEntry((int i) => i > 0, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      Either<Failure, int> _result = _run();
      verify(_function());
      verifyNoMoreInteractions(_function);

      /// this result is self explainatory
      expect(_result, Left(NullFailure()));

      /// it's supposed to pass the safety check
      expect(_failed, false);

      /// the [onValidationFailure] is supposed to triggered
      expect(_valid, false);
    });
  });
}
