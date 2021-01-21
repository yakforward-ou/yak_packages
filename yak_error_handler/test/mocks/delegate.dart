import 'package:mockito/mockito.dart';

mixin Delegate<T> {
  T call();
}

class MockDelegate extends Mock implements Delegate<void> {}
