import 'package:hooks_riverpod/all.dart';

final animationCurvePod = StateProvider<Duration>(
  (ref) => const Duration(milliseconds: 250),
);
