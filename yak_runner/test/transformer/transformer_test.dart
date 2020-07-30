import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/src/streams/implementations.dart';
import 'package:yak_runner/src/unary/implementation.dart';
import 'package:yak_runner/src/validator/conditions.dart';

void main() async {

  final Stream<int> _stream = Stream<int>.fromIterable([for(int i = 0; i < 5; ++i) i]);

  group('[YakStreamTransformer]', () {
    test('with no errors and valid data',() async {
      int _function(int arg) => arg * 2;
      int _functionfailed = 0;
      int _validationFailed = 0;
      int _result = 0;
      int _fileteredFails = 0;
      final YakUnaryRunner<int,int> _runner = YakUnaryRunner(
        function: _function,
        onFunctionFailure: () => ++_functionfailed,
        conditions: [
          YakCondition<int>(
            condition: (int i) => i < 10, 
            onValidationFailure: () => ++_validationFailed,
          ),
        ],
      );
      final YakStreamTransformer<int,int> _transform = YakStreamTransformer(
        runner: _runner,
        onFailure: (_) => ++_fileteredFails,
      );
      final Stream<int> _transformed = _transform(stream: _stream);
      await for (int i in _transformed) {
        _result += i;
      }
      final int _expected = 20; 
      expect(_result, _expected);
      expect(_functionfailed, 0);
      expect(_fileteredFails, 0);
      expect(_validationFailed, 0);
    });

    test('with validation error',() async {
      int _function(int arg) => arg * 2;
      int _functionfailed = 0;
      int _validationFailed = 0;
      int _result = 0;
      int _fileteredFails = 0;
      final YakUnaryRunner<int,int> _runner = YakUnaryRunner(
        function: _function,
        onFunctionFailure: () => ++_functionfailed,
        conditions: [
          YakCondition<int>(
            condition: (int i) => i < 5, 
            onValidationFailure: () => ++_validationFailed,
          ),
        ],
      );
      final YakStreamTransformer<int,int> _transform = YakStreamTransformer(
        runner: _runner,
        onFailure: (_) => ++_fileteredFails,
      );
      final Stream<int> _transformed = _transform(stream: _stream);
      await for (int i in _transformed) {
        _result += i;
      }
      final int _expected = 6; 
      expect(_result, _expected);
      expect(_functionfailed, 0);
      expect(_fileteredFails, 2);
      expect(_validationFailed, 2);
    });

  });
}