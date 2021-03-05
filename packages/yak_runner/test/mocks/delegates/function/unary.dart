import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockUnaryDelegate<T, S> extends Stub<T> implements UnaryDelegate<T, S> {
  @override
  T call(S arg) => stub();
}
