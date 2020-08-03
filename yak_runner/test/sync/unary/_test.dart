import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/src/sync/unary/implementation.dart';
import 'package:yak_runner/src/utils/failure.dart';

import '../../mock/yak_function_mock.dart';

void main() {
  final int _testInt = 1;

  YakFunctionInterfaceMock<String, int> _function;

  setUp(() {
    _function = YakFunctionInterfaceMock<String, int>();
  });

  group('[YakAsyncUnary]', () {
    test('SHOULD return "Right" WHEN the result is correct', () async {
      bool _failed = false;
      bool _valid = true;
      when(_function(_testInt)).thenAnswer(
        (_) => '$_testInt',
      );
      final YakUnary<String, int> _run = YakUnary<String, int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        conditions: [
          MapEntry((String i) => i.length < 2, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      Either<Failure, String> _result = _run(_testInt);
      verify(_function(_testInt));
      verifyNoMoreInteractions(_function);

      /// it is expected to pass all the checks
      expect(_result, Right('$_testInt'));
      expect(_failed, false);
      expect(_valid, true);
    });

    test('SHOULD return "Left" WHEN "Exception" thrown', () async {
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      when(_function(_testInt)).thenThrow(Exception);
      final YakUnary<String, int> _run = YakUnary<String, int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        conditions: [
          MapEntry((String i) => i.length < 2, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      Either<Failure, String> _result = _run(_testInt);
      verify(_function(_testInt));
      verifyNoMoreInteractions(_function);

      /// it's supposed to fail the safety check
      expect(_result, Left(FunctionFailure()));

      /// the [onFailure] callback is expected to trigger
      expect(_failed, true);
      expect(_timeout, false);
      expect(_valid, true);
    });

    test('SHOULD return "Left" WHEN FAIL VALIDATION', () async {
      bool _failed = false;
      bool _valid = true;
      when(_function(_testInt)).thenAnswer(
        (_) => '$_testInt',
      );
      final YakUnary<String, int> _run = YakUnary<String, int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        conditions: [
          MapEntry((String i) => i.length > 2, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      Either<Failure, String> _result = _run(_testInt);
      verify(_function(_testInt));
      verifyNoMoreInteractions(_function);

      /// it is expected to fail the validation check [1 < 0 == false]
      expect(_result, Left(ValidationFailure()));
      expect(_failed, false);

      /// the [onValidationFailure] is supposed to trigger
      expect(_valid, false);
    });

    test('SHOULD return "Left" WHEN return null', () async {
      bool _failed = false;
      bool _valid = true;
      when(_function(_testInt)).thenAnswer(
        (_) => null,
      );
      final YakUnary<String, int> _run = YakUnary<String, int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        conditions: [
          MapEntry((String i) => i.length < 2, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      Either<Failure, String> _result = _run(_testInt);
      verify(_function(_testInt));
      verifyNoMoreInteractions(_function);

      /// it is expected fail due to null value
      expect(_result, Left(NullFailure()));
      expect(_failed, false);

      /// [onFunctionFailure] should be triggered
      expect(_valid, false);
    });
  });
}
