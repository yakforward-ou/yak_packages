import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'inherited_scale_ref.dart';
import 'scale_ref.dart';

abstract class AdaptiveWidget extends Widget implements StatelessWidget {
  const AdaptiveWidget({super.key});

  @override
  StatelessElement createElement() => StatelessElement(this);

  @override
  @protected
  @nonVirtual
  Widget build(BuildContext context) {
    final maybeScaleRef = InheritedScaleRef.maybeOf(context);
    if (maybeScaleRef == null) {
      throw Exception('ScaleRef not found in context,'
          ' make sure to have "ScaleRefProvider" in your Widget Tree');
    }
    return builder(context, maybeScaleRef, parentSize);
  }

  Size get parentSize;

  Widget builder(BuildContext context, ScaleRef scaleRef, Size parentSize);
}
