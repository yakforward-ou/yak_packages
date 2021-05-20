import 'dart:async';

Future<int?> race({
  required void Function() subject,
  required Duration duration,
}) async {
  final completer = Completer<int?>();
  var hit = 0;
  try {
    final watch = Stopwatch()..start();
    var elapsed = Duration(microseconds: 0);
    while (elapsed < duration) {
      subject();
      elapsed = watch.elapsed;
      hit++;
    }
    completer.complete(hit);
  } on Exception catch (_) {
    completer.complete(null);
    // ignore: avoid_catching_errors
  } on Error catch (_) {
    completer.complete(null);
  }
  return completer.future;
}
