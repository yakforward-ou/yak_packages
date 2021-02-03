import '../typedef/all.dart';

class YakErrorHandler {
  static final YakErrorHandler _s = YakErrorHandler._();
  factory YakErrorHandler() => _s;
  YakErrorHandler._();
  CatchError onError = (_, __) {};
}
