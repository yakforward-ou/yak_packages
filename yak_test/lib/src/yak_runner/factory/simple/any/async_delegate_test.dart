import 'package:yak_runner/yak_runner.dart';
import '../../../testers/simple/any/async_delegate_test.dart';

class TryAnyRunAsyncTestFactory implements ResultTestFactoryDelegate {
  const TryAnyRunAsyncTestFactory(this.description);
  final String description;
  @override
  ResultTestDelegate<T> call<T>() =>
      TryAnyRunAsyncTester<T>(description: description);
}

extension TestFactoryExtension on TryAnyRunArg {
  ResultTestFactoryDelegate buildTestFactory(description) =>
      TryAnyRunAsyncTestFactory(description);
}
