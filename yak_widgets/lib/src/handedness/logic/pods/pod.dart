import 'package:hooks_riverpod/all.dart';
import 'package:yak_widgets/src/shared/all.dart';

final handednessPod =
    StateProvider<Handedness>((ref) => Handedness.righthanded);
