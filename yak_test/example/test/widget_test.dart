import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

/// [step 1] import the `yak_runner` you want to test or equivalent
final runner = TryAnyRunArgAsync<int, String>((_) => throw '');

/// [step 2] *when required* provide generic `argument` and `resul`
/// those are meant only for `Type` check, does not matter the content
final argument = 'hello';
final result = 4;

/// [step 3] build your tester with one line of code
final tester = runner.buildTest(runner.buildTestFactory(''));

/// [step 4] run your test
void main() => tester(result, argument);
