import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

void main() {
  group('TryAnyRunArgAsync', () {
    final runner = TryAnyRunArgAsync<int, String>((_) => throw '');
  });
}
