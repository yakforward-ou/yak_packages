import 'package:yak_runner/yak_runner.dart';

double oneDividedBy(int i) {
  assert(i > 0);
  return 1 / i;
}

void main() {
  print(oneDividedBy(0)); // throws
  print(oneDividedBy.run(0)); // print `Failure`
  print(oneDividedBy(1)); // print `1`
  print(oneDividedBy.run(1)); // print `Success`

  final result = oneDividedBy.run(1);
  if (result is Success) {
    print(result.success); // print `1`
  }
}
