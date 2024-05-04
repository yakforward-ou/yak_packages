import 'package:flutter/widgets.dart';

final class PositionedData {
  final EdgeInsets edges;
  final Size size;

  const PositionedData(this.edges, this.size);

  @override
  bool operator ==(other) =>
      other is PositionedData && other.hashCode == hashCode;

  @override
  int get hashCode => Object.hash(edges, size);
}
