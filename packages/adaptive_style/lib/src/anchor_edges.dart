import 'package:meta/meta.dart';

abstract class AnchorEdges {
  const AnchorEdges();
  double? get top;
  double? get bottom;
  double? get left;
  double? get right;

  const factory AnchorEdges.top({
    double top,
    double left,
    double right,
  }) = AnchorEdgesTop;

  const factory AnchorEdges.bottom({
    double bottom,
    double left,
    double right,
  }) = AnchorEdgesBottom;

  const factory AnchorEdges.left({
    double top,
    double bottom,
    double left,
  }) = AnchorEdgesLeft;

  const factory AnchorEdges.right({
    double top,
    double bottom,
    double right,
  }) = AnchorEdgesRight;

  AnchorEdges scale(double scale);

  @override
  @nonVirtual
  bool operator ==(other) => other is AnchorEdges && other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hashAll([top, bottom, left, right]);
}

class AnchorEdgesLeft extends AnchorEdges {
  const AnchorEdgesLeft({
    this.bottom = 0,
    this.left = 0,
    this.top = 0,
  });
  @override
  final double bottom;
  @override
  final double top;
  @override
  final double left;
  @override
  final right = null;

  @override
  AnchorEdgesLeft scale(double scale) => AnchorEdgesLeft(
        bottom: bottom * scale,
        top: top * scale,
        left: left * scale,
      );
}

class AnchorEdgesRight implements AnchorEdges {
  const AnchorEdgesRight({
    this.bottom = 0,
    this.right = 0,
    this.top = 0,
  });
  @override
  final double bottom;
  @override
  final double top;
  @override
  final double right;
  @override
  final left = null;

  @override
  AnchorEdgesRight scale(double scale) => AnchorEdgesRight(
        bottom: bottom * scale,
        top: top * scale,
        right: right * scale,
      );
}

class AnchorEdgesTop implements AnchorEdges {
  const AnchorEdgesTop({
    this.top = 0,
    this.right = 0,
    this.left = 0,
  });
  @override
  final double left;
  @override
  final double top;
  @override
  final double right;
  @override
  final bottom = null;

  @override
  AnchorEdgesTop scale(double scale) => AnchorEdgesTop(
        left: left * scale,
        top: top * scale,
        right: right * scale,
      );
}

class AnchorEdgesBottom implements AnchorEdges {
  const AnchorEdgesBottom({
    this.bottom = 0,
    this.right = 0,
    this.left = 0,
  });
  @override
  final double left;
  @override
  final double bottom;
  @override
  final double right;
  @override
  final top = null;

  @override
  AnchorEdgesBottom scale(double scale) => AnchorEdgesBottom(
        left: left * scale,
        bottom: bottom * scale,
        right: right * scale,
      );
}
