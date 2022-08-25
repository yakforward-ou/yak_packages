import 'package:flutter/material.dart';

import '../typedef/all.dart';

const _strengths = [0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];

extension MateriaColorFromColorX on Color {
  MaterialColor get asMaterial {
    return MaterialColor(value, swatch);
  }
}

extension SwatchFromColorX on Color {
  Swatch get swatch => {
        for (final strength in _strengths)
          (strength * 1000).round(): () {
            final shade = 0.5 - strength;
            return Color.fromRGBO(
              red + ((shade < 0 ? red : (255 - red)) * shade).round(),
              green + ((shade < 0 ? green : (255 - green)) * shade).round(),
              blue + ((shade < 0 ? blue : (255 - blue)) * shade).round(),
              1,
            );
          }()
      };
}
