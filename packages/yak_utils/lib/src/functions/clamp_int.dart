/// see `sky_engine/lib/ui/lerp.dart`
int clampInt(int value, int min, int max) {
  assert(min <= max);
  return value < min
      ? min
      : value > max
          ? max
          : value;
}
