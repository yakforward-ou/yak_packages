import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/src/async/nullary/implementation.dart';
import 'package:yak_runner/src/utils/failure.dart';
import '../../mock/yak_async_yield_mock.dart';

void main() {
  final Duration _duration200 = Duration(milliseconds: 200);
  final Duration _duration300 = Duration(milliseconds: 300);
  final int _testInt = 1;

  YakAsyncYieldInterfaceMock<int> _function;

  setUp(() {
    _function = YakAsyncYieldInterfaceMock<int>();
  });

  group('[YakAsyncNullary]', () {
    test('SHOULD return "Right" WHEN the result is correct', () async {
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      when(_function()).thenAnswer(
        (_) async => Future<int>.delayed(_duration200, () => _testInt),
      );
      final YakAsyncNullary<int> _run = YakAsyncNullary<int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        timeout: _duration300,
        onTimeout: () => _timeout = true,
        conditions: [
          MapEntry((int i) => i > 0, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      Either<Failure, int> _result = await _run();

      /// it is expected to pass all the checks
      expect(_result, Right(_testInt));
      expect(_failed, false);
      expect(_timeout, false);
      expect(_valid, true);
      verify(_function());
      verifyNoMoreInteractions(_function);
    });

    test('SHOULD return "Left" WHEN "Exception" thrown', () async {
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      when(_function()).thenThrow(Exception);
      final YakAsyncNullary<int> _run = YakAsyncNullary<int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        timeout: _duration300,
        onTimeout: () => _timeout = true,
        conditions: [
          MapEntry((int i) => i > 0, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      Either<Failure, int> _result = await _run();

      /// it's supposed to fail the safety check
      expect(_result, Left(FunctionFailure()));

      /// the [onFailure] callback is expected to trigger
      expect(_failed, true);
      expect(_timeout, false);
      expect(_valid, true);
      verify(_function());
      verifyNoMoreInteractions(_function);
    });

    test('SHOULD return "Left" WHEN FAIL VALIDATION', () async {
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      when(_function()).thenAnswer(
        (_) async => Future<int>.delayed(_duration200, () => _testInt),
      );
      final YakAsyncNullary<int> _run = YakAsyncNullary<int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        timeout: _duration300,
        onTimeout: () => _timeout = true,
        conditions: [
          MapEntry((int i) => i < 0, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      Either<Failure, int> _result = await _run();

      /// it is expected to fail the validation check [1 < 0 == false]
      expect(_result, Left(ValidationFailure()));
      expect(_failed, false);
      expect(_timeout, false);

      /// the [onValidationFailure] is supposed to trigger
      expect(_valid, false);
      verify(_function());
      verifyNoMoreInteractions(_function);
    });

    test('SHOULD return "Left" WHEN timeout', () async {
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      when(_function()).thenAnswer(
        (_) async => Future<int>.delayed(_duration200 * 2, () => _testInt),
      );
      final YakAsyncNullary<int> _run = YakAsyncNullary<int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        timeout: _duration300,
        onTimeout: () => _timeout = true,
        conditions: [
          MapEntry((int i) => i > 0, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      Either<Failure, int> _result = await _run();

      /// it is expected to fail for timeout
      expect(_result, Left(TimeoutFailure()));
      expect(_failed, false);

      /// [onTimeout] should be triggered
      expect(_timeout, true);
      expect(_valid, true);
      verify(_function());
      verifyNoMoreInteractions(_function);
    });

    test('SHOULD return "Left" WHEN return null', () async {
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      when(_function()).thenAnswer(
        (_) async => Future<int>.delayed(_duration200, () => null),
      );
      final YakAsyncNullary<int> _run = YakAsyncNullary<int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        timeout: _duration300,
        onTimeout: () => _timeout = true,
        conditions: [
          MapEntry((int i) => i > 0, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      Either<Failure, int> _result = await _run();

      /// it is expected fail due to null value
      expect(_result, Left(NullFailure()));
      expect(_failed, false);
      expect(_timeout, false);

      /// [onFunctionFailure] should be triggered
      expect(_valid, false);
      verify(_function());
      verifyNoMoreInteractions(_function);
    });
  });
}
