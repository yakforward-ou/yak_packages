import 'package:hooks_riverpod/all.dart';
import 'package:yak_widgets/yak_widgets.dart';

final handednessPod =
    StateProvider<Handedness>((ref) => Handedness.righthanded);
