import '../all.dart';

/// the base `Stub`, `abstract` as it is not meant to be used as `stand-alone`
abstract class UnaryStub<T, S> extends StubBase
    with CounterStubMixin, ResetStubMixin, UnaryStubMixin<T, S> {}
