import 'package:hooks_riverpod/all.dart';
import 'package:yak_widgets/src/handedness/logic/state/all.dart';
import '../state/all.dart';

final handednessPod =
    StateProvider<Handedness>((ref) => Handedness.righthanded);
