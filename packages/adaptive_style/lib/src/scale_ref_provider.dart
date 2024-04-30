import 'dart:async';

import 'package:adaptive_style/adaptive_style.dart';
import 'package:flutter/widgets.dart';

import 'inherited_scale_ref.dart';

class ScaleRefProvider extends StatefulWidget {
  final WidgetBuilder builder;
  final List<DeviceSize> deviceSizes;
  const ScaleRefProvider({
    super.key,
    required this.builder,
    this.deviceSizes = const [],
  });

  @override
  State<ScaleRefProvider> createState() => _ScaleRefProvidertState();
}

class _ScaleRefProvidertState extends State<ScaleRefProvider> {
  final _initialized = Completer<bool>();
  late final ValueNotifier<ScaleRef> _notifier;

  @override
  void didChangeDependencies() {
    if (!_initialized.isCompleted) {
      _initialize(context);
      _initialized.complete(true);
      return;
    }
    _update(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  void _update(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final mostSimilarSize = widget.deviceSizes.mostSimilarTo(size);
    final scale = SizeScale(size, mostSimilarSize);
    final ScaleRef scaleRef = (scale: scale, idealSize: mostSimilarSize);
    if (scaleRef == _notifier.value) {
      return;
    }
    _notifier.value = scaleRef;
  }

  void _initialize(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final mostSimilarSize = widget.deviceSizes.mostSimilarTo(size);
    final scale = SizeScale(size, mostSimilarSize);
    final ScaleRef scaleRef = (scale: scale, idealSize: mostSimilarSize);
    _notifier = ValueNotifier<ScaleRef>(scaleRef);
  }

  @override
  Widget build(context) => ValueListenableBuilder(
        valueListenable: _notifier,
        builder: (context, scaleRef, _) => InheritedScaleRef(
          scaleRef: scaleRef,
          child: AdaptiveMediaQueryWidget(
            builder: widget.builder,
            scale: _notifier.value.scale.min,
          ),
        ),
      );
}
