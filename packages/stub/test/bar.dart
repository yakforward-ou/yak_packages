import 'package:stub/stub.dart';

mixin Bar<T, S, Z, W, A> {
  T bar(S arg1, Z arg2, W arg3, A arg4);
}

class BarStub<T, S, Z, W, A> extends Stub<T> implements Bar<T, S, Z, W, A> {
  @override
  T bar(S s, Z z, W w, A a) => stub();
}
