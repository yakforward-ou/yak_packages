import 'package:riverpod/riverpod.dart';
import '/yak_widgets.dart';

/// `StateProvider` for `SidebarScroll`

final sidebarPod = StateProvider<SidebarScroll>((ref) => SidebarScroll.idle);
