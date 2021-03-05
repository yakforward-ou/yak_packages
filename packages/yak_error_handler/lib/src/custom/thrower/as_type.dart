import '../../all.dart';

/// a function that wrap the `Foo as Baz` cast
T asType<T>(dynamic object, [Object? message]) {
  if (object is T) {
    return object;
  } else {
    throw AsTypeError('object is a ${object.runtimeType}');
  }
}
