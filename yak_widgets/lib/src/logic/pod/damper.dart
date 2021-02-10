import 'package:riverpod/riverpod.dart';
import 'package:yak_widgets/yak_widgets.dart';

/// `StateProvider` for `DamperState`

final damperStatePod = StateProvider<DamperState>((ref) => DamperState.impose);
