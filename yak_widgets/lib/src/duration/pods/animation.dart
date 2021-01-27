import 'package:hooks_riverpod/all.dart';

final animationDurationPod = StateProvider<Duration>(
  (ref) => const Duration(milliseconds: 250),
);
