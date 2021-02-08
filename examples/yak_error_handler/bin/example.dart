import 'dart:math' as math;
import 'package:riverpod/riverpod.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

final _random = math.Random();

void veryBadAPI() => _random.nextBool() ? {} : throw 'ops';

void main() {
  final container = ProviderContainer();

  // !! `IMPORTANT`  set the catchError before everything else!
  container.read(setCatchError)(
      (e, s) => print('****** ERRROR COUGHT *******\n$e\n$s'));

  final _runner = YakRunner(veryBadAPI, container.read(catchError));

  for (var i = 0; i < 10; ++i) {
    print('$i');
    _runner().when(
      success: (_) {},
      failure: (_, __) {},
    );
  }
}
