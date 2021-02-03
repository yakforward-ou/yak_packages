import 'package:riverpod/all.dart';
import 'package:yak_widgets/yak_widgets.dart';

final sidebarPod = StateProvider<SidebarScroll>((ref) => SidebarScroll.idle);
