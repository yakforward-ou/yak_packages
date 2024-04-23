import 'package:flutter/widgets.dart';

import 'adaptive_size.dart';
import 'inherited_adaptive_size.dart';

typedef AdaptiveSizeBuild = Widget Function(BuildContext, AdaptiveSizeData);

class AdaptiveSizeBuilder extends StatelessWidget {
  final AdaptiveSizeBuild builder;
  const AdaptiveSizeBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(context) {
    final adaptiveSize = InheritedAdaptiveSize.maybeOf(context);
    if (adaptiveSize == null) {
      throw Exception('InheritedAdaptiveSize not found in BuildContext');
    }

    return ValueListenableBuilder(
      valueListenable: adaptiveSize as ValueNotifier<AdaptiveSizeData>,
      builder: (context, value, _) => builder(context, value),
    );
  }
}
