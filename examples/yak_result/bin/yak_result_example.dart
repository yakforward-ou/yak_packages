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
Result<T> safelyTry<T extends Object>(T Function() function) {
  try {
    return Result.success(function());
  } on Exception catch (e, s) {
    return Result.failure(e, s);
  } on Error catch (e) {
    return Result.failure(e, e.stackTrace ?? StackTrace.empty);
  }
}

void main() {
  final result = safelyTry(meaningOfLife);
  if (result.isSuccess) {
    print('${result.asSuccess}');
    return;
  }

  print('failed');
}
