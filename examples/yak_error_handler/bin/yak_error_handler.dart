import 'dart:math' as math;
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

final _random = math.Random();

void veryBadAPI(int i) => _random.nextBool() ? print('$i') : throw 'ops';

void main() {
  final runner = YakRunnerArg(veryBadAPI, YakErrorHandler());

  YakErrorHandler().handleError =
      (e, s) => print('****** ERRROR COUGHT *******\n$e\n$s');

  for (var i = 0; i < 10; ++i) {
    runner(i);
  }

  YakErrorHandler().handleError =
      (e, s) => print('*** UPDATED ERROR MESSAGE***');

  for (var i = 0; i < 10; ++i) {
    runner(i);
  }
}
