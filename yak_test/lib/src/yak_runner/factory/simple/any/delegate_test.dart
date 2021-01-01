import 'package:yak_runner/yak_runner.dart';
import '../../../testers/simple/any/delegate_test.dart';

class TryAnyRunTestFactory implements ResultTestFactoryDelegate {
  const TryAnyRunTestFactory(this.description);
  final String description;
  @override
  ResultTestDelegate<T> call<T>() =>
      TryAnyRunTester<T>(description: description);
}
