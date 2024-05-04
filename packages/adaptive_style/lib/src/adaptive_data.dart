import 'dart:ui';
import 'positioned_data.dart';

abstract class AdaptiveData {
  PositionedData positioned({
    double scale = 0,
    required Size parentSize,
  });
}
