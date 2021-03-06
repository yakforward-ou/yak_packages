/// see `sky_engine/lib/ui/lerp.dart`
/// _lerpDouble
double lerpNNDouble(double a, double b, double t) {
  return a * (1.0 - t) + b * t;
}
