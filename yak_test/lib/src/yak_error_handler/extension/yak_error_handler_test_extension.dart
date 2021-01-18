import 'package:yak_error_handler/yak_error_handler.dart';
import '../test/with_yak_runner.dart';

extension YakErrorHandlerTestExtension on YakErrorHandler {
  void runYakRunnerTest() {
    final _test = YakErrorHandlerTest();
    _test();
  }
}
