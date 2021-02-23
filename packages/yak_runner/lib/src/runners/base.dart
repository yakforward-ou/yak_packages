import '../all.dart';

/// an interface for `yak_runner` class
abstract class YakRunnerBase {
  /// a function of typedef `CatchException`
  final HandleException handleException;

  /// a list of specific to handle in a predetermined way
  final Set<HandleErrorBase> errorsWhitelist;

  /// the constructor takes an optional parameter `errorHandler`
  const YakRunnerBase([
    this.handleException,
    this.errorsWhitelist,
  ]);
}
