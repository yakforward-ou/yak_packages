import 'package:riverpod/riverpod.dart';
import 'package:yak_widgets/yak_widgets.dart';

/// `StateProvider` for `Handedness`

final handednessPod =
    StateProvider<Handedness>((ref) => Handedness.righthanded);
