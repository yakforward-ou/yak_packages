import 'dart:ui' show Size;

/// a collection of well known screen dimesions
/// as offered by [chrome device toolbar]
enum DeviceSize {
  iphoneSE(Size(375, 667)),
  iphoneXR(Size(414, 896)),
  iphone12PRO(Size(390, 844)),
  iphone14PRO(Size(430, 932)),
  pixel7(Size(412, 915)),
  galaxyS8Plus(Size(360, 740)),
  galaxyS20Ultra(Size(412, 915)),
  iPadMini(Size(768, 1024)),
  iPadAir(Size(820, 1180)),
  iPadPro(Size(1024, 1366)),
  surfacePro7(Size(912, 1368)),
  surfaceDuo(Size(540, 720)),
  galaxyFold(Size(280, 653)),
  galaxyA51(Size(412, 914)),
  galaxyA71(Size(412, 914)),
  nestHub(Size(1024, 600)),
  nestHubMax(Size(1280, 800));

  const DeviceSize(this.size);

  final Size size;
}
