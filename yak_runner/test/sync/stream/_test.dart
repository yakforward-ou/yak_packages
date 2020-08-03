import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/src/sync/stream/implementations.dart';
import 'package:yak_runner/src/sync/unary/implementation.dart';
import 'package:yak_runner/src/utils/failure.dart';
import '../../mock/yak_function_mock.dart';

void main() {
  final int _testInt = 1;
  Stream<int> _stream() async* {
    yield _testInt;
  }

  YakFunctionInterfaceMock<String, int> _function;

  setUp(() {
    _function = YakFunctionInterfaceMock<String, int>();
  });

  group('[YakStreamTransformer]', () {
    test('SHOULD return "value" WHEN the result is correct', () async {
      bool _failed = false;
      bool _valid = true;
      Failure _failure;
      bool _streamError = false;
      bool _streamDone = false;
      when(_function(_testInt)).thenAnswer((_) => '$_testInt');
      final YakUnary<String, int> _runner = YakUnary<String, int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        conditions: [
          MapEntry((String i) => i.length < 2, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      final YakStreamTransformer<String, int> _transformer =
          YakStreamTransformer(
        runner: _runner,
        onDone: (_) => _streamDone = true,
        onStreamError: (_, __, ___) => _streamError = true,
        onFailure: (Failure f) => _failure = f,
      );

      List _list = await _transformer(stream: _stream()).toList();

      verify(_function(_testInt));
      verifyNoMoreInteractions(_function);

      /// the [YakUnary] converted the value as intended
      expect(_list.length, 1);
      expect(_list[0], '$_testInt');

      /// the checks are unchanged
      expect(_failure, null);
      expect(_streamError, false);
      expect(_streamDone, false);
      expect(_failed, false);

      expect(_valid, true);
    });

    test('SHOULD return "Left" WHEN "Exception" thrown', () async {
      bool _failed = false;
      bool _valid = true;

      Failure _failure;
      bool _streamError = false;
      bool _streamDone = false;
      when(_function(_testInt)).thenThrow(Exception());
      final YakUnary<String, int> _runner = YakUnary<String, int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        conditions: [
          MapEntry((String i) => i.length < 2, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      final YakStreamTransformer<String, int> _transformer =
          YakStreamTransformer(
        runner: _runner,
        onDone: (_) => _streamDone = true,
        onStreamError: (_, __, ___) => _streamError = true,
        onFailure: (Failure f) => _failure = f,
      );

      List _list = await _transformer(stream: _stream()).toList();

      verify(_function(_testInt));
      verifyNoMoreInteractions(_function);

      /// no values are passed through the stream
      expect(_list.length, 0);
      expect(_failure, equals(FunctionFailure()));
      expect(_failed, true);
      expect(_valid, true);

      /// the error is couught before reaching the stream
      expect(_streamError, false);
      expect(_streamDone, false);
    });

    test('SHOULD return "Left" WHEN FAIL VALIDATION', () async {
      bool _failed = false;
      bool _valid = true;

      Failure _failure;
      bool _streamError = false;
      bool _streamDone = false;
      when(_function(_testInt)).thenAnswer((_) => '$_testInt');
      final YakUnary<String, int> _runner = YakUnary<String, int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        conditions: [
          MapEntry((String i) => i.length > 2, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      final YakStreamTransformer<String, int> _transformer =
          YakStreamTransformer(
        runner: _runner,
        onDone: (_) => _streamDone = true,
        onStreamError: (_, __, ___) => _streamError = true,
        onFailure: (Failure f) => _failure = f,
      );

      List _list = await _transformer(stream: _stream()).toList();

      verify(_function(_testInt));
      verifyNoMoreInteractions(_function);

      /// it is expected to fail the validation check [1 > 2 == false]
      expect(_list.length, 0);
      expect(_failure, equals(ValidationFailure()));
      expect(_failed, false);

      /// the [onValidationFailure] is supposed to trigger
      expect(_valid, false);

      /// the error is couught before reaching the stream
      expect(_streamError, false);
      expect(_streamDone, false);
    });

    test('SHOULD return "Left" WHEN return null', () async {
      bool _failed = false;
      bool _valid = true;

      Failure _failure;
      bool _streamError = false;
      bool _streamDone = false;
      when(_function(_testInt)).thenAnswer((_) => null);
      final YakUnary<String, int> _runner = YakUnary<String, int>(
        function: _function,
        onFunctionFailure: () => _failed = true,
        conditions: [
          MapEntry((String i) => i.length < 2, null),
        ],
        onValidationFailure: (_) => _valid = false,
      );
      final YakStreamTransformer<String, int> _transformer =
          YakStreamTransformer(
        runner: _runner,
        onDone: (_) => _streamDone = true,
        onStreamError: (_, __, ___) => _streamError = true,
        onFailure: (Failure f) => _failure = f,
      );

      List _list = await _transformer(stream: _stream()).toList();

      verify(_function(_testInt));
      verifyNoMoreInteractions(_function);

      /// it is expected to fail the validation check [null]
      expect(_list.length, 0);
      expect(_failure, equals(NullFailure()));
      expect(_failed, false);

      /// the [onValidationFailure] is supposed to trigger
      expect(_valid, false);

      /// the error is couught before reaching the stream
      expect(_streamError, false);
      expect(_streamDone, false);
    });
  });
}
