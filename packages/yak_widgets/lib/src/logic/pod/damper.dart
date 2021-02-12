import 'package:riverpod/riverpod.dart';
import '../../../yak_widgets.dart';

/// `StateProvider` for `DamperState`

final damperStatePod = StateProvider<DamperState>((ref) => DamperState.impose);