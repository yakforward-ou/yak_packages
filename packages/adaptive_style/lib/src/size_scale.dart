import 'dart:ui' show Offset, Size;
import 'dart:math' as math show min, max;

extension type SizeScale._(Offset scale) implements Offset {
  double get withScale => scale.dx;
  double get heightScale => scale.dy;

  double get min => math.min(withScale, heightScale);
  double get max => math.max(withScale, heightScale);

  factory SizeScale(Size real, Size ideal) => SizeScale._(
        Offset(
          real.width / ideal.width,
          real.height / ideal.height,
        ),
      );
}
