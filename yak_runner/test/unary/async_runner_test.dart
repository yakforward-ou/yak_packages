import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/src/unary/implementation.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:yak_runner/src/validator/conditions.dart';

void main() {
  final int _seed = 1;
  final int _double = _seed *2;
  final Duration _duration = Duration(milliseconds: 200);
  Future<int> _testInt(FutureOr<int> i) async {
    await Future.delayed(_duration);
    return _double;
  }
  group('[YakUnaryAsyncRunner]', () {

    test('SHOULD return "Right" WHEN the result is correct',() async {
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      final YakUnaryAsyncRunner _run = YakUnaryAsyncRunner<int,int>(
        function: _testInt,
        onFunctionFailure: () => _failed = true,
        timeout: _duration * 2,
        onTimeout: () => _timeout = true,
        conditions: [
          YakCondition<int>(
            condition: (int i) => i > 0,
            onValidationFailure: () => _valid = false,
          ),
        ],
      );
      Either<Failure,int> _result = await _run(_seed);
      /// it is expected to pass all the checks
      expect(_result, Right(_double));
      expect(_failed, false);
      expect(_valid, true);
      /// it's expected to complete before timeout
      expect(_timeout, false);
    });

  test('SHOULD return "Left" WHEN "Exception" thrown',() async {
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      final YakUnaryAsyncRunner _run = YakUnaryAsyncRunner<int,int>(
        function: (FutureOr<int> i) async => throw("some arbitrary error"),
        onFunctionFailure: () => _failed = true,
        timeout: _duration * 2,
        onTimeout: () => _timeout = true,
        conditions: [
          YakCondition(
            condition: (int i) => i > 0,
            onValidationFailure: () => _valid = false,
          ),
        ],
      );
      Either<Failure,int> _result = await _run(_seed);
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
      final YakUnaryAsyncRunner _run = YakUnaryAsyncRunner<int,int>(
        function: _testInt,
        onFunctionFailure: () => _failed = true,
        timeout: _duration * 2,
        onTimeout: () => _timeout = true,
        conditions: [
          YakCondition(
            condition: (int i) => i < _seed,
            onValidationFailure: () => _valid = false,
          ),
        ],
      );
      final Either<Failure,int> _result = await _run(_seed);
      /// it is expected to fail the validation check [_double < _seed == false]
      expect(_result, Left(ValidationFailure()));
      /// is supposed to pass the safety check
      expect(_failed, false);
      /// the [YakCondition] is supposed to trigger the callback
      expect(_valid, false);
      /// it's expected to complete before timeout
      expect(_timeout, false);
    });

  test('SHOULD return "Left" WHEN return null',() async {
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      final YakUnaryAsyncRunner _run = YakUnaryAsyncRunner<int,int>(
        function: (FutureOr<int> i) =>  null,
        onFunctionFailure: () => _failed = true,
        timeout: _duration * 2,
        onTimeout: () => _timeout = true,
        conditions: [
          YakCondition(
            condition: (int i) => i < 0,
            onValidationFailure: () => _valid = false,
          ),
        ],
      );
      final Either<Failure,int> _result = await _run(_seed);
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
      Future<int> _longTestInt(FutureOr<int> i) async {
        await Future.delayed(_duration * 2);
        return await i * 2;
      }
      bool _failed = false;
      bool _valid = true;
      bool _timeout = false;
      final YakUnaryAsyncRunner _run = YakUnaryAsyncRunner<int,int>(
        function: _longTestInt,
        onFunctionFailure: () => _failed = true,
        timeout: _duration,
        onTimeout: () => _timeout = true,
        conditions: [
          YakCondition(
            condition: (int i) => i < 0,
            onValidationFailure: () => _valid = false,
          ),
        ],
      );
      final Either<Failure,int> _result = await _run(_seed);
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