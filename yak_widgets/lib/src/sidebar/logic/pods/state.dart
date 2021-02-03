import 'package:riverpod/all.dart';
import '../all.dart';

final sidebarScrollPod =
    StateProvider<SidebarScroll>((ref) => SidebarScroll.idle);
