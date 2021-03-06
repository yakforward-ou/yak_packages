import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

final runner = YakRunner(() => 0);
final _test = runner.buildTest(
  runner.buildTestFactory('unary test'),
);

void main() async => _test(0);
