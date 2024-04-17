import 'exceptions.dart';
import 'failure.dart';

extension type Result<T extends Object>._(Object result) {
  bool get isSuccess => result is T;
  bool get isFailure => result is Failure<T>;
  const Result.success(T this.result);
  Result._failure(Failure<T> this.result);

  factory Result.failure([
    Object reason = const Object(),
    StackTrace stackTrace = StackTrace.empty,
  ]) =>
      Result._failure(Failure(reason, stackTrace));

  Failure<T> get asFailure => isFailure
      ? result as Failure<T>
      : throw ResultExceptions.notFailureException;

  T get asSuccess =>
      isSuccess ? result as T : throw ResultExceptions.notSuccessException;
}

/// inspired by [https://github.com/eernstg/extension_type_unions]
// extension UnionInjectExtension<X> on X {
//   Union2<X, Never> get u21 => Union2.in1(this);
//   Union2<Never, X> get u22 => Union2.in2(this);
// }

// /// Emulate the union of the types [X1] and [X2].
// extension type Union2<X1, X2>._(Object? value) {
//   /// Create a [Union2] value from the first type argument.
//   Union2.in1(X1 this.value);

//   /// Create a [Union2] value from the second type argument.
//   Union2.in2(X2 this.value);

//   /// Return true iff this [Union2] has type [X1] or [X2].
//   bool get isValid => value is X1 || value is X2;

//   /// Return the [value] if it has type [X1], otherwise null.
//   X1? get as1OrNull => value is X1 ? value as X1 : null;

//   /// Return the [value] if it has type [X2], otherwise null.
//   X2? get as2OrNull => value is X2 ? value as X2 : null;

//   /// Return the [value] if it has type [X1], otherwise throw.
//   X1 get as1 => value as X1;

//   /// Return the [value] if it has type [X2], otherwise throw.
//   X2 get as2 => value as X2;

//   /// Return type iff the [value] has type [X1].
//   bool get is1 => value is X1;

//   /// Return type iff the [value] has type [X2].
//   bool get is2 => value is X2;
// }
