import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

/// a `stub` for `NullaryDelegate<T>`
class MockNullaryDelegate<T> extends Stub<T> implements NullaryDelegate<T> {
  @override
  T call() => stub();
}
