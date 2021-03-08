import '../all.dart';
// ignore_for_file: prefer_function_declarations_over_variables

/// a mixin that implements `callCount` getter and setter
mixin CounterStubMixin<T> on StubBase<T> {
  // ignore: prefer_final_fields
  @override
  int callCount = 0;
}
