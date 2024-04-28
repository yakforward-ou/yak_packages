import 'dart:async';

import 'package:adaptive_style/adaptive_style.dart';
import 'package:flutter/widgets.dart';
import 'package:yak_flutter/yak_flutter.dart';
import 'size_ref.dart';
import 'size_scale.dart';

class SizeRefProvider extends StatefulWidget {
  final Widget child;
  final List<DeviceSize> deviceSizes;
  const SizeRefProvider({
    super.key,
    required this.child,
    this.deviceSizes = const [],
  });

  @override
  State<SizeRefProvider> createState() => _SizeRefProvidertState();
}

class _SizeRefProvidertState extends State<SizeRefProvider> {
  final _initialized = Completer<bool>();
  late final ValueNotifier<SizeRef> _notifier;

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
    final SizeRef sizeRef = (scale: scale, size: mostSimilarSize);
    if (sizeRef == _notifier.value) {
      return;
    }
    _notifier.value = sizeRef;
  }

  void _initialize(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final mostSimilarSize = widget.deviceSizes.mostSimilarTo(size);
    final scale = SizeScale(size, mostSimilarSize);
    final SizeRef sizeRef = (scale: scale, size: mostSimilarSize);
    _notifier = ValueNotifier<SizeRef>(sizeRef);
  }

  @override
  Widget build(context) => InheritedSizeRef(
        notifier: RestrictedNotifier(_notifier),
        child: widget.child,
      );
}
