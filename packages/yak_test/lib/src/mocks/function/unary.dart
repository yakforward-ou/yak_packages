import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

/// a `stub` for `UnaryDelegate<T,S>`
class MockUnaryDelegate<T, S> extends Stub<T> implements UnaryDelegate<T, S> {
  @override
  T call(S arg) => stub();
}
