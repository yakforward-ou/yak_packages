import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yak_flutter/yak_flutter.dart';

import 'adaptive_size.dart';
import 'device_size.dart';
import 'inherited_adaptive_size.dart';

class AdaptiveSizeProvider extends StatefulWidget {
  final Widget child;
  final List<DeviceSize> deviceSizes;
  const AdaptiveSizeProvider({
    super.key,
    required this.child,
    this.deviceSizes = DeviceSize.values,
  });

  @override
  State<AdaptiveSizeProvider> createState() => _AdaptiveSizeProvidertState();
}

class _AdaptiveSizeProvidertState extends State<AdaptiveSizeProvider> {
  final _initialized = Completer<bool>();
  late final ValueNotifier<AdaptiveSizeData> _notifier;

  @override
  void didChangeDependencies() {
    if (!_initialized.isCompleted) {
      _initialize(context);
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
    if (size == _notifier.value.realScreenSize &&
        widget.deviceSizes == _notifier.value.deviceSizes) {
      return;
    }

    _notifier.value = AdaptiveSizeData.fromSize(
      size,
      deviceSizes: widget.deviceSizes,
    );
  }

  void _initialize(BuildContext size) {
    final adaptiveSize = AdaptiveSizeData.fromSize(
      MediaQuery.sizeOf(context),
      deviceSizes: widget.deviceSizes,
    );
    _notifier = ValueNotifier<AdaptiveSizeData>(adaptiveSize);
    _initialized.complete(true);
  }

  @override
  Widget build(context) => InheritedAdaptiveSize(
        notifier: RestrictedNotifier(_notifier),
        child: widget.child,
      );
}
