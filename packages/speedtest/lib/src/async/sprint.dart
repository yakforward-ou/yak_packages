import 'dart:async';

Future<Duration?> sprintAsync({
  required Future<void> Function() subject,
  required int laps,
}) async {
  try {
    final start = DateTime.now();
    for (var i = 0; i < laps; ++i) {
      await subject();
    }
    return start.difference(DateTime.now());
  } on Exception catch (_) {
    return null;
    // ignore: avoid_catching_errors
  } on Error catch (_) {
    return null;
  }
}
