import 'package:riverpod/all.dart';
import 'package:yak_widgets/yak_widgets.dart';

/// `StateProvider` for `SidebarScroll`

final sidebarPod = StateProvider<SidebarScroll>((ref) => SidebarScroll.idle);
