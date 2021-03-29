import '../all.dart';

/// an class that provides a `stub` for a given `T Function()`
class StubElement<T> extends StubBase
    with CounterStubMixin, ResetStubMixin, NullaryStubMixin<T>, TypeMixin<T> {}
