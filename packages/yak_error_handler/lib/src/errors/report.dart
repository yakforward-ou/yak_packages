/// as `Exception` are impossible to work with thanks to the apprach
/// `factory Foo() => _Foo();`
/// this wrapper should allow to handle assertion as `Error`

class ErrorReport extends Error implements Exception {
  /// the argument are meant to mirror the output of
  /// `on Exception catch (e,s) {}`
  final Object? message;
  final StackTrace? stackTrace;

  /// the constructor cannot be constant
  ErrorReport({
    this.message,
    this.stackTrace,
  });
}
