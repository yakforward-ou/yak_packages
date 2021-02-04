import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:yak_widgets/yak_widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// `hooks` effect for lining `PageController` to `StateController<SidebarScroll>`

Effect _sidebarPageViewEffect(
  StateController<SidebarScroll> scrollbar,
  PageController controller,
  Duration duration,
  Curve curve,
) =>
    () => scrollbar.addListener((state) {
          switch (state) {
            case SidebarScroll.idle:
              break;
            case SidebarScroll.up:
              controller.nextPage(duration: duration, curve: curve);
              break;
            case SidebarScroll.down:
              controller.previousPage(duration: duration, curve: curve);
              break;
            default:
              break;
          }
        });

extension SidebarPageViewEffect on StateController<SidebarScroll> {
  void useSidebarPageViewEffect(
    PageController controller,
    Duration duration,
    Curve curve,
  ) =>
      useEffect(_sidebarPageViewEffect(this, controller, duration, curve));
}
