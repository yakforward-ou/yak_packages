import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/src/nullary/implementation.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:yak_runner/src/validator/conditions.dart';

void main() {

  final Duration _duration = Duration(milliseconds: 200);
  int _value = 1;
  Future<int> _testInt() async {
    await Future.delayed(_duration);
    return _value;
  }
  group('[YakNullaryAsyncRunner]', () {

    test('SHOULD return "Right" WHEN the result is correct',() async {
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      final YakNullaryAsyncRunner _run = YakNullaryAsyncRunner<int>(
        function: () => _testInt(),
        onFailure: () => _failed = true,
        timeout: _duration * 2,
        onTimeout: () => _timeout = true,
        conditions: [
          YakCondition<int>(
            condition: (int i) => i > 0,
            onFailure: () => _valid = false,
          ),
        ],
      );
      Either<Failure,int> _result = await _run();
      /// it is expected to pass all the checks
      expect(_result, Right(_value));
      expect(_failed, false);
      expect(_valid, true);
      /// it's expected to complete before timeout
      expect(_timeout, false);
    });

  test('SHOULD return "Left" WHEN "Exception" thrown',() async {
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      final YakNullaryAsyncRunner _run = YakNullaryAsyncRunner<int>(
        function: () => throw("some arbitrary error"),
        onFailure: () => _failed = true,
        timeout: _duration * 2,
        onTimeout: () => _timeout = true,
        conditions: [
          YakCondition(
            condition: (int i) => i > 0,
            onFailure: () => _valid = false,
          ),
        ],
      );
      Either<Failure,int> _result = await _run();
      /// it's supposed to fail the safety check
      expect(_result, Left(FunctionFailure()));
      /// the [onFailure] callback is expected to trigger
      expect(_failed, true);
      /// it the [onFailure] callback
      expect(_valid, true);
      /// it's expected to complete before timeout
      expect(_timeout, false);
    });

  test('SHOULD return "Left" WHEN FAIL VALIDATION',() async {
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      final YakNullaryAsyncRunner _run = YakNullaryAsyncRunner<int>(
        function: () =>  _testInt(),
        onFailure: () => _failed = true,
        timeout: _duration * 2,
        onTimeout: () => _timeout = true,
        conditions: [
          YakCondition(
            condition: (int i) => i < 0,
            onFailure: () => _valid = false,
          ),
        ],
      );
      final Either<Failure,int> _result = await _run();
      /// it is expected to fail the validation check [1 < 0 == false]
      expect(_result, Left(ValidationFailure()));
      /// is supposed to pass the safety check
      expect(_failed, false);
      /// the [YakCondition] is supposed to trigger the callback
      expect(_valid, false);
      /// it's expected to complete before timeout
      expect(_timeout, false);
    });

  test('SHOULD return "Left" WHEN timeout',() async {
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      final YakNullaryAsyncRunner _run = YakNullaryAsyncRunner<int>(
        function: () =>  null,
        onFailure: () => _failed = true,
        timeout: _duration * 2,
        onTimeout: () => _timeout = true,
        conditions: [
          YakCondition(
            condition: (int i) => i < 0,
            onFailure: () => _valid = false,
          ),
        ],
      );
      final Either<Failure,int> _result = await _run();
      /// this result is self explainatory
      expect(_result, Left(NullFailure()));
      /// it's supposed to pass the safety check 
      expect(_failed, false);
      /// the null check doesn't have a callback 
      /// therefore [YakCondition]'s [onFailure] isn't called
      expect(_valid, true);
      /// it's expected to complete before timeout
      expect(_timeout, false);
    });

    test('SHOULD return "Left" WHEN return null',() async {
      Future<int> _longTestInt() async {
        await Future.delayed(_duration * 2);
        return 1;
      }
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      final YakNullaryAsyncRunner _run = YakNullaryAsyncRunner<int>(
        function: () =>  _longTestInt(),
        onFailure: () => _failed = true,
        timeout: _duration,
        onTimeout: () => _timeout = true,
        conditions: [
          YakCondition(
            condition: (int i) => i < 0,
            onFailure: () => _valid = false,
          ),
        ],
      );
      final Either<Failure,int> _result = await _run();
      /// this result is self explainatory
      expect(_result, Left(TimeoutFailure()));
      /// it's supposed to pass the safety check 
      expect(_failed, false);
      /// the null check doesn't have a callback 
      /// therefore [YakCondition]'s [onFailure] isn't called
      expect(_valid, true);
      /// it's expected to complete before timeout
      expect(_timeout, true);
    });
  });
}