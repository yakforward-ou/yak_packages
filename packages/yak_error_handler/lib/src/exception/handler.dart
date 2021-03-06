import '../all.dart';

/// `YakExceptionrHandler` singleton that implements `HandleExceptionDelegate`
class ExceptionHandler implements HandleExceptionDelegate {
  static final ExceptionHandler _s = ExceptionHandler._();

  /// return an instance of `YakErrorHandler`
  factory ExceptionHandler() => _s;
  ExceptionHandler._();
  HandleException? handleException;

  @override
  void call(Exception e, StackTrace s) => handleException?.call(e, s);
}
