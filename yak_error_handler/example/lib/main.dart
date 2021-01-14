// import 'package:riverpod/riverpod.dart';
// import 'package:yak_error_handler/yak_error_handler.dart';
// import 'dart:math' as math;

// import 'package:yak_runner/yak_runner.dart';

// final _random = math.Random();

// int veryBadAPI() => _random.nextBool() ? _random.nextInt(10) : throw 'ops';

// void main() {
//   final container = ProviderContainer();
//   final runner = YakRunner<int>(veryBadAPI, container.read(catchError));
//   final _handleError = container.read(catchError);
//   final value = container.read(helloWorldProvider);

//   print(value); // Hello world
// }
