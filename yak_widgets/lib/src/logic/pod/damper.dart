import 'package:riverpod/all.dart';
import 'package:yak_widgets/yak_widgets.dart';

final damperStatePod = StateProvider<DamperState>((ref) => DamperState.impose);
