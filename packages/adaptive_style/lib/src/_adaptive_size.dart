// import 'package:flutter/widgets.dart';
// import 'package:yak_flutter/yak_flutter.dart';
// import 'extension.dart';
// import 'device_size.dart';

// typedef AdaptiveSizeNotifier = RestrictedNotifier<AdaptiveSizeData>;

// final class AdaptiveSizeData {
//   const AdaptiveSizeData({
//     required this.screenSize,
//     required this.scale,
//     required this.availableSizes,
//     required this.mostSimilarDeviceSize,
//   });

//   // factory AdaptiveSizeData.fromSize(
//   //   Size size, {
//   //   List<DeviceSize> availableSizes = DeviceSize.values,
//   // }) {
//   //   final mostSimilarDeviceSize = availableSizes.mostSimilarTo(size);
//   //   final scale = mostSimilarDeviceSize.size.closestDimentionScale(size);

//   //   return AdaptiveSizeData(
//   //     availableSizes: availableSizes,
//   //     realScreenSize: size,
//   //     mostSimilarDeviceSize: mostSimilarDeviceSize,
//   //     scale: scale,
//   //   );
//   // }

//   final Size screenSize;
//   final Offset widthScale, ;
//   final List<DeviceSize> availableSizes;
//   final DeviceSize mostSimilarDeviceSize;

//   @override
//   bool operator ==(Object other) =>
//       other is AdaptiveSizeData && other.hashCode == hashCode;

//   @override
//   int get hashCode => Object.hash(screenSize, availableSizes);
// }
