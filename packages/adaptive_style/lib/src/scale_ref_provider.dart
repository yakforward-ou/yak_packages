import 'dart:async';

import 'package:flutter/widgets.dart';
import 'scale_mediaquery_widget.dart';
import 'device_size.dart';
import 'inherited_scale_ref.dart';
import 'scale_ref.dart';
import 'extension.dart';
import 'size_scale.dart';

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
          child: ScaleMediaQueryWidget(
            builder: widget.builder,
            scale: _notifier.value.scale.min,
          ),
        ),
      );
}
