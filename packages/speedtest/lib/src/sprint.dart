import '../../speedtest.dart';

/// a `SpeedTest` that measure the elepsed time
/// for a given number of iterations for a given number of iterations
class SprintTest implements SpeedTest<Duration?, int> {
  /// allows a `const` constructor
  const SprintTest({
    required this.subject,
    required this.parameter,
  });

  @override
  final void Function() subject;
  @override
  final int parameter;

  @override
  Duration? call() {
    try {
      final watch = Stopwatch()..start();
      for (var i = 0; i < parameter; ++i) {
        subject();
      }
      watch.stop();
      return Duration(microseconds: watch.elapsedMicroseconds);
    } on Exception catch (_) {
      return null;
      // ignore: avoid_catching_errors
    } on Error catch (_) {
      return null;
    }
  }
}
