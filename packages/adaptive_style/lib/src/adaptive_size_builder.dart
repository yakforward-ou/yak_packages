import 'package:flutter/widgets.dart';

import 'inherited_adaptive_size.dart';
import 'size_ref.dart';

typedef SizeRefBuild = Widget Function(BuildContext, SizeRef);

class SizeRefBuilder extends StatelessWidget {
  final SizeRefBuild builder;
  const SizeRefBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(context) {
    final sizeRefNotifier = InheritedSizeRef.maybeOf(context);
    if (sizeRefNotifier == null) {
      throw Exception('InheritedSizeRef not found in BuildContext');
    }

    return ValueListenableBuilder(
      valueListenable: sizeRefNotifier as ValueNotifier<SizeRef>,
      builder: (context, value, _) => builder(context, value),
    );
  }
}
