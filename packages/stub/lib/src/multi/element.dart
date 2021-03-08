import '../all.dart';

/// an class that provides a `stub` for a given `T Function()`
class StubElement<T> extends StubBase<T>
    with CounterStubMixin, ResetStubMixin<T>, StubMixin<T>, TypeMixin<T> {}
