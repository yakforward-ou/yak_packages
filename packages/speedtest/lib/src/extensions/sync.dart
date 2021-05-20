import '../../speedtest.dart';

/// an extension on a sync function
extension SpeedTestX<T> on T Function() {
  /// runs a speed test
  void speedTest({
    int laps = 10000,
    Duration duration = const Duration(seconds: 2),
  }) async {
    final loops = laps.clamp(0, 1000000);
    {
      final warmup = await sprint(
        subject: this,
        laps: (loops / 2).truncate().clamp(1000, 500000),
      );
      if (warmup == null) {
        print('$this failed during `warmup`');
        return;
      }
    }

    final time = await sprint(
      subject: this,
      laps: loops,
    );
    if (time == null) {
      print('$this failed during `sprint`');
      return;
    }
    final microseconds = time.inMicroseconds;

    final record = await race(subject: this, duration: duration);
    if (record == null) {
      print('$this failed during `race`');
      return;
    }
    final _d = duration.inMicroseconds;
    print(
      'looped $loops times in $microseconds microseconds (lower is better)\n'
      'in $_d completed $record times (higher is better)',
    );
  }
}
