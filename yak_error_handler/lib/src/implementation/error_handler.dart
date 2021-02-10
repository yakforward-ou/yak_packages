// ignore_for_file: avoid_setters_without_getters
import '../all.dart';

/// `YakErrorHandler` singleton that implements `CatchErrorDelegate`

class YakErrorHandler implements CatchDelegate {
  static final YakErrorHandler _s = YakErrorHandler._();

  /// return an instance of `YakErrorHandler`
  factory YakErrorHandler() => _s;
  YakErrorHandler._();
  Catch _catch;

  /// set `Catch` for `YakErrorHandler`
  /// `avoid_setters_without_getters` is purposely ingnored
  set handleError(Catch errorHandler) => _catch = errorHandler;

  @override
  void call(Object e, StackTrace s) => _catch?.call(e, s);
}
