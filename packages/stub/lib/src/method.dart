/// an interface for a stubbed method
abstract class Stub<Z> {
  /// returns how many times the method has been called between resets
  int get count;

  /// rese the count to zero
  void get reset;

  /// return the stubbed method
  Z get stub;

  /// set the stubbed method
  set stub(Z stub);
}
