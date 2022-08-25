import 'package:flutter/material.dart';

import '../typedef/all.dart';

@visibleForTesting
const strengths = [.05, .1, .2, .3, .4, .5, .6, .7, .8, .9];

extension MateriaColorFromColorX on Color {
  MaterialColor get asMaterial {
    return MaterialColor(value, swatch);
  }
}

extension SwatchFromColorX on Color {
  Swatch get swatch => {
        for (final strength in strengths)
          (strength * 1000).round(): applyShade(.5 - strength)
      };
}

extension ShadeOfColorX on Color {
  Color applyShade(double shade) => Color.fromRGBO(
        red.applyShade(shade),
        green.applyShade(shade),
        blue.applyShade(shade),
        1,
      );
}

@visibleForTesting
extension ApplyShadeFromIntX on int {
  int applyShade(double shade) {
    final complement = shade < 0 ? this : 255 - this;
    final shaded = (complement * shade).round();
    return this + shaded;
  }
}
