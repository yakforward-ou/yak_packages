import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/src/nullary/implementation.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:yak_runner/src/validator/conditions.dart';

void main() {
  final int _testInt = 1;
  group('[YakNullaryRunner]', () {

    test('SHOULD return "Right" WHEN the result is correct',() {
      bool _failed = false;
      bool _valid = true;
      final YakNullaryRunner _run = YakNullaryRunner<int>(
        function: () => _testInt,
        onFunctionFailure: () => _failed = true,
        conditions: [
          YakCondition<int>(
            condition: (int i) => i > 0,
            onValidationFailure: () => _valid = false,
          ),
        ],
      );
      Either<Failure,int> _result = _run();
      /// it is expected to pass all the checks
      expect(_result, Right(_testInt));
      expect(_failed, false);
      expect(_valid, true);
    });

  test('SHOULD return "Left" WHEN "Exception" thrown',() {
      bool _failed = false;
      bool _valid = true;
      final YakNullaryRunner _run = YakNullaryRunner<int>(
        function: () =>  throw("some arbitrary error"),
        onFunctionFailure: () => _failed = true,
        conditions: [
          YakCondition(
            condition: (int i) => i > 0,
            onValidationFailure: () => _valid = false,
          ),
        ],
      );
      Either<Failure,int> _result = _run();
      /// it's supposed to fail the safety check
      expect(_result, Left(FunctionFailure()));
      /// the [onFailure] callback is expected to trigger
      expect(_failed, true);
      /// it the [onFailure] callback
      expect(_valid, true);
    });

  test('SHOULD return "Left" WHEN FAIL VALIDATION',() {
      bool _failed = false;
      bool _valid = true;
      final YakNullaryRunner _run = YakNullaryRunner<int>(
        function: () =>  _testInt,
        onFunctionFailure: () => _failed = true,
        conditions: [
          YakCondition(
            condition: (int i) => i < 0,
            onValidationFailure: () => _valid = false,
          ),
        ],
      );
      final Either<Failure,int> _result = _run();
      /// it is expected to fail the validation check [1 < 0 == false]
      expect(_result, Left(ValidationFailure()));
      /// is supposed to pass the safety check
      expect(_failed, false);
      /// the [YakCondition] is supposed to trigger the callback
      expect(_valid, false);
    });

  test('SHOULD return "Left" WHEN return null',() {
      bool _failed = false;
      bool _valid = true;
      final YakNullaryRunner _run = YakNullaryRunner<int>(
        function: () =>  null,
        onFunctionFailure: () => _failed = true,
        conditions: [
          YakCondition(
            condition: (int i) => i < 0,
            onValidationFailure: () => _valid = false,
          ),
        ],
      );
      final Either<Failure,int> _result = _run();
      /// this result is self explainatory
      expect(_result, Left(NullFailure()));
      /// it's supposed to pass the safety check 
      expect(_failed, false);
      /// the null check doesn't have a callback 
      /// therefore [YakCondition]'s [onFailure] isn't called
      expect(_valid, true);
    });
  });
}