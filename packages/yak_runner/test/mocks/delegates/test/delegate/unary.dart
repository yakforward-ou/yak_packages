import 'dart:async';
import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockUnaryRunnerTestDelegate<T, S>
    implements UnaryRunnerTestDelegate<T, S> {
  final stub = unaryStub<void, List>();
  @override
  void call(FutureOr<T> result, FutureOr<S> arg) async =>
      stub.wrap([await result, await arg]);
}
