import 'package:hooks_riverpod/hooks_riverpod.dart';

/// `StateProvider` for `Duration`

final animationDurationPod = StateProvider<Duration>(
  (ref) => const Duration(milliseconds: 250),
);
