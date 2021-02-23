/// this class defines how to handle a T that extends Error
abstract class HandleErrorBase<T extends Error> {
  ///
  HandleErrorBase()
      : assert(
          !(T is Error),
          '`T`is not meant to be `Error`',
        );

  /// the `call(T)` reflect the `handleError` Function
  void call(T error);

  /// this is necessary to compare the Type to the Error that has been caught
  Type get type => T;
}
