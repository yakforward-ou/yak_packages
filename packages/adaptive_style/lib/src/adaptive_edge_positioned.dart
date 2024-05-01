import 'package:flutter/widgets.dart';

import 'adaptive_widget.dart';
import 'adaptive_widget_builder.dart';
import 'positioned_data.dart';

class AdaptiveAnchorPositioned extends AdaptiveWidget {
  final AdaptiveAnchorData data;
  final AdaptiveWidgetBuilder _builder;

  const AdaptiveAnchorPositioned({
    super.key,
    required AdaptiveWidgetBuilder builder,
    required this.data,
    required this.parentSize,
  }) : _builder = builder;

  @override
  final Size parentSize;

  @override
  Widget builder(context, scaleRef, parentSize) {
    final positionedData = data.positioned(
      parentSize: parentSize,
      scale: scaleRef.scale.min,
    );
    return Positioned(
      left: positionedData.edges.left,
      right: positionedData.edges.right,
      top: positionedData.edges.top,
      bottom: positionedData.edges.bottom,
      child: _builder(
        context,
        scaleRef,
        positionedData.size,
      ),
    );
  }
}
