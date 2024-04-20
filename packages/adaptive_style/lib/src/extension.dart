import 'dart:math' as math show min, sqrt;
import 'dart:ui';

import 'device_size.dart';

extension DeviceSizeSizesX on List<DeviceSize> {
  List<Size> get sizes => [for (final value in this) value.size];
}

extension FixedRatioSizeScaleX<T extends Size> on T {
  double fixedRatioScale(T size) => math.min(
        width / size.width,
        height / size.height,
      );
}

extension ReverseScaleX<T extends double> on T {
  double get reversedRatio => 1 / this;
}

extension SizeAreaX<T extends Size> on T {
  double get area => width * height;
}

extension MostSimilarSizeX<T extends Size> on Iterable<T> {
  T mostSimilarTo(T size) {
    final sizes = [
      for (final element in this)
        (
          element,

          /// this is arbitrary but seems to work
          (size.aspectRatio - element.aspectRatio).abs() *
              math.sqrt((size.area - element.area).abs())
        )
    ]..sort(
        (a, b) => a.$2.compareTo(b.$2),
      );

    return sizes.first.$1;
  }
}
