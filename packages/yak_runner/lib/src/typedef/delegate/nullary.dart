/// a function that returns a Type `T`
/// a Delegate<T> can be assigned at a Nullary<T>
/// ```
/// class Foo implements Delegate<void> {
///   void call() {}
/// }
///  final Nullary delegate = Foo();
/// ```
typedef Nullary<T> = T Function();
