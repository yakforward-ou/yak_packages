import 'all.dart';

class OnErroDoNothing implements OnErrorDelegate {
  const OnErroDoNothing();
  @override
  void call(Object? p0, StackTrace? p1) {}
}

class RecordError implements OnErrorDelegate {
  RecordError._();
  static final _instance = RecordError._();
  factory RecordError() => _instance;
  OnError onError = const OnErroDoNothing();

  @override
  void call(Object? p0, StackTrace? p1) => onError(p0, p1);
}
