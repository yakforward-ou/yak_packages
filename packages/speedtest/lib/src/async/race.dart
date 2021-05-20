import 'dart:async';

Future<int?> raceAsync({
  required Future<void> Function() subject,
  required Duration duration,
}) async {
  final completer = Completer<int?>();
  var hit = 0;
  try {
    final watch = Stopwatch()..start();
    var elapsed = Duration(microseconds: 0);
    while (elapsed < duration) {
      subject().then((_) => hit++);
      elapsed = watch.elapsed;
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
