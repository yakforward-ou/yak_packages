import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockDelegate<T> extends Stub<T> implements Delegate<T> {
  @override
  T call() => stub.result;
}
