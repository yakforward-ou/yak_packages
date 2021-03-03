import 'dart:async';
import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockYakRunnerTestDelegate<T> extends Stub<void>
    implements YakRunnerTestDelegate<T> {
  @override
  void call(FutureOr<T> result) => stub.result;
}
