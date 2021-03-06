import 'package:hooks_riverpod/hooks_riverpod.dart';

/// `StateProvider` for `Handedness`

final handednessPod =
    // ? answer to the question `is the user lefthanded?`
    StateProvider<bool>((ref) => false);
