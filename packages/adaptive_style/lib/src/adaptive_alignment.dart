import 'dart:ui';

import 'package:meta/meta.dart';

abstract class AdaptiveAlignment {
  const factory AdaptiveAlignment.topLeft({Offset padding}) =
      AdaptiveAlignmentTopLeft;
  const factory AdaptiveAlignment.topRight({Offset padding}) =
      AdaptiveAlignmentTopRight;
  const factory AdaptiveAlignment.bottomLeft({Offset padding}) =
      AdaptiveAlignmentBottomLeft;
  const factory AdaptiveAlignment.bottomRight({Offset padding}) =
      AdaptiveAlignmentBottomRight;
  const factory AdaptiveAlignment.centerLeft({double padding}) =
      AdaptiveAlignmentCenterLeft;
  const factory AdaptiveAlignment.centerRight({double padding}) =
      AdaptiveAlignmentCenterRight;
  const factory AdaptiveAlignment.topCenter({double padding}) =
      AdaptiveAlignmentTopCenter;
  const factory AdaptiveAlignment.bottomCenter({double padding}) =
      AdaptiveAlignmentBottomCenter;
  const factory AdaptiveAlignment.center() = AdaptiveAlignmentCenter;
}

class AdaptiveAlignmentTopLeft implements AdaptiveAlignment {
  const AdaptiveAlignmentTopLeft({this.padding = Offset.zero});

  final Offset padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class AdaptiveAlignmentTopRight implements AdaptiveAlignment {
  const AdaptiveAlignmentTopRight({this.padding = Offset.zero});

  final Offset padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class AdaptiveAlignmentBottomLeft implements AdaptiveAlignment {
  const AdaptiveAlignmentBottomLeft({this.padding = Offset.zero});

  final Offset padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class AdaptiveAlignmentBottomRight implements AdaptiveAlignment {
  const AdaptiveAlignmentBottomRight({this.padding = Offset.zero});

  final Offset padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class AdaptiveAlignmentTopCenter implements AdaptiveAlignment {
  const AdaptiveAlignmentTopCenter({this.padding = 0});

  final double padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class AdaptiveAlignmentBottomCenter implements AdaptiveAlignment {
  const AdaptiveAlignmentBottomCenter({this.padding = 0});

  final double padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class AdaptiveAlignmentCenterLeft implements AdaptiveAlignment {
  const AdaptiveAlignmentCenterLeft({this.padding = 0});

  final double padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class AdaptiveAlignmentCenterRight implements AdaptiveAlignment {
  const AdaptiveAlignmentCenterRight({this.padding = 0});

  final double padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class AdaptiveAlignmentCenter implements AdaptiveAlignment {
  const AdaptiveAlignmentCenter();

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => runtimeType.hashCode;
}
