import '../all.dart';

/// an interface for `yak_runner` class
abstract class YakRunnerBase {
  /// a function of typedef `CatchException`
  final CatchException errorHandler;

  /// the constructor takes an optional parameter `errorHandler`
  const YakRunnerBase([this.errorHandler]);
}
