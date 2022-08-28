import 'package:yak_result/yak_result.dart';

int meaningOfLife() {
  final shouldThrow = DateTime.now().millisecondsSinceEpoch.isEven;
  if (shouldThrow) {
    throw Exception();
  }
  return 42;
}

/// you can use `yak_runner` for this purpose
/// [https://pub.dev/packages/yak_runner]
Result<T> safelyTry<T>(T Function() function) {
  try {
    return Success(function());
  } on Exception catch (e, s) {
    return Failure(reason: e, stackTrace: s);
  } on Error catch (e) {
    return Failure(reason: e, stackTrace: e.stackTrace);
  }
}

void main() {
  final result = safelyTry(meaningOfLife);
  if (result is Success) {
    print('${result.success}');
  }
  if (result is Failure) {
    print('I do not know');
  }
}
