/// a delegate class for a multi-argument [Function]
/// where the fist type is the return type
/// and the subsequent types are the argument of the functions
abstract class MultiDelegate2<T, S, U> {
  const MultiDelegate2();
  T call(S p0, U p1);
}

/// a delegate class for a multi-argument [Function]
/// where the fist type is the return type
/// and the subsequent types are the argument of the functions
abstract class MultiDelegate3<T, S, U, V> {
  const MultiDelegate3();

  T call(S p0, U p1, V p2);
}

/// a delegate class for a multi-argument [Function]
/// where the fist type is the return type
/// and the subsequent types are the argument of the functions
abstract class MultiDelegate4<T, S, U, V, W> {
  const MultiDelegate4();

  T call(S p0, U p1, V p2, W p3);
}

/// a delegate class for a multi-argument [Function]
/// where the fist type is the return type
/// and the subsequent types are the argument of the functions

abstract class MultiDelegate5<T, S, U, V, W, X> {
  const MultiDelegate5();
  T call(S p0, U p1, V p2, W p3, X p4);
}
