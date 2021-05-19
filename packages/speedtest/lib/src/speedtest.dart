/// an `interface` for a benchmark
abstract class SpeedTest<T, S> {
  /// allows for a `const` constructor
  const SpeedTest({
    required this.subject,
    required this.parameter,
  });

  /// a parameter `S` can be the number of iterations (`int`)or a `Duration`
  /// or whatever fit for testing
  final S parameter;

  /// the function that is being tested
  final void Function() subject;

  /// it returns a result `T` that can be
  /// the  number of completed iterations (`int`)
  /// the `Duration` for the time elapsed for completing a number of iterations
  /// or anything deemed fit for the test
  T call();
}
