import 'package:yak_error_handler/yak_error_handler.dart';

/// `YakErrorHandler` singleton that implements `CatchErrorDelegate`

class YakErrorHandler implements CatchDelegate {
  static final YakErrorHandler _s = YakErrorHandler._();
  factory YakErrorHandler() => _s;
  YakErrorHandler._();
  Catch _catch;

  set handleError(Catch errorHandler) => _catch = errorHandler;

  @override
  void call(Object e, StackTrace s) => _catch?.call(e, s);
}
