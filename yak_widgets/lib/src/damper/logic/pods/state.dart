import 'package:riverpod/all.dart';
import '../../all.dart';

final damperStatePod = StateProvider<DamperState>((ref) => DamperState.impose);
