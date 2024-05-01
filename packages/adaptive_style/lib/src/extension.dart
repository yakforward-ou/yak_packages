import 'dart:math' as math show min, sqrt;
import 'dart:ui' show Size;

import 'device_size.dart';

extension ClosestDimentionScaleX<T extends Size> on T {
  double closestDimentionScale(T size) =>
      math.min(size.width / width, size.height / height);
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
          (size.aspectRatio - deviceSize.aspectRatio).abs() *
              math.sqrt((size.area - deviceSize.area).abs())
        )
    ]..sort(
        (a, b) => a.$2.compareTo(b.$2),
      );

    return sizes.first.$1;
  }
}

extension DeviceSizeAverageSizeX on Iterable<DeviceSize> {
  Size get averagePortrait {
    final portraits = [
      for (final device in this)
        if (device.aspectRatio < 1) device,
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
        if (device.aspectRatio > 1) device,
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
