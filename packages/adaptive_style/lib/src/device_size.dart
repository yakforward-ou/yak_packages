import 'dart:ui' show Size;
import 'package:flutter/widgets.dart' show Orientation;

/// a collection of well known screen dimesions
/// as offered by [chrome device toolbar]

// enum Orientation {
//   landscape,
//   portrait,
// }

extension type const DeviceSize._(Size value) implements Size {
  const DeviceSize(Size value) : this._(value);
  static const iphoneSE = DeviceSize(Size(375, 667));
  static const iphoneXR = DeviceSize(Size(414, 896));
  static const iphone12PRO = DeviceSize(Size(390, 844));
  static const iphone14PRO = DeviceSize(Size(430, 932));
  static const pixel7 = DeviceSize(Size(412, 915));
  static const galaxyS8Plus = DeviceSize(Size(360, 740));
  static const galaxyS20Ultra = DeviceSize(Size(412, 915));
  static const iPadMini = DeviceSize(Size(768, 1024));
  static const iPadAir = DeviceSize(Size(820, 1180));
  static const iPadPro = DeviceSize(Size(1024, 1366));
  static const surfacePro7 = DeviceSize(Size(912, 1368));
  static const surfaceDuo = DeviceSize(Size(540, 720));
  static const galaxyFold = DeviceSize(Size(280, 653));
  static const galaxyA51 = DeviceSize(Size(412, 914));
  static const galaxyA71 = DeviceSize(Size(412, 914));
  static const nestHub = DeviceSize(Size(1024, 600));
  static const nestHubMax = DeviceSize(Size(1280, 800));

  Orientation get orientation =>
      aspectRatio <= 1 ? Orientation.portrait : Orientation.landscape;

  DeviceSize flip() => DeviceSize(Size(height, width));
}
