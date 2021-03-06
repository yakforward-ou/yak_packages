import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../yak_widgets.dart';

/// `StateProvider` for `SidebarScroll`

final sidebarPod = StateProvider<SidebarScroll>((ref) => SidebarScroll.idle);
