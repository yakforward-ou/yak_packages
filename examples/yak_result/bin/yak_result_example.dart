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
ValueResult<T> safelyTry<T>(T Function() function) {
  try {
    return ValueSuccess(function());
  } on Exception catch (e, s) {
    return Failure(e, s);
  } on Error catch (e) {
    return Failure.fromError(e);
  }
}

void main() {
  final result = safelyTry(meaningOfLife);
  if (result.isSuccess) {
    print('${result.success.value}');
    return;
  }

  print('failed');
}
