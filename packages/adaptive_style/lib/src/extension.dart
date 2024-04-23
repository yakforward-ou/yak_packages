import 'dart:math' as math show min, sqrt;
import 'dart:ui' show Size;

import 'device_size.dart';

extension DeviceSizeSizesX on List<DeviceSize> {
  List<Size> get sizes => [for (final value in this) value.size];
}

extension ClosestDimentionScaleX<T extends Size> on T {
  double closestDimentionScale(T size) => math.min(
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

extension MostSimilarSizeX<T extends Size> on Iterable<DeviceSize> {
  DeviceSize mostSimilarTo(T size) {
    final sizes = [
      for (final deviceSize in this)
        (
          deviceSize,

          /// this is arbitrary but seems to work
          (size.aspectRatio - deviceSize.size.aspectRatio).abs() *
              math.sqrt((size.area - deviceSize.size.area).abs())
        )
    ]..sort(
        (a, b) => a.$2.compareTo(b.$2),
      );

    return sizes.first.$1;
  }
}

extension DeviceSizeAverageSizeX on List<DeviceSize> {
  Size get averagePortrait {
    final portraits = [
      for (final device in this)
        if (device.size.aspectRatio < 1) device.size,
    ];
    var height = .0;
    var width = .0;
    for (final portrait in portraits) {
      width += portrait.width;
      height += portrait.height;
    }

    return Size(
      width / portraits.length,
      height / portraits.length,
    );
  }

  Size get averageLandscape {
    final landscapes = [
      for (final device in this)
        if (device.size.aspectRatio > 1) device.size,
    ];
    var height = .0;
    var width = .0;
    for (final landscape in landscapes) {
      width += landscape.width;
      height += landscape.height;
    }

    return Size(
      width / landscapes.length,
      height / landscapes.length,
    );
  }
}
