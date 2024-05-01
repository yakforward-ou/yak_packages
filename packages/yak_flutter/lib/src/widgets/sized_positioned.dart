import 'package:flutter/widgets.dart';

class SizedPositioned extends Positioned {
  final EdgeInsets position;
  final Size size;
  final Size parent;
  const SizedPositioned({
    required this.parent,
    required super.child,
    required this.size,
    required this.position,
    super.key,
  });

  @override
  double get left => parent.width / 2 - position.left - size.width / 2;

  @override
  double get right => parent.width / 2 - position.right - size.width / 2;

  @override
  double get top => parent.width / 2 - position.top - size.height / 2;

  @override
  double get bottom => parent.width / 2 - position.bottom - size.height / 2;
}
