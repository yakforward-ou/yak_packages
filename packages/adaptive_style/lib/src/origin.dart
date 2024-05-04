import 'dart:ui';

import 'package:meta/meta.dart';

abstract class Origin {
  const factory Origin.topLeft({Offset padding}) = OriginTopLeft;
  const factory Origin.topRight({Offset padding}) = OriginTopRight;
  const factory Origin.bottomLeft({Offset padding}) = OriginBottomLeft;
  const factory Origin.bottomRight({Offset padding}) = OriginBottomRight;
  const factory Origin.centerLeft({double padding}) = OriginCenterLeft;
  const factory Origin.centerRight({double padding}) = OriginCenterRight;
  const factory Origin.topCenter({double padding}) = OriginTopCenter;
  const factory Origin.bottomCenter({double padding}) = OriginBottomCenter;
  const factory Origin.center() = OriginCenter;
}

class OriginTopLeft implements Origin {
  const OriginTopLeft({this.padding = Offset.zero});

  final Offset padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class OriginTopRight implements Origin {
  const OriginTopRight({this.padding = Offset.zero});

  final Offset padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class OriginBottomLeft implements Origin {
  const OriginBottomLeft({this.padding = Offset.zero});

  final Offset padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class OriginBottomRight implements Origin {
  const OriginBottomRight({this.padding = Offset.zero});

  final Offset padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class OriginTopCenter implements Origin {
  const OriginTopCenter({this.padding = 0});

  final double padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class OriginBottomCenter implements Origin {
  const OriginBottomCenter({this.padding = 0});

  final double padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class OriginCenterLeft implements Origin {
  const OriginCenterLeft({this.padding = 0});

  final double padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class OriginCenterRight implements Origin {
  const OriginCenterRight({this.padding = 0});

  final double padding;

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, padding);
}

class OriginCenter implements Origin {
  const OriginCenter();

  @override
  @nonVirtual
  bool operator ==(other) => other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => runtimeType.hashCode;
}
