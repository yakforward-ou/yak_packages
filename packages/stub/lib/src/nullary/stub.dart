import '../all.dart';

/// the base `Stub`, `abstract` as it is not meant to be used as `stand-alone`
abstract class Stub<T> extends StubBase
    with CounterStubMixin, ResetStubMixin, NullaryStubMixin<T> {}
