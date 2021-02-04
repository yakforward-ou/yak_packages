import 'package:hooks_riverpod/all.dart';

/// `StateProvider` for `Duration`

final animationDurationPod = StateProvider<Duration>(
  (ref) => const Duration(milliseconds: 250),
);
