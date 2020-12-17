abstract class Failure {
  const Failure(this.e, this.s);
  final Object e;
  final StackTrace s;
}
