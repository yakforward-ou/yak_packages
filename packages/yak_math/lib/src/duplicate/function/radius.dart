import 'dart:ui';

import 'lerp_nn_double.dart';

/// a NN version of `lerpDouble`
Radius radiusNNLerp(Radius a, Radius b, double t) => Radius.elliptical(
      lerpNNDouble(a.x, b.x, t),
      lerpNNDouble(a.y, b.y, t),
    );
