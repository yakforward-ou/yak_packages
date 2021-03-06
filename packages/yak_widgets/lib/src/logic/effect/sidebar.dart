import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../yak_widgets.dart';

/// `hooks` effect for lining `PageController`
/// to `StateController<SidebarScroll>`

extension SidebarPageViewEffect on StateController<SidebarScroll> {
  /// extension on `StateController<SidebarScroll> `
  /// returns `useEffect` proving
  /// `PageController`, `Duration` and `Curve`
  void useSidebarPageViewEffect(
    PageController controller,
    Duration duration,
    Curve curve,
  ) =>
      useEffect(_sidebarPageViewEffect(this, controller, duration, curve));
}

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
