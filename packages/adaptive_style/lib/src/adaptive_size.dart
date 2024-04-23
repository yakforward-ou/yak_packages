import 'package:flutter/widgets.dart';
import 'package:yak_flutter/yak_flutter.dart';
import 'extension.dart';
import 'device_size.dart';

typedef AdaptiveSizeNotifier = RestrictedNotifier<AdaptiveSizeData>;

final class AdaptiveSizeData {
  const AdaptiveSizeData({
    required this.realScreenSize,
    required this.scaledSize,
    required this.scale,
    required this.deviceSizes,
    required this.mostSimilarDeviceSize,
  });

  factory AdaptiveSizeData.fromSize(
    Size size, {
    List<DeviceSize> deviceSizes = DeviceSize.values,
  }) {
    final mostSimilarDeviceSize = deviceSizes.mostSimilarTo(size);
    final scale = mostSimilarDeviceSize.size.closestDimentionScale(size);
    return AdaptiveSizeData(
      deviceSizes: deviceSizes,
      realScreenSize: size,
      mostSimilarDeviceSize: mostSimilarDeviceSize,
      scale: scale,
      scaledSize: size * scale,
    );
  }

  final Size realScreenSize;
  final Size scaledSize;
  final double scale;
  final List<DeviceSize> deviceSizes;
  final DeviceSize mostSimilarDeviceSize;

  @override
  bool operator ==(Object other) =>
      other is AdaptiveSizeData && other.hashCode == hashCode;

  @override
  int get hashCode => Object.hash(realScreenSize, deviceSizes);
}
