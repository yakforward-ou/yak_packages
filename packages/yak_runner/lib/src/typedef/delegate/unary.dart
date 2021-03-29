/// a function that returns a Type `T` from an `arg` of Type `S`
/// ```
/// class Foo implements UnaryDelegate<void,Object> {
///   void call(Object s) {}
/// }
///  final Unary<void,Object> delegate = Foo();
/// ```

typedef Unary<T, S> = T Function(S);
