import 'dart:ui';

import 'package:yak_utils/yak_utils.dart';

/// a NN version of `radiusLerp`
Radius radiusNNLerp(Radius a, Radius b, double t) => Radius.elliptical(
      lerpNNDouble(a.x, b.x, t),
      lerpNNDouble(a.y, b.y, t),
    );
