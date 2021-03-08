import '../all.dart';

/// a mixin that implements operator `[]` for  `MultiStubBase`
mixin MultistubOperatorMixin on MultiStubBase {
  @override
  StubElement operator [](String name) => map.containsKey(name)
      ? map[name]!
      : throw Exception('stub $name not found');
}
