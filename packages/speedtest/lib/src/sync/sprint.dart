import 'dart:async';

/// a function for `sprint` test targeting an `sync` function
Future<Duration?> sprint({
  required void Function() subject,
  required int laps,
}) {
  final completer = Completer<Duration?>();
  try {
    final start = DateTime.now();
    for (var i = 0; i < laps; ++i) {
      subject();
    }
    completer.complete(start.difference(DateTime.now()));
  } on Exception catch (_) {
    completer.complete(null);
    // ignore: avoid_catching_errors
  } on Error catch (_) {
    completer.complete(null);
  }
  return completer.future;
}
