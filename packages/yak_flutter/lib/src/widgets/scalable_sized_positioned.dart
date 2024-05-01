import 'package:flutter/widgets.dart';

class ScalableSizedPositioned extends Positioned {
  final EdgeInsets position;
  final Size size;
  final Size parent;
  final double scale;
  const ScalableSizedPositioned({
    required this.scale,
    required this.parent,
    required super.child,
    required this.size,
    required this.position,
    super.key,
  });

  @override
  double get left =>
      parent.width / 2 - ((position.left + (size.width / 2)) * scale);

  @override
  double get right =>
      parent.width / 2 - ((position.right + (size.width / 2)) * scale);

  @override
  double get top =>
      parent.height / 2 - ((position.top + (size.height / 2)) * scale);

  @override
  double get bottom =>
      parent.height / 2 - ((position.bottom + (size.height / 2)) * scale);
}
