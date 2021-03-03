import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockHandleError<T extends Error> extends Stub<void>
    implements HandleErrorBase<T> {
  @override
  void call(T error) => stub.result;

  @override
  Type get type => T;
}
